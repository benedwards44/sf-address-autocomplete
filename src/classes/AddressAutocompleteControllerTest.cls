/**
* Author:       Ben Edwards (Tquila)
* Date:         12/05/2015
* Description:  Test class for the AddressAutocompleteController
*
* ******************* Change Log *******************
* Modified by       Change Date     Change
* Ben Edwards       12/05/2015      Initial creation.
**/
@isTest
public class AddressAutocompleteControllerTest {
	
	// Test ALL method for the controller
	// This test method is really only for test coverage. It's not really "unit testing" the logic
	// This is because the Google callout and validation is done from the VisualForce. Not worth re-implenmenting 
	// in Apex just for testing purposes.
	static testMethod void addressAutocompleteControllerTest() {

		// Instantiate controller
		AddressAutocompleteController testCon = new AddressAutocompleteController();

		// Create Account (this will need additional fields added if validation rules are in place)
		Account testAccount = new Account(
			Name = 'Test Account',
			Phone = 'Test Phone'
		);
		insert testAccount;

		// Set variables (normally passed through from component)
		testCon.recordId 		= testAccount.Id;
		testCon.objName 		= 'Account';

		// Set 1st address details
		testCon.streetOne 		= 'BillingStreet';
		testCon.cityOne 		= 'BillingCity';
		testCon.stateOne 		= 'BillingState';
		testcon.postalcodeOne 	= 'BillingPostalCode';
		testCon.countryOne 		= 'BillingCountry';

		// Set Second Address to true.
		testCon.secondAddress = true;

		// Set 2nd address details
		testCon.streetTwo 		= 'ShippingStreet';
		testCon.cityTwo 		= 'ShippingCity';
		testCon.stateTwo 		= 'ShippingState';
		testcon.postalcodeTwo 	= 'ShippingPostalCode';
		testCon.countryTwo 		= 'ShippingCountry';

		// Assert obj is returned
		system.assertEquals(
			testAccount.Id,
			testCon.obj.get('id'),
			'The object Id in the controller should match the created Account Id.'
		);

		// Test methods
		testCon.cancel();
		testCon.save();

	}

}