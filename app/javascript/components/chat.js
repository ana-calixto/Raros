const chatbtn = () => {
  const btn = document.querySelectorAll('#chat-button');
  console.log(btn);
  btn.forEach(function(button) {
    button.addEventListener('click', function(e) {
      const value = button.value;
      const chatreplace = document.getElementById(`chat-${value}`).style;
      console.log(chatreplace);
      if (chatreplace.display === 'none' ) {
        chatreplace.display = "block";
      } else {
        chatreplace.display = "none";
      };
    });
  });
}

export { chatbtn };

