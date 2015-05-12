# Salesforce Address Autocomplete

This package includes components to enable address autocomplete for objects in Salesforce using the Google Places API.

This current package includes functionality for the following standard objects:
- Account
- Contact
- Lead

To add additional objects, simply copy the existing VisualForce pages, set the component parameters and create a Custom Button for the page.

If looking to implement this package, be sure to read the Terms of Service for the Google Places API:
https://developers.google.com/maps/terms

And the usage limits:
https://developers.google.com/places/webservice/usage

## Installation

1. Deploy this package to a Salesforce environment
2. Sign up for a Google Account and obtain your API key (https://code.google.com/apis/console), and enable the Places API.
3. Put your Google API key in the custom settings
