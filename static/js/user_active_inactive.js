//User active Inactive
$('.people_div').on('click','.user_active_inactive_popup', function(){
    
    var status = $(this).attr('status');
    var name = $(this).attr('name');
    var userid = $(this).attr('userid');


    $('#user-activate-inactive-modal').modal('show'); 

    if (status == 'active')
    {
        $('.active-inactive-modal-title').text(name+' - Hard Inactive');
        $('.user_active_inactive_btn').text('Hard Inactive');        
    }

    else{
        $('.active-inactive-modal-title').text(name+' - Activate');
        $('.user_active_inactive_btn').text('Activate');
    }


 
    $('.user_active_inactive_btn').attr("user-id",userid);
    
    event.preventDefault();    
    url = $(this).attr('data-url');
 
});

//User active Inactive
$('#common_div').on('click','.user_active_inactive_popup', function(){
    
    var status = $(this).attr('status');
    var name = $(this).attr('name');
    var userid = $(this).attr('userid');


    $('#user-activate-inactive-modal').modal('show'); 

    if (status == 'active')
    {
        $('.active-inactive-modal-title').text(name+' - Hard Inactive');
        $('.user_active_inactive_btn').text('Hard Inactive');        
    }

    else{
        $('.active-inactive-modal-title').text(name+' - Activate');
        $('.user_active_inactive_btn').text('Activate');
    }


 
    $('.user_active_inactive_btn').attr("user-id",userid);
    
    event.preventDefault();    
    url = $(this).attr('data-url');
 
});


$('#user-activate-inactive-modal').on('click','.user_active_inactive_btn',function(){
    event.preventDefault();
    var userid = $(this).attr('user-id');
    formdata = new FormData($('#user-activate-inactive-modal #user_active_inactive_form')[0]);
    info = $('#user_active_inactive_info').val();


    if(info){

        url = "/user_active_inactive/"+userid;

        $.ajax({
            url:url,
            data : formdata,
            method: 'post',
            processData: false,
            contentType: false,


            beforeSend: function() {      
                $('.please-wait').text('Please wait');               
            },

            success:function(output)
            {
                if(output.active){
                   alert('Activated');
                   $('.user_id_'+userid).attr("status","active");
                   $('.userid_'+userid).attr("title","Hard Inactive");
                   $('.user_id_'+userid).removeClass('fa-lock-open');
                   $('.user_id_'+userid).addClass('fa-ban');
                   

                }
                else{
                    alert('Hard Inactivated');
                    $('.user_id_'+userid).attr("status","inactive");
                    $('.userid_'+userid).attr("title","Activate");
                    $('.user_id_'+userid).removeClass('fa-ban');
                    $('.user_id_'+userid).addClass('fa-lock-open');

                }

                $('.please-wait').text('');  

                $("#user_active_inactive_info").val('');

                $('#user-activate-inactive-modal').modal('toggle');


                
            }

         
        
        });

    }

    else{
        alert("Enter something in info box");
    }




});






