$(document).ready(function() {
  $("#commentForm").validate(
    {
      messages: {
        name: "I need this",
        email: "This too",
        comment: "And this"
    }
  });
  $("#submit").ajaxbuttonindicator();
});  




