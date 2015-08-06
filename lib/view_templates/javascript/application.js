/**receives the page I am viewing as an argument ( starts from 0 )*/
function hide_or_show_page_links(page_number){
 console.log( page_number); 
 next_page = page_number + 1;  
 next_page_exists = $('[data-page='+ next_page +']').length != 0
 console.log( !next_page_exists );
 if( page_number == 0 ){ 
  $('.prev').hide();
 } else {
  $('.prev').show();
 }
if( !next_page_exists ){ 
  $('.next').hide();   
 } else {
  $('.next').show();
 }    
}

function movePage( operation ){
  current_page = $('.active');
  //if it's ok to change pages
  current_page_number = current_page.data('page');
  desired_page = current_page_number + operation;
  if( $('[data-page='+ desired_page +']').length ) {
    $('[data-page=' + current_page_number + ']').removeClass('active').addClass('inactive');
    $('[data-page=' + desired_page + ']').removeClass('inactive').addClass('active');
    hide_or_show_page_links(desired_page);
  }
}

$('.next').click(function(){
  movePage( 1 );
});

$('.prev').click( function(){
  movePage( -1 );
});
/**
 on page 1 it should not display the previous page link.
*/
hide_or_show_page_links(0); 