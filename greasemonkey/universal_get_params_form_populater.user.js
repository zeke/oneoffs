// ==UserScript==
// @name           Delicious Tags From URL
// @namespace      http://zeke.sikelianos.com
// @description    This script finds text fields on the page and populates them with the values of an corresponding GET parameters
// http://internetducttape.com/2008/05/08/greasemonkey-ninja-jquery/
// @include        *
// ==/UserScript==

var tab_box = document.getElementById('tags');

if (tab_box != null){
	urltag = gup('tags');
	if (urltag != null){
		tab_box.value = unescape(urltag);
	}
}

// Helper functions
function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return null;
  else
    return results[1];
}