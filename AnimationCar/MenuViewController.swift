//
//  MenuViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 23.09.22.
//
//1)Экран настроек для гонок - смена цвета машины, вида препятствия, ввод имени гонщика, опционально скорость игры
//2) Сохранение настроек гонок
//3) Сохранение результатов каждой гонки - кастомным классом

import UIKit


class MenuViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    let buttonGame = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 40))
    
    let buttonSettings = UIButton(frame: CGRect(x: 0, y: 500, width: 200, height: 40))
    
    let label = UILabel(frame: CGRect(x: 0, y: 100, width: 300, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "TimesNewRomanPS-BoldMT", size: 20)!, NSAttributedString.Key.foregroundColor:UIColor.white]
        
       navigationController?.navigationBar.tintColor = .white
        
        let backround = UIImageView(frame: UIScreen.main.bounds)
        backround.image = UIImage(named: "menu")
        backround.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backround, at: 0)
        
        view.backgroundColor = .orange
        navigationItem.title = "Menu"
    
        view.addSubview(label)
        label.center.x = view.center.x
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        
        label.text = "Hello \(defaults.string(forKey: "nameLabel") ?? "world" )"
        
        buttonGame.backgroundColor = .black
        buttonGame.layer.cornerRadius = 10
        buttonGame.center.x = view.center.x
        buttonGame.setTitle("Game", for: .normal)
        buttonGame.setTitleColor(.white, for: .normal)
        buttonGame.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        view.addSubview(buttonGame)
      
        buttonSettings.backgroundColor = .black
        buttonSettings.layer.cornerRadius = 10
        buttonSettings.center.x = view.center.x
        buttonSettings.setTitle("Settings", for: .normal)
        buttonSettings.setTitleColor(.white, for: .normal)
        buttonSettings.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        view.addSubview(buttonSettings)
        
}
    @objc func goToGame (_ sender: UIButton) {
        
        let gameVC = GameViewController()
        self.navigationController?.pushViewController(gameVC, animated: true)
    }

    @objc func goToSettings (_ sender: UIButton) {
        
        let settingVC = SettingsViewController()
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
}
