$(document).ready(function(){
  $('#view').click(function(){
	location.href ="./template_5.jsp"; // move to saved resume page
});
  $('.signout').click(function(){
    location.href = "./index.html"; // if signout button is clicked, perform signout and move to index page.
  });
  $('#next').click(function(){
    $(".tp").toggle();  // if ">" button is clicked, show next templates.
  });
  $('#prev').click(function(){
    $(".tp").toggle();  // if "<" button is clicked, show previous templates.
  });
});
