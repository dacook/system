// ==UserScript==
// @name         Squiz Timesheets
// @version      0.1
// @description  Timsheet tweaks
// @author       dcook@squiz.net
// @namespace    http://squiz.net
// @match        https://intranet.squiz.net/timesheets_nouveau.php
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Collapse Day Summary
    var totalsContainer = document.getElementById('totals-container');
    totalsContainer.className = document.getElementById('totals-container').className + ' collapsed';
    
    // Allow Allocated & Pinned Jobs to extend
    var jobsWrapper = document.getElementById('jobs-wrapper');
    jobsWrapper.style.height = '';
    jobsWrapper.id = 'jobs-wrapper-modified'; // Prevent update on window resize
    
    // Move Allocated & Pinned Jobs to LHS
    // var timesheet = document.getElementById('id_for_print');
    // timesheet.appendChild(jobsWrapper);
    
    // Hide Colour Codes
    var colourCodes = document.getElementsByClassName('colour-codes')[0];
    colourCodes.style.display = 'none';
    
    // Nicer unfiled bgcolor (ok now I'm getting fussy)
    var unfileTime = document.getElementById('unfile_time_flash_alert_table');
    unfileTime.bgColor = "#f9e9e3";
    
})();