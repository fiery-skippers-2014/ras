## Using the 500px API

Hey Lovely Friends,

This is the most important URL that we use to query the 500px API:

<https://api.500px.com/v1/photos/search/?tags=1&rpp=100&sort=rating&consumer_key=GWStsRosRx2RWF3J0Oc5z8OBB5nIG1PxTEGhcovK&tag=happy>

This is made up of a couple of parts:

Title | URL | Description/Notes
:---: | :--- | :---
**Base URI** | `https://api.500px.com/v1/` |   
**Subroute** | `photos/` | we only use photos for our app, but the complete link of possible values are: `photos`, `users`, `blogs`, `collections`, `comments`, `oauth`
**Subaction** | `search/` | we use `search` because we are searching for photos in our app, but see the [documentation](https://github.com/500px/api-documentation) for more less-useful actions
**Parameters** | | Here, we use two mandatory parameters and three optional parameters set off by `?` and joined by `&`:
    | `tags=1` | lets the API know that we want tag information to be return for each photo object
    | `rpp=100` | asks the API for a result of 100 photos back
    | `sort=rating` | asks the API to sort the photo objects highest rating first
    | `consumer_key=[xxx]` | [**MANDATORY**] your secret consumer key used to get access to the API
    | `tag=happy` | [**MANDATORY**] the tag that you're searching for (NOTE: you could have also used `term` which searches by keyword (all fields) or `geo` which searches by location)

Please see [500px's own API documentation](https://github.com/500px/api-documentation) for more information!
:heart: