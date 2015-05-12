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
2. Sign up for a Google Account and obtain your API key (https://code.google.com/apis/console), and enable the Google Maps JavaScript API v3.
3. Put your Google API key in the Address Autocomplete custom setting
4. Add Address Autocomplete buttons to page layouts as required

## Screenshots

![Screenshot](http://i.imgur.com/8j0AGas.png)

## Limits

This application is bound by the Google Terms of Service, and it's associated limits. These are also subject to change, so it's worth understanding this before imeplementing on any enterprise wide projects. Generally speaking, those Terms of Service that impact a Salesforce implementation are:
- 1,000 address validations per day, or 150k per day for a paid service (ask Google for pricing)
- You cannot use the free service if "Your site is only accessible within your company or on your intranet.". This is ultimately the deal-breaker for use within Salesforce. Contact Google to get pricing for the Google Maps for Work API.
