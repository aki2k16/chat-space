$(function(){
   function buildHTML(message){
     var html = '<div class="chat-message__header clearfix">' +
     '<p class="chat-message__name">' + message.name +
     '<p class="chat-message__time">' + message.created_at +
     '</div>' +
     '<p class="chat-message__body">' + message.body;

     return $('<li class="chat-message">').append(html);
   }

   $('#new_message').on('submit', function(e){
     e.preventDefault();
     var textField = $("#message_content")
     var message = textField.val();
       $.ajax({
         type: 'POST',
         url: './messages.json',
         data: {
           message: {
             body: message
           }
         },
         dataType: 'json'
       })
       .done(function(data) {
         var html = buildHTML(data);
         $('.chat-messages').append(html);
         textField.val("");
       })
       .fail(function() {
         alert('メッセージを入力してください。');
       });
       return false;
   });
 });
