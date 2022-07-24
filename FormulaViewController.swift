//
//  FormulaViewController.swift
//  Wolfram-Omega
//
//  Created by Ayesha Nabiha on 7/17/18.
//  Copyright © 2018 Ayesha Nabiha. All rights reserved.
//

import UIKit

class FormulaViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    var formulas = [UIImage?]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //this set of code makes the back button look nicer
        backButton.layer.cornerRadius = 15
        backButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        backButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        backButton.layer.shadowOpacity = 1.0
        backButton.layer.shadowRadius = 0.0
        backButton.layer.masksToBounds = false
        
        backButton.layer.cornerRadius = 15
        backButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha: 0.25).cgColor
        backButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        backButton.layer.shadowOpacity = 1.0
        backButton.layer.shadowRadius = 0.0
        backButton.layer.masksToBounds = false
        
        tableView.reloadData()
        
    }
    
    @IBAction func dismissFormulaView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func getArray(array: [UIImage?]){
        formulas = array
        print(formulas)
    }
    func addNewVariable() {
        let indexPath = IndexPath(row: formulas.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)

        tableView.reloadData()
        tableView.dequeueReusableCell(withIdentifier: "Variable", for: indexPath)
    }


}

extension FormulaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FormulaTableViewCell", for: indexPath) as! FormulaTableViewCell
        print(formulas.count)
        let formula = formulas[indexPath.row]
        cell.formulaImage.image = formula
        
        return cell
    }
    
    func tableView(_tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            formulas.remove(at: indexPath.row)
        }
    }
    
    //sets the height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0;
    }
}



