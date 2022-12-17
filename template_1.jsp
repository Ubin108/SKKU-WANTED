<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Template_1</title>
  <link href="css/template_1.css" rel="stylesheet">
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

<body>
  <nav class="navbar navbar-expand-lg bg-dark">
    <div class="container-fluid" id="navbar">
      <a class="navbar-brand" href="./main.html"><span id="title">SKKU WANTED</span></a>
      <button type="button" class="btn_download" id="save">Save This RESUME</button>
      <p class="signout">Signout</p>
    </div>
  </nav>
  <div id="capture_area" style="background-color: white; border: 1px;">
    <div class="wrapper">
      <div id="top1">
        <h1 id="name"><% out.print(personal.getString("name")); %></h1>
        <div class="information">
          <h5 id="phone"><% out.print(personal.getString("phone")); %></h5>
          <h5 id="email"><% out.print(personal.getString("email")); %></h5>
        </div>
        <h5 id="address"><% out.print(personal.getString("address")); %></h5>
      </div>
      <div id="top2">
        <h5 id="summary"><% out.print(personal.getString("summary")); %></h5>
      </div>
      <div class="mid">
        <div id="left">
          <h2 class="sub_title">Experience</h2>
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" id="experience_name1">
				<% out.print(experience.getString("experience_name1")); %>
			  </h5>
              <h6 class="card-subtitle mb-2 text-muted" id="year1">
              	<% out.print(experience.getString("year1")); %>
              </h6>
              <h6 class="card-subtitle mb-2 text-muted" id="job_position1">
              	<% out.print(experience.getString("job_position1")); %>
			  </h6>
              <p class="card-text" id="experience_summary1">
              	<% out.print(experience.getString("experience_summary1")); %>
              </p>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" id="experience_name2">
              	<% out.print(experience.getString("experience_name2")); %>
			  </h5>
              <h6 class="card-subtitle mb-2 text-muted" id="year2">
              	<% out.print(experience.getString("year2")); %>
              </h6>
              <h6 class="card-subtitle mb-2 text-muted" id="job_position2">
              	<% out.print(experience.getString("job_position2")); %>
              </h6>
              <p class="card-text" id="experience_summary2">
              	<% out.print(experience.getString("experience_summary2")); %>
              </p>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" id="experience_name3">
              	<% out.print(experience.getString("experience_name3")); %>
			  </h5>
              <h6 class="card-subtitle mb-2 text-muted" id="year3">
              	<% out.print(experience.getString("year3")); %>
              </h6>
              <h6 class="card-subtitle mb-2 text-muted" id="job_position3">
              	<% out.print(experience.getString("job_position3")); %>
              </h6>
              <p class="card-text" id="experience_summary3">
              	<% out.print(experience.getString("experience_summary3")); %>
              </p>
            </div>
          </div>
        </div>
        <div id="right">
          <h2 class="sub_title">Expertise</h2>
          <ul class="expertise">
            <li id="expertise1"><% out.print(expertise.getString("expertise1")); %></li>
            <li id="expertise2"><% out.print(expertise.getString("expertise2")); %></li>
            <li id="expertise3"><% out.print(expertise.getString("expertise3")); %></li>
            <li id="expertise4"><% out.print(expertise.getString("expertise4")); %></li>
            <li id="expertise5"><% out.print(expertise.getString("expertise5")); %></li>
          </ul>
          <h2 class="sub_title">Education</h2>
          <h5 id="education_year1"><% out.print(education.getString("education_year1")); %></h5>
          <h6 id="education_name1"><% out.print(education.getString("education_name1")); %></h6>
          <h6 id="education_grade1"><% out.print(education.getString("education_grade1")); %></h6>
          <br>
          <h5 id="education_year2"><% out.print(education.getString("education_year2")); %></h5>
          <h6 id="education_name2"><% out.print(education.getString("education_name2")); %></h6>
          <h6 id="education_grade2"><% out.print(education.getString("education_grade2")); %></h6>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
  <script src="js/template.js"></script>
  <script src="js/main.js"></script>
  <script src="js/html2canvas.min.js"></script>
</body>
</html>
