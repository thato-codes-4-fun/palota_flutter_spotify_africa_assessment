#Submission
##################


# Spotify API Submission

This is a Flutter mobile application that integrates with the Spotify API to provide music-related features. The app allows users to see all playlists from a gentre, view specific playlist

## Features

- **View Afro playlists**: Users can view all playlists in AFRO .

- **View specific playlist**: Users can click into a playlist and view details regarding that playlist.



## Technologies Used

- Flutter: A cross-platform framework for building mobile applications.

- Spotify API: Integration with the Spotify Web API to access music-related data, .

- HTTP Package: Used to handle API requests and responses.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/thato-codes-4-fun/palota_flutter_spotify_africa_assessment.git
```

2. Navigate to the project directory:

```bash
cd spalota_flutter_spotify_africa_assessment
```

3. Install the dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

Make sure you have set up the necessary Flutter development environment and have a compatible device or emulator running.

## Configuration

Data Source
The data will come from a custom RESTful API that serves music category and playlist data based on Spotify Data.

Authentication
An API key will be sent will be sent to you separately. The apiKey should be sent as a header with name x-functions-key. E.g:

curl --location --request GET 'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro' \
--header 'x-functions-key: {apiKey}'
Available Endpoints
The base URL for all calls is: https://palota-jobs-africa-spotify-fa.azurewebsites.net/api

Description	Method	Route	Comments
Get single category	GET	browse/categories/{categoryId}	Spotify Documentation https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-a-category N.B.: The only supported category id is afro
List paginated playlist summaries	GET	browse/categories/{categoryId}/playlists	Spotify Documentation https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-a-categories-playlists N.B.: The only query parameters supported are offset and limit. These help with pagination. Hint: Not all results can be returned at once by API
Get single playlist	GET	playlists/{playlistId}	Spotify Documentation https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-playlist
Get single artist	GET	artists/{artistId}	Spotify Documentation https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-an-artist

```dart
const String kClientId = 'YOUR_CLIENT_ID';
const String kClientSecret = 'YOUR_CLIENT_SECRET';
```

## Final Thoughts
    Thank you for this amazing opportunity, I had been primarly coding in green feilds for flutter
    so to come in on a flutter brownfields assesment has been truly awesome.

    ## Challenges faced
        - pagination for an API was certainly something new for me. I had to research how to do it and 
        implementation took a bit of time

        -The last task of getting specific artist data
        -Further more it had to be unique 
        -this proved very challenging 
        -unfortunatly i was unable to complete this

    ## What would i do differently if if had to start again
        - take a break more often , everytime i got stuck
        i would try solve the problem instead of taking a break

    ## Which bits did I enjoy 
        - implenting the UI
        - the challenge of starting a brownfields product
        - the new concepts I learned namely screen pagination

    ## what would i do next if i had more time?
        - Finish with featured artist
        - implement search
        - implement music preview
            - I noticed in the api there was a priview for the music about a 30sec music clip
            - I would definetly implement this feature if i had more time.












###############
# Palota Spotify Africa Assessment

Palota assessment starter project | Palota Spotify Africa (Afro Category) Assessment

![Palota Logo](https://palota.co.za/assets/images/meta/og-image.png)

## Getting Started

[Use this repo as a template](https://github.com/PalotaCompany/palota_flutter_spotify_africa_assessment/generate) or [fork this repo](https://github.com/PalotaCompany/palota_flutter_spotify_africa_assessment/fork) into your own Github account so you can make changes. Alternatively, you can clone the project and upload it to your own repo so it does not show the link back to this repo.

## The assessment

### Overview
This is a starter project for a simple music playlist viewing application. The main is to complete two primary pages. The first page will show a paginated (via infinite scroll) list of playlist information in a category and provide a click-through navigation to the second page. The second page will be show detailed information about a playlist including a list of all tracks in the specified playlst. 

There are some existing pages, e.g. the landing page [(landing.dart)](lib/features/landing/presentation/pages/landing.dart) and about page [(about.dart)](lib/features/about/presentation/pages/about.dart), you can leave those pages as they are.

### Data Source
The data will come from a custom RESTful API that serves music category and playlist data based on Spotify Data.

#### Authentication
An API key will be sent will be sent to you separately. The `apiKey` should be sent as a header with name `x-functions-key`. E.g:
```bash
curl --location --request GET 'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro' \
--header 'x-functions-key: {apiKey}'
```

#### Available Endpoints

The base URL for all calls is: https://palota-jobs-africa-spotify-fa.azurewebsites.net/api

| Description | Method | Route | Comments |
|:---:|:---:|:---:|---|
| Get single category | `GET` | browse/categories/{categoryId} | Spotify Documentation [https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-a-category](https://developer.spotify.com/documentation/web-api/reference/get-a-category)  *N.B.: The only supported category id is `afro`* |
| List paginated playlist summaries | `GET` | browse/categories/{categoryId}/playlists | Spotify Documentation [https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-a-categories-playlists](https://developer.spotify.com/documentation/web-api/reference/get-a-categories-playlists)  *N.B.: The only query parameters supported are `offset` and `limit`. These help with pagination.  Hint: Not all results can be returned at once by API* |
| Get single playlist | `GET` | playlists/{playlistId} | Spotify Documentation [https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-playlist](https://developer.spotify.com/documentation/web-api/reference/get-playlist) |
| Get single artist | `GET` | artists/{artistId} | Spotify Documentation [https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-an-artist](https://developer.spotify.com/documentation/web-api/reference/get-an-artist) |


### Required Tasks
1. Integrate to the Palota Spotify Africa API to retrieve specific data in the `afro` category of Spotify.
2. Complete the spotify category page ([`spotify_category.dart`](lib/features/spotify/presentation/pages/spotify_category.dart)) and integrate it to the API (feel free to split your code into mutliple files - the main page/widget for the category should however be in the `spotify_category.dart` file ). This page features the following:
    - A header with the name of the category, and the category's image
    - A grid list of all the playlists in the category (along with the name of the playlist and an image for the playlist). The API is paginated and as such will not give you all the playlists at once. You will need to implement pagination via infinite scrolling to allow the user view the entire list by scrolling down and having the data load as they do so.
3. Create click-through navigation to the plylist page (hint: consider using the [route generator](lib/routes.dart))
4. Complete the spotify playlist page ([`spotify_playlist.dart`](lib/features/spotify/presentation/pages/spotify_playlist.dart)) and integrate it to the API (feel free to split your code into mutliple files - the main page/widget for the playlist should however be in the `spotify_playlist.dart` file ). The playlist page features the following:
    - The feature image of the playlist, the name of the playlist, a description of the playlist as well as the amount of followers the playlist has (formatted with a thousands separator).
    - A list of all the tracks in the playlist including the album image of the track, the name of the track, a comma separated list of the artists in that track as well as the formated duration (`mm:ss`) of that track. N.B. There is no pagniation required for the list of tracks - use only the initial list of tracks you receive.
    - A horizontally scrolling list of all the unique artists featured in that playlist (N.B. the same artist may be featured in more than one track in the same playlist). For the artist list you only need to display their name and image.
5. Your implemented app should match the supplied designs (below) as closely as possible. You will be graded on how well your implementation matches the design down to things like border radiuses, shadows and colours.
6. Write clean code and gracefully handle errors (e.g. some data might be missing and the API may return 404s - in that case your code should be able to ommit that data without affecting the user experience). How readable your code is will also be used to grade your submission.

### Bonus Tasks
1. Provide a client-side search/filter capability to filter the list of tracks based on user input. You can put the search/filter input on the app bar of the playlist page. You can also put it below the app bar, as long as it does not scroll with the content.
2. Usage of a pattern that enforces clean code.


### Detailed designs
1. [Figma Designs](https://www.figma.com/file/HCaNpb2sdvY3fEbsTyEhpz/Palota-Spotify-Flutter?type=design)
2. [Figma Prototype](https://www.figma.com/proto/HCaNpb2sdvY3fEbsTyEhpz/Palota-Spotify-Flutter?type=design&scaling=scale-down&page-id=0%3A1&node-id=42-281&starting-point-node-id=1%3A2) N.B. only one playlist is clickable in this prototype, in your submission every playlist should be clickable and the page nagivated to should show the correct content for that playlist
3. [Adobe XD Specs](https://xd.adobe.com/view/773e9204-d782-4539-bae1-a55fc4d7e102-226d/specs) N.B. The specs will be helpful in getting the correct values to match designs (e.g. padding values, colours etc.)


Look at the API responses to figure out where to get the values to populate.

N.B. The designs repeat some values and have some incorrect as they are just for illustration. In your completed app, use the data from the API as is.

![resized_palota_anim](https://github.com/PalotaCompany/palota_flutter_spotify_africa_assessment/assets/4819593/1e1f87a1-789a-4d77-bbc0-387f410b1b8a)

*The data in the designs is not accurate or complete*

## Submission
Once done with the tasks, commit all your code and push it to your forked remote github repository before the deadline which will be provided to you. Submit a link to your forked repo (with relevant branch - ideally main) to the email which will be provided to you separately when the assessment is assigned to you. 

**Important: Make sure your app compiles and runs before submitting. We will not be able to grade the app if it doesn't run** 

---


For help getting started with Flutter, view the
[flutter online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference. 
