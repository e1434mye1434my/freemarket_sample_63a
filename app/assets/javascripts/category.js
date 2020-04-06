$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = "";
    childSelectHtml = `<div class='itemDetails__categorie__box' id= 'children_wrapper'>
                        <select class="item_categorie_list" id="child_category" name="product[category_id]">
                          <option value="">選択してください</option>
                          ${insertHTML}
                        </select>
                      </div>
                    </div>`;
    $('.itemDetails__catagorie').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='itemDetails__categorie__box' id= 'grandchildren_wrapper'>
                                <select class="item_categorie_list" id="grandchild_category" name="product[category_id]">
                                  <option value="">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.itemDetails__catagorie').append(grandchildSelectHtml);
  }
  // サイズの表示作成
  function appendSize(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="itemDetails__size" id= 'size_wrapper'>
                          サイズ
                        <span class="any">
                          任意
                        </span>
                        <div class="itemDetails__box">
                          <select name= "size" class = "itemDetails__box--size">
                            <option value="">選択してください</option>
                            <option value="0">S</option>
                            <option value="1">M</option>
                            <option value="2">L</option>
                          </select>
                        </div>
                      </div>`;
    
    $('.itemDetails__catagorie').append(sizeSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $("#parent_category").on("change", function () {
    //選択された親カテゴリーの名前を取得
    var parentCategory = document.getElementById("parent_category").value;
    //親カテゴリーが初期値でないことを確認
    if (parentCategory != ""){ 
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: "json"
      })
      .done(function (children) {
        //親が変更された時、子以下を削除するする
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        // $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      //親カテゴリーが初期値になった時、子以下を削除するする
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      // $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $(".itemDetails__catagorie").on('change', '#child_category', function () {
    //選択された子カテゴリーのidを取得
    var childId = $('#child_category option:selected').val(); 
    //子カテゴリーが初期値でないことを確認
    if (childId != null){ 
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          console.log(grandchildren)
          //子が変更された時、孫以下を削除するする
          $('#grandchildren_wrapper').remove(); 
          $('#size_wrapper').remove();
          // $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      //子カテゴリーが初期値になった時、孫以下を削除する
      $('#grandchildren_wrapper').remove(); 
      $('#size_wrapper').remove();
      // $('#brand_wrapper').remove();
    }
  });
  $(".itemDetails__catagorie").on('change', '#grandchild_category', function () {
    var grandchildId = $('#grandchild_category option:selected').val();
    //子カテゴリーが初期値でないことを確認
    if (grandchildId != null) {
            // $('#brand_wrapper').remove();
      $('#size_wrapper').remove();
      appendSize();
    } else {
      //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      // $('#brand_wrapper').remove();
    }
  });
});