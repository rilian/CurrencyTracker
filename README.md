CurrencyTracker
===============

CurrencyTracker allows you to track your personal collection of world currencies, by tagging the countries that you've visited along your travels.

Features
--------

* Track Visited Countries
* Track Collected Currencies
* Charts show you how far along you are!

CurrencyTracker assignment guideline.
====================================

*Production readiness*

Please, make sure your output is production ready:
* It has all changes committed with reasonable commit messages
* It does not break existing tests, both unit tests and cucumber features.
* It tests new functionality.
* At all times test routines should pass 'green'

    rake test
    cucumber

* It works from scratch. Literally, it should work after following command sequence
    rake db:reset
    rails server

* It has a sample user with collection history
* What claimed as done is fully working. Better to have 2 working features than 3 not working.
* Don't try to overengineer the solution


*Additional code purity checks*
* No inline JavasScript in views
* Thin controllers where possible
* Scopes instead of stacked find or where calls.