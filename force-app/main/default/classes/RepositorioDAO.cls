public class RepositorioDAO {
    public static List<Repositorio__c> buscarRepositorios(){
        return [
            SELECT
                Id,
                Name,
                IdExterno__c,
                Estrela__c,
                Fork__c
            FROM
                Repositorio__c
            ORDER BY
                Estrela__c DESC,
                Name
        ];
    }
}
