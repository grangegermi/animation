//
//  ChangeColorViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//

import UIKit
//

//class ImageViewChangeColor : UIImageView {
//
//    var buttonTapped: (() -> Void)?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    func changeColor () {
//
//        buttonTapped?()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//

class ColorViewController: UIViewController {
    
    let buttonRed = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))
    
    let buttonPurple = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 30))
    
    let buttonMint = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 30))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "Change color"
   
        buttonRed.backgroundColor = .gray
        buttonRed.layer.cornerRadius = 10
        buttonRed.center.x = view.center.x
        buttonRed.setTitle("Red color", for: .normal)
        buttonRed.addTarget(self, action: #selector(redColor), for: .touchUpInside)
        
        buttonPurple.backgroundColor = .gray
        buttonPurple.layer.cornerRadius = 10
        buttonPurple.center.x = view.center.x
        buttonPurple.setTitle("Purple color", for: .normal)
        buttonPurple.addTarget(self, action: #selector(purpleColor), for: .touchUpInside)
        
        buttonMint.backgroundColor = .gray
        buttonMint.layer.cornerRadius = 10
        buttonMint.center.x = view.center.x
        buttonMint.setTitle("Mint color", for: .normal)
        buttonMint.addTarget(self, action: #selector(mintColor), for: .touchUpInside)
        view.addSubview(buttonRed)
        view.addSubview(buttonPurple)
        view.addSubview(buttonMint)
        
    }
    
    @objc func redColor (_ sender:UIButton){

        var  gameVC = GameViewController()
        gameVC.imageViewCar.tintColor = .systemRed
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
       
        
    }
    
    @objc func purpleColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        gameVC.imageViewCar.tintColor = .purple
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
   
     
    }
    
    @objc func mintColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        gameVC.imageViewCar.tintColor = .systemMint
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)

        
    }
}
