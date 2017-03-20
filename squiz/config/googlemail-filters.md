# Squizmap 
Tip: set project notifications setting to 'as changes are made' to ensure messages are unlikely to be batched (https://squizmap.squiz.net/roadmap/6351).
Although these filters should work with batched emails anyway.

## Delete Squizmap notifications from myself
    Matches: from:no-reply@squizmap.squiz.net subject:"has 1" subject:"Idea" "David Cook added"
    Do this: Apply label "Notifications", Delete it

## Whitelist notification types 
Delete notifications unless they are types that I'm interested in

    Matches: from:(no-reply@squizmap.squiz.net) -{"added a new Idea" "added a new comment" "Assignee changed to David Cook" "Idea moved" "Status changed to Closed" "Idea deleted"}
    Do this: Apply label "Notifications", Delete it

Other types that I didn't want:
* "Vote Added"
* "Vote Removed by"
* "Description updated"
* "Added project report"
* "Status changed to"
* "Tags changed to"
* "Title changed to"
* "Source milestone changed to"
* "Target milestone changed to"
* "Assignee removed"
* "Assignee changed to"

## Move all others to Notifications
    Matches: from:(no-reply@squizmap.squiz.net)
    Do this: Skip Inbox, Apply label "Notifications"

# projects.squiz.net

## Delete notifications from myself
    Matches: "From the" "project in Squiz Projects" subject:"has 1" subject:"Idea" "David Cook added"
    Do this: Apply label "Notifications", Delete it

## Whitelist notification types 
Delete notifications unless they are types that I'm interested in. For some reason this instance is configured to send with your email address.

    Matches: "From the" "project in Squiz Projects"  -{"added a new Idea" "added a new comment" "Assignee changed to David Cook" "Idea moved" "Status changed to Closed" "Idea deleted"}
    Do this: Apply label "Notifications", Delete it

## Move all others to Notifications
    Matches: "From the" "project in Squiz Projects"
    Do this: Skip Inbox, Apply label "Notifications"

# Jira
## Whitelist notification types
Delete notifications unless they are types that I'm interested in

    Matches: from:jira@squiz.net -{"commented on" "mentioned you" "assigned an issue to David Cook"}`
    Do this: Apply label "Notifications", Delete it

Other types:
* "resolved as"
* "updated an issue" (usually adding an attachment)
* "edited a comment"
* "updated `JIRA-ID`" (Change of status. can't filter for this anyway)

## Move most others as Notifications
Unless they are responses from support tickets, or mentioning me.

    Matches: from:(jira@squiz.net) -{"David Cook" VICSR}
    Do this: Skip Inbox, Apply label "Notifications"

# Matrix

    Matches: subject:(Asset Lock Forcibly Acquired)
    Do this: Skip Inbox, Apply label "Notifications"

    Matches: from:(clients.squiz.net)
    Do this: Skip Inbox, Apply label "Notifications"
