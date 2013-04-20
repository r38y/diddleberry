# Diddleberry

## Development

```
$ cp config/database{.example,}.yml
$ bundle
$ rake db:create
$ foreman start
```

1. Visit http://localhost:5000
2. Tail the development logs for an email
3. Enter email address
4. Check the development logs for the email. Copy the link in
   the email and paste in your browser to log in
5. PROFIT!!

## Testing

```
$ rake db:test:prepare
$ rspec
```
