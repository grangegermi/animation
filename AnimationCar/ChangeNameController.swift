//
//  NavigationViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 11.10.22.
//

import UIKit

class ChangeNameController: UIViewController {

   
    let textField = UITextField(frame: CGRect(x: 0, y: 100, width: 300, height: 30))
    let button = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        
        textField.center.x = view.center.x
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
       
      
    
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.center.x = view.center.x
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        view.addSubview(button)
        
    }
 
  
    @objc func save (_ sender:UIButton){
        
        let menuVC = MenuViewController()
    
        guard  let vc = navigationController?.viewControllers.first(where: {$0 is MenuViewController}) as? MenuViewController else {
            return
        }
        vc.label.text = textField.text
        self.navigationController?.popToRootViewController(animated: true)
        
    
   
        
    }
    
}
