<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!doctype html>
<html class="no-js" lang="">
<head>

<spring:url value="/resources/fonts" var="fonts" />
<spring:url value="/resources/images1" var="img" />
<spring:url value="/resources/css1" var="css" />
<spring:url value="/resources/js1" var="js" />
<spring:url value="/resources/scss" var="scss" />

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <meta name="description" content="Dashboard">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   

    <link rel="stylesheet" href="${css}/normalize.css" type="text/css" media="all">
    <link rel="stylesheet" href="${css}/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="${css}/font-awesome.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="${css}/themify-icons.css" type="text/css" media="all">
    <link rel="stylesheet" href="${css}/cs-skin-elastic.css" type="text/css" media="all">
    <link rel="stylesheet" href="${css}/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${scss}/style.css" type="text/css" media="all">
    <link href="${css}/lib/vector-map/jqvmap.min.css" rel="stylesheet" type="text/css" media="all">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#">${name}</a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<c:url value="/profile" />"> <i class="menu-icon fa fa-user-md"></i>Edit Profile</a>
                    </li>
                    <security:authorize access="hasRole('ROLE_STUDENT')">
                    <h3 class="menu-title">Assessment</h3><!-- /.menu-title -->
                    <c:if test="${takentest == 'No'}">
                    <li >
                        <a href="<c:url value="/takeTest"/>" > <i class="menu-icon fa fa-pencil-square-o"></i>Take A Test</a>
                        
                    </li>
                    </c:if>
                    
                      <c:if test="${takentest == 'Yes'}">
                    <li>
                        <a href="<c:url value="/userSubject"/>" > <i class="menu-icon fa fa-book"></i> Favourite  Subject</a>
                        
                    </li>
                  
                  
                    <li>
                       
                      <a href="<c:url value="/userStrength" />" > <i class="menu-icon fa fa-hand-rock-o"></i> My Strength</a>  
                    </li>
                  
                  
                     <li>
                       
                      <a href="<c:url value="/userJob" />" > <i class="menu-icon fa fa-briefcase"></i> My Dream job</a>  
                    </li>
                    
                  
                    
                    
                    <h3 class="menu-title">Result</h3><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-file-pdf-o"></i>Report</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-eye"></i><a href="<c:url value="/report" />">View Report</a></li>
                            <li><i class="menu-icon fa fa-download"></i><a href="font-themify.html">Download Report</a></li>
                        </ul>
                    </li>
                    </c:if>
                    </security:authorize>
                    <security:authorize access="hasRole('ROLE_ADMIN')">
                    <h3 class="menu-title">Admin</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-plus"></i>Add</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-square"></i><a href="<c:url value="/admin/addDimension"/>">Add Dimension</a></li>
                            <li><i class="menu-icon fa fa-quora"></i><a href="<c:url value="/admin/addQuestion"/>">Add Question</a></li>
                            <li><i class="menu-icon fa fa-plug"></i><a href="<c:url value="/admin/addStrength"/>">Add Strength</a></li>
                             <li><i class="menu-icon fa fa-subscript"></i><a href="<c:url value="/admin/addSubject"/>">Add Subject</a></li>
                            <li><i class="menu-icon fa fa-briefcase"></i><a href="<c:url value="/admin/addJob"/>">Add Job</a></li>
                        </ul>
                    </li>
                    <li>
                       
                      <a href="<c:url value="/admin/report"/>" > <i class="menu-icon fa fa-eye"></i> View Report</a>  
                    </li>
                    <li>
                      <a href="<c:url value="/school"/>" > <i class="menu-icon fa fa-graduation-cap"></i> Register School</a>  
                    </li>
                    </security:authorize>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <div id="right-panel" class="right-panel"> 
    <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                        
                       

                        

                       
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${img}/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
								<a href="<c:url value="/j_spring_security_logout"/>">Logout</a>   
                        </div>
                    </div>

                    

                </div>
            </div>

        </header>


<script src="${js}/vendor/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="${js}/plugins.js"></script>
    <script src="${js}/main.js"></script>
</html>