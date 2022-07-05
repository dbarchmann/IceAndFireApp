# IceAndFireApp
This is a small demo application for iPhone, that shows all houses of Game of Thrones in a Master-Detail-View.
Therefore it uses the [Game of Thrones API](https://anapioficeandfire.com).

## Implementation details
- SwiftUI in combination with MVVM is used
- Async/Await for API calls
- Dependency injection with [Resolver](https://github.com/hmlongco/Resolver) package
- When innitial data fetching takes longer than half a second, a activity indicator is shown
- There are some unit tests, as well as some UI tests implemented

## Improvements/ Discussion
- The API call implementation is very basic and could be improved. Especially lazy loading should be implemented for larger data sets.
- The detailView only shows some of the actual data. This could be improved.
- Accessibility should be implemented throughout the app. For better accessibility and better UI testing.
- Localization should be implemented.
- Error handling should be implemented.
- Improve test coverage. The implemented tests are just there to showcase how it is done.
