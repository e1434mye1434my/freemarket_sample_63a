$(document).ready(function(){

  $('.listLeft--first').hover(function(){
    $('.category--list').addClass('active');
    var parent = $('.active').children('.parent--list');
    parent.show();
  },function(){
    $('.category--list').removeClass('active');
    $('.category--list').children('.parent--list').hide();
  });

  $('.parent--category').hover(function(){
    $(this).addClass('active');
    var children = $('.active').children('.child--list');
    children.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.child--list').hide();
  });

  $('.child--category').hover(function(){
    $(this).addClass('active');
    var grandChild = $('.active').children('.grandchild--list');
    grandChild.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.grandchild--list').hide();
  });
});