<%-- 
    Document   : adminUser
    Created on : Feb 8, 2025, 7:36:35 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manage</title>
        <!-- Bootstrap CSS for responsive design -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css"> <!-- Custom CSS for Styling -->
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    
    <body>
       
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
    <h2>User Manager</h2>
    
    <!-- Search Bar -->
    <form class="d-flex mb-3">
        <input class="form-control me-2" type="search" placeholder="Search for users..." aria-label="Search" id="searchInput">
        <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
    </form>

    <!-- Add User Button -->
    <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addUserModal">
        <i class="fas fa-user-plus"></i> Add New User
    </button>
    
    
   


    <!-- User Table -->
    <table class="table table-bordered table-striped table-responsive">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="userTableBody">
            <!-- Data rows will be dynamically added here -->
        </tbody>
    </table>
</div>
       
   <script>
        // Function to fetch users from the RESTful service
        function fetchUsers() {
            fetch('http://localhost:8080/Cab_services/resources/adminUser')  // Replace with your actual REST endpoint
                .then(response => response.json())  // Parse the JSON response
                .then(data => {
                    displayUsers(data);  // Call the function to display users
                })
                .catch(error => console.error('Error fetching users:', error));
        }

        // Function to display the list of users in the table
        function displayUsers(users) {
            const usersTable = document.getElementById('usersTable');
            usersTable.innerHTML = '';  // Clear previous content

            // Loop through each user and display them in the table
            users.forEach(user => {
                const row = document.createElement('tr');
                const cell1 = document.createElement('td');
                const cell2 = document.createElement('td');
                const cell3 = document.createElement('td');

                cell1.textContent = user.id;
                cell2.textContent = user.username;
                cell3.textContent = user.password;  // Be cautious about showing passwords

                row.appendChild(cell1);
                row.appendChild(cell2);
                row.appendChild(cell3);

                usersTable.appendChild(row);
            });
        }

        // Call the fetchUsers function when the page loads
        window.onload = fetchUsers;
    </script>    
       
       

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addUserForm">
                    <div class="mb-3">
                        <label for="userUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="userUsername" required>
                    </div>
                    <div class="mb-3">
                        <label for="userPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="userPassword" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add User</button>
                </form>
            </div>
        </div>
    </div>
</div>


 <!-- Include jQuery (optional) and AJAX for handling the form submission -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    // Handle form submission
    $("#addUserForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var username = $("#userUsername").val();
        var password = $("#userPassword").val();

        // Create an object to send as JSON
        var userData = {
            "username": username,
            "password": password
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adminUser',  // Replace with your actual endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(userData),
            success: function (response) {
                // On success, display a success message or handle it
                alert('User added successfully!');
                $('#addUserModal').modal('hide');  // Close the modal
            },
            error: function (xhr, status, error) {
                // On error, handle the error
                alert('Error adding user. Please try again.');
            }
        });
    });
</script>

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editUserForm">
                    <div class="mb-3">
                        <label for="editUserUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="editUserUsername" required>
                    </div>
                    <div class="mb-3">
                        <label for="editUserPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="editUserPassword" required>
                    </div>
                    <input type="hidden" id="editUserId">
                    <button type="submit" class="btn btn-primary">Update User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete User Confirmation Modal -->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this user?</p>
                <button type="button" class="btn btn-danger" id="deleteUserBtn">Delete</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script> 
        
    </body>
</html>
