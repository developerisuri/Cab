<%-- 
    Document   : Abooking
    Created on : Mar 1, 2025, 9:04:01 AM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        
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
            <h2>Booking Management</h2>
            
            <form class="d-flex mb-3">
                <input class="form-control me-2" type="search" placeholder="Search bookings..." aria-label="Search" id="searchInput">
                <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
            </form>
            
            <script>
    $(document).ready(function () {
        // Function to fetch booking by ID from the backend
        function getBookingById(id, callback) {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/abookings/' + id, // API endpoint with booking ID
                type: 'GET', // HTTP GET method
                dataType: 'json', // Expected response format
                success: function (booking) {
                    console.log("Booking data received:", booking); // Log booking data
                    callback(null, booking); // Pass booking data to callback
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching booking:", xhr.responseText);
                    if (xhr.status === 404) {
                        callback('Booking not found.', null); // Handle 404 error
                    } else if (xhr.status === 500) {
                        callback('Server error. Please try again later.', null); // Handle 500 error
                    } else {
                        callback('Error fetching booking data. Please try again.', null); // Generic error
                    }
                }
            });
        }

        // Handle search button click
        $('#searchBtn').click(function (e) {
            e.preventDefault();

            let id = $('#searchInput').val().trim(); // Get and trim user input

            if (id) {
                console.log("Searching for booking with ID:", id);

                getBookingById(id, function (error, booking) {
                    if (error) {
                        alert(error);
                    } else {
                        $('#bookingTableBody').empty(); // Clear existing table rows

                        if (booking) {
                            var row = '<tr>' +
                                '<td>' + booking.bookId + '</td>' +
                                '<td>' + booking.ordernum + '</td>' +
                                '<td>' + booking.cname + '</td>' +
                                '<td>' + booking.caddress + '</td>' +
                                '<td>' + booking.ctele + '</td>' +
                                '<td>' + booking.destination + '</td>' +
                                '<td>' + booking.km + '</td>' +
                                '<td>' + booking.vehicleId + '</td>' +
                                '<td>' + booking.driverId + '</td>' +
                                '<td>' +
                                    '<button class="btn btn-info editBookingBtn" data-bs-toggle="modal" data-bs-target="#editBookingModal" ' +
                                    'data-id="' + booking.bookId + '" data-ordernum="' + booking.ordernum + '" data-cname="' + booking.cname + '"' +
                                    'data-caddress="' + booking.caddress + '" data-ctele="' + booking.ctele + '" data-destination="' + booking.destination + '"' +
                                    'data-km="' + booking.km + '" data-vehicleid="' + booking.vehicleId + '" data-driverid="' + booking.driverId + '">' +
                                    'Edit</button> ' +
                                    '<button class="btn btn-danger deleteBookingBtn" data-id="' + booking.bookId + '">' +
                                    '<i class="fas fa-trash-alt"></i> Delete</button>' +
                                '</td>' +
                                '</tr>';

                            $('#bookingTableBody').append(row);
                        } else {
                            alert("No booking found with the given ID.");
                        }
                    }
                });
            } else {
                alert('Please enter a Booking ID to search.');
            }
        });
    });
</script>
            
            <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addBookingModal">Add New Booking</button>
            
            <table class="table table-bordered table-striped table-responsive">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Order Number</th>
                        <th>Customer Name</th>
                        <th>Address</th>
                        <th>Telephone</th>
                        <th>Destination</th>
                        <th>KM</th>
                        <th>Vehicle</th>
                        <th>Driver</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="bookingTableBody">
                    <!-- Data rows will be dynamically added here -->
                </tbody>
            </table>
        </div>
        
        <script>
    $(document).ready(function() {
        function getBookings() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/abookings',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);

                    // Clear the existing table body
                    $('#bookingTableBody').empty();

                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, booking) {
                            console.log(booking);

                            // Ensure values exist to prevent "undefined" issues
                            var bookId = booking.bookId ? booking.bookId : '-';
                            var orderNum = booking.ordernum ? booking.ordernum : '-';
                            var cname = booking.cname ? booking.cname : '-';
                            var caddress = booking.caddress ? booking.caddress : '-';
                            var ctele = booking.ctele ? booking.ctele : '-';
                            var destination = booking.destination ? booking.destination : '-';
                            var km = booking.km ? booking.km : '-';
                            var vehicleId = booking.vehicleId ? booking.vehicleId : '-';
                            var driverId = booking.driverId ? booking.driverId : '-';

                            // Constructing the table row with booking data and action buttons
                            var row = '<tr>' +
                                '<td>' + bookId + '</td>' + 
                                '<td>' + orderNum + '</td>' +
                                '<td>' + cname + '</td>' +
                                '<td>' + caddress + '</td>' +
                                '<td>' + ctele + '</td>' +
                                '<td>' + destination + '</td>' +
                                '<td>' + km + '</td>' +
                                '<td>' + vehicleId + '</td>' +
                                '<td>' + driverId + '</td>' +
                                '<td>' +
                                    '<button class="btn btn-warning btn-sm editBooking" data-id="' + bookId + '">Edit</button> ' +
                                    '<button class="btn btn-danger btn-sm deleteBooking" data-id="' + bookId + '">Delete</button>' +
                                '</td>' +
                                '</tr>';

                            // Append the row to the table
                            $('#bookingTableBody').append(row);
                        });
                    } else {
                        // If no bookings are found, display a message in the table
                        $('#bookingTableBody').html('<tr><td colspan="10" style="text-align:center;">No bookings found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching bookings:", xhr.responseText);
                    alert('Error fetching booking data. Please try again.');
                }
            });
        }

        // Fetch booking data when the page loads
        getBookings();
    });
</script>

        
        <!-- Add Booking Modal -->
        <div class="modal fade" id="addBookingModal" tabindex="-1" aria-labelledby="addBookingModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBookingModalLabel">Add New Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addBookingForm">
                            <div class="mb-3">
                                <label class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="bookingCname" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" id="bookingAddress" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="bookingTelephone" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Destination</label>
                                <input type="text" class="form-control" id="bookingDestination" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">KM</label>
                                <input type="number" class="form-control" id="bookingKm" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Vehicle ID</label>
                                <input type="number" class="form-control" id="bookingVehicleId" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Driver ID</label>
                                <input type="number" class="form-control" id="bookingDriverId" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
            
      <script>
    // Handle form submission for adding a booking
    $("#addBookingForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var cname = $("#bookingCname").val();
        var caddress = $("#bookingAddress").val();
        var ctele = $("#bookingTelephone").val();
        var destination = $("#bookingDestination").val();
        var km = $("#bookingKm").val();
        var vehicleId = $("#bookingVehicleId").val();
        var driverId = $("#bookingDriverId").val();

        // Create an object to send as JSON
        var bookingData = {
            "cname": cname,
            "caddress": caddress,
            "ctele": ctele,
            "destination": destination,
            "km": parseInt(km),
            "vehicleId": parseInt(vehicleId),
            "driverId": parseInt(driverId)
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/abookings',  
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(bookingData),
            success: function (response) {
                alert('Booking added successfully!');
                $('#addBookingModal').modal('hide');  
                $("#addBookingForm")[0].reset(); 
            },
            error: function (xhr, status, error) {
                alert('Error adding booking. Please try again.');
            }
        });
    });
</script>

        
        
        <!-- Edit Booking Modal -->
        <div class="modal fade" id="editBookingModal" tabindex="-1" aria-labelledby="editBookingModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editBookingModalLabel">Edit Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editBookingForm">
                            <input type="hidden" id="editBookingId">
                            <div class="mb-3">
    <label class="form-label">Order Number</label>
    <input type="text" class="form-control" id="editBookingOrdernum" required>
</div>

                            <div class="mb-3">
                                <label class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="editBookingCname" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" id="editBookingAddress" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="editBookingTelephone" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Destination</label>
                                <input type="text" class="form-control" id="editBookingDestination" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">KM</label>
                                <input type="number" class="form-control" id="editBookingKm" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Vehicle ID</label>
                                <input type="number" class="form-control" id="editBookingVehicleId" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Driver ID</label>
                                <input type="number" class="form-control" id="editBookingDriverId" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Update Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script>
    $(document).ready(function () {
        // Function to load bookings from API and display them in the table
        function loadBookings() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/abookings',
                type: 'GET',
                dataType: 'json',
                success: function (bookings) {
                    $('#bookingTableBody').empty();
                    bookings.forEach(booking => {
                        var row = '<tr>' +
                            '<td>' + booking.bookId + '</td>' +
                            '<td>' + booking.ordernum + '</td>' +
                            '<td>' + booking.cname + '</td>' +
                            '<td>' + booking.caddress + '</td>' +
                            '<td>' + booking.ctele + '</td>' +
                            '<td>' + booking.destination + '</td>' +
                            '<td>' + booking.km + '</td>' +
                            '<td>' + booking.vehicleId + '</td>' +
                            '<td>' + booking.driverId + '</td>' +
                            '<td>' +
                                '<button class="btn btn-info editBookingBtn" data-bs-toggle="modal" data-bs-target="#editBookingModal" ' +
                                'data-id="' + booking.bookId + '" data-ordernum="' + booking.ordernum + '" data-cname="' + booking.cname + '"' +
                                'data-caddress="' + booking.caddress + '" data-ctele="' + booking.ctele + '" data-destination="' + booking.destination + '"' +
                                'data-km="' + booking.km + '" data-vehicleid="' + booking.vehicleId + '" data-driverid="' + booking.driverId + '">Edit</button> ' +
                                '<button class="btn btn-danger deleteBookingBtn" data-id="' + booking.bookId + '">Delete</button>' +
                            '</td>' +
                            '</tr>';
                        $('#bookingTableBody').append(row);
                    });
                },
                error: function () {
                    alert("Error loading bookings.");
                }
            });
        }

        // Function to open the edit modal and fill it with booking data
        $(document).on("click", ".editBookingBtn", function () {
            let bookId = $(this).attr("data-id");
            let ordernum = $(this).attr("data-ordernum");
            let cname = $(this).attr("data-cname");
            let caddress = $(this).attr("data-caddress");
            let ctele = $(this).attr("data-ctele");
            let destination = $(this).attr("data-destination");
            let km = $(this).attr("data-km");
            let vehicleId = $(this).attr("data-vehicleid");
            let driverId = $(this).attr("data-driverid");

            $("#editBookingId").val(bookId);
            $("#editBookingOrdernum").val(ordernum);
            $("#editBookingCname").val(cname);
            $("#editBookingAddress").val(caddress);
            $("#editBookingTelephone").val(ctele);
            $("#editBookingDestination").val(destination);
            $("#editBookingKm").val(km);
            $("#editBookingVehicleId").val(vehicleId);
            $("#editBookingDriverId").val(driverId);
        });

        // Function to handle booking update
    $(document).ready(function () {
    // Function to update booking
    function updateBooking() {
        let bookId = $.trim($("#editBookingId").val());
        let ordernum = $.trim($("#editBookingOrdernum").val());
        let cname = $.trim($("#editBookingCname").val());
        let caddress = $.trim($("#editBookingAddress").val());
        let ctele = $.trim($("#editBookingTelephone").val());
        let destination = $.trim($("#editBookingDestination").val());
        let km = $.trim($("#editBookingKm").val());
        let vehicleId = $.trim($("#editBookingVehicleId").val());
        let driverId = $.trim($("#editBookingDriverId").val());

        // Debugging: Log values before validation
        console.log("Form Values:", { bookId, ordernum, cname, caddress, ctele, destination, km, vehicleId, driverId });

        // Ensure all fields are properly filled
        if (!bookId || !ordernum || !cname || !caddress || !ctele || !destination || !km || !vehicleId || !driverId) {
            alert("Please fill in all fields.");
            return;
        }

        let bookingData = {
            bookId: parseInt(bookId, 10),
            ordernum: ordernum,
            cname: cname,
            caddress: caddress,
            ctele: ctele,
            destination: destination,
            km: parseInt(km, 10),
            vehicleId: parseInt(vehicleId, 10),
            driverId: parseInt(driverId, 10)
        };

        // Debugging: Log data before sending AJAX request
        console.log("Sending Data:", bookingData);

        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/abookings/update',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(bookingData),
            success: function (response) {
                alert("Booking updated successfully!");
                $("#editBookingModal").modal("hide");
                loadBookings(); // Refresh the table
            },
            error: function (xhr, status, error) {
                console.error("Update failed:", xhr.responseText);
                alert("Error updating booking: " + xhr.responseText);
            }
        });
    }

    // Handle form submission for updating the booking
    $("#editBookingForm").submit(function (e) {
        e.preventDefault();
        updateBooking();
    });

    // Ensure modal fields are populated correctly when modal is opened
    $("#editBookingModal").on("shown.bs.modal", function () {
        console.log("Modal Opened - Booking ID:", $("#editBookingId").val());
    });

    // Load bookings when the page is ready
    loadBookings();
});
});

</script>

    </body>
</html>



 