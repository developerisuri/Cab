<%-- 
    Document   : signCustomer
    Created on : Jan 29, 2025, 10:37:18 AM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Sign In</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script> <!-- For eye icon -->
        
    </head>
    <body>
         <div class="login-container">
        <h2>Customer Sign In</h2>
        <form id="Sign-form" >
            <label for="username">Enter Username</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Enter Password</label>
            <input type="password" id="password" name="password" required><br><br>
            <i class="fas fa-eye eye-icon" id="togglePassword"></i>
            <input type="submit" value="Sign In" class="btn btn-primary"/>
        </form>
        <p><a href="index.jsp">Back to Home</a></p>
         <p><a href="loginCustomer.jsp">Already Sign In? Login from Here</a></p>
    </div>
    </body>
    
   
   
    
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            background: url('m4.jpg') no-repeat center center/cover;
        }

        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: navy;
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

      /* Base Button Styling */
.btn {
    position: relative; /* Ensure positioning of the spinner */
    width: 100%;
    padding: 10px;
    background-color: yellow; /* Default background color */
    color: black; /* Default text color */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
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

/* Regular Hover Effect */
.btn:hover {
    background-color: red; /* Background color changes to red on hover */
    color: white; /* Text color changes to white on hover */
    transform: scale(1.05); /* Slightly increase the size */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
}

/* Active (Pressed) State */
.btn:active {
    background-color: darkred; /* Darker background when clicked */
    transform: scale(0.98); /* Slightly shrink the button to indicate a press */
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
  // Select the button
  //const button = document.querySelector('.btn');

  // Add a click event listener to the button
  //button.addEventListener('click', function () {
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
    //  alert('Processing complete!');
  //  }, 3000); // Simulate a 3-second delay
 // });
</script>

 <script>
        $(document).ready(function() {
            // Toggle password visibility
            $('#togglePassword').click(function() {
                let passwordField = $('#password');
                let type = passwordField.attr('type') === 'password' ? 'text' : 'password';
                passwordField.attr('type', type);
                $(this).toggleClass('fa-eye fa-eye-slash');
            });

            // Handle form submission
            $('#Sign-form').submit(function(e) {
                e.preventDefault();  // Prevent normal form submission

                // Get the username and password
                let username = $('#username').val();
                let password = $('#password').val();

                // Prepare the data to send in JSON format
                let userData = {
                    "username": username,
                    "password": password
                };

                // Send the AJAX request to the backend to create a new user
                $.ajax({
                    url: 'http://localhost:8080/Cab_services/resources/api/user',
                    // Ensure this is correct
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(userData),
                    success: function(response) {
                        // If successful, notify user and redirect to login page
                        alert('Sign Up Successful! Please log in.');
                        window.location.href = 'loginCustomer.jsp';  // Redirect after success
                    },
                    error: function(xhr, status, error) {
                        // Handle the error and display the response from the server
                        alert('Sign Up Failed: ' + xhr.responseText);  // Display server response message
                    }
                });
            });
        });
    </script>
</html>
