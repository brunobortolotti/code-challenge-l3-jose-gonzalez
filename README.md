# README

### How to setup

- Run the app with `rails server`
- Run Sidekiq with `bundle exec sidekiq`

### How to generate a short URL

- POST to `/urls` with `"original_link"` within the JSON body. Ex.:
```
{
    "original_link": "https://www.mozilla.org/es-ES/"
}
```

- Visit the generated URL. Ex.: `http://localhost:/a`

### How is it generated?

- If there isn't an URL present in the database, we start the sequence with `'a'`.
- If there is an URL, then we continue the previous sequence with 'succ'. Ex.: `'a', 'b', ..., 'z'`.
- The sequence is stored in the `token` field.