// ==UserScript==
// @name       Funnelback Admin domain title
// @namespace  http://funnelback.com
// @version    0.1
// @description  Show domain in title for Funnelback Admin interface
// Matching on port number doesn't seem to work
// @match      *://*/search/admin/*
// @match      *://*/a/?redirectTo=*
// @match      *://*/a/
// @copyright  2017, Squiz
// ==/UserScript==
(function (document) {
    var getLocation = function(href) {
        var l = document.createElement("a");
        l.href = href;
        return l;
    };
    document.title = '' + getLocation(document.URL).hostname.replace(/www[\.-]/,'') + ' - ' + document.title;
})(document);