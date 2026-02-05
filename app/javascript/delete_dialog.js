document.addEventListener("turbo:load", () => {
  const modal = document.getElementById("delete-modal");
  const delete_form = document.getElementById("delete-form");

  //在庫一覧の表の各削除ボタン
  document.querySelectorAll(".js-open-modal").forEach(button => {
    button.addEventListener("click", () => {
      //開くモーダル内の削除ボタン(form)にactionとid付与
      const item_id = button.dataset.itemId
      delete_form.action = `/items/${item_id}`;
      //モーダル内の表示処理
      modal.classList.add("is-active");
    });
  });

  //モーダル内の戻るボタン
  document.querySelectorAll(".js-close-modal").forEach(button => {
    button.addEventListener("click", () => {
      //モーダル非表示処理
      modal.classList.remove("is-active");
    });
  });
});
