var scrollToBottomButton = document.getElementById("scroll-to-bottom-button");

scrollToBottomButton.addEventListener("click", function() {
    window.scrollTo({
        top: document.body.scrollHeight,
        behavior: 'smooth'
    });
});