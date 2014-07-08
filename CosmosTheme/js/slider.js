(function ($) {
    $.fn.slider = function (interval) {
        var $slider = $(this),
            slides = $slider.find('.slide').hide(),
            numberOfSlides = slides.length,
            $currentSlide = slides.first().show(),
            currentSlideNumber = parseInt($currentSlide.find('.image img').attr('slide-number')),
            prevSlideNumber = parseInt(currentSlideNumber - 1),
            nextSlideNumber = parseInt(currentSlideNumber + 1),
            interval = interval || 5;

        function moveSlider(currentSlide) {
            slides.fadeOut();
            var slide = $slider.find('.slide .image img[slide-number="' + currentSlide + '"]')
                .parent('.image')
                .parent('.slide').fadeIn();
        }

        function findPrevSlide() {
            if (prevSlideNumber < 0) {
                prevSlideNumber = numberOfSlides - 1;
            }
            nextSlideNumber = currentSlideNumber;
            currentSlideNumber = prevSlideNumber;
            prevSlideNumber = prevSlideNumber - 1;
        }

        function findNextSlide() {
            if (nextSlideNumber >= numberOfSlides) {
                nextSlideNumber = 0;
            }
            prevSlideNumber = currentSlideNumber;
            currentSlideNumber = nextSlideNumber;
            nextSlideNumber = nextSlideNumber + 1;
        }
        
        function startAutoSliding() {
            return setInterval(function () {
                findNextSlide();
                moveSlider(currentSlideNumber);
            }, interval * 1000);
        }


        $('#prev-slide').on('click', function () {
            findPrevSlide();
            moveSlider(currentSlideNumber);
            clearInterval(autoSlide);
            autoSlide = startAutoSliding();
        });

        $('#next-slide').on('click', function () {
            findNextSlide();
            moveSlider(currentSlideNumber);
            clearInterval(autoSlide);
            autoSlide = startAutoSliding();
        });

        var autoSlide = startAutoSliding();
    }

    $('#slider').slider(5);
}(jQuery));