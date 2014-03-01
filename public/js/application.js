$(document).ready(function() {


    //Add Option to Create Option page
    $(document).on('submit', '#submit-option-form', function(event) {
        event.preventDefault();

        var url = $(this).attr('action');
        var data = $(this).serialize();

        $.post(url, data, function(serverResponse) {
            $('#additional-options').append(serverResponse);
        })
    });

    // Add options to create_question page
    $('#submit-question-form').on('submit', function(event) {
        event.preventDefault();

        var url = $(this).attr('action');
        var data = $(this).serialize();

        $.post(url, data, function(serverResponse) {
            // console.log(serverResponse)

            $('#submit-question-form').hide();
            $('#display-options').replaceWith(serverResponse);
        })
    });

    $(document).on('submit', '#add-question-form', function(event){
        event.preventDefault();

        var url = $(this).attr('action')
        var data = {
            option_text: $('.grab_this_shit_yo').last().val()
        }

        console.log(url)
        console.log(data)

        $.post(url, data, function(serverResponse){
            // console.log(serverResponse);
            // return true;
            window.location.href = '/survey/create/question';
        })


    });

    $(document).on('submit', '#finish-survey-form', function(event){
        event.preventDefault();

        var url = $(this).attr('action')
        var data = {
            option_text: $('.grab_this_shit_yo').last().val()
        }

        console.log(url)
        console.log(data)

        $.post(url, data, function(serverResponse){
            // console.log(serverResponse);
            // return true;
            window.location.href = '/survey/create/confirm';
        })


    });


});
