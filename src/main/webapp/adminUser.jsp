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
  
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    
    
    
   <script>
    $(document).ready(function() {
        // Service function to fetch user by ID from the backend
        function getUseri(id, callback) {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/adminUser' ,  // API endpoint with user ID
                type: 'GET',  // HTTP method (GET request)
                dataType: 'json',  // Expected response data type
                success: function(user) {
                    console.log("User data received:", user);  // Log the user data
                    callback(null, user); // Pass the user data to the callback function
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching user:", xhr.responseText);
                    if (xhr.status === 404) {
                        callback('User not found.', null);  // Handle 404 error if user is not found
                    } else if (xhr.status === 500) {
                        callback('Server error. Please try again later.', null);  // Handle 500 server error
                    } else {
                        callback('Error fetching user data. Please try again.', null);  // Generic error
                    }
                }
            });
        }

        // Handle search button click
     $('#searchBtn').click(function(e) {
    e.preventDefault();

    let id = $('#searchInput').val().trim();  

    if (id) {
        console.log("Searching for user with ID:", id); 

        getUseri(id, function(error, users) { // `users` should be an array
            if (error) {
                alert(error);  
            } else {
                $('#userTableBody').empty();  // Clear existing table rows

                // Filter the users array to find the user with the matching ID
                const user = users.find(user => user.id == id);

                if (user) {
                    var userId = user.id ? user.id : '-';
                    var username = user.username ? user.username : '-';
                    var password = user.password ? user.password : '-';

                    var row = '<tr>' +
                        '<td>' + userId + '</td>' +
                        '<td>' + username + '</td>' +
                        '<td>' + password + '</td>' +
                        '<td>' +
                             '<button class="btn btn-info editUserBtn" data-bs-toggle="modal" data-bs-target="#editUserModal" data-id="' + userId + '" data-username="' + username + '" data-password="' + password + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                            '<button class="btn btn-danger deleteUserBtn" data-id="' + userId + '">' +
                            '<i class="fas fa-trash-alt"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('#userTableBody').append(row);
                } else {
                    alert("No user found with the given ID.");
                }
            }
        });
    } else {
        alert('Please enter a User ID to search.');  
    }
});


});
</script>


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
    $(document).ready(function() {
        function getUser() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/user',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);  

                    // Clear the existing table body
                    $('#userTableBody').empty();

                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, user) {
                            console.log(user);  // Log the user object

                            // Ensure values exist to prevent "undefined" issues
                            var userId = user.id ? user.id : '-';
                            var username = user.username ? user.username : '-';
                            var password = user.password ? user.password : '-';

                            // Constructing the table row
                            var row = '<tr>' +
                                '<td>' + userId + '</td>' +
                                '<td>' + username + '</td>' +
                                '<td>' + password + '</td>' +
                                '</tr>';

                            // Append the row to the table
                            $('#userTableBody').append(row);
                        });
                    } else {
                        // If no users are found, display a message in the table
                        $('#userTableBody').html('<tr><td colspan="3" style="text-align:center;">No users found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching users:", xhr.responseText);
                    alert('Error fetching user data. Please try again.');
                }
            });
        }

        // Fetch user data when the page loads
        getUser();
    });
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
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id=" editUserBtn"></button>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function () {
    // Function to load users from API and display them in the table
    function loadUsers() {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/adminUser',
            type: 'GET',
            dataType: 'json',
            success: function (users) {
                $('#userTableBody').empty();
                users.forEach(user => {
                    var userId = user.id ? user.id : '-';
                    var username = user.username ? user.username : '-';
                    var password = user.password ? user.password : '-';

                    var row = '<tr>' +
                        '<td>' + userId + '</td>' +
                        '<td>' + username + '</td>' +
                        '<td>' + password + '</td>' +
                        '<td>' +
                            '<button class="btn btn-info editUserBtn" data-bs-toggle="modal" data-bs-target="#editUserModal" data-id="' + userId + '" data-username="' + username + '" data-password="' + password + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                            '<button class="btn btn-danger deleteUserBtn" data-id="' + userId + '">' +
                            '<i class="fas fa-trash-alt"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('#userTableBody').append(row);
                });
            },
            error: function () {
                alert("Error loading users.");
            }
        });
    }

    // Function to open the edit modal and fill it with user data
   $(document).on("click", ".editUserBtn", function () {
    let userId = $(this).attr("data-id");
    let username = $(this).attr("data-username");
    let password = $(this).attr("data-password");

    console.log("User ID from button:", userId); // Debugging
    console.log("Username from button:", username);
    console.log("Password from button:", password);

    if (!userId || userId === "undefined" || userId === "-") {
        alert("Error: User ID is missing. Please check if your table loads correctly.");
        return;
    }

    $("#editUserId").val(userId);
    $("#editUserUsername").val(username);
    $("#editUserPassword").val(password);
});

    // Function to handle user update
   // Function to handle user update
function updateUser() {
    let userId = $("#editUserId").val();
    let username = $("#editUserUsername").val();
    let password = $("#editUserPassword").val();

    console.log("User ID:", userId);   // Debugging
    console.log("Username:", username);
    console.log("Password:", password);

    // Check if fields are empty or null
    if (userId === "" || username === "" || password === "" || userId === null || username=== null || password === null) {
        alert("Please fill in all fields.");
        return;
    }

    let userData = {
        id: parseInt(userId),  // Ensure ID is a number
        username: username,
        password: password
    };

    console.log("Sending JSON:", JSON.stringify(userData));  // Debugging

    $.ajax({
        url: 'http://localhost:8080/Cab_services/resources/adminUser/update', // Ensure this URL is correct
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(userData),
        success: function (response) {
            alert("User updated successfully!");
            $("#editUserModal").modal("hide");
            loadUsers(); // Refresh the table
        },
        error: function (xhr, status, error) {
            console.error("Update failed:", xhr.responseText);
            alert("Error updating user: " + xhr.responseText);
        }
    });
}

// Handle form submission for updating the user
$("#editUserForm").submit(function (e) {
    e.preventDefault();
    updateUser();
});

    // Load users when the page is ready
    loadUsers();
});

</script>




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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    // Function to delete a user
    $(document).on("click", ".deleteUserBtn", function () {
        let userId = $(this).attr("data-id");

        console.log("User ID to delete:", userId); // Debugging

        if (!userId || userId === "undefined" || userId === "-") {
            alert("Error: User ID is missing.");
            return;
        }

        // Show confirmation modal
        $("#deleteUserModal").modal("show");

        // Set the delete button action
        $("#deleteUserBtn").off("click").on("click", function () {
            $.ajax({
                url:`http://localhost:8080/Cab_services/resources/adminUser`,
                type: "DELETE",
                 dataType: 'json', 
                success: function (response) {
                    alert("User deleted successfully!");
                    $("#deleteUserModal").modal("hide");
                    loadUsers(); // Refresh the user list
                },
                error: function (xhr) {
                    console.error("Delete failed:", xhr.responseText);
                    alert("Error deleting user: " + xhr.responseText);
                }
            });
        });
    });

    // Function to load users
    function loadUsers() {
        $.ajax({
            url: "http://localhost:8080/Cab_services/resources/adminUser",
            type: "GET",
            dataType: "json",
            success: function (users) {
                $("#userTableBody").empty();
                users.forEach(user => {
                    var userId = user.id ? user.id : '-';
                    var username = user.username ? user.username : '-';
                    var password = user.password ? user.password : '-';

                    var row = '<tr>' +
                        '<td>' + userId + '</td>' +
                        '<td>' + username + '</td>' +
                        '<td>' + password + '</td>' +
                        '<td>' +
                            '<button class="btn btn-info editUserBtn" data-bs-toggle="modal" data-bs-target="#editUserModal" data-id="' + userId + '" data-username="' + username + '" data-password="' + password + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                            '<button class="btn btn-danger deleteUserBtn" data-id="' + userId + '">' +
                            '<i class="fas fa-trash-alt"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('#userTableBody').append(row);
                });
            },
            error: function () {
                alert("Error loading users.");
            }
        });
    }


    // Load users when page loads
    loadUsers();
});

</script>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script> 
        
    </body>
</html>
