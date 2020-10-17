//
//  PopOverViewController.swift
//  MDBProject2
//
//  Created by Kanu Grover on 10/15/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit
 
class PopOverViewController: UIViewController, SendingDataDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func sendArraytoPreviousVC(myArray: [Int?], row: Int) {
        lowerBound[row] = myArray[0] ?? 0
        upperBound[row] = myArray[1] ?? 999
        tableView.reloadData()
    }
    
    var lowerBound = [0, 0, 0, 0, 0, 0]
    var upperBound = [999, 999, 999, 999, 999, 999]
 
    @IBOutlet weak var Popupview: UIView!
    
    @IBOutlet weak var tableView: UITableView!
        
    var names: [String] = ["Speed", "Attack", "HP", "Defense", "Special Defense", "Special Attack"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
     
        Popupview.layer.cornerRadius = 10
        Popupview.layer.masksToBounds = true
 
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Attribute Filters"
    }
    
    
    // Returns count of items in tableView
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count;
    }
    
    
    // Select item from tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "changeRange", sender: cell)
  
    }
    
    //Assign values for tableView
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath) as! AttributeTableCell
        cell.textLabel?.text = names[indexPath.row]
        cell.lower = lowerBound[indexPath.row]
        cell.upper = upperBound[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeRange" {
            if let destination = segue.destination as? AttributeBoundViewController {
                destination.attribute = names[tableView.indexPathForSelectedRow!.row]
                destination.row = tableView.indexPathForSelectedRow!.row
                destination.mDelegate = self
            }
        }
    }
    
    @IBAction func dismissPopover(_ sender: Any) {
        popDelegate?.sendBoundstoPreviousVC(lower: lowerBound, upper: upperBound)
        dismiss(animated: true, completion: nil)
    }

    weak var popDelegate: SendingDataDelegate?
}


