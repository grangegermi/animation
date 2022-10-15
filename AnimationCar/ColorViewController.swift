//
//  ChangeColorViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//

import UIKit

extension UserDefaults {
    
    func setColor(color:UIColor?, forKey key:String) {
        var colorRedData:NSData?
        var colorPurpleData:NSData?
        var colorMintData:NSData?

        if let color = color {
            do {
                colorRedData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                colorPurpleData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                colorMintData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                set(colorRedData,forKey: key)
                set(colorPurpleData,forKey: key)
                set(colorMintData,forKey: key)
            }  catch let erorr {
                print( erorr)
            }
        }
        
    }
    func colorForKey(key:String) -> UIColor? {
        var color: UIColor?
        if let colorRedData = data(forKey: "ColorRed"),
           let colorPurpleData = data(forKey: "ColorPurple"),
           let colorMintData = data(forKey: "ColorMint")
        {
            do {
               color =  try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorRedData)
                color =  try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorPurpleData)
                color =  try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorMintData)
                
            }catch let erorr {
                print (erorr)
            }
        }
        return color
    }
    
}

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
        UserDefaults.standard.setColor(color: .red, forKey: "ColorRed")
    
        gameVC.imageViewCar.tintColor = .red
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
       
        
    }
    
    @objc func purpleColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        UserDefaults.standard.setColor(color: .purple, forKey: "ColorPuple")
        gameVC.imageViewCar.tintColor = .purple
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
   
     
    }
    
    @objc func mintColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        UserDefaults.standard.setColor(color: .systemMint, forKey: "ColorMint")
        gameVC.imageViewCar.tintColor = .systemMint
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)

        
    }
   
}

