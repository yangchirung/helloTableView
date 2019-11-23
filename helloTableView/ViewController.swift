//
//  ViewController.swift
//  helloTableView
//
//  Created by MBP_JackYang on 2019/11/23.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    var content:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDefault = UserDefaults.standard
        if let allContent = userDefault.value(forKey: "content") as? [[String:String]] {
            content = allContent
            print(content.count)
        }
    }

    @IBAction func addA(_ sender: Any) {
//        print(nameField.text)
//        print(phoneField.text)
        if let name = nameField.text,
            let phone = phoneField.text{
            
            nameField.text = ""
            phoneField.text = ""
            
            let data = ["name":name, "phone":phone]
            content.append(data)
            let userDefault = UserDefaults.standard
            userDefault.set(content, forKey: "content")
            userDefault.synchronize()
            
        }
    }
    
}

