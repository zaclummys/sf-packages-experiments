@IsTest
private class CoreServiceTest {
    @IsTest
    static void testPackageName() {
        System.assertEquals('core', CoreService.packageName());
    }
}
