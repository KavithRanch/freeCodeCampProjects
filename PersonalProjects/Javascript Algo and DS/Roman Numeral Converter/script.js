const userInput = document.getElementById("number");
const convertBtn = document.getElementById("convert-btn");
const output = document.getElementById("output");

const romanChart = new Map([
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
]);

userInput.addEventListener("keyup", (e) => {checkValidInput(userInput.value);})

const checkValidInput = (userInput) => {
    if (userInput == ""){
        output.innerText = "Please enter a valid number";
    } else if (userInput < 1) {
        output.innerText = "Please enter a number greater than or equal to 1";
    } else if (userInput > 3999) {
        output.innerText = "Please enter a number less than or equal to 3999";
    } else {
        output.innerText = `${romanConverter(userInput)}`;
    }
}

const romanConverter = (number) => {
    let num = 0;
    let roman = "";
    if (number === 0) {
        return "";
    } else {
        for (const [arab, rom] of romanChart) {
            if (number >= arab){
                roman = rom;
                num = arab;
                break;
            }
        }
        return roman + romanConverter(number - num);
    }
}