export {clearform};

const clearform = () => {
  const new_message = document.getElementsByClassName('simple_form new_message')[0];
  if (new_message) {
    new_message.addEventListener('submit', function(event) {
        setTimeout(function(){
          document.getElementById("message_content").value = "";
        }, 300);
    });
  }
}
