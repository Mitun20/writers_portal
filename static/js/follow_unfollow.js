//Follow and unfollow
$('.people_div').on('click','.follow_unfollow',function(){  
    event.preventDefault();    
    url = $(this).attr('data-url');
    id = $(this).attr('user_id');   

    $.ajax({
        url : url,                        
        success:function(output)
            {
              if (output.followed)
                  {
                    $('.people_div #user_id_'+id).removeClass('fa fa-user-check');  
                    $('.people_div #user_id_'+id).addClass('fa fa-user-minus');

                     count = $('#following').attr('count');
                     newCount = Number(count)+1;
                     $('#following').attr('count',newCount);
                     $('#following').text('Following - '+newCount);
                   
                  }
              else{
                  $('.people_div #user_id_'+id).removeClass('fa fa-user-minus');
                  $('.people_div #user_id_'+id).addClass('fa fa-user-check');

                   count = $('#following').attr('count');
                   newCount = Number(count)-1;
                   $('#following').attr('count',newCount);
                   $('#following').text('Following - '+newCount);                     
                  
              
              }    
           },
    });
});