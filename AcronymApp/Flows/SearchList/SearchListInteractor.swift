//
//  SearchListInteractor.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//  
//

import Foundation
import Alamofire

class SearchListInteractor: SearchListInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: SearchListInteractorOutputProtocol?
    
    func interactorIsValidInput(sf: String) {
        if sf.isEmpty{
            presenter?.sendErrorInputValidation(message: "You must to fill the field to search an acronym.")
        }else{
            presenter?.sendFormIsValid(sf: sf)
        }
    }
    
    func interactorRequestDictionary(sf: String) {
        let params: Parameters = ["sf": sf]
        RemoteDataManager.mainCallApi(method: .get, path: .PATH_DICTIONARY, params: params, callbackSuccess: { response in
            
            var listAcronyms: [AcronymItem] = []
            if (response.arrayValue.count >= 1){
                for item in response.arrayValue[0]["lfs"].arrayValue{
                    listAcronyms.append(
                        AcronymItem(
                            lf: item["lf"].stringValue,
                            since: item["since"].stringValue,
                            freq: item["freq"].stringValue
                        )
                    )
                }
                
                self.presenter?.sendSuccessResponseDictionary(data: listAcronyms)
                
            }else{
                self.presenter?.sendErrorWebService(error: "No resoults found.")
            }
            
        }, callbackFail: { failure in
            self.presenter?.sendErrorWebService(error: "Error in web service, please try again later.")
            
        })
    }

}
