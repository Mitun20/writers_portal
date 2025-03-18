
    //Testimonial
    $('.people_div').on('click','.write-testimonial', function(){   
        event.preventDefault(); 
        url = $(this).attr('data-url');            
        $.ajax({
            url : url,               
            success:function(output)
            {
              
                $('#AjaxModal').html(output.form);
                $('#AjaxModal').modal('show');                                 
            },            
        });       
    });


      //add Testimonial
      $('#AjaxModal').on('click','.ajax-add-testimonial-btn', function(){
          event.preventDefault();
  
          formdata = new FormData($('#AjaxModal #ajax_form')[0]);
          url = $(this).attr('data-url');
          var projectLink = $('#get_project_link').attr('projectid');
          formdata.append('project', projectLink);
          var title = $('#id_title').val();  
          var textcontent = $('#id_text_content').val(); 
          var videocontent = $('#id_video_content').val(); 
          var picturecontent = $('#id_picture_content').val();

  
       

        if(   title   && (textcontent || videocontent  || picturecontent) )

        {
   
          $.ajax({
              url : url,
              data : formdata,
              method: 'post',
              processData: false,
              contentType: false,
              beforeSend:function()
              {
                  $('#AjaxModal #info_text').text('Please Wait');
                  
              },
              
              success:function(output)
              {
                  if(output.valid)
                  {

                      $('#AjaxModal').modal('hide');
                      alert('Successfully Submitted..!')
                      
                      
                  }
                  else
                  {
                      $('#AjaxModal').html(output.form);
                  }
                  $('#AjaxModal #info_text').text('');
              },
          });


   


        }

        else{

            alert('You must fill title and at least text, video, or image content when writing a testimonial.!')
        }

   });


