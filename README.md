# SKKU-WANTED

## Introduction
We have created a page that can help in the process of writing RESUME, which is a concern of all job seekers.
It is a web page service that provides a resume template for free and completes the resume when a user signs up and logs in.
When user selects a preferred template and fills out an input form that fits the template format, it is automatically applied to the template and a completed resume is provided. <br>
Users can save the completed resume as an image file, and log in to the web page again later to check their saved resume.
The project is entitled <em>“SKKU WANTED”</em>. We've created a webpage with the intention of helping user become the "Wanted" person in the job market through a great resume.

## Programming Language and Development Environment
Frontend: HTML, CSS, JavaScript <br>
Backend: JSP(Java 19.0.1), MySQL 8.0.31 <br>
Development Platform: Eclipse IDE 4.25.0, Tomcat v8.5 Server, MySQL Workbench <br>

## File description
<p>
(1) Login page (index page, page where login and signup are performed) <br>
index.html, login.css, login.js, login_validate.jsp, signup_validate.jsp
</p>
<p>
(2) Main page (page where user can choose a template for writing resume and check user’s own resume.) <br>
main.html, main.css, main.js
</p>
<p>
(3) Input page (information input form page that fits the template) <br>
input.html, input.css, input.js, resume_validate.jsp
</p>
<p>
(4) Templage page (each template page with information entered through input page) <br>
template_1.jsp, template_1.css, template_2.jsp, template_2.css, template_3.jsp, template_3.css, template_4.jsp, template_4.css, template_5.jsp, template_5.css, template_6.jsp, template.js, html2canvas.min.js
</p>
<p>
(5) SQL file <br>
DDL.sql
</p>
<p>
(6) images file <br>
template_1.jpg, template_2.jpg, template_3.jpg, template_4.jpg, template_5.jpg, template_6.jpg, uncle_sam.png, wallpaper.jpg
</p>

## User manual
<p>
First, create a database named "websitedb" and set the username and password to "root". Subsequently, the attached "DDL.sql" file creates the following table: <br>
[users] <br>
<img src="./readme_images/users.jpg" width="300px"> <br>
[personal] <br>
<img src="./readme_images/personal.jpg" width="300px"> <br>
[skills] <br>
<img src="./readme_images/skills.jpg" width="300px"> <br>
[experience] <br>
<img src="./readme_images/experience.jpg" width="300px"> <br>
[education] <br>
<img src="./readme_images/education.jpg" width="300px">
</p>
<p>
After creating the database, run the index.html file through the server and you will see the login screen: <br>
<img src="./readme_images/login_screen.jpg" width="700px"> <br>
To log in, you must create an ID and save information in the database. Click sign up and create an ID. <br>
<img src="./readme_images/signup_screen.jpg" width="700px"> <br>
If your ID and password do not match, a warning message will be displayed and you will not be able to log in. Enter the correct ID and proceed to the next step. <br>
<img src="./readme_images/login_error.jpg" width="300px"> <br>
If you have successfully logged in, you can see the following screen: <br>
You can choose your favorite template from the six registered resume templates. <br>
<img src="./readme_images/main_screen.jpg" width="700px"> <br>
After you select the template, you must enter the information you want to create on your resume. Create personal information, skills, academic, experience items and click the enter button <br>
<img src="./readme_images/input_screen_1.jpg" width="700px"> <br>
<img src="./readme_images/input_screen_2.jpg" width="700px"> <br>
This is how you got your own resume! To save your resume to your local repository, press the "Save This RESUME" button at the top left of the page. <br>
<img src="./readme_images/resume_screen.jpg" width="700px"> <br>
</p>
<p>
There are three buttons on the navigation bar: <br>
(1) Click the "SKKU WANTED" button to return to the main page. <br>
(2) If you want to see your last resume, click the "View my RESUME" button in the upper left corner of the main page. <br>
(3) Press the "signout" button in the upper right corner to log out after you've done all the work. <br>
<img src="./readme_images/nav_bar.jpg" width="700px"> <br>
</p>
</p>

## Code Architecture
<p>
(1) Frontend part
<p>
[login.js] <br>
Login: <br>
Save the logged in user name in session storage. <br>
Signup: <br>
Check format of all inputs. All signup input values are accessed by the id tag of each input. The signup button is enabled only when all inputs are in the correct format.<br>
first name: start with capital letter, numbers and special characters not allowed, no blank allowed <br>
last name: start with capital letter, numbers and special characters not allowed, no blank allowed <br>
email: follow standard email format, no blank allowed <br>
password: 6 characters or more, all numbers and characters allowed, no blank allowed
</p>
<p>
[main.js] <br>
Shows several templates. User can check other templates by clicking the arrow. If user selects the template to use, move to the input page. If user clicks the signout button, move to the login page. If ‘View My RESUME’ button click, move to completed resume page.
</p>
<p>
[input.js] <br>
Check format of all inputs. All form input values are accessed by the id tag of each input. <br>
name: numbers not allowed, no blank allowed <br>
job: numbers not allowed, no blank allowed <br>
address: no blank allowed <br>
email: follow standard email format, no blank allowed <br>
phone: 010-000(0)-0000 format, no blank allowed <br>
summary: no blank allowed
</p>
<p>
[template.js] <br>
If ‘Save This RESUME’ button click, capture the resume part of the current page and save it as an image file(.jpg). If user clicks the signout button, move to the login page.
</p>
<p>
[html2canvas.min.js] <br>
For screenshots with JavaScript, use the source of html2canvas(https://html2canvas.hertzen.com/) which is licensed under the MIT License.
</p>
</p>
<p>
(2) Backend part <br>
[DDL.sql] <br>
sql file for database table creation. Create a database with the following ER diagrams: <br>
<img src="./readme_images/er_diagram.jpg" width="500px"> <br>
Each table is associated with the user_name of the users table as the foreign key. The users table stores personal information, including login information, and the personal, skills, experience, and education tables store information for writing resume. <br>
[signup_validate.jsp] <br>
Connect to the mysql database and store the information entered in each form in the database. The information you need to enter includes username, password, firstname, lastname, and email. <br>
<img src="./readme_images/signup_validate.jpg" width="250px"> <br>
[login_validate.jsp] <br>
Connect to mysql database to compare the username entered in the form with the username stored in the database. If it doesn't match, display an error message, and if it does, log in successfully and proceed to the main page for writing your resume. <br>
[resume_validate.jsp] <br>
This is the part that processes information input data for resume preparation. Connects to the mysql database and stores each information entered in the form in the database. For example, the information entered in the personal table is: <br>
<img src="./readme_images/resume_validate.jpg" width="600px"> <br>
[template_1 ~ 6.jsp] <br>
Connect to mysql database to get the information entered in each form. After retrieving all the information from each database table, enter each information according to the template format specified. The template format is written using html and css, and the information retrieved from the database is included in the contents of each tag.
</p>
