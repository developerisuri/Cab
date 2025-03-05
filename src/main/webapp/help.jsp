<%-- 
    Document   : help
    Created on : Feb 13, 2025, 2:00:43 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
        
         <nav>
    <div class="logo-container">
    <div class="logo-text">Mega City Cab</div>
    <div class="logo">
        <!-- Replace this with your actual logo image -->
        <img src="cab2.jpg" alt="Mega City Cab Logo">
    </div>
    <div class="menu-icon" onclick="toggleMenu()">&#9776;</div> <!-- Hamburger icon -->
    <div class="nav-links">
         <a href="customerMenu.jsp">Menu</a>
        <a href="customerRegister.jsp">Register</a>
        <a href="booking.jsp">Booking</a>
        <a href="bookingHistory.html">Booking Details</a>
        <a href="billDetails.jsp">Bill Details</a>
        <a href="vehicleInfo.jsp">Vehicle Info</a>
        <a href="logout.html">Driver Info</a>


    </div>
</nav>   
        <!-- Help Button on the Left with an Image -->
<!--div class="help-btn">
    <a href="help.jsp" class="btn btn-help" alt="Help Icon">
        
    </a>
</div-->

    <!-- Logout Button on the Right -->
    <div class="logout-btn">
        <a href="logout.jsp" class="btn btn-logout">Logout</a>
    </div>
 
        
    </head>
    <div class="container">
    <h1 class="page-title">Help Instructions</h1>
    <div class="table-container">
        <table class="help-table">
            <thead>
                <tr>
                    <th>Help ID</th>
                    <th>Instructions</th>
                </tr>
            </thead>
            <tbody id="helpTableBody">
                <!-- Help instructions will be dynamically inserted here -->
            </tbody>
        </table>
    </div>
</div>

        
        
    </body>
    
    <footer>
        <div>
    <div class="footer-container">
        <!-- Copyright -->
        <div>
            <p>&copy; 2025 Mega City Cab</p>
        </div>

        <!-- Footer Links --> 
        <div>
            <a href="privacyPolicy.html">Privacy Policy</a> |
            <a href="termsOfService.html">Terms of Service</a>
        </div>

        <!-- Social Media Links -->
        <div class="social-icons">
            <a href="https://www.facebook.com/MegaCityCab" target="_blank" class="facebook">Facebook</a>
            <a href="https://twitter.com/MegaCityCab" target="_blank" class="twitter">Twitter</a>
            <a href="https://www.instagram.com/MegaCityCab" target="_blank" class="instagram">Instagram</a>
        </div>
        
         <div class="social-icons">
             <a href="customerMenu.jsp  " target="_blank" class="twitter">Menu</a>
            <a href="customerRegister.jsp" target="_blank" class="facebook">Register</a>
             <a href="booking.jsp" target="_blank" class="twitter">Booking</a>
              <a href="bookingDetails.jsp" target="_blank" class="twitter">Booking Details</a>
               <a href="vehicleInfo.jsp" target="_blank" class="twitter">Vehicle Info</a>
            <a href="https://www.instagram.com/MegaCityCab" target="_blank" class="instagram">Instagram</a>
        </div>
    </div>
</footer>
    
    
    <style>
   /* Global reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
     font-weight: bold;
      font-size: 17px;
     
    
    /* Background image setup */
    background: url('v2.png') no-repeat center center;
    background-size: cover;  /* Make sure the image covers the entire page */
    background-attachment: fixed; /* Makes sure the background stays fixed when scrolling (optional) */
    
    height: 20vh; /* Ensure the body takes the full height of the viewport */
    padding-top: 100px; /* Adjusted for better space for the menu */
    margin: 0; /* Remove default margin to ensure full coverage */
}

/* Navigation Bar */
nav {
    background-color: lightseagreen;
    overflow: hidden;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
}

nav a {
    display: inline-block;
    color: #fff;
    padding: 16px 20px;
    text-decoration: none;
    text-align: center;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

nav a:hover {
    background-color: red;
}

/* Logo and Menu */
.logo-container {
    display: flex;
    align-items: center;
    padding: 10px 20px;
}

.logo-text {
    font-size: 24px;
    color: yellow;
    font-weight: bold;
    margin-right: 5px;
}

.logo img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    object-fit: cover;
}

.nav-links {
    float: right;
}

.nav-links a {
    margin-left: 20px;
}

.menu-icon {
    display: none;
}

/* Mobile View */
@media screen and (max-width: 768px) {
    nav a {
        display: block;
        text-align: left;
        padding: 14px;
        border-top: 1px solid #ddd;
    }

    .menu-icon {
        display: block;
        float: right;
        padding: 16px;
        cursor: pointer;
        font-size: 30px;
    }

    .nav-links {
        display: none;
        width: 100%;
    }

    nav.active .nav-links {
        display: block;
    }

    .nav-links a {
        text-align: center;
    }
}
footer {
    background-color: #009688;
    color: white;
    padding: 10px;
    text-align: center;
    margin-top: 40px;
    position: fixed;
    bottom: 0;
    width: 100%;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .container {
        width: 90%;
    }

    #customerId {
        width: 150px;
    }

    #searchButton {
        width: 100%;
    }

    footer {
        position: relative;
    }
}


/* Footer Styling */
footer {
    background-color: yellow;
    color: black;
    padding: 20px 0;
    text-align: center;
    
  
}

footer .footer-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 20px;
      
}

footer .footer-container div {
    margin: 5px 10px;
}

footer .footer-container a {
    color: black;
    text-decoration: none;
    padding: 8px;
    transition: background-color 0.3s ease;
}

footer .footer-container a:hover {
    background-color: red;
    border-radius: 5px;
}

footer .social-icons a {
    font-size: 20px;
    margin: 0 10px;
}

/* Footer Mobile Responsiveness */
@media screen and (max-width: 768px) {
    footer .footer-container {
        flex-direction: column;
    }
}

/* Help and Logout Button Styling */
.help-btn, .logout-btn {
    position: fixed;
    top: 120px;
    z-index: 10;
}

.help-btn {
    left: 20px;
}

.logout-btn {
    right: 20px;
}

/* Help Button Styling */
.btn-help {
    width: 80px;
    height: 80px;
    background-color: #007bff;
    border-radius: 50%;
    background-image: url('help.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.btn-help:hover {
    background-color: #0056b3;
    transform: scale(1.1); /* Slightly enlarges the button */
}

/* Assuming the icon is an image or an element inside the button */
.btn-help img {
    transition: transform 0.3s ease;
}

/* Hover effect for the icon/image */
.btn-help:hover img {
    transform: scale(1.2); /* Enlarges the image */
}

.btn-logout {
    background-color: #333;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

.btn-logout:hover {
    background-color: red;
    
    
    .container {
    width: 80%;
    margin: auto;
    text-align: center;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

/* Container styling */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    text-align: center;
}

.page-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
}

.table-container {
    width: 80%;
    max-width: 800px;
    margin: 0 auto;
}

.help-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 18px;
    font-weight: bold;
}

.help-table th, .help-table td {
    border: 2px solid #000;
    padding: 12px;
    text-align: center;
     font-weight: bold;
}

.help-table th {
    background-color: #f4f4f4;
}

/* Table body styling */
.help-table td {
    padding: 12px;
    text-align: center ;
    border: 10px solid #ddd;
     font-weight: bold;
   
}


/* Alternate row background for better readability */
.help-table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

/* Hover effect */
.help-table tbody tr:hover {
    background-color: #f1f1f1;
}

 }
/* Responsive design */
@media (max-width: 768px) {
    .help-table {
        width: 100%;
    }

    .help-table th, .help-table td {
        font-size: 14px;
        padding: 8px;
    }
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

<script>
    $(document).ready(function() {
        function getAllHelpInstructions() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/help',  
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
                                        '<td class="long-text">' + instructions + '</td>' +
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
                    alert('Error fetching help data. Please try again.');
                }
            });
        }

        // Fetch help instructions when the page loads
        getAllHelpInstructions();
    });
</script>


</html>
