<%-- 
    Document   : customerRegister
    Created on : Jan 29, 2025, 8:53:17 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Register</title>
    </head>
    <body>
        <div class="container">
        <div class="form-container">
            <h2>Customer Registration</h2>
            <form action="registerCustomer.jsp" method="POST">
                <div class="form-group">
                    <label for="customer-name">Customer Name</label>
                    <input type="text" id="customer-name" name="customerName" required placeholder="Enter your name">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" required placeholder="Enter your address"></textarea>
                </div>
                <div class="form-group">
                    <label for="nic">NIC Number</label>
                    <input type="text" id="nic" name="nic" required placeholder="Enter your NIC number">
                </div>
                <div class="form-group">
                    <label for="telephone">Telephone Number</label>
                    <input type="tel" id="telephone" name="telephone" required placeholder="Enter your telephone number">
                </div>
                <button type="submit" class="btn-submit">Register</button>
            </form>
        </div>
    </div>
    </body>
    
    <style>
        
        /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Style */
body {
    font-family: 'Arial', sans-serif;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: url('cusReg.jpg') no-repeat center center/cover;
    background-size: cover; /* Ensure the image covers the whole screen */
    position: relative; /* To position the overlay */
     
}
/* Semi-transparent Overlay */
 /*body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4); /* Semi-transparent black overlay */
    /*z-index: -1; /* Place the overlay behind the content */
/*}


/* Container */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    padding: 20px;
}

/* Form Container */
.form-container {
    background-color: yellow;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 400px;
}

.form-container h2 {
    text-align: center;
    font-size: 1.8rem;
    color: #007bff;
    margin-bottom: 30px;
}

/* Form Group */
.form-group {
    margin-bottom: 20px;
}

/* Label */
label {
    font-size: 1rem;
    color: #333;
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

/* Input Fields */
input, textarea {
    width: 100%;
    padding: 12px;
    font-size: 1rem;
    border: 1px solid #ddd;
    border-radius: 8px;
    outline: none;
    box-sizing: border-box;
}

input:focus, textarea:focus {
    border-color: #007bff;
}

/* Textarea Styling */
textarea {
    resize: vertical;
    height: 100px;
}

/* Submit Button */
.btn-submit {
    width: 100%;
    padding: 14px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 1.2rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-submit:hover {
    background-color: red;
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

/* Responsive Styles */
@media (max-width: 768px) {
    .form-container {
        padding: 20px;
        width: 100%;
        max-width: 90%;
    }

    .form-container h2 {
        font-size: 1.6rem;
    }

    .form-group {
        margin-bottom: 15px;
    }

    input, textarea {
        font-size: 0.95rem;
    }

    .btn-submit {
        font-size: 1rem;
        padding: 12px;
    }
}

    </style>
    
    <script>
  const button = document.querySelector('button');

  button.addEventListener('click', function () {
    // Add the 'processing' class when the button is clicked
    button.classList.add('processing');

    // Simulate an API call or some processing task with a delay (e.g., 3 seconds)
    setTimeout(function () {
      // Remove the 'processing' class after the task is done
      button.classList.remove('processing');
      alert('Processing complete!');
    }, 3000); // Simulate a 3-second delay
  });
</script>
</html>
