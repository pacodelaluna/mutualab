// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
    $('#add_entity').click(function(event) {
        event.preventDefault();
        $('.entity_errors').html('');
        if (($('#entity_existing_entity').val() == null) || ($('#entity_existing_entity').val() == '')) {
            jQuery.ajax({
                url:      '/entities',
                type:     'POST',
                dataType: 'json',
                data: {
                    entity: {
                        name: $('#entity_name').val(),
                        category: $('#entity_category').val()
                    }
                },
                success:  function(data, textStatus, XMLHttpRequest) {
                    entity = data;
                    $('#entities_list').children().first().before('<div>'+entity['name']+'<input type="hidden" name="user[entity_ids][]" value="'+entity['id']+'"><button class="delete_entity">X</button></div>');
                },
                error:    function(jqXHR, status, error) {
                    $(eval(jqXHR.responseText)).each(function(i, e) {
                        $('.entity_errors').append('<div>'+e+'</div>');
                    });
                }
            });
        } else {
            entity = $('#entity_existing_entity option:selected').first()[0];
            console.log(entity);
            $('#entities_list').children().first().before('<div>'+entity.text+'<input type="hidden" name="user[entity_ids][]" value="'+entity.value+'"><button class="delete_entity">X</button></div>');
        }
    });

    $('.delete_entity').click(function(event) {
        event.preventDefault();
        console.log('TODO');
    });
})