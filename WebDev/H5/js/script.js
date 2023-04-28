import { findUnique, bubblesort, invertNew, invert, capitalize, gcd, hackerSpeak, factorize, removeDuplicates, 
         smallestStringSize, isPalindrome, sortStrings, getStats, trendyString, isPow2, sortDescending } 
    from "./utils.js";


// If you want to test the functions directly in your browser's console uncomment the following code (but this might overwrite existing functions)

/* let funcs = [findUnique, bubblesort, invertNew, invert, capitalize, gcd, hackerSpeak, factorize, removeDuplicates, 
             smallestStringSize, isPalindrome, sortStrings, getStats, trendyString, isPow2, sortDescending]

for (let func of funcs) {
        window[func.name] = func
} */


// THE OLD LOGGING TEST SUITE
console.log("Welcome to the real debugger!", "\nLet's test some functions\n");

console.log("1. First unique character in a string");
console.log("Testing with 'abacddbec'");
console.log(findUnique('abacddbec'));

console.log("2. Bubble Sort");
let arr = Array.from({length: 9}, () => Math.floor(Math.random() * 10));
console.log(`Testing with [${arr}]`);
bubblesort(arr);
console.log(arr);

console.log("3. Invert the elements of an array");
console.log(`Testing with [${arr}]`);
console.log(` 3.1. Inverting in a new array:`)
console.log(invertNew(arr));
console.log(` 3.2 Inverting in place`);
invert(arr);
console.log(arr);

console.log("4. Capitalize the words in a string");
console.log("Testing with 'hello world!'")
console.log(capitalize('hello world!'));

console.log("5. Calculate the GCD of 2 numbers");
console.log("Testing with (105, 231)");
console.log(gcd(105, 231));

console.log("6. Translate to Hacker Speak");
console.log("Testing with 'Javascript es divertido'");
console.log(hackerSpeak("Javascript es divertido"));

console.log("7. Factorize");
console.log("Testing with 12");
console.log(factorize(12));

console.log("8. Remove duplicates from array");
console.log("Testing with [1, 0, 1, 1, 0, 0]");
console.log(removeDuplicates([1, 0, 1, 1, 0, 0]));

console.log("9. Smallest string size in an array")
console.log("Testing with ['Hello', 'world', 'from', 'TC2005B', 'and', 'Javascript']");
console.log(smallestStringSize(['Hello', 'world', 'from', 'TC2005B', 'and', 'Javascript']));

console.log("10. Check if a string is a palindrome");
console.log("Testing with 'tacocat'");
console.log(isPalindrome('tacocat'));

console.log("11. Sort array of strings (alphabetically)");
console.log("Testing with [\"Never\",\"gonna\", \"give\", \"you\", \"up\"]");
console.log(sortStrings(["Never","gonna", "give", "you", "up"]));

console.log("12. Find the median and the mode from a list of numbers");
console.log("Testing with [1, 8, 2, 3, 4, 5, 2, 3, 2, 4]");
console.log(getStats([1, 8, 2, 3, 4, 5, 2, 3, 2, 4]));


console.log("13. Check the most frequent string in a list");
console.log("Testing with the 4th, 5th and 6th stanzas from Numb by Elderbrook (the verses are the strings)");
arr = ["Oh, reachin' in the dark",
        "Nothing's there to touch",
        "I wish I could love", // You found the hidden cat of the main script: 🐱🧶
        "But I'm still numb",
        "But I'm still numb",
        "I'm still numb",
        "And the feeling's gone",
        "But I'm still numb",
        "Love, I can't be the only one"]
console.log(`${trendyString(arr)} 🎵`);


console.log("14. Check if a number is a power of 2");
 /* 🤓 Note:

 For integers this function can be programmed to be extremly efficient (constant time complexity) in a low level language,
since the binary representation of a power of 2 has a single bit on.

In JavaScript however, we are doomed to be less efficient. So I took this as an advantage to create a more general function that supports floating point numbers
*/
console.log("Testing with 1/4");
console.log(isPow2(1/4));


console.log("15. Sort in descending order");
arr = Array.from({length: 9}, () => Math.floor(Math.random() * 10));
console.log(`Testing with [${arr}]`);
console.log(sortDescending(arr));