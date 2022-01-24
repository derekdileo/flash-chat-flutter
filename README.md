# flash_chat_flutter

A Flutter project which allows users to log in and message within a single chatroom-like environment.
(This behavior is subject to change at a later date, once I become a better dev!)

## Getting Started

This project uses Firebase for user authentication via email/password registration and login and
implements a Firestore database to preserve message history.


## TDL:
[Create test cases (after learning how)](https://docs.flutter.dev/testing)

[Send email verification link to newly-registered users](https://support.google.com/firebase/answer/7000714?authuser=0)

Fix spinning-wheel issue where user tries to register with a previously-registered email.
Similar issue when user tries to log in with an email that has not been registered.

[Add functionality to message individual users on their own page via in_app_purchase package](https://pub.dev/packages/in_app_purchase)

Fix 'Could not find a set of Noto fonts to display all missing characters. 
Please add font asset for the missing characters' error on web app.

Fix constraint issue on iPhone

Fix "8.10.0 - [Firebase/Firestore][I-FST000001] 
Listen for query at messages failed: Missing or insufficient permissions." on iPhone
MORE = GTMSessionFetcher invoking fetch callbacks, data {length = 1377, bytes = 0x7b0a2020 226b696e 64223a20 22696465 ... 33363030 220a7d0a }, error (null)
GTMSessionFetcher invoking fetch callbacks, data {length = 648, bytes = 0x7b0a2020 226b696e 64223a20 22696465 ... 7d0a2020 5d0a7d0a }, error (null)
