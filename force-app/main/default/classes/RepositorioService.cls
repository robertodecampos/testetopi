public class RepositorioService {
    public static List<RepositorioServiceTO.RepositorioTO> buscarRepositorios(){
        HttpRequest objHttpRequest = new HttpRequest();
        objHttpRequest.setEndpoint('https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1');
        objHttpRequest.setMethod('GET');

        HttpResponse objHttpResponse = new Http().send(objHttpRequest);
        
        if (objHttpResponse.getStatusCode() == 200){
            return ((RepositorioServiceTO.BuscaRepositoriosTO)JSON.deserialize(objHttpResponse.getBody(), RepositorioServiceTO.BuscaRepositoriosTO.class)).items;
        } else {
            throw new RepositorioServiceException('Ocorreu um erro ao atualizar a listagem de repositórios');
        }
    }

    public class RepositorioServiceException extends Exception { }
}
