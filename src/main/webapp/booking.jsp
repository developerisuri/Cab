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
            <option value="${vehicle.id}">${vehicle.model}</option>
        </c:forEach>
    </select>
    </div>

    <div>
        <label for="driver">Driver:</label>
        <select id="driver" name="driver" required>
            <option value="">Select Driver</option>
            <c:forEach var="driver" items="${driverList}">
                <option value="${driver.id}">${driver.name}</option>
            </c:forEach>
        </select>
    </div>

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
    $(document).ready(function() {
        // Handle booking form submission
        $('form').submit(function(event) {
            event.preventDefault();  // Prevent default form submission

            // Collect form data into JSON format
            let bookingData = {
                customerName: $('#cname').val(),
                customerAddress: $('#caddress').val(),
                customerTelephone: $('#ctele').val(),
                destination: $('#destination').val(),
                kilometers: parseInt($('#km').val()),
                vehicle: parseInt($('#vehicle_id').val()),
                driver: parseInt($('#driver_id').val())
            };

            // Send AJAX request to insert booking
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/bookings',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(bookingData),
                success: function(response) {
                    alert('Booking Created Successfully!'); // Confirmation
                    fetchLatestBooking(); // Fetch and display the latest booking
                },
                error: function(xhr, status, error) {
                    alert('Booking Failed: ' + xhr.responseText); // Error alert
                }
            });
        });

        // Function to fetch and display the latest booking
        function fetchLatestBooking() {
            $.ajax({
                url: 'http://localhost:8080/Cab_services/resources/bookings ',
                type: 'GET',
                dataType: 'json',
                success: function(booking) {
                    // Populate modal fields with booking details
                    $('#bookingOrderNum').text(booking.ordernum);
                    $('#bookingCustomerName').text(booking.cname);
                    $('#bookingAddress').text(booking.caddress);
                    $('#bookingTelephone').text(booking.ctele);
                    $('#bookingDestination').text(booking.destination);
                    $('#bookingKilometers').text(booking.km);
                    $('#bookingVehicle').text(booking.vehicleName);
                    $('#bookingDriver').text(booking.driverName);

                    // Show modal
                    $('#bookingModal').fadeIn();
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching latest booking:', xhr.responseText);
                }
            });
        }

        // Close modal when "Close" button is clicked
        $('.close').click(function() {
            $('#bookingModal').fadeOut();
        });
    });
</script>

<script>
    $(document).ready(function () {
        // Fetch vehicle list
        $.ajax({
            url: "http://localhost:8080/Cab_services/resources/booking/vehicles",
            type: "GET",
            contentType: "application/json",
            success: function (vehicles) {
                let vehicleDropdown = $("#vehicle");
                vehicleDropdown.empty().append('<option value="">Select Vehicle</option>');
                $.each(vehicles, function (index, vehicle) {
                    vehicleDropdown.append('<option value="' + vehicle.id + '">' + vehicle.model + '</option>');
                });
            },
            error: function () {
                alert("Failed to load vehicles.");
            }
        });

        // Fetch driver list
        $.ajax({
            url: "http://localhost:8080/Cab_services/resources/booking/drivers",
            type: "GET",
            contentType: "application/json",
            success: function (drivers) {
                let driverDropdown = $("#driver");
                driverDropdown.empty().append('<option value="">Select Driver</option>');
                $.each(drivers, function (index, driver) {
                    driverDropdown.append('<option value="' + driver.id + '">' + driver.name + '</option>');
                });
            },
            error: function () {
                alert("Failed to load drivers.");
            }
        });
    });
</script>

</html>
