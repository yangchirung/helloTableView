//
//  ListViewController.swift
//  helloTableView
//
//  Created by MBP_JackYang on 2019/11/23.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    var content = [["name":"Danny","phone":"12345678"],
//                   ["name":"Jack","phone":"88888888"]
//                  ]
    var content:[[String:String]] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
        
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        tableview.reloadData()
        self.navigationController?.navigationBar.isHidden = true
        
        let userDefault = UserDefaults.standard
        if let allContent = userDefault.value(forKey: "content") as? [[String:String]] {
            content = allContent
        }
        
        content.sort { (a, b) -> Bool in
            return a["name"]! < b["name"]!
        }
        
        tableview.reloadData()
    }
    
    //Mark : tableview datasource & delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//        return 10000
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
//        cell.backgroundColor = UIColor.yellow
//        cell.textLabel?.text = "test\(indexPath.row)"
//        return cell
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cCell")
//        return cell ?? UITableViewCell()
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cCell") as! MyTableViewCell
//        cell.nameLabel.text = "\(indexPath.row)"
        cell.nameLabel.text = content[indexPath.row]["name"]
        cell.phoneLabel.text = content[indexPath.row]["phone"]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 125
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "goDetail":
            let nextVC = segue.destination as!  DetailViewController
            nextVC.lastVC = self
        default:
            break;
        }
    }
   

}
