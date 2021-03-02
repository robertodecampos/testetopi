import { LightningElement } from 'lwc';
import buscarRepositorios from '@salesforce/apex/ListagemRepositoriosController.buscarRepositorios'

export default class ListagemRepositorios extends LightningElement {
    repositorios;
    isLoading = true;

    connectedCallback(){
        buscarRepositorios().then(
            (repositorios) => {
                this.repositorios = repositorios;
                this.isLoading = false;
            }
        ).catch(
            () => {
                this.isLoading = false;
            }
        )
    }

   get colunas(){
        return [
            { label: 'Nome', fieldName: 'Link', type: 'url', typeAttributes: { tooltip: { fieldName: 'Nome' }, label: { fieldName: 'Nome' } } },
            { label: 'Estrelas', fieldName: 'Estrelas', type: 'number' },
            { label: 'Forks', fieldName: 'Forks', type: 'phone' }
        ];
    }
}