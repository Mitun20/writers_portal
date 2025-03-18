

 //Report People
 $('.people_div').on('click','.report_people',function(){  
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


//Ajax update Award
$('#AjaxModal').on('click','.report_people_btn', function(){

    event.preventDefault();
    formdata = new FormData($('#AjaxModal #ajax_form')[0]);
    url = $(this).attr('data-url');
    complaint = $('#id_complaint').val();
    report_file = $('#id_report_file').val();

    if( complaint || report_file ){

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
                alert('Successfully  Reported..');
                $('#AjaxModal').modal('toggle');

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

      alert('Complete all of the essential fields.');

    }

});
