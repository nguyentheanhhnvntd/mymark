//
//  SubjectTableViewController.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/15/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SubjectTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var showSubjects: [Subject]!
    var allSubjects: [Subject]!
    
    var listResultName: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    
    func getInfo() {
        allSubjects = FileIO.readSubjects()
        showSubjects = allSubjects
        for subject in allSubjects {
            listResultName.append(subject.name)
//            FirebaseDataService.saveSubject(subject: subject)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        disableSearchBar()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldEndEditing")
        disableSearchBar()
        search()
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing")
        disableSearchBar()
        search()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange")
        search()
    }
    
    func disableSearchBar() {
        print("disableSearchBar original")
        searchBar.resignFirstResponder()
        print(searchBar.isFocused, searchBar.isFirstResponder)
    }
    
    func search() {
        
        guard let searchText = searchBar.text else {
            return
        }
        
        if searchText.characters.count == 0 {
            showSubjects = allSubjects
            tableView.reloadData()
            return
        }
        
        let resultName = Util.search(searchText: searchText, listResult: listResultName)
        
        showSubjects = allSubjects.filter({resultName.contains($0.name)})
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return showSubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectTableViewCell
        
        cell.tag = indexPath.row
        let subject = showSubjects[indexPath.row]
        cell.subject.text = subject.name
        cell.scoreTen.text = String(subject.finalPoint.pointTen)
        cell.scoreFour.text = String(subject.finalPoint.pointFour)
        cell.scoreC.text = String(subject.finalPoint.pointC)
        let tapGeture = UITapGestureRecognizer(target: self, action: #selector(click(_:)))
        cell.addGestureRecognizer(tapGeture)
        return cell
    }
    
    func click(_ sender: UITapGestureRecognizer){
        disableSearchBar()
        guard sender.view != nil else {
            return
        }
        let subjectDialog = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Subject Info Dialog") as! SubjectInfoDialog
        subjectDialog.modalPresentationStyle = .overCurrentContext
        subjectDialog.subject = showSubjects[(sender.view?.tag)!]
        self.present(subjectDialog, animated: true, completion: nil)
    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension UIViewController {
    func showAlert(_ message: String) {
        view.endEditing(true)
        let alertController = UIAlertController(title: "MyMark App", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        print(message)
        self.present(alertController, animated: true, completion: nil)
    }
}
