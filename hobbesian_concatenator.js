$('p.js-tweet-text').
  filter(function() { return $(this).text().indexOf('@zeke') > -1; }).
  map(function() { return $(this).text().replace('@zeke', ''); }).
  get().
  reverse().
  join(" ");