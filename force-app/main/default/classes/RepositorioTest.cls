@isTest
private class RepositorioTest {
    @isTest
    static void buscarRepositorioTest(){
        StaticResourceCalloutMock objMock = new StaticResourceCalloutMock();
        objMock.setStaticResource('BuscaRepositorioMock');
        objMock.setStatusCode(200);
        
        Test.setMock(HttpCalloutMock.class, objMock);

        Test.startTest();
        RepositorioBO.atualizarRepositorios();
        Test.stopTest();

        System.assertEquals(2, 
            [
                SELECT
                    Id
                FROM Repositorio__c
            ].size()
        );
    }

    @isTest
    static void compartilharRepositorioTest(){
        Repositorio__c objRepositorio = new Repositorio__c(
            Name = 'Projeto teste',
            Estrela__c = 10,
            Fork__c = 5,
            IdExterno__c = 123
        );

        Test.startTest();
        insert objRepositorio;
        Test.stopTest();

        User objUsuario = UserDAO.buscarPorNome('Integration User');

        List<Repositorio__Share> lstCompartilhamento = [SELECT Id FROM Repositorio__Share WHERE ParentId = :objRepositorio.Id AND UserOrGroupId = :objUsuario.Id];

        System.assertEquals(1, lstCompartilhamento.size());
    }
}
