(function ($) {
    
    var menuItems = [{
        menuItem: 'Home',
        menuURL: '#',
        subMenuItems: [
            {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }]
    }, {
        menuItem: 'Content',
        menuURL: '#',
        subMenuItems: [
            {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }, {
                subMenuItem: 'SubMenuItem',
                subMenuURL: '#',
            }]
    }, {
        menuItem: 'About',
        menuURL: '#'
    }, {
        menuItem: 'Contact',
        menuURL: '#'
    }, {
        menuItem: 'More Info',
        menuURL: '#'
    }, {
        menuItem: 'And More..',
        menuURL: '#'
    }];

    $.fn.menuGenerator = function (items) {
        var $this = $(this);
        var templateString = '{{#items}}';
        templateString += $this.html();
        templateString += '{{/items}}';

        var listViewTemplate = Handlebars.compile(templateString);
        var listViewHTML = listViewTemplate({ items: items });
        $this.html(listViewHTML);

        return $this;
    }
    
    $('#main-menu > ul').menuGenerator(menuItems);
})(jQuery);