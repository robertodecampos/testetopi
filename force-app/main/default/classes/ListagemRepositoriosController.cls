public class ListagemRepositoriosController {
    @AuraEnabled
    public static List<RepositorioTO> buscarRepositorios(){
        try {
            List<Repositorio__c> lstRepositorio = RepositorioDAO.buscarRepositorios();

            List<RepositorioTO> lstRepositorioTO = new List<RepositorioTO>();

            for (Repositorio__c objRepositorio : lstRepositorio){
                RepositorioTO objRepositorioTO = new RepositorioTO();

                objRepositorioTO.Id = objRepositorio.Id;
                objRepositorioTO.IdExterno = objRepositorio.IdExterno__c;
                objRepositorioTO.Link = URL.getSalesforceBaseUrl().getHost() + '/' + objRepositorio.Id;
                objRepositorioTO.Nome = objRepositorio.Name;
                objRepositorioTO.Estrelas = objRepositorio.Estrela__c;
                objRepositorioTO.Forks = objRepositorio.Fork__c;

                lstRepositorioTO.add(objRepositorioTO);
            }

            return lstRepositorioTO;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class RepositorioTO {
        @AuraEnabled
        public Id Id { get; set; }

        @AuraEnabled
        public Decimal IdExterno { get; set; }

        @AuraEnabled
        public String Link { get; set; }

        @AuraEnabled
        public String Nome { get; set; }

        @AuraEnabled
        public Decimal Estrelas { get; set; }

        @AuraEnabled
        public Decimal Forks { get; set; }
    }
}
