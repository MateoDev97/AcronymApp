//
//  RemoteEndPoints.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//

import Foundation

class RemoteEndPoints {
    
    func getMainEndPoint() -> String {
        return "http://www.nactem.ac.uk/software/acromine"
    }
    
    public enum METHODS: String {
        case PATH_DICTIONARY = "/dictionary.py"
        case PATH_DICTIONARY_2 = "/dictionary"
    }
}

