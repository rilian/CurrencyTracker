Actions
-------

* Since REE 2010 is a bit old Ruby, I have updated it to latest in .rvmrc
* Tried bundle the gems and run all tests via `rake test` and `cucumber` - all passing, server is running
* Getting rid of bundled gems which are 1.5 years old
* Got some issues and warnings with new gems, decided to update Rails to latest 3.2.8
* Some unexpected issues with Unit tests, fixed them by changing around some methods
* Added a cleanup for test database for cucumber, for continuous integration and `rake test && cucumber`, cause the fixtures loaded with Unit tests, are not cleaned up before cucumber run
* Now all tests are passing again
* Running latest Rails server, see no way to add data
* Impelmenting CRUD in all controllers to be able to add data
* Notice methods in DataUpdater which load remote country data from some services
* Remove the added CRUD methods
* Implement rake task to load remote data, working successfully, `rake data_updater:load_data`
 
