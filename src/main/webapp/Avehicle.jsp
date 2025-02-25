<%-- 
    Document   : Avehicle
    Created on : Feb 25, 2025, 4:28:34 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Management</title>
        <!-- Bootstrap CSS for responsive design -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    
    <body>
       
        <!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        
        
       <!-- Navigation Bar -->
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
           <a class="navbar-brand" href="#">Admin Dashboard</a>
           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
           </button>
           <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav ms-auto">
                   <li class="nav-item">
                       <a class="nav-link" href="#">Logout</a>
                   </li>
               </ul>
           </div>
       </nav>
       
       <div class="container mt-5">
           <h2>Vehicle Management</h2>
           
           <!-- Search Bar -->
           <form class="d-flex mb-3">
               <input class="form-control me-2" type="search" placeholder="Search for vehicles..." aria-label="Search" id="searchInput">
               <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
           </form>
           
           <script>
    $(document).ready(function() {
        // Service function to fetch vehicle by ID from the backend
        function getVehicleById(id, callback) {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/avehicles/' + id,  // API endpoint with vehicle ID
                type: 'GET',  // HTTP method (GET request)
                dataType: 'json',  // Expected response data type
                success: function(vehicle) {
                    console.log("Vehicle data received:", vehicle);  // Log the vehicle data
                    callback(null, vehicle); // Pass the vehicle data to the callback function
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching vehicle:", xhr.responseText);
                    if (xhr.status === 404) {
                        callback('Vehicle not found.', null);  // Handle 404 error if vehicle is not found
                    } else if (xhr.status === 500) {
                        callback('Server error. Please try again later.', null);  // Handle 500 server error
                    } else {
                        callback('Error fetching vehicle data. Please try again.', null);  // Generic error
                    }
                }
            });
        }

        // Handle search button click
        $('#searchBtn').click(function(e) {
            e.preventDefault();

            let id = $('#searchInput').val().trim();  

            if (id) {
                console.log("Searching for vehicle with ID:", id); 

                getVehicleById(id, function(error, vehicle) { 
                    if (error) {
                        alert(error);  
                    } else {
                        $('#vehicleTableBody').empty();  // Clear existing table rows

                        if (vehicle) {
                            var row = '<tr>' +
                                '<td>' + vehicle.vehicleId + '</td>' +
                                '<td>' + vehicle.plate + '</td>' +
                                '<td>' + vehicle.type + '</td>' +
                                '<td>' + vehicle.model + '</td>' +
                                '<td>' + vehicle.colour + '</td>' +
                                '<td>' + vehicle.baseFare + '</td>' +
                                '<td>' + vehicle.status + '</td>' +
                                '<td>' +
                                     '<button class="btn btn-info editVehicleBtn" data-bs-toggle="modal" data-bs-target="#editVehicleModal" ' +
                                     'data-id="' + vehicle.vehicleId + '" data-plate="' + vehicle.plate + '" data-type="' + vehicle.type + '"' +
                                     'data-model="' + vehicle.model + '" data-colour="' + vehicle.colour + '" data-basefare="' + vehicle.baseFare + '" ' +
                                     'data-status="' + vehicle.status + '">Edit</button> ' +
                                     '<button class="btn btn-danger deleteVehicleBtn" data-id="' + vehicle.vehicleId + '">' +
                                     '<i class="fas fa-trash-alt"></i> Delete</button>' +
                                '</td>' +
                                '</tr>';

                            $('#vehicleTableBody').append(row);
                        } else {
                            alert("No vehicle found with the given ID.");
                        }
                    }
                });
            } else {
                alert('Please enter a Vehicle ID to search.');  
            }
        });
    });
</script>

           
           <!-- Add Vehicle Button -->
           <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addVehicleModal">
    Add New Vehicle
</button>

           
           <!-- Vehicle Table -->
           <table class="table table-bordered table-striped table-responsive">
               <thead>
               <tr>
                   <th>ID</th>
                   <th>Plate</th>
                   <th>Type</th>
                   <th>Model</th>
                   <th>Colour</th>
                   <th>Base Fare</th>
                   <th>Status</th>
                   <th>Actions</th>
               </tr>
               </thead>
               <tbody id="vehicleTableBody">
                   <!-- Data rows will be dynamically added here -->
               </tbody>
           </table>
       </div>
       
       <script>
    $(document).ready(function() {
        function getVehicles() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/avehicles',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);  

                    // Clear the existing table body
                    $('#vehicleTableBody').empty();

                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, vehicle) {
                            console.log(vehicle);  // Log the vehicle object

                            // Ensure values exist to prevent "undefined" issues
                            var vehicleId = vehicle.vehicleId ? vehicle.vehicleId : '-';
                            var plate = vehicle.plate ? vehicle.plate : '-';
                            var type = vehicle.type ? vehicle.type : '-';
                            var model = vehicle.model ? vehicle.model : '-';
                            var colour = vehicle.colour ? vehicle.colour : '-';
                            var baseFare = vehicle.baseFare ? vehicle.baseFare : '-';
                            var status = vehicle.status ? vehicle.status : '-';

                            // Constructing the table row with vehicle ID and action buttons
                            var row = '<tr>' +
                                '<td>' + vehicleId + '</td>' + 
                                '<td>' + plate + '</td>' +
                                '<td>' + type + '</td>' +
                                '<td>' + model + '</td>' +
                                '<td>' + colour + '</td>' +
                                '<td>' + baseFare + '</td>' +
                                '<td>' + status + '</td>' +
                                '<td>' +
                                    '<button class="btn btn-warning btn-sm editVehicle" data-id="' + vehicleId + '">Edit</button> ' +
                                    '<button class="btn btn-danger btn-sm deleteVehicle" data-id="' + vehicleId + '">Delete</button>' +
                                '</td>' +
                                '</tr>';

                            // Append the row to the table
                            $('#vehicleTableBody').append(row);
                        });
                    } else {
                        // If no vehicles are found, display a message in the table
                        $('#vehicleTableBody').html('<tr><td colspan="8" style="text-align:center;">No vehicles found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching vehicles:", xhr.responseText);
                    alert('Error fetching vehicle data. Please try again.');
                }
            });
        }

        // Fetch vehicle data when the page loads
        getVehicles();
    });
</script>

       
       
       
       
       <!-- Add Vehicle Modal -->
      <div class="modal fade" id="addVehicleModal" tabindex="-1" aria-labelledby="addVehicleModalLabel" aria-hidden="true">

           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <form id="addVehicleForm">
                           <div class="mb-3">
                               <label class="form-label">Plate</label>
                               <input type="text" class="form-control" id="vehiclePlate" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Type</label>
                               <input type="text" class="form-control" id="vehicleType" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Model</label>
                               <input type="text" class="form-control" id="vehicleModel" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Colour</label>
                               <input type="text" class="form-control" id="vehicleColour" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Base Fare</label>
                               <input type="number" class="form-control" id="vehicleBaseFare" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Status</label>
                               <input type="text" class="form-control" id="vehicleStatus" required>
                           </div>
                           <button type="submit" class="btn btn-primary">Add Vehicle</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       <script>
    // Handle form submission for adding a vehicle
    $("#addVehicleForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var plate = $("#vehiclePlate").val();
        var type = $("#vehicleType").val();
        var model = $("#vehicleModel").val();
        var colour = $("#vehicleColour").val();
        var baseFare = $("#vehicleBaseFare").val();
        var status = $("#vehicleStatus").val();

        // Create an object to send as JSON
        var vehicleData = {
            "plate": plate,
            "type": type,
            "model": model,
            "colour": colour,
            "baseFare": parseInt(baseFare), // Ensure baseFare is an integer
            "status": status
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/avehicles',  // Replace with your actual endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(vehicleData),
            success: function (response) {
                // On success, display a success message or handle it
                alert('Vehicle added successfully!');
                $('#addVehicleModal').modal('hide');  // Close the modal
                $("#addVehicleForm")[0].reset(); // Reset the form
                getVehicles(); // Refresh vehicle list
            },
            error: function (xhr, status, error) {
                // On error, handle the error
                alert('Error adding vehicle. Please try again.');
            }
        });
    });
        </script>
       
       
       <!-- Edit Vehicle Modal -->
       <div class="modal fade" id="editVehicleModal" tabindex="-1" aria-labelledby="editVehicleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="editVehicleModalLabel">Edit Vehicle</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <form id="editVehicleForm">
                           <input type="hidden" id="editVehicleId">
                           <div class="mb-3">
                               <label class="form-label">Plate</label>
                               <input type="text" class="form-control" id="editVehiclePlate" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Type</label>
                               <input type="text" class="form-control" id="editVehicleType" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Model</label>
                               <input type="text" class="form-control" id="editVehicleModel" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Colour</label>
                               <input type="text" class="form-control" id="editVehicleColour" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Base Fare</label>
                               <input type="number" class="form-control" id="editVehicleBaseFare" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Status</label>
                               <input type="text" class="form-control" id="editVehicleStatus" required>
                           </div>
                           <button type="submit" class="btn btn-primary">Update Vehicle</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       <script>
    $(document).ready(function () {
        // Function to load vehicles from API and display them in the table
        function loadVehicles() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/avehicles',
                type: 'GET',
                dataType: 'json',
                success: function (vehicles) {
                    $('#vehicleTableBody').empty();
                    vehicles.forEach(vehicle => {
                        var row = '<tr>' +
                            '<td>' + vehicle.vehicleId + '</td>' +
                            '<td>' + vehicle.plate + '</td>' +
                            '<td>' + vehicle.type + '</td>' +
                            '<td>' + vehicle.model + '</td>' +
                            '<td>' + vehicle.colour + '</td>' +
                            '<td>' + vehicle.baseFare + '</td>' +
                            '<td>' + vehicle.status + '</td>' +
                            '<td>' +
                                '<button class="btn btn-info editVehicleBtn" data-bs-toggle="modal" data-bs-target="#editVehicleModal" ' +
                                'data-id="' + vehicle.vehicleId + '" data-plate="' + vehicle.plate + '" data-type="' + vehicle.type + '"' +
                                'data-model="' + vehicle.model + '" data-colour="' + vehicle.colour + '" data-basefare="' + vehicle.baseFare + '" ' +
                                'data-status="' + vehicle.status + '">Edit</button> ' +
                                '<button class="btn btn-danger deleteVehicleBtn" data-id="' + vehicle.vehicleId + '">Delete</button>' +
                            '</td>' +
                            '</tr>';
                        $('#vehicleTableBody').append(row);
                    });
                },
                error: function () {
                    alert("Error loading vehicles.");
                }
            });
        }

        // Function to open the edit modal and fill it with vehicle data
        $(document).on("click", ".editVehicleBtn", function () {
            let vehicleId = $(this).attr("data-id");
            let plate = $(this).attr("data-plate");
            let type = $(this).attr("data-type");
            let model = $(this).attr("data-model");
            let colour = $(this).attr("data-colour");
            let baseFare = $(this).attr("data-basefare");
            let status = $(this).attr("data-status");

            $("#editVehicleId").val(vehicleId);
            $("#editVehiclePlate").val(plate);
            $("#editVehicleType").val(type);
            $("#editVehicleModel").val(model);
            $("#editVehicleColour").val(colour);
            $("#editVehicleBaseFare").val(baseFare);
            $("#editVehicleStatus").val(status);
        });

        // Function to handle vehicle update
        function updateVehicle() {
            let vehicleId = $("#editVehicleId").val();
            let plate = $("#editVehiclePlate").val();
            let type = $("#editVehicleType").val();
            let model = $("#editVehicleModel").val();
            let colour = $("#editVehicleColour").val();
            let baseFare = $("#editVehicleBaseFare").val();
            let status = $("#editVehicleStatus").val();

            if (!vehicleId || !plate || !type || !model || !colour || !baseFare || !status) {
                alert("Please fill in all fields.");
                return;
            }

            let vehicleData = {
                vehicleId: parseInt(vehicleId),  // Ensure ID is a number
                plate: plate,
                type: type,
                model: model,
                colour: colour,
                baseFare: parseInt(baseFare), // Convert to integer
                status: status
            };

            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/avehicles/update',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(vehicleData),
                success: function (response) {
                    alert("Vehicle updated successfully!");
                    $("#editVehicleModal").modal("hide");
                    loadVehicles(); // Refresh the table
                },
                error: function (xhr, status, error) {
                    console.error("Update failed:", xhr.responseText);
                    alert("Error updating vehicle: " + xhr.responseText);
                }
            });
        }

        // Handle form submission for updating the vehicle
        $("#editVehicleForm").submit(function (e) {
            e.preventDefault();
            updateVehicle();
        });

        // Load vehicles when the page is ready
        loadVehicles();
    });
</script>

       
       
    </body>
</html>
