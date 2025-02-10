<%-- 
    Document   : billDetails
    Created on : Jan 31, 2025, 11:33:18 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Details</title>
        
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
        <h2>Search Bill Details</h2>
        
        <!-- Bill Search Form -->
        <div class="search-form">
            <label for="customerId">Enter Customer ID:</label>
            <input type="text" id="customerId" placeholder="Enter Customer ID">
            <button id="searchButton" onclick="searchBill()">Search</button>
        </div>

        <!-- Bill Details (Initially Hidden) -->
        <div id="billDetails" class="bill-details" style="display:none;">
            <h3>Bill Information</h3>
            <ul>
                <li><strong>Bill ID:</strong> <span id="billId"></span></li>
                <li><strong>Booking ID:</strong> <span id="bookingId"></span></li>
                <li><strong>Tax:</strong> $<span id="tax"></span></li>
                <li><strong>Discount:</strong> $<span id="discount"></span></li>
                <li><strong>Driver Fees:</strong> $<span id="driverFees"></span></li>
                <li><strong>Amount:</strong> $<span id="amount"></span></li>
                <li><strong>Vehicle Type:</strong> <span id="vehicleType"></span></li>
                <li><strong>Final Total:</strong> $<span id="finalTotal"></span></li>
            </ul>
        </div>

        <!-- Error Message (Initially Hidden) -->
        <div id="errorMessage" class="error-message" style="display:none;">
            <p>No bill found with this Customer ID. Please try again.</p>
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
    background: url('bb2.jpg') no-repeat center center/cover;
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

.container {
    width: 60%;
    margin: 0 auto;
    padding: 10px;
    background-color: lightskyblue;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
  
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

.search-form {
    text-align: center;
    margin-bottom: 40px;
}

#customerId {
    padding: 8px;
    margin-right: 10px;
    width: 200px;
    font-size: 16px;
}
.lable{
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

/* Processing State */
#searchButton.processing {
  background-color: #ffcc00; /* Light yellow */
  color: #666; /* Dimmed text color */
  cursor: not-allowed; /* Prevent further clicking */
  pointer-events: none; /* Disable button click */
  border-color: #ff9900; /* Optional darker border */
}

/* Optional: Add a loading spinner inside the button during processing */
#searchButton.processing::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 35px;
  height: 35px;
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


.bill-details {
    margin-top: 20px;
    padding: 15px;
    background-color: #f0f0f0;
    border-radius: 8px;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    font-size: 16px;
    margin-bottom: 12px;
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



          <script>
    // Function to toggle the navigation menu on small screens
    function toggleMenu() {
        const nav = document.querySelector('nav');
        nav.classList.toggle('active');
    }
    
    
    
    
    // Function to simulate the search functionality and show the processing state with a spinner
function searchBill() {
    const searchButton = document.getElementById('searchButton');
    
    // Add the 'processing' class when the button is clicked
    searchButton.classList.add('processing');
    
    // Simulate an API call or some processing task with a delay (e.g., 3 seconds)
    setTimeout(function () {
        // Remove the 'processing' class after the task is done
        searchButton.classList.remove('processing');
        alert('Processing complete!');
        
        // Here you would proceed with the actual search functionality
        // For now, just simulating it with an alert.
    }, 3000); // Simulate a 3-second delay
}

</script>


</html>
