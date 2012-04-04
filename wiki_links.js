links = $('#bodyContent a').map(function() { return $(this).text(); }).get();
links = jQuery.unique(links).sort();
links.join("\n");