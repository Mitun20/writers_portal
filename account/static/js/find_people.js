    //Find People Search
    $('.people_search_btn').click(function() {
        event.preventDefault();
        var name = $('#people_search_input').val();
        var people_type = $("input:radio.people_type:checked").val();


        if (name){

            var url = "/search_people/"; 

            $.ajax({
                url : url,
                data : {'name':name,'people_type':people_type,},
                dataType: 'json',
                headers: {'X-CSRFToken': '{{ csrf_token }}'},
                                                    
                success:function(output)
                    {
                        if (output.valid)
                            {
                                $('.people_div').html(output.users);  
                                
                            }
                        else{
                            alert('Something went wrong...!')
                            }    
                    },
            });                                                      

        }
        else{
            $('#name-empty-modal').modal('show'); 

        }

    });


     //User Group Filter
     $('.radio-div').on('click','.people_type', function(){ 
        var peopletype  = $(this).attr('value');    
        if(peopletype == "clear"){
            $('#people_search_input').val('');
            $('.people_type').prop('checked', false);
        }
        var name = $('#people_search_input').val();
        var url = "/search_people/"; 
        var page = "Find People";
   
        $.ajax({
               url : url,
               data : {'name':name,'people_type':peopletype,'page':page},
               dataType: 'json',
               headers: {'X-CSRFToken': '{{ csrf_token }}'},
                                                   
               success:function(output)
                   {
                       if (output.valid)
                           {
                               $('.people_div').html(output.users);  
                               
                           }
                       else{
                           alert('Something went wrong...!')
                           }    
                   },
           });                                                      
   
       });
   
   
    
   