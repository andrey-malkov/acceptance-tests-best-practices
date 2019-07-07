Given 'Accounts migration project for source and target tenants does not exist' {
    $accountsProject = Get-ProjectsByTenants -type "activedirectory" `
        -orgId $global:CONFIG.OrganizationId `
        -srcTenant $TestContext.Tenants.Source -tgtTenant $TestContext.Tenants.Target `
        -apiBaseUrl $global:CONFIG.AccountMigrationQmmpUrl |
        Select-Object -first 1
    $accountsProject | Should -BeNullOrEmpty -Because "Account migration project should not exist for this test case"
}