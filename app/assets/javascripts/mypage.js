// メニュ現在地背景色変更
$(function(){
  $('.side-menu__bar-list-item').each(function(){
    const $href = $(this).attr('href');
    if(location.href.match($href)) {
      $(this).addClass('active');
    } else {
      $(this).removeClass('active');
    }
  });
});

// タブ切替１
$(function(){
  $('.tab').click(function(e){
    e.preventDefault();
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
    $('.is-show').removeClass('is-show');
    const index = $(this).index();
    $('.panel').eq(index).addClass('is-show');
  });
});

// タブ切替2
$(function(){
  $('.tab-purchase').click(function(e){
    e.preventDefault();
    $('.is-current').removeClass('is-current');
    $(this).addClass('is-current');
    $('.is-open').removeClass('is-open');
    const index = $(this).index();
    $('.panel-purchase').eq(index).addClass('is-open');
  });
});

 // ボタンクリック背景色変更
 $(function(){
   $('.logout-container__inner-btn').click(function(){
     $('.logout-container__inner-btn').css('background',"#696969");
     $('.logout-container__inner-btn').css('border-color',"#696969");
   });
 });

 // toggle 画像表示
 $(function(){
   $('.cvcnum-text').click(function(){
     $('.is-show').toggle();
   });
 });
