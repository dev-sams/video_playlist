# README

## Collab Code Challenge
https://gist.github.com/sp2410/d34d7b75e8a3fb1752ab2a14e74bee84

### Assumptions
- The app will fetch video data from the Mock YouTube API and store it in a local PostgreSQL database.
- A rake task will be scheduled to periodically fetch new videos from the API.
- The app includes a search feature to filter videos by title.
- The UI is intentionally left open-ended for creative design choices.
### Stack

* ruby 3.1.1
* rails 7.1.3
* postgresql
* yarn
* bundler

### Dev Setup

```
Clone the repo
bundle install
yarn install
rails db:create db:migrate db:seed
```
# import videos for the mock API
```
rake fetch:videos
```

# Start the Server
```
rails s
```

Visit `http://localhost:3000`

### Testing

Run test suite with:

```
rspec spec/
```
