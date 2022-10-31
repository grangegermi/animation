//
//  TableViewCell.swift
//  AnimationCar
//
//  Created by Даша Волошина on 31.10.22.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
let button = UIButton()
  static let id = "TableViewCell"
   
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(button)
        button.setTitle("Change color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
       
        
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func createConstraints() {
        
        button.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
            
        }
    }
    
    func createColor(color: UIColor) {
        
        contentView.backgroundColor = color
    }
    
    @objc func changeColor(_ sender:UIButton){
        
        
        
    }
}
