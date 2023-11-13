//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 김완기C/SGS 모바일개발팀 on 2023/11/12.
//

import UIKit
import Combine

enum Section {
    case main
}

class ToDoItemsListViewController: UIViewController {
    
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    
    @IBOutlet weak var tableView: UITableView!
    var toDoItemStore: ToDoItemStoreProtocol?
    let dateFormatter = DateFormatter()
    private var items: [ToDoItem] = [] // holds the items sent by item publisher
    private var token: AnyCancellable? // holds reference to the subscirber subscribed to that publisher
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
        dataSource = UITableViewDiffableDataSource<Section, ToDoItem>(
            tableView: tableView,
            cellProvider: { [weak self] tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
                cell.titleLabel.text = item.title
                if let timestamp = item.timestamp {
                    let date = Date(timeIntervalSince1970: timestamp)
                    cell.dateLabel.text = self?.dateFormatter
                        .string(from: date)
                }
                
                return cell
            })
        token = toDoItemStore?.itemPublisher
            .sink(receiveValue: { [weak self] items in
                self?.items = items
            })
        
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
    }
    
    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot)
    }
}
// delete after implement diffable data source
//
//extension ToDoItemsListViewController: UITableViewDataSource {
//
//    // minimal code to make ToDoItemListViewController make the test pass
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = ToDoItemCell()
//        // seem stupid to write code like this, is kind of essential of TDD.
//        // 테스트를 통과하기 위해 하드 코딩된 코드들은 더 많은 테스트가 필요함을 의미한다.
////        cell.titleLabel.text = "dummy 1"
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
//
//        let item = items[indexPath.row]
//        cell.titleLabel.text = item.title
//
//        if let timestamp = item.timestamp {
//            let date = Date(timeIntervalSince1970: timestamp)
//            cell.dateLabel.text = dateFormatter.string(from: date)
//        }
//
//        return cell
//    }
//}
