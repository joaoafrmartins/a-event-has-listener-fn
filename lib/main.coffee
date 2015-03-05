module.exports = aEventHasListenerFn = (event, aListener) ->

  if typeof aListener["#{event}?"] is "function" then return true

  options = aListener?.options

  if aListener.events

    if Array.isArray aListener.events

      for e in aListener.events

        if e.name is event then return true

    else if typeof aListener.events is "object"

      if aListener.events[event] then return true

  if ns = options?.eventNamespace then event = "#{ns}.#{event}"

  if options?.eventListeners?[event]?.length > 0 then return true
