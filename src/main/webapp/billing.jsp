<%-- 
    Document   : billing
    Created on : Feb 24, 2025, 7:20:44 AM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>bill</title>
        
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
<!--div class="help-btn">
    <a href="help.jsp" class="btn btn-help" alt="Help Icon">
        
    </a>
</div-->

    <!-- Logout Button on the Right -->
    <div class="logout-btn">
        <a href="logout.jsp" class="btn btn-logout">Logout</a>
    </div>
    </head>
    <body>
    
        <!-- Help Button on the Left with an Image -->
<!--div class="help-btn">
    <a href="help.jsp" class="btn btn-help" alt="Help Icon">
        
    </a>
</div-->

    <!-- Logout Button on the Right -->
    <div class="logout-btn">
        <a href="logout.jsp" class="btn btn-logout">Logout</a>
    </div>
    
    
    <h2>Billing Details</h2>
    Order Number: <input id="orderNum" readonly><br>
    Customer Name: <input id="customerName" readonly><br>
    Vehicle ID: <input type="number" id="vehicleId" readonly><br>
    KM Traveled: <input id="km" readonly><br>
    Base Fare: <input id="baseFare" readonly><br>
    KM Amount: <input id="kmAmount" readonly><br>
    Tax: <input id="tax" readonly><br>
    Discount: <input id="discount" readonly><br>
    Driver Fees: <input id="driverFees" readonly><br>
    Total Amount: <input id="totalAmount" readonly><br>
    <button onclick="processPayment()">Pay</button>

    </body>
    
     <!-- Footer Section -->
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
            <a href="customerRegister.jsp" target="_blank" class="facebook">Register</a>
            <a href="booking.jsp" target="_blank" class="twitter">Booking</a>
            <a href="bookingDetails.jsp" target="_blank" class="twitter">Booking Details</a>
            <a href="billDetails.jsp" target="_blank" class="twitter">Bill Details</a>
            <a href="vehicleInfo.jsp" target="_blank" class="instagram">Vehicle Info</a>
              <a href="driverInfo.jsp" target="_blank" class="instagram">Driver Info</a>
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
    
    /* Background image setup */
    background: url('d2.png') no-repeat center center;
    background-size: cover;  /* Make sure the image covers the entire page */
    background-attachment: fixed; /* Makes sure the background stays fixed when scrolling (optional) */
    
    height: 10vh; /* Ensure the body takes the full height of the viewport */
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
}

    </style>
    
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
        document.addEventListener("DOMContentLoaded", function () {
    fetchLatestBooking(); // Trigger fetch function when page loads
});

function fetchLatestBooking() {
    // Make sure the API URL is correct based on your backend configuration
    fetch("http://localhost:8080/Cab_services/resources/billing/latestBooking")
        .then(response => {
            console.log("API Response Status:", response.status); // Log status code
            if (!response.ok) { // Check if response status is 200-299 (OK)
                throw new Error(`Error: ${response.status} - ${response.statusText}`); // Throw error if not OK
            }
            return response.json(); // Return parsed JSON if successful
        })
        .then(data => {
            console.log("API Response JSON:", data); // ✅ Debugging log

            if (!data || Object.keys(data).length === 0 || data.error) {
                alert("No booking data found!"); // Show message if data is empty or error is present
                return;
            }

            // Populate fields only if data exists
            document.getElementById("orderNum").value = data.orderNum || "";
document.getElementById("customerName").value = data.customerName || "";
document.getElementById("vehicleId").value = data.vehicleId || 0;  // Add this line for vehicle ID
document.getElementById("km").value = data.km || 0;
document.getElementById("baseFare").value = data.baseFare || 0;
document.getElementById("kmAmount").value = data.kmAmount || 0;
document.getElementById("tax").value = data.tax || 0;
document.getElementById("discount").value = data.discount || 0;
document.getElementById("driverFees").value = data.driverFees || 0;
document.getElementById("totalAmount").value = data.totalAmount || 0;

        })
        .catch(error => {
            console.error("Error fetching latest booking:", error); // Log error in console
            alert("Failed to load booking details."); // Alert user on failure
        });
}

     
    function processPayment() {
    try {
        // Retrieve field values
        let orderNum = $("#border_num").val(); // String (no need for parsing)
        let customerName = $("#bcuname").val(); // String (no need for parsing)
        let vehicleId = parseInt($("#vehicle_id").val(), 10) || 0; // Integer (fallback to 0 if invalid)
        let km = parseInt($("#km").val(), 10) || 0; // Integer (fallback to 0 if invalid)
        let baseFare = parseInt($("#bbase_fare").val(), 10) || 0; // Integer (fallback to 0 if invalid)
        let kmAmount = parseFloat($("#km_amount").val()) || 0.0; // Double (fallback to 0 if invalid)
        let tax = parseFloat($("#tax").val()) || 0.0; // Double (fallback to 0 if invalid)
        let discount = parseFloat($("#discount").val()) || 0.0; // Double (fallback to 0 if invalid)
        let driverFees = parseFloat($("#driver_fees").val()) || 0.0; // Double (fallback to 0 if invalid)
        let totalAmount = parseFloat($("#total_amount").val()) || 0.0; // Double (fallback to 0 if invalid)

        // Validate required fields
        if (!orderNum || !customerName || !vehicleId || km <= 0 || baseFare <= 0) {
            alert("Error: Required fields are missing or invalid.");
            return;
        }

        // Construct the data object
        let data = {
            border_num: orderNum,
            bcuname: customerName,
           vehicle_id: vehicleId,
            km: km,
           bbase_fare: baseFare,
           km_amount: kmAmount,
            tax: tax,
            discount: discount,
            driver_fees: driverFees,
            total_amount: totalAmount
        };

        console.log("Sending Data:", data);  // Debugging log

        // Send the AJAX request
        $.ajax({
            url: "http://localhost:8080/Cab_services/resources/billing/processPayment",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(data),
            success: function(response) {
                alert(response.message || "Payment successful!");
                window.location.reload();  // Reload page after success
            },
            error: function(xhr, status, error) {
                console.log("Error:", xhr.responseText);
                alert("Payment processing failed: " + xhr.responseText);
            }
        });
    } catch (error) {
        console.error("AJAX Error:", error);
        alert("Error in processing payment: " + error.message);
    }
}


    </script>
     
</html>
