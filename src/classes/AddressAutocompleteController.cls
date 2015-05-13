/**
* Author:       Ben Edwards (Tquila)
* Date:         12/05/2015
* Description:  Controller for the AddressValidation component
*
* ******************* Change Log *******************
* Modified by       Change Date     Change
* Ben Edwards       12/05/2015      Initial creation.
**/
public with sharing class AddressAutocompleteController {

	// Variables passed through from Component
	public Id recordId {get;set;}
	public String objName {get;set;}

	// Address one details
	public String streetOne {get;set;}
	public String cityOne {get;set;}
	public String stateOne {get;set;}
	public String postalcodeOne {get;set;}
	public String countryOne {get;set;}

	// Whether to include 2nd address
	public Boolean secondAddress {get;set;}

	// ADdress two details
	public String streetTwo {get;set;}
	public String cityTwo {get;set;}
	public String stateTwo {get;set;}
	public String postalcodeTwo {get;set;}
	public String countryTwo {get;set;}

	
	// CONSTRUCTOR
	public AddressAutocompleteController() {}

	// When save method is clicked from page
	public PageReference save() {

		try {
			update obj;
			return new PageReference('/' + obj.Id);
		}
		catch (Exception ex) {

			// Add error to page messages if none already exist. Some would exist if page validation fails, so no need to enter twice
			if (!ApexPages.hasMessages()) {

				ApexPages.addMessages(ex);
			}

			system.debug('### Error saving object: ' + ex);

			// Return null. Error message should be returned via pageMessages on page
			return null;
		}	
	}
	
	// When Cancel method is clicked on page
	public PageReference cancel() {
		return new PageReference('/' + obj.Id);
	}

	// Object for the page
	public sObject obj {

		get {

			if (obj == null) {

				// Build query for address fields
				String objectQuery = 'Select Name,';
				objectQuery += String.isNotBlank(streetOne) ? streetOne + ',' : '';
				objectQuery += String.isNotBlank(cityOne) ? cityOne + ',' : '';
				objectQuery += String.isNotBlank(stateOne) ? stateOne + ',' : '';
				objectQuery += String.isNotBlank(postalcodeOne) ? postalcodeOne + ',' : '';
				objectQuery += String.isNotBlank(countryOne) ? countryOne : '';

				// If there is a 2nd address, add fields to query
				if (secondAddress) {

					objectQuery += ',';
					objectQuery += String.isNotBlank(streetTwo) ? streetTwo + ',' : '';
					objectQuery += String.isNotBlank(cityTwo) ? cityTwo + ',' : '';
					objectQuery += String.isNotBlank(stateTwo) ? stateTwo + ',' : '';
					objectQuery += String.isNotBlank(postalCodeTwo) ? postalCodeTwo + ',' : '';
					objectQuery += String.isNotBlank(countryTwo) ? countryTwo : '';

				}

				// Add object and where clause
				objectQuery += ' From ' + objName + ' Where Id = \'' + recordId + '\'';

				// Execute query for record
				obj = database.query(objectQuery);
			}
			return obj;
		}
		set;

	}
		
}