// ==UserScript==
// @name       Squiz Matrix _admin domain title
// @namespace  http://squiz.net
// @version    0.2
// @description  Show domain in title for Squiz Matrix _admin mode
// @match      *://*/_admin*
// @match      *://*/*/_admin*
// @copyright  2017, Squiz
// ==/UserScript==
(function (document) {
    var getLocation = function(href) {
        var l = document.createElement("a");
        l.href = href;
        return l;
    };
    document.title = '' + getLocation(document.URL).hostname.replace(/www[\.-]/,'') + ' - ' + document.title.replace('Squiz ','');
})(document);