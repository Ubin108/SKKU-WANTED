<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/login.css">
    <title></title>
  </head>
  <body>
  <%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("user_name");   
        String password = request.getParameter("password");
       
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select user_name, password from users where user_name=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) // Enter session information and move on to main screen when logged in successfully
        {
        	session.setAttribute("user_name", username); 
        	response.sendRedirect("main.html");
        }
        else // If the ID and password do not match, a warning message is displayed.
        {
        	%>
        	<script>
        	alert("Please check your username and password!");
        	</script>
        	<% 
        }
   }
   catch(Exception e){             
   }      
%>
    <div class="wrapper">
      <h1 class="title"> SKKU WANTED </h1>
      <h2 class="introduction"> Make your own RESUME </h2>
      <div class="box">
        <div class="contents">
        
          <form class="login_content" action="login_validate.jsp" method="post">
            <img src="./images/uncle_sam.png" class="login_image" width="160px">
            <p class="instruction" id="instruction_login">Enter user name and password</p>
            <div class="sub_box">
              <p class="sub_title">User name</p>
              <input class="input_box" id="input_email_login" name="user_name" type="text" placeholder="User name">
              <p class="sub_title">Password</p>
              <input class="input_box" id="input_password_login" name="password" type="password" placeholder="Password">
            </div>
            <input class="button" id = "login" type="submit" value="Login">
            <div class="signup_tap"> Sign Up </div>
          </form>
          
          <form class="signup_content" action="signup_validate.jsp" method="post">
            <div class="sub_box">
              <p class="sub_title">User name</p>
              <input class="input_box" id="user_name" name="user_name"type="text" placeholder="User name">
              <p class="sub_title">Password</p>
              <input class="input_box" id="input_password" name="password" type="password" placeholder="Password">
              <p class="sub_title">First name</p>
              <input class="input_box" id="input_first_name" name="first_name" type="text" placeholder="First name">
              <p class="sub_title">Last name</p>
              <input class="input_box" id="input_last_name" name="last_name" type="text" placeholder="Last name">
              <p class="sub_title">Email</p>
              <input class="input_box" id="input_email" name="email" type="email" placeholder="Email">
            </div>
            <input class="button" id = "signup" type="submit" value="Sign Up">
          </form>
          
        </div>
      </div>
        <h2 class="inst1"> It's time to increase your VALUE </h2>
        <h1 class="inst2"> REWARD &nbsp; &nbsp; $999,999,999 </h1>
      </div>
      
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="./js/login.js"></script>
  </body>
</html>