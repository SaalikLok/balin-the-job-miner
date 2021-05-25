# ⛏️ Balin, the job scraper
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/open-source.svg)](https://forthebadge.com)

A job board scraper for remote software engineering jobs for my personal job search. 
Balin digs up the best job for software engineering job searches from several websites. Run it locally to customize which jobs Balin prioritizes!

Themed and named after Balin, one of the many dwarfs who led Bilbo to the Lonely Mountain in the Hobbit.

## Customizing for your Search
Want Balin to help dig up great software engineering jobs for you? Follow these steps:

- Ensure that you have a modern version of Ruby installed
- Clone this repository
- `cd` into the repo
- Run `bundle`
- In your code editor, head to `./lib/scrapers/blockers_n_boosters.rb`
- Add or subtract words from the "BLOCKERS" constant to filter out jobs containing those keywords
- Add or subtract words from the "BOOSTERS" constant to add a bump to jobs containing those keywords
  - Note that a posting's recency is also considered for most of the scrapers included.

- Run `ruby server.rb` to start the server
- Visit `localhost:4567` to see what Balin digs up!

## Current job boards being scraped

- [RemoteOK](https://remoteok.io)
- [Remotive](https://remotive.io)

## Contributing
If you see something you'd like to fix, there's a job board you'd like to scrape, or any other enhancement, create a pull request! 
Make sure that the feature you build is something that adds to the project as whole, rather than tailoring the job search to your particular needs.

MIT Licensed.
