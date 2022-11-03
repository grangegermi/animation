//
//  TableViewCell.swift
//  AnimationCar
//
//  Created by Даша Волошина on 31.10.22.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    let defaults = UserDefaults.standard
    let button = UIButton()
    let label = UILabel()
    
    static let id = "TableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(button)
        button.setTitle("Change color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10

        
        contentView.addSubview(label)
        label.text = "Score \(defaults.integer(forKey: "score"))"
     
        createConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createConstraints() {
        
        button.snp.makeConstraints { make in
            
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
            
        }
        
        label.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).inset(20)
            make.top.equalTo(contentView.snp.top).inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
    }
    
    func createColor(color: UIColor) {
        
        contentView.backgroundColor = color
    }
}
