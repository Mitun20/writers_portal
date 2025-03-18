
$('body').on('click','img', function(){ 

    is_logo = $(this).attr('is_logo');
    if(is_logo !== "true"){
        imgLocation = $(this).attr('src');
        $('#photo-url').attr('src',imgLocation);
        $('#Picture-Open-Modal').modal('toggle');
    }
  
 
});