<%-- 
    Document   : Ahelp
    Created on : Feb 25, 2025, 3:20:52 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help Management</title>
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
           <h2>Help Management</h2>
           
           <!-- Search Bar -->
           <form class="d-flex mb-3">
               <input class="form-control me-2" type="search" placeholder="Search for help instructions..." aria-label="Search" id="searchInput">
               <button class="btn btn-primary" type="submit" id="searchBtn">Search</button>
           </form>
           
           
           <script>
$(document).ready(function() {
    // Service function to fetch help instruction by ID from the backend
    function getHelpById(id, callback) {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/ahelp/' + id,  // API endpoint with help ID
            type: 'GET',  // HTTP method (GET request)
            dataType: 'json',  // Expected response data type
            success: function(help) {
                console.log("Help data received:", help);  // Log the help data
                callback(null, help); // Pass the help data to the callback function
            },
            error: function(xhr, status, error) {
                console.error("Error fetching help:", xhr.responseText);
                if (xhr.status === 404) {
                    callback('Help instruction not found.', null);  // Handle 404 error if help not found
                } else if (xhr.status === 500) {
                    callback('Server error. Please try again later.', null);  // Handle 500 server error
                } else {
                    callback('Error fetching help instruction. Please try again.', null);  // Generic error
                }
            }
        });
    }

    // Handle search button click for help instructions
    $('#searchBtn').click(function(e) {
        e.preventDefault();

        let id = $('#searchInput').val().trim();  // Get the ID from input

        if (id) {
            console.log("Searching for help instruction with ID:", id);

            getHelpById(id, function(error, help) { // `help` is an object
                if (error) {
                    alert(error);  
                } else {
                    // Display the result
                    if (help) {
                        // Assuming you're displaying the result in a specific div or area
                        $('#helpTableBody').empty();  // Clear existing table rows

                        var helpId = help.helpId ? help.helpId : '-';
                        var instructions = help.instructions ? help.instructions : '-';

                        var row = '<tr>' +
                            '<td>' + helpId + '</td>' +
                            '<td>' + instructions + '</td>' +
                            '<td>' +
                                '<button class="btn btn-info editHelpBtn" data-bs-toggle="modal" data-bs-target="#editHelpModal" data-id="' + helpId + '" data-instructions="' + instructions + '">' +
                                '<i class="fas fa-edit"></i> Edit</button>' +
                            '</td>' +
                            '</tr>';

                        $('#helpTableBody').append(row);
                    } else {
                        alert("No help instruction found with the given ID.");
                    }
                }
            });
        } else {
            alert('Please enter a Help ID to search.');  
        }
    });
});
</script>

           
           <!-- Add Help Button -->
           <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addHelpModal">
               Add New Help Instruction
           </button>

           
           <!-- Help Table -->
           <table class="table table-bordered table-striped table-responsive">
               <thead>
               <tr>
                   <th>ID</th>
                   <th>Instructions</th>
                   <th>Actions</th>
               </tr>
               </thead>
               <tbody id="helpTableBody">
                   <!-- Data rows will be dynamically added here -->
               </tbody>
           </table>
       </div>
       <script>
    $(document).ready(function() {
        function getHelpInstructions() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/ahelp',  
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log("Data received:", data);  

                    // Clear the existing table body
                    $('#helpTableBody').empty();

                    // Check if data is valid and not empty
                    if (Array.isArray(data) && data.length > 0) {
                        $.each(data, function(index, help) {
                            console.log(help);  // Log the help object

                            // Ensure values exist to prevent "undefined" issues
                            var helpId = help.helpId ? help.helpId : '-';
                            var instructions = help.instructions ? help.instructions : '-';

                            // Constructing the table row
                            var row = '<tr>' +
                                '<td>' + helpId + '</td>' +
                                '<td>' + instructions + '</td>' +
                                '</tr>';

                            // Append the row to the table
                            $('#helpTableBody').append(row);
                        });
                    } else {
                        // If no help instructions are found, display a message in the table
                        $('#helpTableBody').html('<tr><td colspan="2" style="text-align:center;">No help instructions found</td></tr>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching help instructions:", xhr.responseText);
                    alert('Error fetching help instructions. Please try again.');
                }
            });
        }

        // Fetch help instructions when the page loads
        getHelpInstructions();
    });
</script>

       
       <!-- Add Help Instruction Modal -->
      <div class="modal fade" id="addHelpModal" tabindex="-1" aria-labelledby="addHelpModalLabel" aria-hidden="true">

           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="addHelpModalLabel">Add New Help Instruction</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                 
                       
                       <form id="addHelpForm">
                           <div class="mb-3">
                               <label class="form-label">Instructions</label>
                               <textarea class="form-control" id="helpInstructions" required></textarea>
                           </div>
                           <button type="submit" class="btn btn-primary">Add Help Instruction</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       <script>
    // Handle form submission for adding help instruction
    $("#addHelpForm").submit(function (event) {
        event.preventDefault(); // Prevent default form submission

        // Get the form data
        var instructions = $("#helpInstructions").val();

        // Create an object to send as JSON
        var helpData = {
            "instructions": instructions
        };

        // AJAX request to the RESTful service
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/ahelp',  // Replace with your actual endpoint URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(helpData),
            success: function (response) {
                // On success, display a success message or handle it
                alert('Help instruction added successfully!');
                $('#addHelpModal').modal('hide');  // Close the modal
            },
            error: function (xhr, status, error) {
                // On error, handle the error
                alert('Error adding help instruction. Please try again.');
            }
        });
    });
</script>

       
       
       <!-- Edit Help Instruction Modal -->
       <div class="modal fade" id="editHelpModal" tabindex="-1" aria-labelledby="editHelpModalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="editHelpModalLabel">Edit Help Instruction</h5>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <form id="editHelpForm">
                           <input type="hidden" id="editHelpId">
                           <div class="mb-3">
                               <label class="form-label">Instructions</label>
                               <textarea class="form-control" id="editHelpInstructions" required></textarea>
                           </div>
                           <input type="hidden" id="editHelpId">
                    <button type="submit" class="btn btn-primary"> Update Help Instruction</button>
                   </div>
               </div>
           </div>
       </div>
      
       
       <script>
$(document).ready(function () {
    // Function to load help instructions from API and display them in a table
    function loadHelpInstructions() {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/ahelp',  // Replace with your actual help endpoint URL
            type: 'GET',
            dataType: 'json',
            success: function (helpInstructions) {
                $('#helpTableBody').empty();  // Ensure you have a table body with id 'helpTableBody'
                helpInstructions.forEach(help => {
                    var helpId = help.helpId ? help.helpId : '-';
                    var instructions = help.instructions ? help.instructions : '-';

                    var row = '<tr>' +
                        '<td>' + helpId + '</td>' +
                        '<td>' + instructions + '</td>' +
                        '<td>' +
                            '<button class="btn btn-info editHelpBtn" data-bs-toggle="modal" data-bs-target="#editHelpModal" data-id="' + helpId + '" data-instructions="' + instructions + '">' +
                            '<i class="fas fa-edit"></i> Edit</button> ' +
                        '</td>' +
                        '</tr>';

                    $('#helpTableBody').append(row);
                });
            },
            error: function () {
                alert("Error loading help instructions.");
            }
        });
    }

    // Function to open the edit modal and fill it with help data
    $(document).on("click", ".editHelpBtn", function () {
        let helpId = $(this).attr("data-id");
        let instructions = $(this).attr("data-instructions");

        console.log("Help ID from button:", helpId);  // Debugging
        console.log("Instructions from button:", instructions);

        if (!helpId || helpId === "undefined" || helpId === "-") {
            alert("Error: Help ID is missing. Please check if your table loads correctly.");
            return;
        }

        $("#editHelpId").val(helpId);
        $("#editHelpInstructions").val(instructions);
    });

    // Function to handle help update
    function updateHelp() {
        let helpId = $("#editHelpId").val();
        let instructions = $("#editHelpInstructions").val();

        console.log("Help ID:", helpId);   // Debugging
        console.log("Instructions:", instructions);

        // Check if fields are empty or null
        if (helpId === "" || instructions === "" || helpId === null || instructions === null) {
            alert("Please fill in all fields.");
            return;
        }

        let helpData = {
            help_id: parseInt(helpId),  // Ensure help_id is a number
            instructions: instructions
        };

        console.log("Sending JSON:", JSON.stringify(helpData));  // Debugging

        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/ahelp/update',  // Replace with your actual update endpoint URL
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(helpData),
            success: function (response) {
                alert("Help instruction updated successfully!");
                $("#editHelpModal").modal("hide");
                loadHelpInstructions(); // Refresh the table
            },
            error: function (xhr, status, error) {
                console.error("Update failed:", xhr.responseText);
                alert("Error updating help instruction: " + xhr.responseText);
            }
        });
    }

    // Handle form submission for updating the help instruction
    $("#editHelpForm").submit(function (e) {
        e.preventDefault();
        updateHelp();
    });

    // Load help instructions when the page is ready
    loadHelpInstructions();
});
</script>

    </body>


</html>
