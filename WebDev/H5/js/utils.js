/**
 * Takes a string and returns the first unique character or an empty string if no unique characters exist
 * @param {string} str - A string of characters
 * @return {string} The first unique character from the string
 */
export function findUnique(str) {
    const found = {};
    
    // Populate object with key value pairs of each character and the number of times it appears.
    for (let chr of str)
        found[chr] = (found[chr] ?? 0) + 1;


    for (let chr of str) {
        if (found[chr] == 1)
            return chr;
    }

    return "";
}

/**
 * Sort an array of numbers in place using bubble sort
 * @param {number[]} arr - An array of numbers
 * @return {number[]} - The sorted array
 */
export function bubblesort(arr){
    const size = arr.length;

    for (let i = 0; i < size; i++) {
        let swaps = 0
        for (let j = 0; j < size - i; j++) {
            if(arr[j] >= arr[j + 1]) {
                let temp = arr[j + 1];
                arr[j + 1] = arr[j];
                arr[j] = temp;
                swaps += 1;
            }
        }
        
        // Check number of swaps to terminate early (if no swaps were made you are done)
        if (swaps == 0)
            return arr
    }

    return arr;
}

/**
 * Given an array of numbers, crete a new array that has all elements inverted
 * @param {number[]} arr - An array of numbers
 * @return {number[]} A new array with the elements inverted
 */
export function invertNew(arr) {
    // Having some fun here with a cryptic ";" that is actually required to run properly hahaha 🥷 
    // For anyone reading this and wondering why is the semicolon required: it allows the variable newArray to be inicialized
    return arr.reduceRight((newArray, current) => {;return newArray.concat(current)}, []);
}

/* This was my original approach:

    function invertNew(arr) {
        const newArr = new Array();

        const size = arr.length;

        for (let i = 0; i < size; i++)
            newArr[i] = arr[size - 1 -i];

        return newArr;
    } 
*/

/**
 * Given an array of numbers,invert all elements in place
 * @param {number[]} arr - An array of numbers
 * @return {number[]} The same array, with the elements in reverse order
 */
export function invert(arr) {
    const size = arr.length;
    const bound = Math.floor(size / 2);

    for (let i = 0; i < bound; i++) {
        let temp = arr[i];
        arr[i] = arr[size - 1 - i];
        arr[size - 1 - i] = temp;
    }

    return arr;
}

/**
 * Capitalize the words in a string
 * @param {string} str - A string of text
 * @return {string} A new string with all the words capitalized
 */
export function capitalize(str) {
    return str.split(" ").map((word) => word.charAt(0).toUpperCase() + word.slice(1)).join(" ")
}

/**
 * Calculate the greatest common divisor of 2 numbers
 * @param {number} a - A number
 * @param {number} b - Another number
 * @return {number} The gcd of a and b
 */
export function gcd(a, b) {

    // Inner function in which it is guaranteed that the first argument is greater than or equal to the second one.
    function do_gcd(max, min) {
        return b == 0 ? a : gcd(min, max % min);
    }

    // Make sure that arguments are integers and make them positive
    if (Number.isInteger(a) && Number.isInteger(b)) {
        a = Math.abs(a);
        b = Math.abs(b);

        return do_gcd(Math.max(a, b), Math.min(a,b));
    }

    return undefined;
}

/**
 * Transform a string of text into Hacker / Leet Speak
 * @param {string} str - A string of text
 * @return {string} A new string of text in "Hacker Speak"
 */
export function hackerSpeak(str) {
    const translate = {
        "o": 0,
        "i": 1,
        "z": 2,
        "e": 3,
        "a": 4,
        "s": 5,
        "b": 6,
        "t": 7,
        "g": 9
    }

    return [...str].map(chr => translate[chr.toLowerCase()] ?? chr).join("");
}

/**
 * Get an array of all factors of a given number
 * @param {number} num - A number
 * @return {number[]} An array containing all the factors of the given number
 */
export function factorize(num) {
    const factors = new Array();
    for (let i = 1; i <= num; i++) {
        if (num % i == 0)
            factors.push(i);
    }

    return factors;
}

/**
 * Create an array of unique elements
 * @param {any[]} arr - An array of elements
 * @return {any[]} An array containing the elements of arr without repetition
 */
export function removeDuplicates(arr) {
    const s = new Set(arr)
    return Array.from(s);
}

/**
 * Find the smallest string in an array
 * @param {string[]} arr - An array of strings
 * @return {number} The size of the smallest string in the array
 */
export function smallestStringSize(arr) {
    // Some good fold (left) maneuvers here
    return arr.reduce((smallest, current) => {return current.length < smallest ? current.length : smallest}, arr[0]?.length ?? 0);
}

/**
 * Check if a string is a palindorme
 * @param {string} str - A string of text
 * @return {boolean} True if the string is a palindrome and false otherwise
 */
export function isPalindrome(str) {
    const size = str.length;
    const bound = Math.floor(size / 2);

    for (let i = 0; i < bound; i++) {
        if (str[i] != str[size - 1 -i])
            return false;
    }

    return true;
}

/**
 * Order an array of strings alphabetically (using a locale)
 * @param {string[]} arr - A list of strings of text
 * @return {string[]} The array of strings sorted alphabetically
 */
export function sortStrings(arr) {
    return arr.sort((a, b) => a.localeCompare(b));
}

/**
 * Find the meadian and the mode in a list (array) of numbers
 * @param {number[]} nums - An array of nubers
 * @return {Stats} An object containing the median and the mode
 */
export function getStats(nums) {
    
    /**
     * @typedef {object} Stats
     * @property {number} median - The median of a set of data
     * @property {number} mode - The mode of a set of data
     */
    const stats = {
        median: 0,
        mode: 0
    };

    const popularity = {};

    /* I remember I once read there's a way to find the median in linear time...
       I'm to lazy 😴 to deal with that tho. So I will sort and make it run in O(n lg n) time lol
       In this situation, the side effect of sorting might be undesirable, so I will create a sorted copy of the array. */

    let sortedNums = [...nums].sort((a, b) => a - b);

    let size = nums.length;
    let midpoint = size / 2;

    stats.median = size % 2 == 0 ? (sortedNums[midpoint - 1] + sortedNums[midpoint]) / 2 : sortedNums[Math.floor(midpoint)];

    for (let num of nums)
        popularity[num] = (popularity[num] ?? 0) + 1;

    let max = 0
    for (let item in popularity) {
        if (popularity[item] > max) {
            max = popularity[item];
            stats["mode"] = Number(item);
        }
    }

    return stats;
}

/**
 * Find the most frequent string in an array of strings
 * @param {string[]} arr - An array of strings
 * @return {string} The most popular string
 */
export function trendyString(arr) {
    // This is a vile copy of my algorithm to find the mode in a set of data...
    let mode = "";

    const popularity = {};

    for (let str of arr)
        popularity[str] = (popularity[str] ?? 0) + 1;

    let max = 0
    for (let item in popularity) {
        if (popularity[item] > max) {
            max = popularity[item];
            mode = item;
        }
    }
    
    return mode;
}


/**
 * Check if a number is a power of 2
 * @param {number} num - A number
 * @return {boolean} True if the number is a power of 2 and false otherwise
 */
export function isPow2(num) {
    return Number.isInteger(Math.log2(num));
}

/**
 * Sort numbers in descending order (in place)
 * @param {number[]} nums - An array of numbers
 * @return {number[]} The same array (but sorted)
 */
export function sortDescending(nums) {
    return nums.sort((a, b) => b - a);
}

// You made it to the end!
// You found the hidden cat: 🐱!