//
//  SettingsViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//
//1)Экран настроек для гонок - смена цвета машины, вида препятствия, ввод имени гонщика, опционально скорость игры
//2) Сохранение настроек гонок
//3) Сохранение результатов каждой гонки - кастомным классом

import UIKit

class SettingsViewController: UIViewController {
    
 
    let buttonColor = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))
    
    let buttonBarrier = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 30))
    
    let buttonName = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 30))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonColor.backgroundColor = .gray
        buttonColor.layer.cornerRadius = 10
        buttonColor.center.x = view.center.x
        buttonColor.setTitle("Change color", for: .normal)
        buttonColor.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        
        
        buttonBarrier.backgroundColor = .gray
        buttonBarrier.layer.cornerRadius = 10
        buttonBarrier.center.x = view.center.x
        buttonBarrier.setTitle("Change barrier", for: .normal)
        buttonBarrier.addTarget(self, action: #selector(changeBarrier), for: .touchUpInside)
        
        buttonName.backgroundColor = .gray
        buttonName.layer.cornerRadius = 10
        buttonName.center.x = view.center.x
        buttonName.setTitle("Change Name", for: .normal)
        buttonName.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        view.addSubview(buttonName)
        view.addSubview(buttonColor)
        view.addSubview(buttonBarrier)

    }
    
    @objc func changeColor (_ sender: UIButton) {
        var viewColor = UIStoryboard(name: "Main", bundle: nil)
        guard let settingColor = self.storyboard!.instantiateViewController(identifier: "ChangeColorViewController") as? ChangeColorViewController else {return}
        settingColor.modalPresentationStyle = .popover
        self.present(settingColor, animated: true)
    }
    
    
    @objc func changeBarrier (_ sender: UIButton) {
        var viewBarrier = UIStoryboard(name: "Main", bundle: nil)
        guard let settingBarrier = self.storyboard!.instantiateViewController(identifier: "ChangeBarrierViewController") as? ChangeBarrierViewController else {return}
        settingBarrier.modalPresentationStyle = .popover
        self.present(settingBarrier, animated: true)
        
    }
    
    @objc func changeName (_ sender: UIButton) {
        
    }
    

}
