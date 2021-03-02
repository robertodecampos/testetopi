public class RepositorioBO {
    @future(callout=true)
    public static void atualizarRepositorios() {
        List<RepositorioServiceTO.RepositorioTO> lstRepositorioTO = RepositorioService.buscarRepositorios();

        List<Repositorio__c> lstRepositorio = new List<Repositorio__c>();

        for (RepositorioServiceTO.RepositorioTO objRepositorioTO : lstRepositorioTO){
            lstRepositorio.add(
                new Repositorio__c(
                    Name = objRepositorioTO.name,
                    IdExterno__c = objRepositorioTO.id,
                    Estrela__c = objRepositorioTO.stargazers_count,
                    Fork__c = objRepositorioTO.forks_count
                )
            );
        }

        if (!lstRepositorio.isEmpty()){
            upsert lstRepositorio IdExterno__c;
        }
    }

    public static void compartilharRepositorios(List<Repositorio__c> lstRepositorios){
        List<Repositorio__Share> lstCompartilhamentos = new List<Repositorio__Share>();
        User objUsuario = UserDAO.buscarPorNome('Integration User');

        for (Repositorio__c objRepositorio : lstRepositorios){
            lstCompartilhamentos.add(
                new Repositorio__Share(
                    ParentId = objRepositorio.Id,
                    UserOrGroupId = objUsuario.Id,
                    AccessLevel = 'Edit'
                )
            );
        }

        insert lstCompartilhamentos;
    }
}
