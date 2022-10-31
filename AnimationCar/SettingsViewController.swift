//
//  SettingsViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//
//
//Экран настроек для гонок - смена цвета машины, вида препятствия, ввод имени гонщика, опционально скорость игры
//2) Сохранение настроек гонок
//3) Сохранение результатов каждой гонки - кастомным классом

import UIKit
class SettingsViewController: UIViewController {

    
    let buttonColor = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 40))
    
    let buttonBarrier = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 40))
    
    let buttonName = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 40))
    
    let buttonRecords = UIButton(frame: CGRect(x: 0, y: 500, width: 200, height: 40))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         
        navigationItem.title = "Settings"
       
        navigationItem.leftBarButtonItem?.style = .plain
        view.backgroundColor = .white
        
        let backround = UIImageView(frame: UIScreen.main.bounds)
        backround.image = UIImage(named: "settings")
        backround.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backround, at: 0)
 
        buttonColor.backgroundColor = .black
        buttonColor.layer.cornerRadius = 10
        buttonColor.center.x = view.center.x
        buttonColor.setTitle("Change color", for: .normal)
        buttonColor.setTitleColor(.white, for: .normal)
        buttonColor.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        view.addSubview(buttonColor)
      
        
        buttonBarrier.backgroundColor = .black
        buttonBarrier.layer.cornerRadius = 10
        buttonBarrier.center.x = view.center.x
        buttonBarrier.setTitle("Change barrier", for: .normal)
        buttonBarrier.setTitleColor(.white, for: .normal)
        buttonBarrier.addTarget(self, action: #selector(changeBarrier), for: .touchUpInside)
        view.addSubview(buttonBarrier)
        
        buttonName.backgroundColor = .black
        buttonName.layer.cornerRadius = 10
        buttonName.center.x = view.center.x
        buttonName.setTitle("Change Name", for: .normal)
        buttonName.setTitleColor(.white, for: .normal)
        buttonName.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        view.addSubview(buttonName)
        
        buttonRecords.backgroundColor = .black
        buttonRecords.layer.cornerRadius = 10
        buttonRecords.center.x = view.center.x
        buttonRecords.setTitle("Records", for: .normal)
        buttonRecords.setTitleColor(.white, for: .normal)
        buttonRecords.addTarget(self, action: #selector(records), for: .touchUpInside)
        view.addSubview(buttonRecords)
//
    }
    
    @objc func changeColor (_ sender: UIButton) {
        
        let  colorVC = ColorViewController()
        self.navigationController?.pushViewController(colorVC, animated: true)
        colorVC.view.backgroundColor = .white
        colorVC.modalPresentationStyle = .fullScreen
    }

    @objc func changeBarrier (_ sender: UIButton) {

        let  barrierVC = ChangeBarrierViewController()
        self.navigationController?.pushViewController(barrierVC, animated: true)
        barrierVC.view.backgroundColor = .white
        barrierVC.modalPresentationStyle = .fullScreen
    }

    @objc func changeName (_ sender: UIButton) {
        
        let  nameVC = ChangeNameController()
        self.navigationController?.pushViewController(nameVC, animated: true)
        nameVC.view.backgroundColor = .darkGray
        nameVC.modalPresentationStyle = .fullScreen

    }
                                 
    @objc func records(_ sender:UIButton) {

        let  recordsVC = RecordsViewController()
        self.navigationController?.pushViewController(recordsVC, animated: true)
        recordsVC.view.backgroundColor = .darkGray
        recordsVC.modalPresentationStyle = .fullScreen

    }
}
