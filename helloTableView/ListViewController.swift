//
//  ListViewController.swift
//  helloTableView
//
//  Created by MBP_JackYang on 2019/11/23.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
    }
    
    //Mark : tableview datasource & delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = UIColor.red
        return cell
    }
   

}
