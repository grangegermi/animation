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
//}

class ChangeColorViewController: UIViewController {
    
    //    weak var delegate: ChangeColorDelegate?
    var colorWhite:UIColor = .white
    var colorPurple:UIColor = .purple
    var colorMint:UIColor = .systemMint
    
    let buttonWhite = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))
    
    let buttonPurple = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 30))
    
    let buttonMint = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 30))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonWhite.backgroundColor = .gray
        buttonWhite.layer.cornerRadius = 10
        buttonWhite.center.x = view.center.x
        buttonWhite.setTitle("White color", for: .normal)
        buttonWhite.addTarget(self, action: #selector(whiteColor), for: .touchUpInside)
        
        
        
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
        view.addSubview(buttonWhite)
        view.addSubview(buttonPurple)
        view.addSubview(buttonMint)
        
    }
    
    @objc func whiteColor (_ sender:UIButton){
        
        var color = UIStoryboard(name: "Main", bundle: nil)
        guard let viewColor = self.storyboard!.instantiateViewController(identifier: "GameViewController") as? GameViewController else {return}
        viewColor.modalPresentationStyle = .popover
        
        
        viewColor.colorWhite = self.colorWhite
        self.present(viewColor, animated: true)
        
        
    }
    @objc func purpleColor (_ sender:UIButton){
        
        var color = UIStoryboard(name: "Main", bundle: nil)
        guard let viewColor = self.storyboard!.instantiateViewController(identifier: "GameViewController") as? GameViewController else {return}
        viewColor.modalPresentationStyle = .popover
        viewColor.colorPurple = self.colorPurple
        self.present(viewColor, animated: true)
    }
    
    @objc func mintColor (_ sender:UIButton){
        var color = UIStoryboard(name: "Main", bundle: nil)
        guard let viewColor = self.storyboard!.instantiateViewController(identifier: "GameViewController") as? GameViewController else {return}
        viewColor.modalPresentationStyle = .popover
        viewColor.colorMint = self.colorMint
        self.present(viewColor, animated: true)
        
    }
}
