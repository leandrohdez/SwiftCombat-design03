//
//  SignInSMSViewController.swift
//  desing03
//
//  Created by Leandro Hernandez on 12/9/15.
//  Copyright (c) 2015 SwiftCombat. All rights reserved.
//

import UIKit


class SignInSMSViewController: UITableViewController {


    var titleHeaderLabel    = UILabel()
    var titleFooterLabel    = UILabel()
    
    var countryCodeTextField    = UITextField()
    var phoneNumberTextField    = UITextField()
    
    var flagWaitingForEnterCode = false
    
    
    // MARK: - View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign in"
        
        // Custom NavigationBar
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(21)]
        self.navigationController?.navigationBar.shadowImage = ImageWithColor(UIColorFromRGB(0xebb400))
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.setBackgroundImage(ImageWithColor(UIColorFromRGB(0xebb400)), forBarMetrics: UIBarMetrics.Default)
       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("nextAction"))
        
        // configura tableview
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.scrollEnabled = false
        self.tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 80))
        self.tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 80))
        
        // title text
        self.titleHeaderLabel = UILabel(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.tableHeaderView!.frame), CGRectGetHeight(self.tableView.tableHeaderView!.frame)))
        self.titleHeaderLabel.text = "Your phone"
        self.titleHeaderLabel.textAlignment = NSTextAlignment.Center
        self.titleHeaderLabel.textColor = UIColorFromRGB(0x292929)
        self.titleHeaderLabel.font = UIFont.systemFontOfSize(20)
        self.tableView.tableHeaderView!.addSubview(self.titleHeaderLabel)
        
        // title footer text
        self.titleFooterLabel = UILabel(frame: CGRectMake(20, 0, CGRectGetWidth(self.tableView.tableFooterView!.frame)-40, CGRectGetHeight(self.tableView.tableFooterView!.frame)))
        self.titleFooterLabel.text = "Enter your phone number to validate your account"
        self.titleFooterLabel.numberOfLines = 0
        self.titleFooterLabel.textAlignment = NSTextAlignment.Center
        self.titleFooterLabel.textColor = UIColorFromRGB(0xc8c8c8)
        self.titleFooterLabel.font = UIFont.systemFontOfSize(15)
        self.tableView.tableFooterView!.addSubview(self.titleFooterLabel)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.countryCodeTextField.becomeFirstResponder()
    }

    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.flagWaitingForEnterCode == true) ? 1 : 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        if self.flagWaitingForEnterCode == false {
            
            // I will use the "tag" property to avoid repeating the cell construction
            if cell.tag == 0 {
                
                if indexPath.row == 0 {
                    // line separator in the first cell
                    cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                    
                    cell.textLabel!.text = "China"
                }
                
                if indexPath.row == 1 {
                    // selection cell
                    cell.selectionStyle = UITableViewCellSelectionStyle.None
                    
                    // custom cell
                    // horizontal line separator
                    var lineHorizontalSeparator = UIImageView(frame: CGRectMake(90, 0, 1, CGRectGetHeight(cell.frame)))
                    lineHorizontalSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
                    cell.addSubview(lineHorizontalSeparator)
                    
                    self.countryCodeTextField = UITextField(frame: CGRectMake(16, 5, 64, CGRectGetHeight(cell.frame)-10))
                    self.countryCodeTextField.placeholder = "+00"
                    self.countryCodeTextField.keyboardType = UIKeyboardType.NumberPad
                    cell.addSubview(self.countryCodeTextField)
                    
                    self.phoneNumberTextField = UITextField(frame: CGRectMake(CGRectGetMaxX(lineHorizontalSeparator.frame)+10, 5, CGRectGetWidth(cell.frame)-CGRectGetMaxX(lineHorizontalSeparator.frame)-20, CGRectGetHeight(cell.frame)-10))
                    self.phoneNumberTextField.placeholder = "Your phone number"
                    self.phoneNumberTextField.keyboardType = UIKeyboardType.NumberPad
                    cell.addSubview(self.phoneNumberTextField)
                }
                
                // line separator
                var lineSeparator = UIImageView(frame: CGRectMake(0, CGRectGetHeight(cell.frame)-1, CGRectGetWidth(self.tableView.frame), 1))
                lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
                cell.addSubview(lineSeparator)
                
                if indexPath.row == 0 {
                    lineSeparator = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 1))
                    lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
                    cell.addSubview(lineSeparator)
                }
                
                cell.tag = 1
            }
        }
        else {
            // I will use the "tag" property to avoid repeating the cell construction
            if cell.tag == 0 {
                cell.textLabel?.text = "Enter code"
            }
            
            // line separator
            var lineSeparator = UIImageView(frame: CGRectMake(0, CGRectGetHeight(cell.frame)-1, CGRectGetWidth(self.tableView.frame), 1))
            lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
            cell.addSubview(lineSeparator)
            
            lineSeparator = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 1))
            lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
            cell.addSubview(lineSeparator)
        
            cell.tag = 1
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 52
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("segueListOfCountIdentifier", sender: nil)
        }
    }
    
    
    // tambien ahacer asi...
    // para ver los iconos del status bar en blanco
    // el icono verde de la bateria solo se ve verde mientras este conectado el telefono cargando
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default;
    }

    
    // MARK: - Actions
    func backAction () {
        // update flag
        self.flagWaitingForEnterCode = false
        
        // botones en la barra
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("nextAction"))
        
        // reload view
        self.tableView.reloadData()
    }
    
    func nextAction () {
        // update flag
        self.flagWaitingForEnterCode = true
        
        // botones en la barra
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("backAction"))
        self.navigationItem.rightBarButtonItem = nil
        
        // reload view
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
