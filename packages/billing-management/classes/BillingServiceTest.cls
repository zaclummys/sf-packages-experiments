@IsTest
private class BillingServiceTest {
    @IsTest
    static void testPackageName() {
        System.assertEquals('billing-management', BillingService.packageName());
    }
}
