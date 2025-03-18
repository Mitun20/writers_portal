//message popup open
    $('.people_div').on('click','.get_all_message',function(){
        event.preventDefault();
        url = $(this).attr('data-url');        
        $.ajax({
              url : url,               
              success:function(output)
              {              
                $('#AjaxModal').html(output.messages);
                $('#AjaxModal').modal('show');   
              },    
          });  
          //scroll to the bottom of the message
          $('.chat-container').scrollTop($('.chat-container')[0].scrollHeight); 
         
      });


    // append file name to message input text area
    $('#AjaxModal').on('change','.message-file',function(e){
        var fileName = e.target.files[0].name;
        $("#message_txt").val(fileName);
    });
    
    //remove selected attachment
    $('#AjaxModal').on('click','.remove-message-file',function(){
        event.preventDefault();
        $(".message-file").val(null);
        $("#message_txt").val('');
    });



    // send message
    $('#AjaxModal').on('click','.chat_to',function(){
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
                        $('.message_div').html(output.messages);
                        $('#message_txt').val('');
                        $(".message-file").val(null);
                        $('.chat-container').scrollTop($('.chat-container')[0].scrollHeight);
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

    
    

    // Block User
    $('#AjaxModal').on('click','.block-unblock-btn',function(){
        event.preventDefault();
        url = $(this).attr('data-url');

   
        if(confirm('Are you sure you want to block this user?')){

            $.ajax({
                url:url,

                success:function(output)
                {
                    if(output.blocked){
                        $('#AjaxModal #message-form').addClass('d-none');
                        $('#AjaxModal .block-unblock-btn').text('Unblock');                       
                    }
                    else{
                        $('#AjaxModal #message-form').removeClass('d-none');
                        $('#AjaxModal .block-unblock-btn').text('Block');
                        $('#AjaxModal #blocked_info').addClass('d-none');
                     
                    }
                    
                }
            
            });



        }

     
        

    });