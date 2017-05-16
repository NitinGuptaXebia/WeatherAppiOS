# WeatherAppiOS
Weather, everybody wants to know how it is going to be during the week. Will it be rainy, windy, or sunny?
Stay connected to the latest in weather forecasting with  Weather. This free, weather app now and features , available for more countries and for more minutes than any other minute-by-minute precipitation forecast. Supporting Apple iPhone, this app offers the same world-class, synchronized app experience across all your iOS devices.
## Requirements

* [Xcode 8.3](https://developer.apple.com/xcode/)
* [Swift 3.1](https://github.com/apple/swift).

## How to build

Clone the project in your machine using ``https://github.com/NitinGuptaXebia/WeatherAppiOS``

Go to the project directory **Project Directory -> Weather**

The project can be run using Xcode 8.3 and built/tested using the standard Xcode build (⌘B) and test (⌘U) commands.

## Features
* `Swift Programming Language - version 3.1`
* `Design driven development`  
* `Custom UIView`
* `UICollectionViewController`
* MVC - Reactively update `ViewController` UI from `ViewModel`
* `Protocol-Oriented Programming `
* `Apple Map Kit`
* `UIStackView`
* `Core Location`
#
● Home screen:
- Showing a list of locations that the user has bookmarked previously.
- Show a way to remove locations from the list - Swipe left.
- Add locations by placing a pin on map- Longpress Gesture.

● City screen: once the user clicks on a bookmarked city this screen will appear. On this screen the user should be able to see:
- Today’s forecast, including: temperature, humidity, rain chances and wind information
- 5 Days forecast, including: temperature, humidity, rain chances and wind information
- On the home screen, implemented search capabilities for a list of known or bookmarked locations.

● Help screen: The help screen is done using a webview, and contain information of how to use the app, gestures available if any, etc.

● Settings page: where the user can select some preferences like: unit system
(metric/imperial),reset cities bookmarked.

● The UI is responsive supports - landscape and portrait orientations, and tablet resolutions.

● Compatible with iOS 9.0+ or above.

● Unit tests added with coverage of 95% - Model, APIClients, Utils & Other functional part. Overall Covegare - 61% due to ViewController .

## Further Improvements

The following are some of the improvements to the project that should be made given more time:
- Refresh button to manually trigger updating of weather data
- Mock API endpoint that loads test responses from JSON files in test bundle to remove the dependency of the life API during testing
- Custom Forecast cell for more advanced layout of forecast information
- Parse and show more forecast info such as wind direction and humidity
- "View model" for Forecast object to handle transforming raw data into strings and other structures for user display to better test data presented in view controllers
- Extract weather data into Core Data attributes instead of just storing raw JSON response
- More unit tests for more complete coverage, including for DayIdentifier, NSDateExtension, FetchableManagedObject, ConcurrentOperation
- UI tests
- Use reachability to handle various network conditions
- Better management of API requests and data fetching
# Disclaimer :
The icons are taken from [icon8](https://icons8.com),

The weather data is provided by [OpenWeatherMap](http://openweathermap.org/), under the [Creative Commons license](http://creativecommons.org/licenses/by-sa/2.0/).

