<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Template</title>
    <link href="css/template_6.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<%@ page import ="java.sql.*" %>
<%
	boolean i = false;
	Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
	PreparedStatement ps = null;
	
	String username = (String)session.getAttribute("user_name");
	
	/* loading personal table information*/
	ps = conn.prepareStatement("select * from personal where user_name = ?");
	ps.setString(1, username);
	ResultSet personal = ps.executeQuery();
	i = personal.next();
	
	/* loading experience table information*/
	ps = conn.prepareStatement("select * from experience where user_name = ?");
	ps.setString(1, username);
	ResultSet experience = ps.executeQuery();
	i = experience.next();
	
	/* loading skills table information*/
	ps = conn.prepareStatement("select * from skills where user_name = ?");
	ps.setString(1, username);
	ResultSet expertise = ps.executeQuery();
	i = expertise.next(); 
	
	/* loading education table information*/
	ps = conn.prepareStatement("select * from education where user_name = ?");
	ps.setString(1, username);
	ResultSet education = ps.executeQuery();
	i = education.next(); 
%>
<body onload="load_page()">
    <nav class="navbar navbar-expand-lg bg-dark">
      <div class="container-fluid" id="navbar">
        <a class="navbar-brand" href="./main.html"><span id="title">SKKU WANTED</span></a>
        <button type="button" class="btn_download" id="save">Save This RESUME</button>
        <p class="signout">Signout</p>
      </div>
    </nav>
    <div id="capture_area">
      <div class="wrapper">
          <div id="left" class="container text-right">
            <h1 id="name"><% out.print(personal.getString("name")); %></h1>
            <h2 id="job">Student</h2>
            <h5 class="summary" id="summary"><% out.print(personal.getString("summary")); %>
            </h5>
            <h2 class="sub_title">Experience</h2>
            <div class="sub_box">
              <h4 class="year" id="year1"><% out.print(experience.getString("year1")); %></h4>
              <h5 id="experience_name1"><% out.print(experience.getString("experience_name1")); %></h5>
              <h4 class="jobs" id="job_position1"><% out.print(experience.getString("job_position1")); %></h4>
              <h5 class="summary" id="experience_summary1"><% out.print(experience.getString("experience_summary1")); %>
              </h5>
              <h4 class="year" id="year2"><% out.print(experience.getString("year2")); %></h4>
              <h5 id="experience_name2"><% out.print(experience.getString("experience_name2")); %></h5>
              <h4 class="jobs" id="job_position2"><% out.print(experience.getString("job_position2")); %></h4>
              <h5 class="summary" id="experience_summary2"><% out.print(experience.getString("experience_summary2")); %>
              </h5>
              <h4 class="year" id="year3"><% out.print(experience.getString("year3")); %></h4>
              <h5 id="experience_name3"><% out.print(experience.getString("experience_name3")); %></h5>
              <h4 class="jobs" id="job_position3"><% out.print(experience.getString("job_position3")); %></h4>
              <h5 class="summary" id="experience_summary3"><% out.print(experience.getString("experience_summary3")); %>
              </h5>
            </div>
          </div>
          <div id="right" class="container text-right">
            <h2 id="contact" class="sub_title">Contact</h2>
            <h4 class="item">phone</h4>
            <h5 id="phone"><% out.print(personal.getString("phone")); %></h5>
            <h4 class="item">Email</h4>
            <h5 id="email"><% out.print(personal.getString("email")); %></h5>
            <h4 class="item">Address</h4>
            <h5 id="address"><% out.print(personal.getString("address")); %></h5>
            <h2 class="sub_title">Education</h2>
            <h4 class="item" id="education_year1"><% out.print(education.getString("education_year1")); %></h4>
            <h5 id="education_name1"><% out.print(education.getString("education_name1")); %></h5>
            <h5 id="education_grade1"><% out.print(education.getString("education_grade1")); %></h5>
            <h4 class="item" id="education_year2"><% out.print(education.getString("education_year2")); %></h4>
            <h5 id="education_name2"><% out.print(education.getString("education_name2")); %></h5>
            <h5 id="education_grade2"><% out.print(education.getString("education_grade2")); %></h5>
            <h2 class="sub_title">Expertise</h2>
            <ul>
              <li id="expertise1"><% out.print(expertise.getString("expertise1")); %></li>
              <li id="expertise2"><% out.print(expertise.getString("expertise2")); %></li>
              <li id="expertise3"><% out.print(expertise.getString("expertise3")); %></li>
              <li id="expertise4"><% out.print(expertise.getString("expertise4")); %></li>
              <li id="expertise5"><% out.print(expertise.getString("expertise5")); %></li>
            </ul>
          </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
    <script src="js/template.js"></script>
    <script src="js/html2canvas.min.js"></script>
  </body>
</html>
