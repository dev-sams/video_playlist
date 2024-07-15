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


<img width="1029" alt="Screenshot 2024-07-15 at 10 27 30 AM" src="https://github.com/user-attachments/assets/d7992121-a5c6-450a-b35c-86bf0cd347a5">
<img width="534" alt="Screenshot 2024-07-15 at 10 27 52 AM" src="https://github.com/user-attachments/assets/c5d92070-e17c-48fc-9ebc-c7efee08e097">
<img width="1500" alt="Screenshot 2024-07-15 at 10 28 21 AM" src="https://github.com/user-attachments/assets/6bb4a2d6-4f1b-46fe-9830-5de97f57dda1">
<img width="912" alt="Screenshot 2024-07-15 at 10 29 03 AM" src="https://github.com/user-attachments/assets/63eede60-bd55-4b42-9572-6ede0c201acc">
<img width="1083" alt="Screenshot 2024-07-15 at 10 29 20 AM" src="https://github.com/user-attachments/assets/16520250-748b-48b0-8790-5aec979f0693">


