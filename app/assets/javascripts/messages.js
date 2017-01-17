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
   //自動更新
  if (document.location.href.match(/\/groups\/\d+\/messages/)) {
    setInterval(function(){
        var messagelength = $('.chat-message').length;
        console.log(messagelength)
        $.ajax(document.location.href + '.json',{
         type: 'GET',
         dataType: 'json'
       })
      .done(function(data) {
        var datalength = data.message.length;
        for (var i = messagelength; i < datalength; i++) {
          console.log(data.message[i]);
          var html = buildHTML(data.message[i]);
          $('.chat-messages').append(html);
       }
      })
      .fail(function(){
        alert('エラーが発生しました。');
      });
    },3000);
   }
 });
