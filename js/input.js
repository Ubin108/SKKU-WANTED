  $('#enter').attr('disabled', true); // initialize the signup button to a disabled state
  function enter_btn_click() {
      validation();
  }
  function validation() { // function for format check of all inputs
      let valid = name_validation() + job_validation() + address_validation() + email_validation() + phone_validation() + summary_validation();
      if (valid !== 6) {
          window.scrollTo(0, 400); // scroll up to rewrite content
      }
  }

  function name_validation() { // function for format check of name input
      let name = $('#name').val();
      name = name.trim();

      if (name === '') {
          $('#name').css("border-color", "red");
          $('#name_validation_empty').css("display", "block");
          $('#name_validation_number').css("display", "none");
          return 0;
      }
      else if (name.match(/[0-9]/)) {
          $('#name').css("border-color", "red");
          $('#name_validation_empty').css("display", "none");
          $('#name_validation_number').css("display", "block");
          return 0;
      }
      else {
          $('#name').css("border-color", "black");
          $('#name_validation_empty').css("display", "none");
          $('#name_validation_number').css("display", "none");
          return 1;
      }

  }

  function job_validation() { // function for format check of job input
      let job = $('#job').val();
      job = job.trim();

      if (job === '') {
          $('#job').css("border-color", "red");
          $('#job_validation_empty').css("display", "block");
          $('#job_validation_number').css("display", "none");
          return 0;
      }
      else if (job.match(/[0-9]/)) {
          $('#job').css("border-color", "red");
          $('#job_validation_empty').css("display", "none");
          $('#job_validation_number').css("display", "block");
          return 0;
      }
      else {
          $('#job').css("border-color", "black");
          $('#job_validation_empty').css("display", "none");
          $('#job_validation_number').css("display", "none");
          return 1;
      }
  }

  function address_validation() { // function for format check of address input
      let address = $('#address').val();
      address = address.trim();

      if (address === '') {
          $('#address').css("border-color", "red");
          $('#address_validation_empty').css("display", "block");
          return 0;
      }
      else {
          $('#address').css("border-color", "black");
          $('#address_validation_empty').css("display", "none");
          return 1;
      }
  }

  function email_validation() { // function for format check of email input
      let email = $('#email').val();
      email = email.trim();

      if (email === '') {
          $('#email').css("border-color", "red");
          $('#email_validation_empty').css("display", "block");
          $('#invalid_email').css("display", "none");
          return 0;
      }
      else if (!email.match(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i)) {
          $('#email').css("border-color", "red");
          $('#email_validation_empty').css("display", "none");
          $('#invalid_email').css("display", "block");
          return 0;
      }
      else {
          $('#email').css("border-color", "black");
          $('#email_validation_empty').css("display", "none");
          $('#invalid_email').css("display", "none");
          return 1;
      }
  }

  function phone_validation() { // function for format check of phone input
      let phone = $('#phone').val();
      phone = phone.trim();

      if (phone === '') {
          $('#phone').css("border-color", "red");
          $('#phone_validation_empty').css("display", "block");
          $('#invalid_phone').css("display", "none");
          return 0;
      }
      else if (!phone.match(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/)) {
          $('#phone').css("border-color", "red");
          $('#phone_validation_empty').css("display", "none");
          $('#invalid_phone').css("display", "block");
          return 0;
      }
      else {
          $('#phone').css("border-color", "black");
          $('#phone_validation_empty').css("display", "none");
          $('#invalid_phone').css("display", "none");
          return 1;
      }
  }

  function summary_validation() { // function for format check of summary input
      let summary = $('#summary').val();
      summary = summary.trim();

      if (summary === '') {
          $('#summary').css("border-color", "red");
          $('#summary_validation_empty').css("display", "block");
          return 0;
      }
      else {
          $('#summary').css("border-color", "black");
          $('#summary_validation_empty').css("display", "none");
          return 1;
      }
  }

  $('input').on("propertychange change keyup paste input", function(){ // Real-time check for format of all inputs when some input changes
	   sessionStorage.setItem("template",location.href.split('?')[1]);
    let valid = name_validation() + job_validation() + address_validation() + email_validation() + phone_validation() + summary_validation();
    if (valid !== 6) { // if some inputs don't fit the format
      $('#enter').attr('disabled', true);
    }
    else{ // if all inputs fit the format
      $('#enter').attr('disabled', false);
    }
  });

  $('textarea').on("propertychange change keyup paste input", function(){ // Real-time check for format of all inputs when some textarea changes
    let valid = name_validation() + job_validation() + address_validation() + email_validation() + phone_validation() + summary_validation();
    if (valid !== 6) { // if some inputs don't fit the format
      $('#enter').attr('disabled', true);
    }
    else{ // if all inputs fit the format
      $('#enter').attr('disabled', false);
    }
  });
