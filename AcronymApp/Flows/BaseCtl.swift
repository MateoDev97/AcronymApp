//
//  BaseCtl.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//

import Foundation
import UIKit

class BaseViewCtl: UIViewController{
    
    var viewSpinner: UIView?
    
    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setViewStyle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setViewStyle(){}
}
