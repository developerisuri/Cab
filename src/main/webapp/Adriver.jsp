<%-- 
    Document   : Adriver
    Created on : Feb 25, 2025, 4:27:07 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Driver Management</title>
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
           <h2>Driver Management</h2>
           
           <!-- Search Bar -->
           <form class="d-flex mb-3">
               <input class="form-control me-2" type="search" placeholder="Search for drivers..." aria-label="Search" id="searchInput">
               <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
           </form>
           
           <script>
               $(document).ready(function() {
    // Function to fetch driver by ID from the backend
    function getDriverById(id, callback) {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adrivers/' + id, // API endpoint for driver ID
            type: 'GET', // HTTP method (GET request)
            dataType: 'json', // Expected response data type
            success: function(driver) {
                console.log("Driver data received:", driver); // Log the driver data
                callback(null, driver); // Pass the driver data to the callback function
            },
            error: function(xhr, status, error) {
                console.error("Error fetching driver:", xhr.responseText);
                if (xhr.status === 404) {
                    callback('Driver not found.', null); // Handle 404 error if driver is not found
                } else if (xhr.status === 500) {
                    callback('Server error. Please try again later.', null); // Handle 500 server error
                } else {
                    callback('Error fetching driver data. Please try again.', null); // Generic error
                }
            }
        });
    }

    // Handle search button click
    $('#searchBtn').click(function(e) {
        e.preventDefault();

        let id = $('#searchInput').val().trim();  

        if (id) {
            console.log("Searching for driver with ID:", id); 

            getDriverById(id, function(error, driver) { // `driver` should be an object
                if (error) {
                    alert(error);  
                } else {
                    $('#driverTableBody').empty(); // Clear existing table rows

                    var driverId = driver.driverId ? driver.driverId : '-';
                    var name = driver.name ? driver.name : '-';
                    var address = driver.address ? driver.address : '-';
                    var tele = driver.tele ? driver.tele : '-';

                    var row = '<tr>' +
                        '<td>' + driverId + '</td>' +
                        '<td>' + name + '</td>' +
                        '<td>' + address + '</td>' +
                        '<td>' + tele + '</td>' +
                        '<td>' +
                            '<button class="btn btn-info editDriverBtn" data-bs-toggle="modal" data-bs-target="#editDriverModal" data-id="' + driverId + '" data-name="' + name + '" data-address="' + address + '" data-tele="' + tele + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                            '<button class="btn btn-danger deleteDriverBtn" data-id="' + driverId + '">' +
                            '<i class="fas fa-trash-alt"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('#driverTableBody').append(row);
                }
            });
        } else {
            alert('Please enter a Driver ID to search.');  
        }
    });
});

               </script>
           
           
           
           <!-- Add Driver Button -->
           <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addDriverModal">
               Add New Driver
           </button>

           
           <!-- Driver Table -->
           <table class="table table-bordered table-striped table-responsive">
               <thead>
               <tr>
                   <th>ID</th>
                   <th>Name</th>
                   <th>Address</th>
                   <th>Telephone</th>
                   <th>Actions</th>
               </tr>
               </thead>
               <tbody id="driverTableBody">
                   <!-- Data rows will be dynamically added here -->
               </tbody>
           </table>
       </div>
       
       <script>
    $(document).ready(function() {
        function getDrivers() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/adrivers',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);
                    
                    // Clear the existing table body
                    $('#driverTableBody').empty();
                    
                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, driver) {
                            console.log(driver);
                            
                            // Ensure values exist to prevent "undefined" issues
                            var driverId = driver.driver_id ? driver.driver_id : '-';
                            var name = driver.name ? driver.name : '-';
                            var address = driver.address ? driver.address : '-';
                            var tele = driver.tele ? driver.tele : '-';
                            
                            // Constructing the table row
                            var row = '<tr>' +
                                '<td>' + driverId + '</td>' +
                                '<td>' + name + '</td>' +
                                '<td>' + address + '</td>' +
                                '<td>' + tele + '</td>' +
                                '</tr>';
                            
                            // Append the row to the table
                            $('#driverTableBody').append(row);
                        });
                    } else {
                        // If no drivers are found, display a message in the table
                        $('#driverTableBody').html('<tr><td colspan="4" style="text-align:center;">No drivers found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching drivers:", xhr.responseText);
                    alert('Error fetching driver data. Please try again.');
                }
            });
        }

        // Fetch driver data when the page loads
        getDrivers();
    });
</script>

       
       
       <!-- Add Driver Modal -->
      <div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">

           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <form id="addDriverForm">
                           <div class="mb-3">
                               <label class="form-label">Name</label>
                               <input type="text" class="form-control" id="driverName" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Address</label>
                               <input type="text" class="form-control" id="driverAddress" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Telephone</label>
                               <input type="text" class="form-control" id="driverTelephone" required>
                           </div>
                           <button type="submit" class="btn btn-primary">Add Driver</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       
       <script>
    // Handle form submission
    $("#addDriverForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var driverName = $("#driverName").val();
        var driverAddress = $("#driverAddress").val();
        var driverTelephone = $("#driverTelephone").val();

        // Create an object to send as JSON
        var driverData = {
            "name": driverName,
            "address": driverAddress,
            "tele": driverTelephone
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adrivers',  // Replace with your actual endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(driverData),
            success: function (response) {
                // On success, display a success message or handle it
                alert('Driver added successfully!');
                $('#addDriverModal').modal('hide');  // Close the modal
            },
            error: function (xhr, status, error) {
                // On error, handle the error
                alert('Error adding driver. Please try again.');
            }
        });
    });
</script>
       
       <!-- Edit Driver Modal -->
       <div class="modal fade" id="editDriverModal" tabindex="-1" aria-labelledby="editDriverModalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="editDriverModalLabel">Edit Driver</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <form id="editDriverForm">
                           <input type="hidden" id="editDriverId">
                           <div class="mb-3">
                               <label class="form-label">Name</label>
                               <input type="text" class="form-control" id="editDriverName" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Address</label>
                               <input type="text" class="form-control" id="editDriverAddress" required>
                           </div>
                           <div class="mb-3">
                               <label class="form-label">Telephone</label>
                               <input type="text" class="form-control" id="editDriverTelephone" required>
                           </div>
                           <input type="hidden" id="editDriverId">
                    <button type="submit" class="btn btn-primary">Update User</button>
                    
                     </form>
            </div>
        </div>
    </div>
</div>
              
                           <script>
                              $(document).ready(function () {
    // Function to load drivers from API and display them in the table
    function loadDrivers() {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adrivers',
            type: 'GET',
            dataType: 'json',
            success: function (drivers) {
                $('#driverTableBody').empty();
                drivers.forEach(driver => {
                    var driverId = driver.driverId ? driver.driverId : '-';
                    var name = driver.name ? driver.name : '-';
                    var address = driver.address ? driver.address : '-';
                    var tele = driver.tele ? driver.tele : '-';

                    var row = '<tr>' +
                        '<td>' + driverId + '</td>' +
                        '<td>' + name + '</td>' +
                        '<td>' + address + '</td>' +
                        '<td>' + tele + '</td>' +
                        '<td>' +
                            '<button class="btn btn-info editDriverBtn" data-bs-toggle="modal" data-bs-target="#editDriverModal" data-id="' + driverId + '" data-name="' + name + '" data-address="' + address + '" data-tele="' + tele + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                            '<button class="btn btn-danger deleteDriverBtn" data-id="' + driverId + '">' +
                            '<i class="fas fa-trash-alt"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('#driverTableBody').append(row);
                });
            },
            error: function () {
                alert("Error loading drivers.");
            }
        });
    }

    // Function to open the edit modal and fill it with driver data
    $(document).on("click", ".editDriverBtn", function () {
        let driverId = $(this).attr("data-id");
        let name = $(this).attr("data-name");
        let address = $(this).attr("data-address");
        let tele = $(this).attr("data-tele");

        if (!driverId || driverId === "undefined" || driverId === "-") {
            alert("Error: Driver ID is missing. Please check if your table loads correctly.");
            return;
        }

        $("#editDriverId").val(driverId);
        $("#editDriverName").val(name);
        $("#editDriverAddress").val(address);
        $("#editDriverTelephone").val(tele);
    });

    // Function to handle driver update
    function updateDriver() {
        let driverId = $("#editDriverId").val();
        let name = $("#editDriverName").val();
        let address = $("#editDriverAddress").val();
        let tele = $("#editDriverTelephone").val();

        if (driverId === "" || name === "" || address === "" || tele === "" || driverId === null || name === null || address === null || tele === null) {
            alert("Please fill in all fields.");
            return;
        }

        let driverData = {
            driverId: parseInt(driverId),
            name: name,
            address: address,
            tele: tele
        };

        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adrivers/update',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(driverData),
            success: function (response) {
                alert("Driver updated successfully!");
                $("#editDriverModal").modal("hide");
                loadDrivers(); // Refresh the table
            },
            error: function (xhr, status, error) {
                console.error("Update failed:", xhr.responseText);
                alert("Error updating driver: " + xhr.responseText);
            }
        });
    }

    // Handle form submission for updating the driver
    $("#editDriverForm").submit(function (e) {
        e.preventDefault();
        updateDriver();
    });

    // Load drivers when the page is ready
    loadDrivers();
});
 
                               </script>

</html>
