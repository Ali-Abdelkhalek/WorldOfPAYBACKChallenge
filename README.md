## iOS Coding Challenge - "WorldOfPAYBACK"
Welcome to "WorldOfPAYBACK", an iOS app developed as part of a coding challenge. This app was created to showcase the developer's skills and abilities in iOS development, and it is being shared with the community as part of the challenge.

## "WorldOfPAYBACK" App - Functional Requirements

Please create an App based on the following User-Stories:

* As a user of the App, I want to see a list of (mocked) transactions. Each item in the list displays `bookingDate`, `partnerDisplayName`, `transactionDetail.description`, `value.amount` and `value.currency`. *(see attached JSON File)*
* As a user of the App, I want to have the list of transactions sorted by `bookingDate` from newest (top) to oldest (bottom).
* As a user of the App, I want to get feedback when loading of the transactions is ongoing or an Error occurs. *(Just delay the mocked server response for 1-2 seconds and randomly fail it)*
* As a user of the App, I want to see an error if the device is offline.
* As a user of the App, I want to filter the list of transactions by `category`.
* As a user of the App, I want to see the sum of filtered transactions somewhere on the Transaction-list view. *(Sum of `value.amount`)*
* As a user of the App, I want to select a transaction and navigate to its details. The details-view should just display `partnerDisplayName` and `transactionDetail.description`.
* As a user of the App, I like to see nice UI in general. However, for this coding challenge fancy UI is not required.

## "WorldOfPAYBACK" App - Requirements
* iOS 16.0 or later
* iPhone, iPad, or iPod touch

## Installation
Simply open the project in Xcode to start using it.


## Technologies used: 
* Swift, SwiftUI, Xcode

## Architecture: 
*MVVM

## Future improvements:
* Enhance UI with a more appealing one (it needed more time :) )
* Split mock and server backend entities into two separate modules below PBClient
* split HomeViewModel into smaller modules for each view within home view

## Support
This app was created as part of a coding challenge, and as such, support is limited. However, if you have any questions or feedback about WorldOfPAYBACK, please feel free to reach out to the developer at aliabdelkhalek96@gmail.com.

## License
"WorldOfPAYBACK" is open source and licensed under the MIT license.
