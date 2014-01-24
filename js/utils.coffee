Website = Website or {}
Website.apps =
  dataMenu: do ->
    'use strict'
    JSONObj =
      "menu": [
        {'text': 'Blog', 'url': 'http://imarcker.blogspot.com'}
        {'text': 'GitHub', 'url': 'http://github.com/marcker'}
        {'text': 'Facebook', 'url': 'http://facebook.com/imarcker'}
        {'text': 'Google Plus', 'url': 'https://plus.google.com/102852478914643331562'}
        {'text': 'Valid HTML', 'url': 'http://validator.w3.org/check?uri=http://marcker.net'}
        {'text': 'Valid CSS', 'url': 'http://jigsaw.w3.org/css-validator/validator?uri=http://marcker.net'}
      ]

    return JSONObj

  createHTML: (container, id) ->
    'use strict'
    div = document.querySelector container
    ul = document.createElement 'ul'

    ul.setAttribute 'id', id
    div.appendChild ul

    return ul

  populate: (container) ->
    'use strict'
    ul = this.createHTML container, 'dropdown-menu'
    a = []
    li = []

    for elem, i in this.dataMenu.menu by 1
      li[i] = document.createElement 'li'
      a[i] = document.createElement 'a'
      a[i].setAttribute 'href', this.dataMenu.menu[i].url
      a[i].setAttribute 'title', this.dataMenu.menu[i].text
      a[i].innerHTML = this.dataMenu.menu[i].text
      li[i].appendChild a[i]
      ul.appendChild li[i]

    return ul

  github: (response) ->
    'use strict'
    JSONObj = response.data
    updates = document.querySelector '.updates'
    list = ''
    date = []

    for elem, i in JSONObj by 1
      if JSONObj[i].type is 'PushEvent'
        date[i] = new Date JSONObj[i].created_at
        list += '<li>' +
          date[i].getDate() + '/' + (date[i].getMonth() + 1) + '/' + date[i].getFullYear() +
          '&raquo; <a class="commit" href="' + JSONObj[i].payload.commits[0].url + '">' +
            JSONObj[i].payload.commits[0].message +
          '</a> &#8594; ' +
          '<a class="repo" href="' + JSONObj[i].repo.url + '">' +
            JSONObj[i].repo.name +
          '</a></li>'
    updates.innerHTML = list

    return

Website.apps.populate '#nav'