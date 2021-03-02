trigger RepositorioTrigger on Repositorio__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert){
        RepositorioBO.compartilharRepositorios(Trigger.new);
    }
}