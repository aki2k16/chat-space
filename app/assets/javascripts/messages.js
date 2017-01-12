$(function(){
   function buildHTML(message){
    //imageカラムに要素があるかないかで条件分岐
  if (message.image) {
    //画像があった場合要素を追加
    var Image = '<br><img src="'+ message.image +'">';
    //画像がなかった場合
  } else {
    //nullを定義
    var Image='';
  }
     var html = '<div class="chat-message__header clearfix">' +
     '<p class="chat-message__name">' + message.name +
     '<p class="chat-message__time">' + message.created_at +
     '</div>' +
     '<p class="chat-message__body">' + message.body + Image;

     return $('<li class="chat-message">').append(html);
   }

   $('#new_message').on('submit', function(e){
    var $form = this;
     e.preventDefault();
     var textField = $("#message_content");
     var fd = new FormData($(this)[0]);
       $.ajax({
         type: 'POST',
         url: './messages.json',
         processData: false,
         contentType: false,
         data: fd,
         dataType: 'json'
       })
       .done(function(data) {
         var html = buildHTML(data);
         $('.chat-messages').append(html);
         textField.val("");
         $form.reset();
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
       return false;
   });
 });
