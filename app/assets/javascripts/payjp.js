document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey("pk_test_1cea08240728e4337c35fbac");
    let btn = document.getElementById('token_submit');
  //   if(btn) { // または elem === null で比較
  //     console.log('発見！', $);
  // } else {
  //     console.error('見つからない');
  // }
  
    btn.addEventListener("click", (e) => {
      // console.log("fire1");
      e.preventDefault();
      
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("card_exp_month").value,
        exp_year: document.getElementById("card_exp_year").value
      };
      // console.log(card);

      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
            $(`<input type="hidden" name="payjp_token">`).val(response.id)
          );
          // document.inputForm.submit();
          $('#charge-form').get(0).submit();
          alert("登録が完了しました。");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },
  false
);

