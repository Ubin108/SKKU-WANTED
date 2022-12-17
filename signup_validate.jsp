<%@ page import ="java.sql.*" %>
<%
    try{  	
        String username = request.getParameter("user_name");   
        String password = request.getParameter("password");
        String firstName = request.getParameter("first_name");   
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        if(username == "" || password == "" || firstName == "" || lastName == ""|| email == ""){
        	response.sendRedirect("index.html");
        	return;
        } // If the user has not entered any information, return to the login page
        
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
        
        //sql query for signup information 
        String sql = "insert into users(user_name,password,first_name,last_name,email)values(?,?,?,?,?)";
        PreparedStatement ps = null;
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, firstName);
        ps.setString(4, lastName);
        ps.setString(5, email);
        int i=ps.executeUpdate(); // execute sql query
        
        out.println("<script>alert('Signup complete successfully'); location.href='index.html';</script>");   
        out.flush(); // show complete message
   }
   catch(Exception e){
	   out.println("Exception" + e);  
   }      
%>
