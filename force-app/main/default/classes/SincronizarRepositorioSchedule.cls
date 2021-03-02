global class SincronizarRepositorioSchedule implements Schedulable, Database.AllowsCallouts {
    global void execute(SchedulableContext objSchedulableContext) {
       RepositorioBO.atualizarRepositorios();
    }
}
