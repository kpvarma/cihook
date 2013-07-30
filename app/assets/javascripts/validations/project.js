function validateProjectForm() {
  
    $('#form_project').validate({
      debug: true,
      rules: {
        "project[name]": {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        "project[description]": "required",
        "project[status]": {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        "project[qa_url]": "required",
        "project[uat_url]": "required",
        "project[repo_url]": "required",
      },
      messages: {
        "project[name]": "Please specify Name",
        "project[description]": "Please specify Description",
        "project[status]": "Please specify Status",
        "project[qa_url]": "Please specify Qa Url",
        "project[uat_url]": "Please specify Uat Url",
        "project[repo_url]": "Please specify Repo Url",
      },
      highlight: function(element) {
          $(element).parent().addClass("danger");
      },
      unhighlight: function(element) {
          $(element).parent().removeClass("danger");
      },
      invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {
          
          // Populating error message
          var errorMessage = errors == 1
            ? 'You missed 1 field. It has been highlighted'
            : 'You missed ' + errors + ' fields. They have been highlighted';
          
          // Removing the form error if it already exists
          $("#div_project_js_validation_error").remove();
          
          errorHtml = "<div id='div_project_js_validation_error' class=\"alert danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          $("#div_project_details").prepend(errorHtml);  
          
          // Show error labels
          $("div.error").show();
          
        } else {
          // Hide error labels
          $("div.error").hide();
          // Removing the error message
          $("#div_project_js_validation_error").remove();
        }
      },
      submitHandler: function(form) {
        // Submit the form via HTTP request
        // form.submit();
        
        // Submit the form via XMLHTTP request (Ajax)
        $(form).ajaxSubmit({
          url: $("#form_project input[name=faction]").val(),
          type: $("#form_project input[name=fmethod]").val(),
          dataType: 'script'
        });
      }
      
    });
    
}
