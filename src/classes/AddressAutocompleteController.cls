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
	public String addOnePrefix {get;set;}
	public String addTwoPrefix {get;set;}
	
	// CONSTRUCTOR
	public AddressAutocompleteController() {}

	// When save method is clicked from page
	public PageReference save() {

		try {
			update obj;
			return new PageReference('/' + obj.Id);
		}
		catch (Exception ex) {

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
				objectQuery += addOnePrefix + 'Street,';
				objectQuery += addOnePrefix + 'City,';
				objectQuery += addOnePrefix + 'State,';
				objectQuery += addOnePrefix + 'PostalCode,';
				objectQuery += addOnePrefix + 'Country';

				// If there is a 2nd address, add fields to query
				if (String.isNotBlank(addTwoPrefix)) {

					objectQuery += ',' + addTwoPrefix + 'Street,';
					objectQuery += addTwoPrefix + 'City,';
					objectQuery += addTwoPrefix + 'State,';
					objectQuery += addTwoPrefix + 'PostalCode,';
					objectQuery += addTwoPrefix + 'Country';

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