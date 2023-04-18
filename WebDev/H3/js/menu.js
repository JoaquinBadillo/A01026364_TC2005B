let openMenu = () => {
    document.getElementById("menu").style.width = "100%";
}

let closeMenu = () => {
    document.getElementById("menu").style.width = "0";
}

document.getElementById("esc").addEventListener("click", () => {
    openMenu();
});

document.getElementById("closebtn").addEventListener("click", () => {
    closeMenu();
});

document.onkeydown = (event) => {
    if (event.key == "Escape" || event.key == "Esc") {
        document.getElementById("menu").style.width == "100%" ? closeMenu() : openMenu();
    }
}