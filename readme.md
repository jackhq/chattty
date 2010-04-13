# Chattty 

A Rails Engine that provide short messaging and notification processes for any rails application.

## What is it?

If you want to add short messaging and notifications to your rails app, this engine makes it really simple.  You can use @ to reference and search on userid, and # to reference topics, and & to reference people.  You can allow you users to create these messages, and/or allow the web application to generate these messages on events.  You can then generate a javascript file that will check for messages via jquery and pop or notify the user of a new message or activity.

You can also add custom name spaces for particular topics or at_users or people.

## Install

    sudo gem install chattty
    
## Generators

    script/generate chattty
    
    rake db:migrate
    
    # if you want the jquery
    
    script/generate chattty_js