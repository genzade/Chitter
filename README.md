# Chitter: a Twitter clone

This was onriginally a weekend challenge set by our coaches at Makers Academy. I was not happy with what I produced the first time around so I added 'complete the chitter challnge + extend it' to my coding bucket list. This is the challenge set to us [chitter-challenge](https://github.com/makersacademy/chitter-challenge).

## Features
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
## Installation
You can try the app at [chitter-hamid.herokuapp.com](https://chitter-hamid.herokuapp.com)
or install it locally:
```
$ git clone git@github.com:genzade/Chitter.git
$ cd Chitter
$ bundle
$ createdb chitter_development
$ rake db:migrate
$ rackup
```
## Usage
You can sign up usong an email address, and log in with a username to start chittering (trying desperately to avoid using the word "chitting"). See what other users have been writing, write them a reply. If you forget your password (mainly because of all the fun you're having) don't worry, just follow the "I forgot my password" link on the homepage, type your email in and we will send you a password recovery link.

At the moment we do not check for authentic emails upon sign up (see __Contributing__ and __TODO__) so please enter an authentic email address to view the password recovery feature.

## Technologies
- Ruby
- Sinatra
- Postgres
- DataMapper

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## TODO

In no particular order

- email authentication
- omniauth with any one or all of the following; facebook, twitter or github
- allow users to upload an image for profile, display image
- password length must be at least n chars

## Credits
[Alan Gabbianelli](https://github.com/AlanGabbianelli)
