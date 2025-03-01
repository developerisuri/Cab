<%-- 
    Document   : Acustomer
    Created on : Mar 1, 2025, 9:01:00 AM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
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
            <h2>Customer Registration</h2>
            
            <!-- Search Bar -->
           <form class="d-flex mb-3">
               <input class="form-control me-2" type="search" placeholder="Search for customers..." aria-label="Search" id="searchInput">
               <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
           </form>
            
            <script>
    $(document).ready(function() {
        // Function to fetch customer by ID from the backend
        function getCustomerById(id, callback) {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/acustomer/' + id,  // API endpoint with customer ID
                type: 'GET',  // HTTP GET request
                dataType: 'json',  // Expected response type
                success: function(customer) {
                    console.log("Customer data received:", customer);  // Log customer data
                    callback(null, customer); // Pass the customer data to the callback function
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching customer:", xhr.responseText);
                    if (xhr.status === 404) {
                        callback('Customer not found.', null);  // Handle 404 error if customer is not found
                    } else if (xhr.status === 500) {
                        callback('Server error. Please try again later.', null);  // Handle 500 server error
                    } else {
                        callback('Error fetching customer data. Please try again.', null);  // Generic error
                    }
                }
            });
        }

        // Handle search button click
        $('#searchBtn').click(function(e) {
            e.preventDefault();

            let id = $('#searchInput').val().trim();  

            if (id) {
                console.log("Searching for customer with ID:", id); 

                getCustomerById(id, function(error, customer) { 
                    if (error) {
                        alert(error);  
                    } else {
                        $('#customerTableBody').empty();  // Clear existing table rows

                        if (customer) {
                            var row = '<tr>' +
                                '<td>' + customer.regid + '</td>' +
                                '<td>' + customer.name + '</td>' +
                                '<td>' + customer.address + '</td>' +
                                '<td>' + customer.nic + '</td>' +
                                '<td>' + customer.tele + '</td>' +
                                '<td>' +
                                     '<button class="btn btn-info editCustomerBtn" data-bs-toggle="modal" data-bs-target="#editCustomerModal" ' +
                                     'data-id="' + customer.regid + '" data-name="' + customer.name + '" data-address="' + customer.address + '"' +
                                     'data-nic="' + customer.nic + '" data-telephone="' + customer.tele + '">Edit</button> ' +
                                     '<button class="btn btn-danger deleteCustomerBtn" data-id="' + customer.regid + '">' +
                                     '<i class="fas fa-trash-alt"></i> Delete</button>' +
                                '</td>' +
                                '</tr>';

                            $('#customerTableBody').append(row);
                        } else {
                            alert("No customer found with the given ID.");
                        }
                    }
                });
            } else {
                alert('Please enter a Customer ID to search.');  
            }
        });
    });
</script>

            <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addCustomerModal">Add New Customer</button>
            
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Reg ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>NIC</th>
                        <th>Telephone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="customerTableBody">
                    <!-- Data rows will be dynamically added here -->
                </tbody>
            </table>
        </div>
        
        
        <script>
    $(document).ready(function() {
        function getCustomers() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/acustomer',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);  

                    // Clear existing table body
                    $('#customerTableBody').empty();

                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, customer) {
                            console.log(customer);  

                            // Ensure values exist to prevent "undefined" issues
                            var regid = customer.regid ? customer.regid : '-';
                            var name = customer.name ? customer.name : '-';
                            var address = customer.address ? customer.address : '-';
                            var nic = customer.nic ? customer.nic : '-';
                            var tele = customer.tele ? customer.tele : '-';

                            // Constructing the table row with customer ID and action buttons
                            var row = '<tr>' +
                                '<td>' + regid + '</td>' + 
                                '<td>' + name + '</td>' +
                                '<td>' + address + '</td>' +
                                '<td>' + nic + '</td>' +
                                '<td>' + tele + '</td>' +
                                '<td>' +
                                    '<button class="btn btn-warning btn-sm editCustomer" data-id="' + regid + '">Edit</button> ' +
                                    '<button class="btn btn-danger btn-sm deleteCustomer" data-id="' + regid + '">Delete</button>' +
                                '</td>' +
                                '</tr>';

                            // Append the row to the table
                            $('#customerTableBody').append(row);
                        });
                    } else {
                        // If no customers are found, display a message in the table
                        $('#customerTableBody').html('<tr><td colspan="6" style="text-align:center;">No customers found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching customers:", xhr.responseText);
                    alert('Error fetching customer data. Please try again.');
                }
            });
        }

        // Fetch customer data when the page loads
        getCustomers();
    });
</script>

        
        <!-- Add Customer Modal -->
        <div class="modal fade" id="addCustomerModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Customer</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addCustomerForm">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" id="customerName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" id="customerAddress" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">NIC</label>
                                <input type="text" class="form-control" id="customerNIC" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="customerTele" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <script>
    // Handle form submission for adding a customer
    $("#addCustomerForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var name = $("#customerName").val();
        var address = $("#customerAddress").val();
        var nic = $("#customerNIC").val();
        var telephone = $("#customerTele").val();

        // Create an object to send as JSON
        var customerData = {
            "name": name,
            "address": address,
            "nic": nic,
            "tele": telephone
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/acustomer',  // Replace with your actual endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(customerData),
            success: function (response) {
                // On success, display a success message or handle it
                alert('Customer added successfully!');
                $('#addCustomerModal').modal('hide');  // Close the modal
                $("#addCustomerForm")[0].reset(); // Reset the form
                getCustomers(); // Refresh customer list
            },
            error: function (xhr, status, error) {
                // On error, handle the error
                alert('Error adding customer. Please try again.');
            }
        });
    });
</script>

        
        <!-- Edit Customer Modal -->
        <div class="modal fade" id="editCustomerModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Customer</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editCustomerForm">
                            <input type="hidden" id="editCustomerId">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" id="editCustomerName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" id="editCustomerAddress" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">NIC</label>
                                <input type="text" class="form-control" id="editCustomerNIC" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Telephone</label>
                                <input type="text" class="form-control" id="editCustomerTele" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
    $(document).ready(function () {
        // Function to load customers from API and display them in the table
        function loadCustomers() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/acustomer',
                type: 'GET',
                dataType: 'json',
                success: function (customers) {
                    $('#customerTableBody').empty();
                    customers.forEach(customer => {
                        var row = '<tr>' +
                            '<td>' + customer.regid + '</td>' +
                            '<td>' + customer.name + '</td>' +
                            '<td>' + customer.address + '</td>' +
                            '<td>' + customer.nic + '</td>' +
                            '<td>' + customer.tele + '</td>' +
                            '<td>' +
                                '<button class="btn btn-info editCustomerBtn" data-bs-toggle="modal" data-bs-target="#editCustomerModal" ' +
                                'data-id="' + customer.regid + '" data-name="' + customer.name + '" data-address="' + customer.address + '"' +
                                'data-nic="' + customer.nic + '" data-telephone="' + customer.tele+ '">Edit</button> ' +
                                '<button class="btn btn-danger deleteCustomerBtn" data-id="' + customer.regid + '">Delete</button>' +
                            '</td>' +
                            '</tr>';
                        $('#customerTableBody').append(row);
                    });
                },
                error: function () {
                    alert("Error loading customers.");
                }
            });
        }

        // Function to open the edit modal and fill it with customer data
        $(document).on("click", ".editCustomerBtn", function () {
            let regid = $(this).attr("data-id");
            let name = $(this).attr("data-name");
            let address = $(this).attr("data-address");
            let nic = $(this).attr("data-nic");
            let tele = $(this).attr("data-telephone");

            $("#editCustomerId").val(regid);
            $("#editCustomerName").val(name);
            $("#editCustomerAddress").val(address);
            $("#editCustomerNIC").val(nic);
            $("#editCustomerTele").val(tele);
        });

        // Function to handle customer update
        function updateCustomer() {
            let regid = $("#editCustomerId").val();
            let name = $("#editCustomerName").val();
            let address = $("#editCustomerAddress").val();
            let nic = $("#editCustomerNIC").val();
            let tele = $("#editCustomerTele").val();

            if (!regid || !name || !address || !nic || !tele) {
                alert("Please fill in all fields.");
                return;
            }

            let customerData = {
                regid: parseInt(regid),  // Ensure ID is a number
                name: name,
                address: address,
                nic: nic,
                tele: tele
            };

            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/acustomer/update',
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(customerData),
                success: function (response) {
                    alert("Customer updated successfully!");
                    $("#editCustomerModal").modal("hide");
                    loadCustomers(); // Refresh the table
                },
                error: function (xhr, status, error) {
                    console.error("Update failed:", xhr.responseText);
                    alert("Error updating customer: " + xhr.responseText);
                }
            });
        }

        // Handle form submission for updating the customer
        $("#editCustomerForm").submit(function (e) {
            e.preventDefault();
            updateCustomer();
        });

        // Load customers when the page is ready
        loadCustomers();
    });
</script>

    </body>
</html>
