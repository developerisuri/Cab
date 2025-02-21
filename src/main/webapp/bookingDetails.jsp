<%-- 
    Document   : bookingDetails
    Created on : Jan 31, 2025, 8:22:25 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Details</title>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
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
        <a href="logout.html">Bill Details</a>
        <a href="logout.html">Vehicle Info</a>
        <a href="logout.html">Driver Info</a>


    </div>
</nav>
    </head>
    <body>
         
        <!-- Help Button on the Left with an Image -->
<div class="help-btn">
    <a href="help.jsp" class="btn btn-help" alt="Help Icon">
        
    </a>
</div>

    <!-- Logout Button on the Right -->
    <div class="logout-btn">
        <a href="logout.jsp" class="btn btn-logout">Logout</a>
    </div>

  <div class="container">
  <!-- Title -->
  <h2>Booking Details</h2>
  
  <!-- Search Section -->
  <div class="search-section">
    <label for="orderNumber">Enter Order Number:</label>
    <input type="text" id="orderNumber" placeholder="Enter your order number" />
    <button id="searchButton">Search</button>
  </div>
  
  <!-- Booking Details (Initially Hidden) -->
  <div id="bookingDetails" class="booking-details" style="display:none;">
    <h3>Booking Information</h3>
    <ul>
        <li><strong>Booking ID:</strong> <span id="bookId"></span></li>
        <li><strong>Order Number:</strong> <span id="orderNum"></span></li>
        <li><strong>Customer Name:</strong> <span id="customerName"></span></li>
        <li><strong>Customer Address:</strong> <span id="customerAddress"></span></li>
        <li><strong>Destination:</strong> <span id="destination"></span></li>
        <li><strong>Kilometers:</strong> <span id="kilometers"></span></li>
        <li><strong>Vehicle ID:</strong> <span id="vehicleId"></span></li>
        <li><strong>Driver ID:</strong> <span id="driverId"></span></li>
    </ul>
</div>

  <!-- Error Message (Initially Hidden) -->
  <div id="errorMessage" class="error-message" style="display:none;">
    <p>No booking found with this order number. Please try again.</p>
  </div>
</div>
    
    </body>
    
    <footer>
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
             <a href="customerMenu.jsp" target="_blank" class="twitter">Menu</a>
            <a href="customerRegister.jsp" target="_blank" class="facebook">Register</a>
             <a href="booking.jsp" target="_blank" class="twitter">Booking</a>
              <a href="bookingDetails.jsp" target="_blank" class="twitter">Booking Details</a>
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
    background: url('bookingde2.jpg') no-repeat center center/cover;
    padding-top: 100px; /* Adjusted for better space for the menu */
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

main {
    flex: 1; /* Allows the content area to grow and take up available space */
}

/* Footer Styling */
footer {
    background-color: yellow;
    color: black;
    padding: 20px 0;
    text-align: center;
    position: relative; /* Ensures the footer stays within the page layout */
    width: 100%;
}

footer .footer-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 20px;
    margin: 0 auto;
    max-width: 1200px;
}

footer .footer-container div {
    margin: 5px 10px;
}

/* Footer Links */
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

/* Social Icons */
footer .social-icons a {
    font-size: 20px;
    margin: 0 10px;
}

/* Footer Positioning */
footer {
    position: relative;
    width: 100%;
}

/* Footer Mobile Responsiveness */
@media screen and (max-width: 768px) {
    footer .footer-container {
        flex-direction: column;
        padding: 10px;
    }
    
    footer .footer-container div {
        margin: 10px 0;
    }
    
    footer .footer-container a {
        padding: 12px;
        font-size: 16px;
    }

    footer .social-icons a {
        font-size: 18px;
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
}

/* Main content container */
.container {
  width: 70%;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

h2 {
  text-align: center;
   font-size: 50px;
    font-weight: bold;
    color:darkblue;
}

.search-section {
  text-align: center;
  margin-bottom: 20px;
  font-weight:bold;
  color:black;
  font-size:25px;
}

#orderNumber {
  padding: 8px;
  margin-right: 10px;
  width: 200px;
  font-weight: bold;
}

#searchButton {
  padding: 8px 16px;
  cursor: pointer;
  background-color: yellow;
  font-weight: bold;
  font-size: 20px;
  border: 2px solid transparent; /* Border to transition */
  border-radius: 5px; /* Optional, for rounded corners */
  transition: background-color 0.3s ease, transform 0.3s ease, border-color 0.3s ease; /* Smooth transition */
}

#searchButton:hover {
  background-color: orange; /* Change background color on hover */
  color: white; /* Change text color on hover */
  transform: scale(1.1); /* Slightly enlarge the button */
  border-color: #ff6600; /* Optional: Add a border on hover */
}

/* Optional: Add a loading spinner inside the button during processing */
#searchButton.processing::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 24px;
  height: 24px;
  border: 4px solid #fff;
  border-top: 4px solid #007bff; /* Blue spinner */
  border-radius: 50%;
  animation: spin 1s linear infinite;
  transform: translate(-50%, -50%);
}

/* Spinner Animation */
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}


.booking-details {
  margin-top: 20px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 10px;
}

li strong {
  font-weight: bold;
  
}

.error-message {
  color: red;
  text-align: center;
  margin-top: 20px;
  font-size: 16px;
}



        </style>
        
          <script>
    // Function to toggle the navigation menu on small screens
    function toggleMenu() {
        const nav = document.querySelector('nav');
        nav.classList.toggle('active');
    }
</script>

 <script>
    $(document).ready(function() {
        // Function to fetch booking details by order number
        function getBookingByOrderNum(orderNum) {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/bookings/' + orderNum, // Adjust API endpoint
                type: 'GET',
                contentType: 'application/json',
                success: function(booking) {
                    console.log("Booking data received:", booking);  

                    if (booking) {
                        // Populate UI with booking details
                        $("#bookId").text(booking.bookId);
                        $("#orderNum").text(booking.ordernum);
                        $("#customerName").text(booking.cname);
                        $("#customerAddress").text(booking.caddress);
                        $("#destination").text(booking.destination);
                        $("#kilometers").text(booking.km);
                        $("#vehicleId").text(booking.vehicleId);
                        $("#driverId").text(booking.driverId);

                        // Show booking details section
                        $("#bookingDetails").css("display", "block");
                        $("#errorMessage").css("display", "none"); // Hide error message
                    } else {
                        $("#bookingDetails").css("display", "none");
                        $("#errorMessage").css("display", "block").text("No booking found for this order number.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching booking:", xhr.responseText);
                    $("#bookingDetails").css("display", "none");
                    $("#errorMessage").css("display", "block").text("Error fetching booking. Please try again.");
                }
            });
        }

        // Handle search button click
        $("#searchButton").click(function(e) {
            e.preventDefault();
            let orderNum = $("#orderNumber").val().trim(); // Get order number input

            if (orderNum) {
                console.log("Searching for booking with Order Number:", orderNum);
                getBookingByOrderNum(orderNum);
            } else {
                alert("Please enter an Order Number.");
            }
        });
    });
</script>


</html>
