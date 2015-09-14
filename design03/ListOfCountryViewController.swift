//
//  ListOfCountryViewController.swift
//  desing03
//
//  Created by Leandro Hernandez on 13/9/15.
//  Copyright (c) 2015 SwiftCombat. All rights reserved.
//

import UIKit

class ListOfCountryViewController: UITableViewController {

    var countryList = NSArray()
    
    var didSelect: ((index: NSDictionary)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Country codes"
        
        self.countryList = getCountryDictionaryArray()
        self.tableView.reloadData()
    }


    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        var item: NSDictionary = self.countryList.objectAtIndex(indexPath.row) as! NSDictionary
        
        // name of country
        cell.textLabel!.text = item.valueForKey("name") as? String
        
        // code of country
        var code = item.valueForKey("code") as! String
        
        // iso region
        var region = item.valueForKey("region") as! String
        
        
        cell.detailTextLabel!.text = "+(\(code)) - \(region)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var item: NSDictionary = self.countryList.objectAtIndex(indexPath.row) as! NSDictionary
        self.didSelect!(index: item)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    // MARK: ?
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
