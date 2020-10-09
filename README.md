## About
Loads insurance data to tables then makes it accessible via API.
See index page for available endpoints.

Endpoints do the following:
* The total counts of clients, carriers, and policies loaded into the system
* A list of all clients and allow paginating through them
* All policies for a single client

## System Dependencies
You'll need Ruby 2.6.3, Rails 6.0.3.3 and bundler.

## Setup
cd into project directory then
* bundle install

Create database tables
* bundle exec rails db:migrate

Load data into tables:
(Note the order you run these tasks matter)
* bundle exec rails "load_clients"
* bundle exec rails "load_carriers"
* bundle exec rails "load_policies"

### To reset tables
* bundle exec rails db:migrate VERSION=0

then rerun all setup steps again.

## Access Endpoints
#### Start Server
* PORT=3010 bundle exec rails server

When the web server starts and you go to the index page you can see all the endpoints
You should be able to click links to view data in the browser.


## Noteable Code Locations
Api related:
* app/controllers/api/vi
* app/models/
* app/views/
Rake tasks that load data:
* lib/tasks/

### Note
Should you get the following whenever you run a console command please ignore.
Current rails seems to come out the box this way or could be something with my setup.

/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils/version.rb:4: warning: already initialized constant FileUtils::VERSION
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:105: warning: previous definition of VERSION was here
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils.rb:1267: warning: already initialized constant FileUtils::Entry_::S_IF_DOOR
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:1284: warning: previous definition of S_IF_DOOR was here
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils.rb:1540: warning: already initialized constant FileUtils::Entry_::DIRECTORY_TERM
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:1568: warning: previous definition of DIRECTORY_TERM was here
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils.rb:1595: warning: already initialized constant FileUtils::OPT_TABLE
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:1626: warning: previous definition of OPT_TABLE was here
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils.rb:1649: warning: already initialized constant FileUtils::LOW_METHODS
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:1685: warning: previous definition of LOW_METHODS was here
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/2.6.0/fileutils.rb:1656: warning: already initialized constant FileUtils::METHODS
/Users/kned/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/fileutils-1.4.1/lib/fileutils.rb:1692: warning: previous definition of METHODS was here
