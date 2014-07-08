(function ($) {

    var slides = [{
        imageURL: './images/slider/sliderImage1.jpg',
        imageAlt: 'consmos1',
        text: 'Image 1 text'
    }, {
        imageURL: './images/slider/sliderImage2.jpg',
        imageAlt: 'consmos2',
        text: 'Image 2 text'
    }, {
        imageURL: './images/slider/sliderImage3.jpg',
        imageAlt: 'consmos3',
        text: 'Image 3 text'
    }, {
        imageURL: './images/slider/sliderImage4.jpg',
        imageAlt: 'consmos4',
        text: 'Image 4 text'
    }];

    $.fn.sliderGenerator = function (items) {
        var $this = $(this);
        var templateString = '{{#items}}';
        templateString += $this.html();
        templateString += '{{/items}}';

        var listViewTemplate = Handlebars.compile(templateString);
        var listViewHTML = listViewTemplate({ items: items });
        $this.html(listViewHTML);

        return $this;
    }

    $('#slider #container').sliderGenerator(slides);
})(jQuery);