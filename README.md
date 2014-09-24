Chitter
=================

Chitter is a basic version of twitter where users can sign up, login, recover thier password and post to a public timeline. Users can also reply to each post and start a conversation.

This was built without using Twitter Bootstrap or any front end frameworks.

![](app/assets/images/chitterscreenshot.png)

####Deployed
To view, visit: http://limitless-beach-7213.herokuapp.com/

###Specification

+ Users sign up to chitter with their email, password, name and a user name
+ The username and email are unique
+ Peeps (posts to chitter) have the name of the maker and their user handle
+ Use data mapper and postgres to save the data
+ You don't have to be logged in to see the peeps
+ Users can reply to peeps

###Technologies used

+ Ruby
+ RSPEC
+ Sinatra
+ BCrypt
+ Datamapper
+ PSQL
+ Capybara
+ Heroku

###Set up

```sh
git clone https://github.com/csharpd/Chitter.git
cd yelp
bundle install
```

###Run

```sh
cd chitter
rackup
```
Open the browser at localhost:3000 to view the app

###Test

```sh
cd chitter
rspec

##Possible extension

* Forgotten Password option
* Ability to filter peeps by user


