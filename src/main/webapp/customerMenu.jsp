<%-- 
    Document   : customerMenu
    Created on : Jan 29, 2025, 1:58:20 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Menu</title>
        
             <!-- Navigation Bar -->
<nav>
    <div class="logo-container">
    <div class="logo-text">Mega City Cab</div>
    <div class="logo">
        <!-- Replace this with your actual logo image -->
        <img src="cab2.jpg" alt="Mega City Cab Logo">
    </div>
    <div class="menu-icon" onclick="toggleMenu()">&#9776;</div> <!-- Hamburger icon -->
    <div class="nav-links">
        <a href="customerRegister.jsp">Register</a>
        <a href="booking.jsp">Booking</a>
        <a href="bookingDetails.jsp">Booking Details</a>
        <a href="billDetails.jsp">Bill Details</a>
        <a href="vehicleInfo.jsp">Vehicle Info</a>
        <a href="driverInfo.jsp">Driver Info</a>


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


    <!-- Main Container -->
    <div class="container">
        <div class="menu-header">
            <h1>Welcome to Mega City Customer</h1>
            <p>Manage your ride bookings and account easily.</p>
        </div>

        <!-- Menu Buttons -->
        <div class="menu-buttons">
            <div class="button-container">
                <a href="customerRegister.jsp" class="btn btn-register">Register
                 
                 </a>
            </div>
            <div class="button-container">
                <a href="booking.jsp" class="btn btn-booking">Booking</a>
            </div>
            <div class="button-container">
                <a href="bookingDetails.jsp" class="btn btn-details">Booking Details</a>
            </div>
            <div class="button-container">
                <a href="billDetails.jsp" class="btn btn-bill">Bill Details</a>
            </div>
            <div class="button-container">
                <a href="vehicleInfo.jsp" class="btn btn-vehicle">Vehicle Info</a>
            </div>
            <div class="button-container">
                <a href="driverInfo.jsp" class="btn btn-driver">Driver Info</a>
            </div>
        </div>
    </div>   
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
    
    <!--style>
        /* General Body and Layout Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
}
/* Style for the images inside buttons */
.button-icon {
    width: 70px;
    height: 70px;
    margin-right: 10px; /* Space between the image and text */
    
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    text-align: center;
    padding: 20px;
}

.menu-header {
    margin-bottom: 40px;
}

h1 {
    font-size: 2.5rem;
    color: #007bff;
}

p {
    font-size: 1.2rem;
    color: #555;
}

/* Button Layout and Styles */
.menu-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    margin-top: 20px;
}

.button-container {
    width: 300px;
    height: 100px;
}

.btn {
    display: block;
    width: 100%;
    height: 100%;
    padding: 15px;
    text-align: center;
    font-size: 1.2rem;
    font-weight: bold;
    text-decoration: none;
    border-radius: 8px;
    color: white;
    transition: background-color 0.3s ease, transform 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn:hover {
    transform: scale(1.05);
}

.btn-register {
    background-color: #28a745;
}

.btn-booking {
    background-color: #007bff;
}

.btn-details {
    background-color: #ff5722;
}

.btn-bill {
    background-color: #f39c12;
}

.btn-vehicle {
    background-color: #8e44ad;
}

.btn-driver {
    background-color: #e74c3c;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .container {
        padding: 10px;
    }

    .menu-header h1 {
        font-size: 2rem;
    }

    .menu-header p {
        font-size: 1rem;
    }

    .menu-buttons {
        gap: 15px;
    }

    .button-container {
        width: 200px;
        height: 80px;
    }

    .btn {
        font-size: 1rem;
    }
}

@media (max-width: 480px) {
    .menu-buttons {
        flex-direction: column;
        gap: 10px;
    }

    .button-container {
        width: 100%;
        height: 70px;
    }

    .btn {
        font-size: 1rem;
        padding: 12px;
    }
}
    </style-->
    <style>
        /* General Body and Layout Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
    background: url('cusM3.jpg') no-repeat center center/cover;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    text-align: center;
    padding: 20px;
}

.menu-header {
    margin-bottom: 40px;
}

h1 {
    font-size: 2.5rem;
    color: black;
}

p {
    font-size: 1.2rem;
    color: navy;
    font-weight: bold;
}

/* Button Layout and Styles */
.menu-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    margin-top: 10px;
}

.button-container {
    width: 250px;
    height: 100px;
}

.btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    padding: 15px;
    text-align: center;
    font-size: 1.2rem;
    font-weight: bold;
    text-decoration: none;
    border-radius: 8px;
    color: white;
    transition: background-color 0.3s ease, transform 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}



.btn-register{
    text-align: center;
}
/* Button hover effect */
.btn:hover {
    transform: scale(1.05);
}

.btn-register {
    background-color: #28a745;
}
.btn-register:hover {
                background-color: yellow;
            }
.btn-booking:hover {
                background-color: red;
            }
.btn-details:hover {
                background-color: green;
            }
.btn-bill:hover {
                background-color: pink;
            }
.btn-vehicle:hover {
                background-color: blue;
            }
.btn-driver:hover {
                background-color: purple;
            }
.btn-booking {
    background-color: #007bff;
}

.btn-details {
    background-color: #ff5722;
}

.btn-bill {
    background-color: #f39c12;
   
}

.btn-vehicle {
    background-color: #8e44ad;
}

.btn-driver {
    background-color: #e74c3c;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .container {
        padding: 10px;
    }

    .menu-header h1 {
        font-size: 2rem;
    }

    .menu-header p {
        font-size: 1rem;
    }

    .menu-buttons {
        gap: 15px;
    }

    .button-container {
        width: 200px;
        height: 80px;
    }

    .btn {
        font-size: 1rem;
    }

    .button-icon {
        width: 25px;
        height: 25px;
    }
}

@media (max-width: 480px) {
    .menu-buttons {
        flex-direction: column;
        gap: 10px;
    }

    .button-container {
        width: 100%;
        height: 70px;
    }

    .btn {
        font-size: 1rem;
        padding: 12px;
    }

    .button-icon {
        width: 25px;
        height: 25px;
    }
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

    </style>
    
    
    <script>
    // Function to toggle the navigation menu on small screens
    function toggleMenu() {
        const nav = document.querySelector('nav');
        nav.classList.toggle('active');
    }
</script>
</html>
