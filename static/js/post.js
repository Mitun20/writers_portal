// show more and show less
$('#post_div').on('click','.full_content_show',function(){  
    event.preventDefault();       
    postId =  $(this).attr('post_id');
    $('.post_description_half_content_'+postId).addClass('d-none');
    $('.post_description_full_content_'+postId).removeClass('d-none');   
});

$('#post_div').on('click','.half_content_show',function(){  
    event.preventDefault();       
    postId =  $(this).attr('post_id');
    $('.post_description_half_content_'+postId).removeClass('d-none');
    $('.post_description_full_content_'+postId).addClass('d-none');   
});



//post upvote Downvote
$('#post_div').on('click','.upvote_downvote',function(){  
    event.preventDefault();       
    url = $(this).attr('data-url');
    postId =  $(this).attr('id');
    id =  $(this).attr('post_id');  


    $.ajax({
        url : url,                        
        success:function(output)
            {
                if (output.action == "upvoted")
                    {                         
                    
                        $('#up_count'+id).text(output.upvote_count);
                        $('#down_count'+id).text(output.downvote_count);
                        $('.downvote_postid_'+id).removeClass('theme');
                        $('.upvote_postid_'+id).addClass('theme');

                    }

                else if (output.action == "dis-upvoted")
                    {                        
                        $('#up_count'+id).text(output.upvote_count);
                        $('#down_count'+id).text(output.downvote_count);
                        $('.downvote_postid_'+id).removeClass('theme');
                        $('.upvote_postid_'+id).removeClass('theme');

                    }
                else if (output.action == "downvoted")

                {
                    
                    $('#up_count'+id).text(output.upvote_count);
                    $('#down_count'+id).text(output.downvote_count);
                    $('.upvote_postid_'+id).removeClass('theme');
                    $('.downvote_postid_'+id).addClass('theme');
        

                }    


                else if (output.action == "dis-downvoted")

                {
                    
                    $('#up_count'+id).text(output.upvote_count);
                    $('#down_count'+id).text(output.downvote_count);
                    $('.upvote_postid_'+id).removeClass('theme');
                    $('.downvote_postid_'+id).removeClass('theme');
        

                }    

            },
    });
});

