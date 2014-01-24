$(document).ready ->
  welcome = [
    '<p><strong>Marcos Garcia</strong> is a brazilian developer who builds <strong>web applications</strong> simple and creative.</p>'
    '<p><strong>Marcos Garcia</strong> é um desenvolvedor brasileiro que constrói <strong>aplicações web</strong> simples e criativas.</p>'
    '<p><strong>Marcos Garcia</strong> er en brasiliansk utvikler som bygger <strong>webapplikasjoner</strong> enkel og kreativ.</p>'
    '<p><strong>0100110101100001</strong> 01110010011 0001 101101111011 10011001000 000100011101 100001 011100100 11 000110 <strong>11010010110</strong> 000100</p>'
  ]

  randomizeColors = ->
    colors = [
      'black'
      'yellow'
      'magenta'
      'cyan'
    ]
    colors[Math.floor Math.random() * colors.length]

  applyTranslation = ->
    container = $ '#welcome'
    p = '#welcome p'
    english = $ '#enus'
    portugues = $ '#ptbr'
    norske = $ '#nr'
    binary = $ '#binary'
    firstStrong = '#welcome strong:first'
    lastStrong = '#welcome strong:last'
    container.append welcome[0]

    english.on 'click', (evt) ->
      $(p).remove()
      container.append(welcome[0]).hide().fadeIn 1000
      evt.preventDefault()
      return

    portugues.on 'click', (evt) ->
      $(p).remove()
      container.append(welcome[1]).hide().fadeIn 1000
      evt.preventDefault()
      return

    norske.on 'click', (evt) ->
      $(p).remove()
      container.append(welcome[2]).hide().fadeIn 1000
      evt.preventDefault()
      return

    binary.on 'click', (evt) ->
      $(p).remove()
      container.append(welcome[3]).hide().fadeIn 1000
      evt.preventDefault()
      return

    $(document).on 'mouseover', firstStrong, ->
      $(firstStrong).animate
        color: randomizeColors()
        1000

      $(lastStrong).animate
        color: randomizeColors()
        1000

      return
    return

  applyTranslation()
  return