<%-- 
    Document   : adminDashboard
    Created on : Feb 8, 2025, 5:28:18 PM
    Author     : iband
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 
    </head>
    
   
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align:center;
        }
        .dashboard-card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
        }
        .dashboard-card:hover {
            transform: scale(1.05);
        }
        .card-body {
            text-align: center;
        }
        .card-title {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .card-description {
            font-size: 16px;
        }
        .btn-custom {
            width: 100%;
            font-size: 16px;
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .container-fluid {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
    </nav>

    <div class="container-fluid">
        <!-- Dashboard Cards -->
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <!-- Card 1: Customer Management -->
            <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">User Management</h5>
                        <p class="card-description">Manage system users,usernames and passwords</p>
                        <a href="<%= request.getContextPath() %>/adminUser.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>

            <!-- Card 2: User Management -->
            <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Registered Customers</h5>
                        <p class="card-description">View and manage the registered Customers</p>
                        <a href="<%= request.getContextPath() %>/user-management.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>

            <!-- Card 3: Orders Overview -->
            <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Orders</h5>
                        <p class="card-description">View and manage the customers orders</p>
                        <a href="<%= request.getContextPath() %>/orders-overview.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>

            <!-- Card 4: Analytics Dashboard -->
            <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Vehicle Information</h5>
                        <p class="card-description">View and manage vehicle information</p>
                        <a href="<%= request.getContextPath() %>/analytics-dashboard.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>
                    
                     <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Driver Information</h5>
                        <p class="card-description">View and manage the driver information</p>
                        <a href="<%= request.getContextPath() %>/analytics-dashboard.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>

            <!-- Card 5: Settings -->
            <div class="col">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Help Instructions</h5>
                        <p class="card-description">Update customer instructions for the portal</p>
                        <a href="<%= request.getContextPath() %>/settings.jsp" class="btn btn-custom">Go to Page</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional: Add Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>

    
