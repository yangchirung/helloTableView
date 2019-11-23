//
//  DetailViewController.swift
//  helloTableView
//
//  Created by MBP_JackYang on 2019/11/23.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var lastVC:ListViewController? = nil
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = false
        if let index = lastVC?.tableview.indexPathForSelectedRow?.row {
            let data = lastVC?.content[index]
            name.text = data?["name"]
            tel.text = data?["phone"]
            
        }
        
    }
    

    
    @IBAction func deleteA(_ sender: Any) {
        if let index = lastVC?.tableview.indexPathForSelectedRow?.row{
            lastVC?.content.remove(at: index)
            
            let userDefault = UserDefaults.standard
            userDefault.set(lastVC!.content, forKey: "content")
            userDefault.synchronize()

            navigationController?.popViewController(animated: true)
        }
    }
    
}
