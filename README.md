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

Sidekiq performs a background job and adds the `page_title` field.

### How is it generated?

- If there isn't an URL present in the database, we start the sequence with `'a'`.
- If there is an URL, then we continue the previous sequence with 'succ'. Ex.: `'a', 'b', ..., 'z'`.
- The sequence is stored in the `token` field.

### Get TOP 100 Urls

GET `/urls/show_top_100`. Example output:

```
[
    {
        "short_link": "http://localhost:3000/a",
        "title": "Stack Overflow - Where Developers Learn, Share, & Build Careers",
        "link": "https://stackoverflow.com/",
        "visits": 7
    },
    {
        "short_link": "http://localhost:3000/d",
        "title": "The Behemoth - We Make Games",
        "link": "https://www.thebehemoth.com/",
        "visits": 5
    },
    {
        "short_link": "http://localhost:3000/c",
        "title": "Full Packing del Caribe | Inicio",
        "link": "https://www.fullpackingdelcaribe.com/es",
        "visits": 4
    },
    {
        "short_link": "http://localhost:3000/b",
        "title": "Google",
        "link": "https://www.google.com/",
        "visits": 4
    },
    {
        "short_link": "http://localhost:3000/e",
        "title": "Internet para la gente, no para el lucro — Mozilla",
        "link": "https://www.mozilla.org/es-ES/",
        "visits": 3
    },
    {
        "short_link": "http://localhost:3000/f",
        "title": "How to Format Code in Markdown",
        "link": "https://www.freecodecamp.org/news/how-to-format-code-in-markdown/",
        "visits": 1
    },
    {
        "short_link": "http://localhost:3000/g",
        "title": "GitHub: Let’s build from here · GitHub",
        "link": "https://github.com/",
        "visits": 1
    }
]
```
