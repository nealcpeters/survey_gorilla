$(document).ready(function() {


    //Add Option to Create Option page
    $(document).on('submit', '#submit-option-form', function(event) {
        event.preventDefault();

        var url = $(this).attr('action');
        var data = $(this).serialize();

        $.post(url, data, function(serverResponse) {
            // console.log(serverResponse);
            $('#additional-options').append(serverResponse);
            // console.log(serverResponse);
        })
    });




    // Add options to create_question page
    $('#submit-question-form').on('submit', function(event) {
        event.preventDefault();

        var url = $(this).attr('action');
        var data = $(this).serialize();

        // console.log(url)
        // console.log(data)

        $.post(url, data, function(serverResponse) {
            console.log(serverResponse)

            $('#submit-question-form').hide();
            $('#display-options').append(serverResponse);
            // $('#display-options').css('visibility', 'visible');

        })
    })



});
