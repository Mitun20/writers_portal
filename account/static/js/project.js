  //Project Modal
  $('#AjaxModal').on('click','.add-project', function(){ 
    event.preventDefault();           
    $('#projectModal').modal('show');  
    $('.container' ).addClass('blur');
    $('#AjaxModal' ).addClass('fade');
});



  //project search
  $('#projectModal').on('click','.project_search', function(){            
      event.preventDefault();
        name = $('#project-search-input').val();            

        url = "{% url 'project_search' model_name='assistant' %}"
        $.ajax({
            url : url,
            data : {'name':name,},
            method: 'post',  
            headers: { "X-CSRFToken": "{{ csrf_token }}", },   

            success:function(output)
              {  
                $('#project-list-div').html(output.projects); 
                $('.add-selected-project').removeClass('disabled');                                           
              },
        });
    });


 //move selected project
 $('#projectModal').on('click','.add-selected-project', function(){           
      projectId = $('input[name="project-select"]:checked').val();
      projectName = $('input[name="project-select"]:checked').attr('project_name');

   
      if(projectId){

          $('#get_project_link').remove();
          $('#ajax-model-project-section').append('<div class="m-1"><h5 class="mt-2" id="get_project_link" projectid="'+projectId+'" > Project: '+projectName+'</h5></div>');
          $("#id_project").find('option:first').remove();
          $('#id_project').append('<option value="'+projectId+'" seleted>'+projectName+'</option>');
          
          $('#projectModal').modal('toggle');             
          $('.add-selected-project').text("Edit Project");
          $('.open-add-project-modal').text("Edit Project");
          $('.add-project').text("Edit Project");
          

      }
      else{
        alert('You must select one of the options.');
      }
       
  });


  $('#projectModal').on('click','.ajax-add-project-btn', function(){

      event.preventDefault();
      formdata = new FormData($('#projectModal #ajax_form')[0]);
      url = $(this).attr('data-url');
      $.ajax({
          url : url,
          data : formdata,
          method: 'post',
          processData: false,
          contentType: false,
          beforeSend:function()
          {
              $('#projectModal #project_info_text').text('Please Wait ');
              
          },
          
          success:function(output)
          {
              if(output.valid)
              {                 
                $('#project-list-div').html(output.project); 
                $("#project-search-tab").tab('show');
                $('.add-selected-project').removeClass('disabled'); 
                 
              }
              else
              {                     
                  $('.project-form').html(output.form);
              }
              $('#projectModal #project_info_text').text('');
          },
      });


  });

  