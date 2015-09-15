//
//  SignInSMSViewController.swift
//  desing03
//
//  Created by Leandro Hernandez on 12/9/15.
//  Copyright (c) 2015 SwiftCombat. All rights reserved.
//

import UIKit


class SignInSMSViewController: UITableViewController, UITextFieldDelegate {


    var titleHeaderLabel    = UILabel()
    var titleFooterLabel    = UILabel()
    
    var countryCodeTextField    = UITextField()
    var phoneNumberTextField    = UITextField()
    var smsCodeTextField        = UITextField()
    
    var flagWaitingForEnterCode = false
    
    // data
    var countrySelected: NSDictionary? = nil
    
    
    // MARK: - View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sign in"
        
        // Custom NavigationBar
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(21)]
        self.navigationController?.navigationBar.shadowImage = ImageWithColor(UIColorFromRGB(0xebb400))
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.setBackgroundImage(ImageWithColor(UIColorFromRGB(0xebb400)), forBarMetrics: UIBarMetrics.Default)
       self.navigationController?.navigationBar.translucent = false
        
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
        
        if self.countryCodeTextField.text == "" {
            self.countryCodeTextField.becomeFirstResponder()
        }
        else {
            self.phoneNumberTextField.becomeFirstResponder()
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.flagWaitingForEnterCode == true) ? 1 : 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if self.flagWaitingForEnterCode == false {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("reuseSignInIdentifier", forIndexPath: indexPath) as! UITableViewCell
            
            // I will use the "tag" property to avoid repeating the cell construction
            if cell.tag == 0 {
                
                if indexPath.row == 0 {
                    // line separator in the first cell
                    cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
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
                    self.countryCodeTextField.delegate = self
                    cell.addSubview(self.countryCodeTextField)
                    
                    self.phoneNumberTextField = UITextField(frame: CGRectMake(CGRectGetMaxX(lineHorizontalSeparator.frame)+10, 5, CGRectGetWidth(cell.frame)-CGRectGetMaxX(lineHorizontalSeparator.frame)-20, CGRectGetHeight(cell.frame)-10))
                    self.phoneNumberTextField.placeholder = "Your phone number"
                    self.phoneNumberTextField.keyboardType = UIKeyboardType.NumberPad
                    self.phoneNumberTextField.delegate = self
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
            
            // always exec
            if indexPath.row == 0 {
                cell.textLabel!.text = (self.countrySelected != nil) ? self.countrySelected!.valueForKey("name") as! String : ""
            }
            if indexPath.row == 1 {
                var code = (self.countrySelected != nil) ? self.countrySelected!.valueForKey("code") as! String : ""
                self.countryCodeTextField.text = (code != "") ? "+\(code)" : ""
            }
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("reuseEnterCodeIdentifier", forIndexPath: indexPath) as! UITableViewCell
            
            // I will use the "tag" property to avoid repeating the cell construction
            if cell.tag == 0 {
                self.smsCodeTextField = UITextField(frame: CGRectMake(10, 5, CGRectGetWidth(cell.frame)-20, CGRectGetHeight(cell.frame)-10))
                self.smsCodeTextField.placeholder = "Code"
                self.smsCodeTextField.textAlignment = NSTextAlignment.Center
                self.smsCodeTextField.keyboardType = UIKeyboardType.NumberPad
                cell.addSubview(self.smsCodeTextField)
            }
            
            // line separator
            var lineSeparator = UIImageView(frame: CGRectMake(0, CGRectGetHeight(cell.frame)-1, CGRectGetWidth(self.tableView.frame), 1))
            lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
            cell.addSubview(lineSeparator)
            
            lineSeparator = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 1))
            lineSeparator.image = ImageWithColor(UIColorFromRGB(0xeaeaea))
            cell.addSubview(lineSeparator)
        
            cell.tag = 1
            
            return cell
        }
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
        return UIStatusBarStyle.Default
    }

    
    // MARK: - Actions
    func backAction () {
        // update flag
        self.flagWaitingForEnterCode = false
        
        // botones en la barra
        self.navigationItem.leftBarButtonItem = nil
        
        // new title
        self.flipAnimateTitle("Your phone")
        self.titleFooterLabel.text = "Enter your phone number to validate your account"
        
        // reload view
        self.tableView.reloadData()
        
        let seconds = 0.4
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            self.phoneNumberTextField.becomeFirstResponder()
        })
    }
    
    func nextAction () {
        if self.flagWaitingForEnterCode == false {
            // update flag
            self.flagWaitingForEnterCode = true
            
            // botones en la barra
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("backAction"))
            
            // new title
            self.flipAnimateTitle("Enter code")
            self.titleFooterLabel.text = "Verification code sent"
            
            // reload view
            self.tableView.reloadData()
            
            // limpio el campo code
            self.smsCodeTextField.text = ""
            
            let seconds = 0.4
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.smsCodeTextField.becomeFirstResponder()
            })
        }
    }

    
    // Useful methods
    func flipAnimateTitle(title: String) {
        var layer:CALayer = self.titleHeaderLabel.layer
        var rotationAndPerspectiveTransform: CATransform3D = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = 1.0 / -1000
        
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(M_PI/2), CGFloat(1), CGFloat(0), CGFloat(0))
        
        layer.transform = rotationAndPerspectiveTransform
        
        self.titleHeaderLabel.text = title
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            layer.transform = CATransform3DIdentity
        })
    }
    
    
    // MARK: - TextFields Delegates & Formater
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var performChange = true
        
        var newLength = (textField.text as NSString).length + (string as NSString).length - range.length
        
        // determina si se esta borrando
        var deleting: Bool = false
        var char = string.cStringUsingEncoding(NSUTF8StringEncoding)
        if (range.length==1 && (string as NSString).length == 0){
            // then is backspace
            deleting = true
        }
        
        // Phone Number Field
        if(textField == self.phoneNumberTextField){
            performChange = self.formatterPhoneNumber(textField, range: range, deleting: deleting) as Bool
        }
        
        // Country Code Field
        if (textField == self.countryCodeTextField){
            performChange = self.formatterCountryCode(textField, range: range, deleting: deleting) as Bool
        }
        
        return performChange
    }
    
    
    func formatterPhoneNumber(textField: UITextField, range: NSRange, deleting: Bool) -> Bool {
        
        var performChange = true
        
        var separatorFormatter: String = " "
        var string: NSString = textField.text
        
        var realString: NSString = string.stringByReplacingOccurrencesOfString(separatorFormatter as String, withString: "")
        var len = realString.length
        var resultString = string
        
        if(deleting == false){
            // muy largo
            if (string.length > 14) {
                performChange = false
            }
            else if(len == 3 || len == 6 || len == 9 || len == 12) {
                resultString = (string as String) + (separatorFormatter as String)
            }
        }
        else{
            // para cuando estoy borrando
            var index = string.length - 2
            var lastChar = ""
            if (index > 0) {
                lastChar = string.substringWithRange(NSMakeRange(index, 1))
            }
            
            // si el ultimo caracter es un espacio lo borro
            if(lastChar == separatorFormatter){
                var string1 = string.substringToIndex(index+1)
                resultString = string1
            }
            else if (range.location != index+1) {
                resultString = string.substringToIndex(string.length-1)
                performChange = false
            }
            else{
                resultString = string
            }
        }
        
        textField.text = resultString as String
        
        return performChange
    }
    
    
    func formatterCountryCode(textField: UITextField, range: NSRange, deleting: Bool) -> Bool {
        
        var performChange = true
        
        var separatorFormatter: String = "+"
        var string: NSString = textField.text
        
        var realString: NSString = string.stringByReplacingOccurrencesOfString(separatorFormatter as String, withString: "")
        var len = realString.length
        var resultString = string
        
        if(deleting == false){
            if(len == 0) {
                resultString = (string as String) + (separatorFormatter as String)
            }
            // muy largo
            if (string.length > 3) {
                performChange = false
            }
        }
        else{
            // para cuando estoy borrando
            var index = string.length - 2
            var lastChar = ""
            if (index > 0) {
                lastChar = string.substringWithRange(NSMakeRange(index, 1))
            }
            
            var stringWillBeDeleted = string.substringWithRange(range)
            
            // si el ultimo caracter es un + lo borro
            if(lastChar == separatorFormatter || realString.length == 1){
                var string1 = string.substringToIndex(index+1)
                resultString = string1
            }
            else if (stringWillBeDeleted == separatorFormatter) {
                resultString = string
                performChange = false
            }
            else{
                resultString = string
            }
        }
        
        textField.text = resultString as String
        
        let delayInSeconds = 0.5
        var dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            var indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        })
        
        return performChange
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueListOfCountIdentifier" {
            
            // BLOCK
            let controller = segue.destinationViewController as! ListOfCountryViewController
            controller.didSelect = { (index: NSDictionary) -> Void in
                self.countrySelected = index
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
