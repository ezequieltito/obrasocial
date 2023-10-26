// farm.js

let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

function showSlide(index) {
    slides[currentSlide].classList.remove('active');
    slides[index].classList.add('active');
    currentSlide = index;
}

prevBtn.addEventListener('click', () => {
    const prevSlide = (currentSlide - 1 + slides.length) % slides.length;
    showSlide(prevSlide);
});

nextBtn.addEventListener('click', () => {
    const nextSlide = (currentSlide + 1) % slides.length;
    showSlide(nextSlide);
});

// Autoplay the carousel
setInterval(() => {
    const nextSlide = (currentSlide + 1) % slides.length;
    showSlide(nextSlide);
}, 5000); // Change slide every 5 seconds
