//
//  RemoteDataManager.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteDataManager {
    
    static func mainCallApi(method: HTTPMethod, path: RemoteEndPoints.METHODS, extraPath: String = "", params: Parameters = [:], body: JSON = [], jsonHeaders: Bool = false, callbackSuccess: @escaping (JSON) -> (), callbackFail: @escaping (AnyObject) -> ()) {
            
        
        var url = URL(string: RemoteEndPoints().getMainEndPoint()+path.rawValue)!
        if (extraPath != ""){
            url = URL(string: RemoteEndPoints().getMainEndPoint()+path.rawValue+extraPath)!
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if (!body.isEmpty){
            print("*** BODY *** \n\(body)\n")
            urlRequest.httpBody = body.rawString()!.data(using: .utf8)
        }
        if (jsonHeaders){
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        print("*** URL REQUEST *** \n\(urlRequest)\n")
        
        var request = AF.request(urlRequest)
        if (method == .get && !params.isEmpty){
            request = AF.request(url, method: method, parameters: params)
        }
        
        request.responseJSON { response in
                switch response.result {
                    case .success(let value):
                        let responseJSON = JSON(value)
                        print("*** RESPONSE SUCCESS *** \n\(responseJSON)\n")
                        callbackSuccess(responseJSON)
                   case .failure(let error):
                    print("*** RESPONSE ERROR *** \n\(error)\n")
                        callbackFail(error as AnyObject)
                }
        }
    }
    
    
    
}
