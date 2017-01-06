jQuery(document).on 'turbolinks:load', ->
  tasks = $('#tasks')

  count = tasks.find('.count > span')

  recount = -> count.text tasks.find('.nested-fields').size()

  tasks.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  tasks.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()

  tasks.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  tasks.on 'cocoon:after-remove', (e, removed_el) ->
    recount()
