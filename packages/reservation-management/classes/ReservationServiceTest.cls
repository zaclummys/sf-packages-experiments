@IsTest
private class ReservationServiceTest {
    @IsTest
    static void testPackageName() {
        System.assertEquals('reservation-management', ReservationService.packageName());
    }
}
