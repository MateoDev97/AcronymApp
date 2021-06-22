//
//  CaronymItemCell.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//

import Foundation
import UIKit


class AcronymItemCell: UITableViewCell {
    
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSince: UILabel!
    
    func configureData(index: Int, data: AcronymItem){
        labelName.text = "\(index+1). \(data.lf)"
        labelSince.text = "Since: \(data.since)"
    }
    
}
