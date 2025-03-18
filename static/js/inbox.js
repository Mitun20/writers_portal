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
      console.log($('#AjaxModal .chat-container').length);
      
     
  });


  //message popup open
$('.report_div').on('click','.get_all_message',function(){
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
      $(".chat-container").animate({ scrollTop: $('.chat-container').prop("scrollHeight")}, ); 
      console.log($('#AjaxModal .chat-container').length);
  });




//remove selected attachment
$('#AjaxModal').on('click','.remove-message-file',function(){
    event.preventDefault();
    $(".message-file").val(null);
});



// send message
$('#AjaxModal').on('click','.chat_to',function(){
    event.preventDefault();
    url = $(this).attr('data-url');
    var file = $('#AjaxModal #file-upload')[0].files[0];
    if (file){
        message = file
    }
    else{
        message = $('#message_txt').val(); 
    }
    formdata = new FormData($('#AjaxModal #message-form')[0]);
      
    if(message){

        $.ajax({
            url:url,
            data : formdata,
            method: 'post',
            processData: false,
            contentType: false,

            beforeSend:function()
            {
                $('.chat_to').attr('value','Sending');
                
            },


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

                $('.chat_to').attr('value','Send');
                
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