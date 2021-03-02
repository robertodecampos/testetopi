@isTest
private class ListagemRepositoriosTest {
    @isTest
    static void buscarRepositorioTest(){
        insert new List<Repositorio__c>{
            new Repositorio__c(
                Name = 'Projeto teste',
                Estrela__c = 10,
                Fork__c = 5,
                IdExterno__c = 123
            )
        };

        Test.startTest();
        List<ListagemRepositoriosController.RepositorioTO> lstRepositorio = ListagemRepositoriosController.buscarRepositorios();
        Test.stopTest();

        System.assertEquals(1, lstRepositorio.size());
    }
}
