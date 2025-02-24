<%-- 
    Document   : booking
    Created on : Jan 30, 2025, 4:40:14 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Booking</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <a href="bookingDetails.jsp">Booking Details</a>
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

    </head>
    
        
        <h1>Booking Page</h1>

    <!-- Form to Display & Insert Data -->
<form >
    <div>
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required />
    </div>

    <div>
        <label for="customerAddress">Customer Address:</label>
        <input type="text" id="customerAddress" name="customerAddress" required />
    </div>

    <div>
        <label for="customerTelephone">Telephone Number:</label>
        <input type="text" id="customerTelephone" name="customerTelephone" required />
    </div>

    <div>
        <label for="destination">Destination Name:</label>
        <input type="text" id="destination" name="destination" required />
    </div>

    <div>
        <label for="kilometers">Kilometers:</label>
        <input type="number" id="kilometers" name="kilometers" required />
    </div>

    <div>
        <label for="vehicle">Select Vehicle:</label>
    <select id="vehicle" name="vehicle" required>
        <option value="">Select Vehicle</option>
        <c:forEach var="vehicle" items="${vehicleList}">
            <option value="${vehicle.vehicleId}">${vehicle.model}</option>
        </c:forEach>
    </select>
    </div>
        
        
        <!--select name="vehicle">
    <option value="vehicle">Select a Vehicle</option>
    <//c:forEach var="vehicle" items="${vehicles}">
        <option value="${vehicle.vehicleId}">${vehicle.model}</option>
    <///c:forEach>
</select>
    </div-->

    <div>
        <label for="driver">Driver:</label>
        <select id="driver" name="driver" required>
            <option value="">Select Driver</option>
            <c:forEach var="driver" items="${driverList}">
                <option value="${driver.driverId}">${driver.name}</option>
            </c:forEach>
        </select>
    </div>

        
        <!--select name="driver">
    <option value="driver">Select a Driver</option>
    <//c:forEach var="driver" items="${drivers}">
        <option value="${driver.driverId}">${driver.name}</option>
    <///c:forEach>
</select-->

    <div>
        <button type="submit">Submit Booking</button>
    </div>
</form>

            
            <div id="bookingModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
            background: white; padding: 20px; box-shadow: 0px 0px 10px gray;">
    <h2>Booking Details</h2>
    <p><strong>Order Number:</strong> <span id="bookingOrderNum"></span></p>
    <p><strong>Customer Name:</strong> <span id="bookingCustomerName"></span></p>
    <p><strong>Address:</strong> <span id="bookingAddress"></span></p>
    <p><strong>Telephone:</strong> <span id="bookingTelephone"></span></p>
    <p><strong>Destination:</strong> <span id="bookingDestination"></span></p>
    <p><strong>Kilometers:</strong> <span id="bookingKilometers"></span></p>
    <p><strong>Vehicle:</strong> <span id="bookingVehicle"></span></p>
    <p><strong>Driver:</strong> <span id="bookingDriver"></span></p>
    <button class="close">Close</button>
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
    
    <!--style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
    background: url('booking.jpg') no-repeat center center/cover;
}
        
        
        h1 {
    text-align: center;
    color: #0056b3;
    margin-bottom: 20px;
}

form {
    background-color: #fff;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

form div {
    margin-bottom: 15px;
}

label {
    font-size: 1rem;
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input, select {
    width: 100%;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 5px;
    background-color: #f9f9f9;
}

input[type="number"] {
    -webkit-appearance: none;
    -moz-appearance: textfield;
}

input:focus, select:focus {
    border-color: #0056b3;
    outline: none;
    background-color: #e9f5ff;
}

button {
    width: 100%;
    padding: 12px;
    font-size: 1.1rem;
    color: white;
    background-color: #0056b3;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #003d8f;
}

button:active {
    background-color: #003066;
}

/* Styling for small devices */
@media (max-width: 768px) {
    form {
        padding: 15px;
    }

    h1 {
        font-size: 1.5rem;
    }
        
        /* Positioning Help and Logout Buttons */
.help-btn, .logout-btn {
    position: absolute;
    top: 100px;
    z-index: 10;
}

.help-btn {
    left: 20px;
}

.logout-btn {
    right: 20px;
}

/* Button Styles for Help and Logout */
/* Style for the Help Button as a Circle with Background Image */
.btn-help {
    width: 80px;
    height: 80px;
    background-color: #007bff; /* Default blue background in case image fails */
    border-radius: 50%; /* Make the button circular */
    background-image: url('help.jpg'); /* Path to your background image */
    background-size: cover; /* Ensure the image covers the button */
    background-position: center; /* Center the image inside the button */
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}
/* Fix image inside the button and center it */
/* Style for the images inside buttons */
.button-icon {
        width: 30px;
        height: 30px;
    }

.btn-help:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

.btn-help .button-icon {
    width: 24px;
    height: 24px;
}

/* Button Styles for Logout */
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

.btn-help .button-icon {
    width: 24px;
    height: 24px;
}

.btn-help:hover .button-icon {
    transform: scale(1.1);
}

 .btn-logout:hover {
    background-color: #555;
}

/* Navigation Bar */
        nav {
            background-color: lightseagreen;
            overflow: hidden;
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

        /* Logo on the left */
        .logo {
            float: left;
            padding: 10px 20px;
            font-size: 24px;
            color: #fff;
            font-weight: bold;
        }

        /* Right-side navigation items */
        .nav-links {
            float: right;
        }

        .nav-links a {
            margin-left: 20px;
        }

        /* Mobile Navigation */
        .menu-icon {
            display: none;
        }

        /* Mobile View - When screen width is below 768px */
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
 /* Logo container */
      
        .logo-container {
            display: flex;
            align-items: center;
            padding: 5px 20px;
        }

        /* Text and logo styling */
        .logo-text {
            font-size: 24px;
            color: yellow;
            font-weight: bold;
            margin-right: 5px; /* Space between text and image */
        }

        .logo img {
            width: 60px; /* Adjust this size based on your logo image */
            height: 60px;
            border-radius: 50%; /* Makes the logo circular */
            object-fit: cover; /* Ensures the image fits nicely within the circle */
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
    </style-->
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
    background: url('booking.jpg') no-repeat center center/cover;
    padding-top: 100px; /* Adjusted for better space for the menu */
}

/* Header Styles */
h1 {
    text-align: center;
    color: black;
    margin-bottom: 30px;
    font-size: 60px;
    font-weight: bold;
}

/* Form Styles */
form {
    background-color: darkblue;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 35px;
}

form div {
    margin-bottom: 15px;
}

label {
    font-size: 1rem;
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
    color: white;
}

input, select {
    width: 100%;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 5px;
    background-color: #f9f9f9;
}

input[type="number"] {
    -webkit-appearance: none;
    -moz-appearance: textfield;
}

input:focus, select:focus {
    border-color: #0056b3;
    outline: none;
    background-color: #e9f5ff;
}

button {
    width: 100%;
    padding: 12px;
    font-size: 1.1rem;
    color: black;
    background-color: yellow;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Hover Effect */
button:hover {
    background-color: red; /* Change to orange on hover */
    color: #fff; /* Text color stays white when hovered (or change to any color) */
    transform: scale(1.05); /* Slightly increase the size */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
}

button:hover::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background-color:black; /* Underline effect */
}

button:active {
    background-color: yellow;
}

/* Processing State */
button.processing {
    background-color: #ffcc00; /* Light yellow to indicate processing */
    color: #666; /* Dimmed text color */
    cursor: not-allowed; /* Prevent further clicking */
    pointer-events: none; /* Disable button click */
    border-color: #ff9900; /* Optional darker border */
}

/* Add a loading spinner inside the button during processing */
button.processing::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 60px;
    height: 60px;
    border: 4px solid #fff;
    border-top: 4px solid red; /* Blue spinner */
    border-radius: 50%;
    animation: spin 1s linear infinite;
    transform: translate(-50%, -50%);
}

/* Spinner Animation */
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
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
    background-color: #555;
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
</style>
     <script>
    // Function to toggle the navigation menu on small screens
    function toggleMenu() {
        const nav = document.querySelector('nav');
        nav.classList.toggle('active');
    }
</script>

<script>
 // const button = document.querySelector('button');

 // button.addEventListener('click', function () {
    // Add the 'processing' class when the button is clicked
  //  button.classList.add('processing');

    // Simulate an API call or some processing task with a delay (e.g., 3 seconds)
   // setTimeout(function () {
      // Remove the 'processing' class after the task is done
    //  button.classList.remove('processing');
     // alert('Processing complete!');
   // }, 3000); // Simulate a 3-second delay
 // });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        // Handle booking form submission
        $('form').submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            // Collect form data
            let vehicleValue = $('#vehicle').val();
            let driverValue = $('#driver').val();
            
            console.log("Selected Vehicle ID:", vehicleValue);
        console.log("Selected Driver ID:", driverValue);
        
            let bookingData = {
                cname: $('#customerName').val(),
                caddress: $('#customerAddress').val(),
                ctele: $('#customerTelephone').val(),
                destination: $('#destination').val(),
                km: parseInt($('#kilometers').val(), 10) || 0,  // Convert and validate
                vehicleId: vehicleValue ? parseInt(vehicleValue, 10) : null, // Ensure valid ID
                driverId: driverValue ? parseInt(driverValue, 10) : null    // Ensure valid ID
            };

            console.log("Booking data to submit:", bookingData);

            // Ensure vehicle and driver are selected
            if (!bookingData.vehicleId || isNaN(bookingData.vehicleId)) {
                alert("Please select a valid vehicle.");
                return;
            }
            if (!bookingData.driverId || isNaN(bookingData.driverId)) {
                alert("Please select a valid driver.");
                return;
            }

            // Call function to insert booking
            insertBooking(bookingData);
        });
    });

    // Function to insert booking into RESTful API
    function insertBooking(bookingData) {
        $.ajax({
            url: 'http://localhost:8080/Cab_services/resources/bookings', // Ensure correct endpoint
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(bookingData),
            success: function (response) {
                alert('Booking Created Successfully!');
                fetchLatestBooking(); // Call function to refresh bookings
            },
            error: function (xhr, status, error) {
                console.error("Error inserting booking:", xhr.responseText); // Debugging log
                alert('Booking Failed: ' + xhr.responseText);
            }
        });
    }

    // Function to fetch and display the latest bookings
    function fetchLatestBooking() {
       $.ajax({
        url: 'http://localhost:8080/Cab_services/resources/bookings/latest', // Ensure this endpoint returns the most recent booking
        type: 'GET',
        contentType: 'application/json',
       success: function (data) {
            console.log("Latest booking:", data);

            // Use fallback operators to handle different JSON key naming conventions
            $("#bookingOrderNum").text(data.ordernum || data.orderNum || "");
            $("#bookingCustomerName").text(data.cname || data.customerName || "");
            $("#bookingAddress").text(data.caddress || data.address || "");
            $("#bookingTelephone").text(data.ctele || data.telephone || "");
            $("#bookingDestination").text(data.destination || "");
            $("#bookingKilometers").text(data.km || data.kilometers || "");

            // Display vehicle ID directly (try both key variants)
            $("#bookingVehicle").text(data.vehicle_id || data.vehicleId || "");
            
            // Display driver ID directly (try both key variants)
            $("#bookingDriver").text(data.driver_id || data.driverId || "");

            // Show the modal
            $("#bookingModal").css("display", "block");
        },
        error: function (xhr, status, error) {
            console.error("Error fetching latest booking:", xhr.responseText);
        }
    });
    }

// Event listener for submit button
$(document).ready(function () {
    $("#submitBooking").click(function (event) {
        event.preventDefault(); // Prevent default form submission
        fetchLatestBooking(); // Fetch and display the latest booking
    });

    // Close modal event
   $(".close").click(function () {
    // Hide the modal
    $("#bookingModal").css("display", "none");

    // Redirect the user to bill.jsp
    window.location.href = "billing.jsp"; // Adjust the path if necessary
    });
    });
    
</script>

<script>
    $(document).ready(function () {
    // Fetch vehicle list
    $.ajax({
        url: "http://localhost:8080/Cab_services/resources/vehicles",
        type: "GET",
        contentType: "application/json",
        success: function (response) {
            let vehicleDropdown = $("#vehicle");
            vehicleDropdown.empty().append('<option value="">Select Vehicle</option>');

            if (!response || response.length === 0) {
                console.error("No vehicles found in API response", response);
                alert("No vehicles available.");
                return;
            }

            console.log("Fetched Vehicles:", response); // ✅ Log API response

            $.each(response, function (index, vehicle) {
                let vehicleId = vehicle.vehicleId || vehicle.id; // Handle different property names
                let vehicleModel = vehicle.model || vehicle.model; // Handle different naming

                if (!vehicleId || !vehicleModel) {
                    console.error("Invalid vehicle data at index", index, ":", vehicle);
                    return;
                }

                vehicleDropdown.append('<option value="' + vehicleId + '">' + vehicleModel + '</option>');
            });

            console.log("Vehicle Dropdown Options Count:", $('#vehicle option').length);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching vehicles:", xhr.responseText);
            alert("Failed to load vehicles.");
        }
    });

    // Fetch driver list
    $.ajax({
        url: "http://localhost:8080/Cab_services/resources/drivers",
        type: "GET",
        contentType: "application/json",
        success: function (response) {
            let driverDropdown = $("#driver");
            driverDropdown.empty().append('<option value="">Select Driver</option>');

            if (!response || response.length === 0) {
                console.error("No drivers found in API response", response);
                alert("No drivers available.");
                return;
            }

            console.log("Fetched Drivers:", response); // ✅ Log API response

            $.each(response, function (index, driver) {
                let driverId = driver.driverId || driver.id; // Handle different property names
                let driverName = driver.name || driver.name; // Handle different naming

                if (!driverId || !driverName) {
                    console.error("Invalid driver data at index", index, ":", driver);
                    return;
                }

                driverDropdown.append('<option value="' + driverId + '">' + driverName + '</option>');
            });

            console.log("Driver Dropdown Options Count:", $('#driver option').length);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching drivers:", xhr.responseText);
            alert("Failed to load drivers.");
        }
    });
});

</script>

</html>
