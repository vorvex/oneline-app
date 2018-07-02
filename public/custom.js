removeIconClass = 'glyphicon glyphicon-remove pull-right';

$(document).ready(function() {
    $('.list-group-item').css('border-radius', 0);
    $('.list-group-item').css('border-radius', 0);


    chevronClosed = $('<span></span>').addClass('toggle glyphicon glyphicon-chevron-right').css('margin-right', 10);
    chevronOpened = $('<span></span>').addClass('toggle glyphicon glyphicon-chevron-down').css('margin-right', 10);
    $('.list-group.sub-items ul').hide();
    $('.list-group.sub-items').find('li.sub').prepend(chevronClosed);
    $('.list-group.sub-items').find('li.sub').css('cursor', 'pointer');

    $('.list-group.sub-items').find('li.sub').click(function(e) {
        toggleChevron($(this).children('.toggle'));
        toggleChildren($(this).next(), $(this));
    });

    if (true) {
        addRemoveItemFeature();
    }
    $('ul.sub-items').css('margin-bottom', -1);
});

function addRemoveItemFeature() {
    $('.list-group.sub-items').find('li').hover(function() {
        removeIcon = $('<span></span>').addClass(removeIconClass).css({
            padding: 15,
            marginRight: -15,
            marginTop: -15,
        });
        removeIcon.click(function() {
            var item = $(this).parent();
            item.height(item.height());
            var next = item.next();
            if(item.hasClass('sub')) next.remove();
            item.slideUp(150, function() {
              item.remove();
            });
        });
        $(this).prepend(removeIcon);
    }, function() {
        removeIcon.remove();
    });
}

function toggleChildren(next, main) {
    if (next.is(':visible')) {
        next.slideUp(100);
    } else {
        var padding = parseInt(main.css('padding-left'));
        var margin = parseInt(main.css('margin-left'));
        next.children('li').css({
            marginLeft: margin - 40,
            paddingLeft: padding + 25 
        });
        next.slideDown(100);
    }
}

function toggleChevron(currentChevron) {
    if (currentChevron.hasClass('glyphicon-chevron-right')) {
        currentChevron.removeClass('glyphicon-chevron-right').addClass('glyphicon-chevron-down');
    } else {
        currentChevron.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-right');
    }
}

