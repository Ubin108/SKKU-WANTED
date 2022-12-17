$(function () {
    $(".btn_download").click(function (e) { // if "Save This RESUME" button is clicked
        html2canvas(document.getElementById("capture_area")).then(function (canvas) { // capture resume area of current web page through html2canvas.js
            var el = document.createElement("a")
            el.href = canvas.toDataURL("image/jpeg")
            el.download = 'RESUME.jpg'
            el.click() // download as 'RESUME.jpg'
        });
    });
});

$(".signout").click(function(e){ // if signout button clicks
	location.href="index.html"; // move to index page
});
