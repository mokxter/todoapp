# To-do List App

This is a To-do app that is made using Rails

## Dependencies

* Ruby 2.1.5 and above
* RVM 1.26.3
* Rails 4.2.0
* Other dependencies are in the Gemfile

## Installation

### Clone the app

  $ git clone git@github.com:mokxter/todoapp.git

### On ubuntu

#### Ruby Version Manager

This will install Ruby and RVM for you. For a more detailed info, you can 
check their website. [RVM website](https://rvm.io)

  $ \curl -sSL https://get.rvm.io | bash -s stable

### Ruby on Rails and other dependencies

Create a new gem set (optional, but if don't want to remove the .rvmrc
file in the app root directory)

  $ rvm gemset create todoset

And then, go to the project root directory and run

  $ bundle install

This will install all the dependencies for you

### Setting up the app

We really just need to setup the database for the app. To set it up,
run this in the root of the app directory.

  $ rake db:migrate

## Server

You just need to run the rails server in the root directory of the app

  $ rails server

Then go to "localhost:3000" in your browser
