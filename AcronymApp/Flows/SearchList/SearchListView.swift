//
//  SearchListView.swift
//  AcronymApp
//
//  Created by Mateo Ortiz on 21/06/21.
//  
//

import Foundation
import UIKit

class SearchListView: BaseViewCtl {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var listAcronyms: [AcronymItem] = []
    
    // MARK: Properties
    var presenter: SearchListPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setViewStyle() {
        searchButton.layer.cornerRadius = 8
        activityIndicator.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)

    }
    
    
    @IBAction func searchAction(_ sender: UIButton) {
        presenter?.presenterValidateInput(sf: textField.text ?? "")
    }
}

extension SearchListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAcronyms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcronymItemCell") as! AcronymItemCell
        cell.configureData(index: indexPath.row, data: listAcronyms[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension SearchListView: SearchListViewProtocol {
    
    // TODO: implement view output methods
    
    func onErrorInputValidation(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onValidInputForm(sf: String) {
        textField.text = ""
        textField.resignFirstResponder()
        activityIndicator.isHidden = false
        presenter?.presenterRequestDictionary(sf: sf)
    }
    
    func onErrorWebService(error: String) {
        activityIndicator.isHidden = true
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onSuccesDictionaryResponse(data: [AcronymItem]) {
        activityIndicator.isHidden = true
        self.listAcronyms = data
        self.tableView.reloadData()
    }
}
