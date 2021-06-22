//
//  SearchListProtocols.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//  
//

import Foundation
import UIKit

protocol SearchListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SearchListPresenterProtocol? { get set }
    
    func onErrorInputValidation(message: String)
    func onValidInputForm(sf: String)
    func onErrorWebService(error: String)
    func onSuccesDictionaryResponse(data: [AcronymItem])

}

protocol SearchListRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSearchListModule() -> UIViewController
}

protocol SearchListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SearchListViewProtocol? { get set }
    var interactor: SearchListInteractorInputProtocol? { get set }
    var router: SearchListRouterProtocol? { get set }
    
    func viewDidLoad()
    
    func presenterValidateInput(sf: String)
    func presenterRequestDictionary(sf: String)
}


protocol SearchListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SearchListInteractorOutputProtocol? { get set }
    
    func interactorIsValidInput(sf: String)
    func interactorRequestDictionary(sf: String)
    
}

protocol SearchListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func sendErrorInputValidation(message: String)
    func sendFormIsValid(sf: String)
    
    func sendErrorWebService(error: String)
    func sendSuccessResponseDictionary(data: [AcronymItem])
}


