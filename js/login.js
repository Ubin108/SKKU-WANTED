$(document).ready(function(){
  let mail_regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  let first_regex = /^[A-Z][a-z]*$/;
  let last_regex = /^[A-Z][a-z]*$/;
  let numreg = /[0-9]/g;
  let specialreg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
  let capital = /^[A-Z]/;
  let password_regex = /[0-9a-zA-Z\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{6,}/;
  let flag_first_name = false;
  let flag_last_name = false;
  let flag_email = false;
  let flag_password = false;

  $('#signup').attr("disabled", true); // initialize the signup button to a disabled state

  $('.login_content').show();
  $('.signup_content').hide();

  $('#input_first_name').on("propertychange change keyup paste input", function(){ // Real-time first name input change detection
    first_name = $('#input_first_name').val();
    if(first_regex.test(first_name)){ // check the first name format
      $('#input_first_name').css({"border": "1px solid black"});
      $('#error_msg_first_name').hide();
      flag_first_name = true;
      if (flag_first_name && flag_last_name && flag_email && flag_password){ // if all inputs fit the format
        $('#signup').attr("disabled", false); // Enable signup button
      }
      else{ // if some inputs don't fit the format
        $('#signup').attr("disabled", true); // Diable signup button
      }
    }
    else{ // first name format error
      if(!capital.test(first_name)){
        $('#error_msg_first_name').text("Wrong Input!");
      }
      else if(capital.test(first_name) && numreg.test(first_name)){
        $('#error_msg_first_name').text("Wrong Input!");
      }
      else if(!numreg.test(first_name) && specialreg.test(first_name)){
        $('#error_msg_first_name').text("Wrong Input!");
      }
      $('#input_first_name').css({"border": "1px solid red"});
      $('#error_msg_first_name').show();
      flag_first_name = false;
    }

  });
  $('#input_last_name').on("propertychange change keyup paste input", function(){ // Real-time last name input change detection
    last_name = $('#input_last_name').val();
    if(last_regex.test(last_name)){ // check the last name format
      $('#input_last_name').css({"border": "1px solid black"});
      $('#error_msg_last_name').hide();
      flag_last_name = true;
      if (flag_first_name && flag_last_name && flag_email && flag_password){ // if all inputs fit the format
        $('#signup').attr("disabled", false); // Enable signup button
      }
      else{ // if some inputs don't fit the format
        $('#signup').attr("disabled", true); // Diable signup button
      }
    }
    else{ // last name format error
      if(!capital.test(last_name)){
        $('#error_msg_last_name').text("Wrong Input!");
      }
      else if(capital.test(last_name) && numreg.test(last_name)){
        $('#error_msg_last_name').text("Wrong Input!");
      }
      else if(!numreg.test(last_name) && specialreg.test(last_name)){
        $('#error_msg_last_name').text("Wrong Input!");
      }
      $('#input_last_name').css({"border": "1px solid red"});
      $('#error_msg_last_name').show();
      flag_last_name = false;
    }

  });
  $('#input_email').on("propertychange change keyup paste input", function(){ // Real-time email input change detection
    email = $('#input_email').val();
    if(mail_regex.test(email)){ // check the email format
      $('#input_email').css({"border": "1px solid black"});
      $('#error_msg_email').hide();
      flag_email = true;
      if (flag_first_name && flag_last_name && flag_email && flag_password){ // if all inputs fit the format
        $('#signup').attr("disabled", false); // Enable signup button
      }
      else{ // if some inputs don't fit the format
        $('#signup').attr("disabled", true); // Diable signup button
      }
    }
    else{ // email format error
      $('#input_email').css({"border": "1px solid red"});
      $('#error_msg_email').text("Wrong Input!");
      $('#error_msg_email').show();
      flag_email = false;
    }

  });
  $('#input_password').on("propertychange change keyup paste input", function(){ // Real-time password input change detection
    password = $('#input_password').val();
    if(password_regex.test(password)){ // check the password format
      $('#input_password').css({"border": "1px solid black"});
      $('#error_msg_password').hide();
      flag_password = true;
      if (flag_first_name && flag_last_name && flag_email && flag_password){ // if all inputs fit the format
        $('#signup').attr("disabled", false); // Enable signup button
      }
      else{ // if some inputs don't fit the format
        $('#signup').attr("disabled", true); // Diable signup button
      }
    }
    else{ // password format error
      $('#input_password').css({"border": "1px solid red"});
      $('#error_msg_password').text("Wrong Input!")
      $('#error_msg_password').css({"width": "280px", "height": "40px"});
      $('#error_msg_password').show();
      flag_password = false;
    }

  });

  $('#login').click(function(){
	   sessionStorage.setItem("username",$('#input_email_login').val()); // save username in session storage
	});

  $('.signup_tap').click(function(){ // when you click the signup tab
    $('.input_box').val(''); // initialize inside the input box

    // fade-in and fade-out effects for natural page transitions
    // use setTimeout so fadein and fadeout don't appear at the same time
    $('.login_content').fadeOut(400, function(){
    });
    setTimeout(function(){
      $('.signup_content').fadeIn(400, function(){
      });
    }, 400);
  });
});
