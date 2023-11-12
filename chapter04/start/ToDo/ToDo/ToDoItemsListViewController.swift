//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 김완기C/SGS 모바일개발팀 on 2023/11/12.
//

import UIKit

class ToDoItemsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItemStore: ToDoItemStoreProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
