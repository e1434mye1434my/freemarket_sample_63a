$(function(){
  $('#delete-js-modal__open').on('click',function(){
    $('.dalete-js-modal').fadeIn();
    return false;
  });
  $('.delete-js-modal__close').on('click',function(){
    $('.dalete-js-modal').fadeOut();
    return false;
  });
});