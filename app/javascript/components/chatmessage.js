export {clearform};
const clearform = () => {
  document.getElementsByClassName('simple_form new_message')[0].addEventListener('submit', function(event) {
      setTimeout(function(){
        document.getElementById("message_content").value = "";
      }, 300);
  });
}
//Function that clears the form after submiting a message
