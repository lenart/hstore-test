# README

When editing an existing record rails doesn't recognize that it is a `PATCH` request if there are both - hidden field and select field present. Instead it recognizes it as a regular `POST` request on candidate resource which returns an error `No route matches [POST] "/candidates/1"` because this route does not exist.

If you open up [app/views/candidates/_form.html.erb](https://github.com/lenart/hstore-test/blob/master/app/views/candidates/_form.html.erb) uncomment any of the `candidate[language]` fields and the request will be recognized correctly.

## How to reproduce

- first create a new record
- edit the newly created record and submit the form

## Why i need this

The code is part of larger (legacy) app. There needs to be a default (blank) value when there are no languages present - similar to how rails handles checkbox values.
