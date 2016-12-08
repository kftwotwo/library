# Library

#### You can add or update books in the select, 2016-12-7

#### By [Kevin Finley](http://www.kfinley.com), Andrew

## Description

This application you can add, update, or delete books and search by author or title.

## Setup/Installation Requirements

Go to github and clone the repository `https://github.com/kftwotwo/library_2_day.git`.  
Once the repository is cloned:
```
$ git clone library_2_day
$ cd library_2_day
$ bundle install
```

Enter the following psql commands below:

```
# CREATE DATABASE library;
# \c library;
# CREATE TABLE authors (id serial PRIMARY KEY, first_name varchar, last_name varchar);
# CREATE TABLE checkouts (id serial PRIMARY KEY, patron_id  int, due_date varchar, return varchar, checkout_date varchar);
# CREATE TABLE books (id serial primary key, title varchar)
# CREATE TABLE patron (id serial primary key, name varchar)
# CREATE DATABASE library_test WITH TEMPLATE library
# CREATE DATABASE library_development with template library_test
# CREATE TABLE authors_books (id serial PRIMARY KEY, author_id, book_id);
# CREATE TABLE books_checkout (id serial PRIMARY KEY, checkout_it, book_id);
```

## Known Bugs

If you notice any bugs or problems you can fill out an issue [here](http://www.github.com/kftwotwo/library_2_day/issue) or you can clone the project and work on it yourself!

## Contact details
Here is my email kf.two.two@gmail.com

## Contribute

Issue Tracker: https://github.com/kftwotwo/library_2_day/issues

Source Code: https://github.com/kftwotwo/library_2_day


## Technologies Used
```
HTML
CSS
Ruby
Postgress
```
### License

*This is under a MIT License*

Copyright (c) 2016 **_Kevin Finley_**
