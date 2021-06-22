//
//  SearchListPresenter.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//  
//

import Foundation

class SearchListPresenter  {
    
    // MARK: Properties
    weak var view: SearchListViewProtocol?
    var interactor: SearchListInteractorInputProtocol?
    var router: SearchListRouterProtocol?
    
}

extension SearchListPresenter: SearchListPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func presenterValidateInput(sf: String) {
        interactor?.interactorIsValidInput(sf: sf)
    }
    
    func presenterRequestDictionary(sf: String) {
        interactor?.interactorRequestDictionary(sf: sf)
    }
}

extension SearchListPresenter: SearchListInteractorOutputProtocol {
    
    
    // TODO: implement interactor output methods
    func sendErrorInputValidation(message: String) {
        view?.onErrorInputValidation(message: message)
    }
    
    func sendFormIsValid(sf: String) {
        view?.onValidInputForm(sf: sf)
    }
    
    func sendErrorWebService(error: String) {
        view?.onErrorWebService(error: error)
    }
    
    func sendSuccessResponseDictionary(data: [AcronymItem]) {
        view?.onSuccesDictionaryResponse(data: data)
    }
}
