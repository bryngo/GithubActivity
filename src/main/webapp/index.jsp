<%@ page import="ecs189.querying.github.GithubQuerier" %><%--
  Created by IntelliJ IDEA.
  User: Vincent
  Date: 7/3/2017
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Github push tracker">
      <meta name="author" content="Lena Tan Bryan Ngo">

      <title>Github Stalker</title>

      <!-- Bootstrap Core CSS -->
      <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="main.css">

      <!-- Custom Fonts -->
      <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
      <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
      <link href='https://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>

      <!-- Theme CSS -->
      <link href="css/grayscale.min.css" rel="stylesheet">

      <!-- Temporary navbar container fix until Bootstrap 4 is patched -->
      <style>
          .navbar-toggler {
              z-index: 1;
          }

          @media (max-width: 576px) {
              nav > .container {
                  width: 100%;
              }
          }
      </style>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Github Stalker</title>
  </head>
  <body id="page-top">

  <!-- Intro Header -->
  <header class="intro">
      <div class="intro-body">
          <div class="container">
              <div class="row">
                  <div class="col-md-8 offset-md-2">
                      <h1 class="brand-heading">Github Tracker</h1>
                      <p class="intro-text">The most elegant way to stalk developers on Github.</p>
                      <a href="#about" class="btn btn-circle page-scroll">
                          <i class="fa fa-angle-double-down animated"></i>
                      </a>
                  </div>
              </div>
          </div>
      </div>
  </header>

  <!-- About Section -->
  <section id="about" class="container content-section text-center">
      <div class="row">
          <div class="col-lg-8 offset-md-2">
              <h2>About Github Tracker</h2>
              <p>GitHub Tracker is a free to open source project that allows you to track activity from other users on GitHub.</p>
              <p>This is game changing software. Never before have you been able to view the date of the last 10 push requests of a user <b>and</b> be able to view each commit's SHA<i> and</i> commit message.</p>
              <p>Simply amazing.</p>
          </div>
      </div>
  </section>

  <!-- Download Section -->
  <section id="download" class="content-section text-center">
      <div class="download-section">
          <div class="container">
              <div class="col-lg-8 offset-md-2">
                  <h2>Go ahead, give it a try. It's free</h2>
                  <p>You can download GitHub Tracker. Completely free of charge.</p>
                  <a href="https://github.com/bryngo/GithubActivity" class="btn btn-default btn-lg">Visit Download Page</a>
              </div>
          </div>
      </div>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="container content-section text-center">
  <div id="core">
    <h1>Enter a username, any GitHub username</h1>
    <form action="index.jsp" method="GET">
      <div class="form-group">
        <label for="user"><h3>Github username:</h3></label>
        <input type="user" name="user_name" class="form-control" id="user"
               value="<%= request.getParameter("user_name") == null ? "" : request.getParameter("user_name")%>">
      </div>
      <%String user=request.getParameter("user_name"); %>
      <button type="submit" class="btn btn-default">
        <c:choose>
          <c:when test="${empty user}">
            Submit
          </c:when>
          <c:otherwise>
            Refresh
          </c:otherwise>
        </c:choose>
      </button>
    </form>
    <div id="activity">
      <%if (user != null && !user.isEmpty()){%>
          <%=GithubQuerier.eventsAsHTML(user)%>
        <% } else { %>
            What are you waiting for? Your open source developer stalking starts now.
        <% }%>
    </div>
  </div>
  </section>

  <!-- YOUR CODE HERE -->
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <!-- Footer -->
  <footer>
      <div class="container text-center">
          <p>Copyright &copy; Lena and <a href="https://www.instagram.com/bryan.cpp/">Bryan</a></p>
      </div>
  </footer>

  <!-- jQuery Version 3.1.1 -->
  <script src="lib/jquery/jquery.js"></script>

  <!-- Tether -->
  <script src="lib/tether/tether.min.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

  <!-- Theme JavaScript -->
  <script src="js/grayscale.min.js"></script>


  </body>
</html>
