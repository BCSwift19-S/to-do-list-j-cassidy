//
//  ViewController.swift
//  To-Do-List
//
//  Created by Jimmy Cassidy on 2/11/19.
//  Copyright © 2019 Jimmy Cassidy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoArray = ["Learn Swift", "Change the World", "Build Apps"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }
}

