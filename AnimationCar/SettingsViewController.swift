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

    
    let buttonColor = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))
    
    let buttonBarrier = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 30))
    
    let buttonName = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 30))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         
        navigationItem.title = "Settings"
        view.backgroundColor = .white
        

 
        buttonColor.backgroundColor = .gray
        buttonColor.layer.cornerRadius = 10
        buttonColor.center.x = view.center.x
        buttonColor.setTitle("Change color", for: .normal)
        buttonColor.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        view.addSubview(buttonColor)
      
        
        buttonBarrier.backgroundColor = .gray
        buttonBarrier.layer.cornerRadius = 10
        buttonBarrier.center.x = view.center.x
        buttonBarrier.setTitle("Change barrier", for: .normal)
        buttonBarrier.addTarget(self, action: #selector(changeBarrier), for: .touchUpInside)
        view.addSubview(buttonBarrier)
        
        
        
        buttonName.backgroundColor = .gray
        buttonName.layer.cornerRadius = 10
        buttonName.center.x = view.center.x
        buttonName.setTitle("Change Name", for: .normal)
        buttonName.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        view.addSubview(buttonName)
    }



    @objc func changeColor (_ sender: UIButton) {
        
        let  colorVC = ColorViewController()
        self.navigationController?.pushViewController(colorVC, animated: true)
        colorVC.view.backgroundColor = .white
        colorVC.modalPresentationStyle = .fullScreen
      

    }

    @objc func changeBarrier (_ sender: UIButton) {

        let  barrierVC = ChangeBarrierViewController ()
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
    

}
