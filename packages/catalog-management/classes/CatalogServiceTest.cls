@IsTest
private class CatalogServiceTest {
    @IsTest
    static void testPackageName() {
        System.assertEquals('catalog-management', CatalogService.packageName());
    }
}
