document.addEventListener('DOMContentLoaded', function () {
    var mainSlider = new Splide('#main-slider', {
        type       : 'fade',
        heightRatio: 1.3,
        rewind    : true,
        pagination : false,
        arrows     : false,
        cover      : true,
    }).mount();

    var thumbnailSlider = new Splide('#thumbnail-slider', {
        fixedWidth  : 100,
        fixedHeight : 100,
        isNavigation: true,
        gap         : 10,
        focus       : 'center',
        pagination  : false,
        cover       : false,
        arrows      : false,
        breakpoints : {
            600: {
                fixedWidth : 100,
                fixedHeight: 150,
            },
        },
    }).mount();

    mainSlider.sync(thumbnailSlider).mount();
});
