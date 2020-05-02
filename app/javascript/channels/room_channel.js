import consumer from "./consumer"

const RoomChannel = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  },

  speak: function(message, roomId) {
    return this.perform('speak', {
      message: message,
      room_id: roomId
    });
  }
});


let commentArea = document.getElementById('comment_area');

commentArea.addEventListener('keypress', (event) => {
  if (event.keyCode === 13) {

    let roomId = document.getElementById('room_id').value;

    RoomChannel.speak(event.target.value, roomId);
    event.target.value = '';
    return event.preventDefault();
  }
});