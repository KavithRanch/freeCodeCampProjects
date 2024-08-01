const textInput = document.querySelector("#text-input");
const result = document.querySelector("#result");
const checkButton = document.querySelector("#check-btn");

let userWord = "";

checkButton.addEventListener("click", () => {
    if (textInput.value.length > 0) {
        result.innerHTML = palindromeChecker(textInput.value) ? `${textInput.value} is a palindrome` : `${textInput.value} is not a palindrome`;
    } else {
        alert("Please enter a value first!");
    }
});

function palindromeChecker(word) {
    word = cleanString(word);
    let j = word.length - 1;
    for (let i = 0; i < word.length / 2; i++){
        if (word[i] != word[j]){
            return false;
        }
        j--;
    }
    return true;
}

function cleanString(word) {
    word = word.replace(/[^a-zA-Z0-9]/g, "");
    word = word.toLowerCase();
    return word;
}