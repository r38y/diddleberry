jQuery ->
  console.log 'yeah'
  $('form').on 'submit', (event) ->
    $(this).find('input[type=submit]').attr('disabled', 'disabled')
  $('[data-behavior~=confirm]').on 'click', (event) ->
    $target = $(event.target)
    unless confirm($target.data('confirm'))
      event.preventDefault()

