//
//  RecordsViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 31.10.22.
//• таблица рекордов для гонок
//• Разноцветные ячейки в таблице. В каждой ячейке - кнопка. Нажатие на кнопку перекрашивает контроллер в цвет ячейки

import UIKit
import SnapKit

class RecordsViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{

    var tableView = UITableView()
    var colors:[UIColor] = [.orange, .darkGray, .yellow, .purple, .systemPink, .green, .blue, .magenta, .red, .systemIndigo]
  var cell = TableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
      
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
   
        cell.createColor(color: colors[indexPath.row])
        
        cell.button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        cell.button.tag = indexPath.row
        
        return cell
    }
    
    func createConstraints() {
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
    }

    @objc func changeColor (_ sender:UIButton){
 
        let indexPath1 = IndexPath(row: sender.tag, section: 0)
        tableView.backgroundColor = colors[indexPath1.row]
       
    
        
        
      
    }
}
