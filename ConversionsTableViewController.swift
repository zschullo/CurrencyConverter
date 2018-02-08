//
//  ConversionsTableViewController.swift
//  LP3_currencyConverter_zschullo
//
//  Created by Zachary Schullo on 12/4/17.
//  Copyright © 2017 assignment2 Zachary Schullo. All rights reserved.
//

import UIKit

class ConversionsTableViewController: UITableViewController {
    
    let conversionTypes = ["Distance - Land", "Distance - Sea", "Currency", "Temperature", "Food", "Speed", "Weight"]
    
    //Declare a constant for the cell reuse identifier we will be using
    let CellIdentifier = "Cell Identifier"
    
    let SegueMyViewController = "MyViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
        
        title = "Conversion Types"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return conversionTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // De-queue reusable cell gives us a UITableViewCell instance
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        cell.textLabel?.text = conversionTypes[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        // Perform our show segue which initiates the segue with the specified identifier from the current ViewController's
        // storyboard file
        if (index == 2) {
            performSegue(withIdentifier: SegueMyViewController, sender: self)
            
        } else {
            print("You selected index: \(index)" )
            
        }
        
        // The following method deselects a given row identified by index path with an option to animate the deselection;
        // here we reset the selection AFTER performing the segue
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == SegueMyViewController {
            
            // Ask the table view for the index path of the currently selected row
            if let indexPath = tableView.indexPathForSelectedRow, let conversionType = conversionTypes[indexPath.row] as? String {
                
                //Set the book property of the destination view controller (BookCoverViewController)
                let destinationViewController = segue.destination as! CurrencyViewController
                
                destinationViewController.conversionType = conversionType
            }
            
        }
    }



}
