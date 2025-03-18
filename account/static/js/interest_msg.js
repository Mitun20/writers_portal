//Interest
    $('#post_div').on('click','.interest-btn',function(){  
        event.preventDefault();       
        url = $(this).attr('data-url');
       
        

        $.ajax({
            url : url,                        
            success:function(output)
                {
                  if (output.valid)
                      {                           
                          $('#AjaxModal').html(output.html);
                          $('#AjaxModal').modal('show'); 
                      }
                  else{
                   alert(output.response); 
                    }    
               },
        });
    });
  



  $('#AjaxModal').on('change','.interest-message-file',function(e){
      var fileName = e.target.files[0].name;
      $("#intrest_message_txt").val(fileName);
  });
    
  $('#AjaxModal').on('click','.interest-remove-message-file',function(){
      event.preventDefault();
      $(".interest-message-file").val(null);
      $(".interest_message_txt").val('');
  });

  //interest message
  $('#AjaxModal').on('click','.send-message',function(){
      event.preventDefault();
      url = $(this).attr('data-url');
      formdata = new FormData($('#AjaxModal #message-form')[0]);
      message = $('#message_txt').val();

      if(message){

          $.ajax({
              url:url,
              data : formdata,
              method: 'post',
              processData: false,
              contentType: false,

              success:function(output)
              {
                  if(output.valid){
                      $('.message_div').html(output.message);
                      $('#message_txt').val('');
                      $(".message-file").val(null);
                  }
                  else{
                      alert(output.response);
                  }
                  
              }
          
          });

 

      }

      else{
          alert("Message can't be empty");
      }

      

});