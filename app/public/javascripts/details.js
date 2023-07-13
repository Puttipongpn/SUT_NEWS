$('#myModal').on('hide.bs.modal', function (e) {
    $('iframe').attr('src', $('iframe').attr('src'));
});