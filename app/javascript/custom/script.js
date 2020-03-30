window.onload = function() {
  // Notifications messages
  let notifications = document.querySelectorAll('.notification')
  
  // Removing message with on click events in 'X' button
  notifications.forEach(function(el) {
    let close_message = el.children[0]
    close_message.addEventListener('click', function () {
      this.parentNode.parentNode.removeChild(this.parentNode)
    })
  })
};