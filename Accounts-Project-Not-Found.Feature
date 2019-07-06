@ERRORS-HANDLING
Feature: Inform a migration operator of Accounts migration project does not exist issue

Background: xCloud tenants are configured
    Given The tenants are added using Tenants management page
	| Tenant                           | Admin  | Id                                   | Consent    |
	| msteamsalin.onmicrosoft.com	   | odmmst | 856ad5a2-c756-44c7-a4de-a56723367c1a | granted	|
	| elaverev.onmicrosoft.com         | odmmst | 3d56f088-b2c3-408e-8d4b-3522f290f85e | granted	|

Scenario: Accounts migration project for source and target tenants does not exist
    Given Teams Accounts Provisioning migration project is created
        """
        Source = msteamsalin.onmicrosoft.com
        Target = elaverev.onmicrosoft.com
        """
    And Accounts migration project for source and target tenants does not exist
    And Next teams are going to be processed by Provision task of provisionteams type
    |Name |State        |TeamStatus |Workflow      |LastOperation |
    |East |In Progress  |In Progress|Discovered    |Discovered    |
    When Open migration/accounts dashboard
    And Open Tasks view by project ID
    Then The Provision task is in the Tasks list
        """
        State = Failed
        Type = Provision
        Created = Today
        Operation = No relevant Account Migration project found
        """