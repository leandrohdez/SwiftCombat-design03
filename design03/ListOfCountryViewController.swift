//
//  ListOfCountryViewController.swift
//  desing03
//
//  Created by Leandro Hernandez on 13/9/15.
//  Copyright (c) 2015 SwiftCombat. All rights reserved.
//

import UIKit

class ListOfCountryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        return cell
    }
    
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
