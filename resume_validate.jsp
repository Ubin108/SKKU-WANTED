
<%@ page import ="java.sql.*" %>
<%
    try{  	
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
        PreparedStatement ps = null;

        int i = 0;
        String username = (String)session.getAttribute("user_name");
        // Loading Session Information
        
        /* One person can save only one resume to the database.
		Before creating resume information, delete any previously saved resume.*/
        String del1 = "DELETE FROM `websitedb`.`education` WHERE (`user_name` = ?);";
        String del2 = "DELETE FROM `websitedb`.`experience` WHERE (`user_name` = ?);";
        String del3 ="DELETE FROM `websitedb`.`personal` WHERE (`user_name` = ?);";
        String del4 ="DELETE FROM `websitedb`.`skills` WHERE (`user_name` = ?);";
        
        ps = conn.prepareStatement(del1);
        ps.setString(1, username);
        i = ps.executeUpdate();
        ps = conn.prepareStatement(del2);
        ps.setString(1, username);
        i = ps.executeUpdate();
        ps = conn.prepareStatement(del3);
        ps.setString(1, username);
        i = ps.executeUpdate();
        ps = conn.prepareStatement(del4);
        ps.setString(1, username);
        i = ps.executeUpdate();
        
        /* personal section insert*/
        String name = request.getParameter("name");   
        String job = request.getParameter("job");
        String address = request.getParameter("address");   
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String summary = request.getParameter("summary");
        
        String sql = "insert into personal(user_name,name,job,address,email,phone,summary)values(?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, name);
        ps.setString(3, job);
        ps.setString(4, address);
        ps.setString(5, email);
        ps.setString(6, phone);
        ps.setString(7, summary);
        i=ps.executeUpdate();
        
        /* skills section insert*/
        String expertise1 = request.getParameter("expertise1");   
        String expertise2 = request.getParameter("expertise2");
        String expertise3 = request.getParameter("expertise3");   
        String expertise4 = request.getParameter("expertise4");
        String expertise5 = request.getParameter("expertise5");
        
        sql = "insert into skills(user_name,expertise1,expertise2,expertise3,expertise4,expertise5)values(?,?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, expertise1);
        ps.setString(3, expertise2);
        ps.setString(4, expertise3);
        ps.setString(5, expertise4);
        ps.setString(6, expertise5);
        i=ps.executeUpdate();
        
        /* education section insert*/
        String education_year1 = request.getParameter("education_year1");   
        String education_name1 = request.getParameter("education_name1");
        String education_grade1 = request.getParameter("education_grade1");   
        String education_year2 = request.getParameter("education_year2");
        String education_name2 = request.getParameter("education_name2");
        String education_grade2 = request.getParameter("education_grade2");   
        
        sql = "insert into education(user_name,education_year1,education_name1,education_grade1,education_year2,education_name2,education_grade2)values(?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, education_year1);
        ps.setString(3, education_name1);
        ps.setString(4, education_grade1);
        ps.setString(5, education_year2);
        ps.setString(6, education_name2);
        ps.setString(7, education_grade2);
        i=ps.executeUpdate();
        
        /* experience section insert*/
        String year1 = request.getParameter("year1");   
        String experience_name1 = request.getParameter("experience_name1");
        String job_position1 = request.getParameter("job_position1");   
        String experience_summary1 = request.getParameter("experience_summary1");
        
        String year2 = request.getParameter("year2");
        String experience_name2 = request.getParameter("experience_name2");   
        String job_position2 = request.getParameter("job_position2");
        String experience_summary2 = request.getParameter("experience_summary2");
        
        String year3 = request.getParameter("year3");
        String experience_name3 = request.getParameter("experience_name3");   
        String job_position3 = request.getParameter("job_position3");
        String experience_summary3 = request.getParameter("experience_summary3");
        
        sql = "insert into experience(user_name,"+
        "year1,experience_name1,job_position1,experience_summary1,"+
        "year2,experience_name2,job_position2,experience_summary2,"+
        "year3,experience_name3,job_position3,experience_summary3)"+
        		"values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        
        ps.setString(2, year1);
        ps.setString(3, experience_name1);
        ps.setString(4, job_position1);
        ps.setString(5, experience_summary1);
        
        ps.setString(6, year2);
        ps.setString(7, experience_name2);
        ps.setString(8, job_position2);
        ps.setString(9, experience_summary2);
        
        ps.setString(10, year3);
        ps.setString(11, experience_name3);
        ps.setString(12, job_position3);
        ps.setString(13, experience_summary3);
        i=ps.executeUpdate();
        
        /* View resume written with entered information */
        String js = "<script>alert('Resume is created successfully'); let template = sessionStorage.getItem('template');"+ 
        "if (template === '1') { location.href='template_1.jsp'; }"+
        "else if (template === '2') { location.href='template_2.jsp'; }"+
        "else if (template === '3') { location.href='template_3.jsp'; }"+
        "else if (template === '4') { location.href='template_4.jsp'; }"+
        "else if (template === '5') { location.href='template_5.jsp'; }"+
        "else if (template === '6') { location.href='template_6.jsp'; }</script>";
        
        out.println(js);   
        out.flush();
        return;
   }
   catch(Exception e){ //If the data is not entered successfully
	   out.println("Please check your own data");  
   }      
%>