//
//  NavigationViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 11.10.22.
//

import UIKit



class ChangeNameController: UIViewController {

    let defaults = UserDefaults.standard
    let textField = UITextField(frame: CGRect(x: 0, y: 300, width: 300, height: 40))
    let button = UIButton(frame: CGRect(x: 0, y: 500, width: 300, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backround = UIImageView(frame: UIScreen.main.bounds)
        backround.image = UIImage(named: "name")
        backround.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backround, at: 0)
       
        view.addSubview(textField)
        
        textField.center.x = view.center.x
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
    
        textField.text = defaults.string(forKey: "name")
    
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.center.x = view.center.x
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @objc func save (_ sender:UIButton){
        
        let menuVC = MenuViewController()
    
        guard  let vc = navigationController?.viewControllers.first(where: {$0 is MenuViewController}) as? MenuViewController else {
            return
        }
        
        var string = textField.text
        defaults.set(string, forKey: "name")
        defaults.set(string, forKey: "nameLabel")
        vc.label.text = string
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
