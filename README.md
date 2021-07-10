# Project 4 - Parsetagram

Parsetagram is a photo sharing app using Parse as its backend.

Time spent: **16-18** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication
- [x] User can log in and log out of his or her account
- [x] The current signed in user is persisted across app restarts
- [x] User can take a photo, add a caption, and post it to "Instagram"
- [x] User can view the last 20 posts submitted to "Instagram"
- [x] User can pull to refresh the last 20 posts submitted to "Instagram"
- [x] User can tap a post to view post details, including timestamp and caption.

The following **optional** features are implemented:

- [x] Run your app on your phone and use the camera to take the photo
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling.
- [x] Show the username and creation time for each post
- [x] User can use a Tab Bar to switch between a Home Feed tab (all posts) and a Profile tab (only posts published by the current user)
- User Profiles:
  - [x] Allow the logged in user to add a profile photo
  - [x] Display the profile photo with each post
  - [ ] Tapping on a post's username or profile photo goes to that user's profile page
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- [ ] User can comment on a post and see all comments for each post in the post details screen.
- [ ] User can like a post and see number of likes for each post in the post details screen.
- [ ] Style the login page to look like the real Instagram login page.
- [ ] Style the feed to look like the real Instagram feed.
- [ ] Implement a custom camera view.

The following **additional** features are implemented:

- [x] Placeholder text for post caption
- [x] Error message popups when login/sign up fails
- [x] Circular image for profile pictures

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class:

1. Have the home feed refresh automatically with the new post without refreshing
2. Implement liking and commenting

## Video Walkthrough

### Login, logout, and signup

![Login, logout, and signup](ig_1.gif)

### User persistence

![User persistence](ig_2.gif)

### Create posts, refresh, home timeline

![Create posts, refresh, home timeline](ig_3.gif)

### Details view, profile tab, edit profile pic

![Login, logout, and signup](ig_4.gif)

GIFS created with (ezgif.com/video-to-gif).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [DateTools](https://github.com/MatthewYork/DateTools) - dates and times library
- [Parse](https://www.back4app.com/) - database backend

## Notes

Describe any challenges encountered while building the app.

- Logout didn't switch views when login was user persisted
- Unable to access Post object to refresh home timeline automatically after new post created
- Loading profile image onto profile view
- Autolayout with collection view

## License

    Copyright [2021] [Ileen Fan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
