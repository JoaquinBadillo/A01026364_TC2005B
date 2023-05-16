//Writes the position of the mouse at the end of a paragraph with he mousePosition id
document.addEventListener("mousemove", (e) => {
    const x = e.clientX;
    const y = e.clientY;
    document.getElementById("mousePosition").innerHTML = "Posición del mouse: (" + x + ", " + y + ")";
});


 //Gets the full name from the form and adds it to the DOM
 document.getElementById("submit-form1").addEventListener("click", () => {
    const fname = document.getElementById("form-fname").value;
    const lname = document.getElementById("form-lname").value;
    const fullName = fname + " " + lname;
    const fullNameElement = document.createElement("p");
    fullNameElement.innerHTML = fullName;
    document.getElementById("form1").
    appendChild(fullNameElement);
});


let columns = 2;
let rows = 2;
            
// Adds a row to the table
document.getElementById("btn-insert-r").addEventListener("click", () => {
    const table = document.getElementById("sampleTable");
    const row = table.insertRow(rows);
    for (let i = 0; i < columns; i++) {
        const cell = row.insertCell(i);
        cell.innerHTML = "Row " + (rows + 1) + " column " + (i + 1);
    }
    rows++;
});

// Adds a column to the table
document.getElementById("btn-insert-c").addEventListener("click", () => {
    const table = document.getElementById("sampleTable");
    for (let i = 0; i < rows; i++) {
        const cell = table.rows[i].insertCell(columns);
        cell.innerHTML = "Row " + (i + 1) + " column " + (columns + 1);
    }
    columns++;
});

// Changes the content of the table at the specified row and column
document.getElementById("btn-change").addEventListener("click", () => {
    const rowIndex = document.getElementById("rowIndex").value;
    const colIndex = document.getElementById("colIndex").value;
    const newValue = document.getElementById("newValue").value;
    const table = document.getElementById("myTable");
    const row = table.rows[rowIndex - 1];
    const cell = row.cells[colIndex - 1];
    cell.innerHTML = newValue;
});

// Adds a color to the select
document.getElementById("btn-add-color").addEventListener("click", () => {
    const colors = ["Red", "Green", "White", "Black", "Blue", "Yellow", "Orange", "Purple", "Pink", "Brown"];
    const select = document.getElementById("colorSelect");
    const option = document.createElement("option");
    option.text = colors[Math.floor(Math.random() * colors.length)];
    option.value = colors[Math.floor(Math.random() * colors.length)];;
    select.add(option);
});

// Removes a color from the select
document.getElementById("btn-rmv-color").addEventListener("click", () => {
    const select = document.getElementById("colorSelect");
    select.remove(select.selectedIndex);
});

// Changes the size of the image when the mouse enters it
document.getElementById("imagenGato").addEventListener("mouseenter", () => {
    const width = Math.floor(Math.random() * (600 - 300 + 1) + 300);
    const height = Math.floor(Math.random() * (600 - 300 + 1) + 300);
    const url = "http://placekitten.com/" + width + "/" + height;
    document.getElementById("imagenGato").src = url;
});