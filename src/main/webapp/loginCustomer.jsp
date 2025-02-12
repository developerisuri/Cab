<%-- 
    Document   : loginCustomer
    Created on : Jan 28, 2025, 5:56:03 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Login</title>
        
    </head>
    <body>
         <div class="login-container">
        <h2>Customer Login</h2>
        <form id="login-form">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required><br><br>
            <i class="fas fa-eye eye-icon" id="togglePassword"></i>
            <input type="submit" value="Login" class="btn btn-primary"/>
        </form>
        <p><a href="index.jsp">Back to Home</a></p>
        <p><a href="signCustomer.jsp">Not Sign In? Sign In from Here</a></p>
    </div>
    </body>
    
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            background: url('cus2.jpg') no-repeat center center/cover;
        }

        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #0056b3;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: white;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: white;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

       .btn {
    width: 100%;
    padding: 10px;
    background-color: yellow; /* Default background color */
    color: black; /* Default text color */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition */
}

/* Hover Effect */
.btn:hover {
    background-color: red; /* Background color changes to red on hover */
    color: white; /* Text color changes to white on hover */
    transform: scale(1.05); /* Slightly enlarge the button for a "lifted" effect */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Add a shadow around the button for a raised look */
}

/* Active (Pressed) State */
.btn:active {
    background-color: darkred; /* Darker background when clicked */
    transform: scale(0.98); /* Slightly shrink the button to indicate a press */
}

/* Processing State */
.btn.processing {
    background-color: #ffcc00; /* Light yellow to indicate processing */
    color: #666; /* Dimmed text color */
    cursor: not-allowed; /* Prevent further clicking */
    pointer-events: none; /* Disable button click */
    border-color: #ff9900; /* Optional darker border */
    position: relative; /* Ensure the spinner is positioned inside the button */
    text-align: center; /* Center text (if needed) */
    display: inline-block; /* Ensure the button does not stretch beyond content */
}

/* Add a loading spinner inside the button during processing */
.btn.processing::after {
    content: ''; /* Empty content for the spinner */
    position: absolute;
    top: 50%; /* Position vertically at the center of the button */
    left: 50%; /* Position horizontally at the center of the button */
    width: 30px; /* Size of the spinner */
    height: 30px;
    border: 4px solid #fff; /* White border for the spinner */
    border-top: 4px solid red; /* Orange spinner */
    border-radius: 50%;
    animation: spin 1s linear infinite; /* Spinning animation */
    transform: translate(-50%, -50%); /* Center the spinner */
}

/* Spinner animation */
@keyframes spin {
    0% {
        transform: translate(-50%, -50%) rotate(0deg);
    }
    100% {
        transform: translate(-50%, -50%) rotate(360deg);
    }
}


        .btn:hover {
            background-color: red;
        }

        p {
            text-align: center;
        }

        p a {
            text-decoration: none;
            color: red;
        }

        p a:hover {
            text-decoration: underline;
            color: yellow;  /* Change text color when hovering (example: orange) */
           
        }

               /* Eye Icon Styling */
        .password-container {
            position: relative;
            width: 100%;
        }

        .eye-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        /* Responsive Design */
        @media (max-width: 600px) {
            .login-container {
                padding: 15px;
                margin: 20px;
            }

            h2 {
                font-size: 20px;
            }

            input[type="text"], input[type="password"] {
                padding: 12px;
                font-size: 16px;
            }

            .btn {
                padding: 12px;
                font-size: 18px;
            }
        }
    </style>
    
      <script>
        // Get references to the password field and the eye icon
        const passwordField = document.getElementById('password');
        const togglePassword = document.getElementById('togglePassword');

        // Add an event listener to toggle password visibility
        togglePassword.addEventListener('click', function() {
            // Toggle the type between 'password' and 'text'
            const type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;

            // Toggle the eye icon between "eye" and "eye-slash"
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>
    
    <script>
  // Select the button
 // const button = document.querySelector('.btn');

  // Add a click event listener to the button
 // button.addEventListener('click', function () {
    // Add the 'processing' class to the button to show spinner
   // button.classList.add('processing');
    
    // Disable the button to prevent further clicks while processing
   // button.disabled = true;

    // Simulate an API call or some processing task with a delay (e.g., 3 seconds)
   // setTimeout(function () {
      // Remove the 'processing' class after the task is done, hiding the spinner
    //  button.classList.remove('processing');

      // Re-enable the button after processing is complete
     // button.disabled = false;

      // Optionally, show a message or alert to indicate completion
     // alert('Processing complete!');
   // }, 3000); // Simulate a 3-second delay
 // });
</script>

<script>
            // Handle form submission via JavaScript
            document.getElementById('login-form').addEventListener('submit', function(e) {
                e.preventDefault(); // Prevent the form from submitting normally

                // Get username and password values from the form
                let username = document.getElementById('username').value;
                let password = document.getElementById('password').value;

                // Prepare the login data as JSON
                let loginData = {
                    "username": username,
                    "password": password
                };

                // Send the AJAX request to the RESTful login endpoint
                fetch('http://localhost:8080/Cab_services/resources/user/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(loginData)
                })
                .then(response => {
                    if (response.ok) {
                        // If login is successful
                        alert('Login successful!');
                        window.location.href = 'customerMenu.jsp'; // Redirect to the customer dashboard
                    } else {
                        // If login failed
                        return response.text(); // Extract the error message
                    }
                })
                .then(errorMessage => {
                    if (errorMessage) {
                        alert(errorMessage); // Show the error message if login failed
                    }
                })
                .catch(error => {
                    console.error('Error during login:', error);
                    alert('An error occurred during login. Please try again.');
                });
            });
        </script>
</html>
