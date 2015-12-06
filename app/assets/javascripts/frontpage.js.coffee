$ ->
  $("form#login_user, form#registration_user, form#edit_user")
    .on "ajax:success", (event, data, status, xhr) ->
      $(this).parents('.modal').modal('hide')
      window.location.reload()

    .on "ajax:error", (event, xhr, status, error) ->
      error_messages = if xhr.responseJSON['error']
        "<div class='alert alert-danger'>" + xhr.responseJSON['error'] + "</div>"
      else if xhr.responseJSON['errors']
        $.map(xhr.responseJSON['errors'], (v, k) ->
          "<div class='alert alert-danger'>" + k + " " + v + "</div>"
        ).join ""
      else
        "<div class='alert alert-danger'>Unknown error</div>"
      $(this).find(".error_messages").html(error_messages)

  $("#new_sessions_dialog, #new_registration_dialog, #edit_registration_dialog")
    .on "hidden.bs.modal", () ->
      $(this).find(".error_messages").empty()
