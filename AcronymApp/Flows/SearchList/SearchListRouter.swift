//
//  SearchListRouter.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//  
//

import Foundation
import UIKit

class SearchListRouter: SearchListRouterProtocol {

    class func createSearchListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "SearchListView")
        if let view = navController as? SearchListView {
            let presenter: SearchListPresenterProtocol & SearchListInteractorOutputProtocol = SearchListPresenter()
            let interactor: SearchListInteractorInputProtocol = SearchListInteractor()
            let router: SearchListRouterProtocol = SearchListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchListView", bundle: Bundle.main)
    }
    
}
