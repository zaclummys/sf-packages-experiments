@IsTest
private class NotificationServiceTest {
    @IsTest
    static void testPackageName() {
        System.assertEquals('notification-management', NotificationService.packageName());
    }
}
