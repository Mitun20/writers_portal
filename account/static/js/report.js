   
    //Report post popup
    $('#post_div').on('click','.report-btn',function(){  
        event.preventDefault();       
        url = $(this).attr('data-url');  
        $.ajax({
            url : url,                        
            success:function(output)
                {
                  if (output.valid)
                      {                           
                          $('#AjaxModal').html(output.form);
                          $('#AjaxModal').modal('show'); 
                      }
                  else{
                   alert(output.response); 
                    }    
               },
        });
    });

    
  //report form submit
  $('#AjaxModal').on('click','.report-btn',function(){
      event.preventDefault();
      formdata = new FormData($('#AjaxModal #report_form')[0]);
      url = $(this).attr('data-url');
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
                  alert('Reported Succesfully');
                  
                  
              }
              else
              {
                  $('#AjaxModal').html(output.form);
              }
              $('#AjaxModal #info_text').text('');
          },
      });

  });


