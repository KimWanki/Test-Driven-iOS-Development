//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by WANKI KIM on 2023/11/13.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    
    let titleLabel: UILabel
    let dateLabel: UILabel
    let locationLabel: UILabel
    
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        // prefer to initialize the elements within the init method
        titleLabel  = UILabel()
        dateLabel = UILabel()
        locationLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(locationLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
