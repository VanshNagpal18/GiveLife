document.addEventListener("DOMContentLoaded", function() {
    const carousel = document.querySelector(".carousel");
    setInterval(() => {
        carousel.style.transition = "transform 0.5s ease-in-out";
        carousel.style.transform = "translateX(-270px)";
        setTimeout(() => {
            carousel.appendChild(carousel.firstElementChild);
            carousel.style.transition = "none";
            carousel.style.transform = "translateX(0)";
        }, 500);
    }, 2000);
});


let position = 0;
function moveCarousel(step) {
    const track = document.querySelector(".carousel-track");
    const cardWidth = document.querySelector(".card").offsetWidth + 20;
    position += step * cardWidth;
    track.style.transform = `translateX(-${position}px)`;
}


document.querySelectorAll(".faq-question").forEach(button => {
    button.addEventListener("click", () => {
        const answer = button.nextElementSibling;
        answer.style.display = answer.style.display === "block" ? "none" : "block";
    });
});


function contactUs() {
    alert("Feel free to reach out to us via email at er.vanshnagpal@gmail.com!");
}

function checkAvailability() {
    alert("Redirecting to organ banks and availability.");
}
function locateHospitals() {
    alert("Finding transplant centers for you.");
}