function setLoadingBox(element) {
    $(element).append('<div class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
}

function unsetLoadingBox(element) {
    $(element).find('.overlay').remove();
}