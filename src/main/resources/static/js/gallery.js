document.addEventListener('DOMContentLoaded', function () {
    let hiddenElements = document.querySelectorAll('.gallery img.hidden');
    let loadMoreBtn = document.getElementById('loadMore');

    loadMoreBtn.addEventListener('click', function (e) {
        e.preventDefault();
        let shownCount = 0;
        hiddenElements.forEach(function (el, index) {
            if (shownCount < 10) {
                el.classList.remove('hidden');
                shownCount++;
            }
        });
        hiddenElements = document.querySelectorAll('.gallery img.hidden');
        if (hiddenElements.length === 0) {
            loadMoreBtn.style.display = 'none';
        }
    });

    // Initialize Swiper
    const swiper = new Swiper(".mySwiper", {
        centeredSlides: true,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    // Open swiper from clicked image
    document.querySelectorAll('.gallery img').forEach(function(img, index) {
        img.onclick = function() {
            swiper.slideToLoop(index, 0); // Swiper로 해당 이미지로 이동
            document.getElementById('myModal').style.display = 'flex';
        }
    });

    // Close swiper on click outside
    document.querySelector('.close').onclick = function() {
        document.getElementById('myModal').style.display = 'none';
    };
});
