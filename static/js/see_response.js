
    //Response
    $('#post_div').on('click','.response-btn',function(){  
        event.preventDefault();       
        url = $(this).attr('data-url'); 

        $.ajax({
            url : url,                        
            success:function(output)
                {
                  if (output.valid)
                      {                           
                          $('#AjaxModal').html(output.responses);
                          $('#AjaxModal').modal('show'); 
                      }
                  else{
                   alert(output.response); 
                    }    
               },
        });
    });


  //interest message view
  $('#AjaxModal').on('click','.view-message',function(){

      url = $(this).attr('data-url');
  
      $.ajax({
          url:url,
          success:function(output)
          {
              if(output.valid){
                  $('#message-text-area').removeClass('d-none');
                  $('.message_div').html(output.message);   
                  $(".message_div_scroll").animate({ scrollTop: $('.message_div_scroll').prop("scrollHeight")}, );                 
              }
              else{
                  alert(output.response);
              }
              
          }
      
      });

  });

  //reply to a message
  $('#AjaxModal').on('click','.reply-to-a-message',function(){
      event.preventDefault();

      url = $(this).attr('data-url');

      formdata = new FormData($('#AjaxModal #intrest-message-form')[0]);
      message = $('#intrest_message_txt').val();
      if(message){

          $.ajax({
              url:url,
              data : formdata,
              method: 'post',
              processData: false,
              contentType: false,

              beforeSend:function()
              {
                  $('#AjaxModal .reply-to-a-message').text('Sending..');
                  
              },


              success:function(output)
              {
                  if(output.valid){
                      $('.message_div').html(output.message);
                      $('#intrest_message_txt').val('');
                      $(".interest-message-file").val(null);
                  }
                  else{
                      alert(output.response);
                  }

                  $(".message_div_scroll").animate({ scrollTop: $('.message_div_scroll').prop("scrollHeight")}, 1000);
                  
                  $('#AjaxModal .reply-to-a-message').text('Send');
                  
              }
      
      });



      }
      else{
          alert("Message can't be empty");
      }
 });


