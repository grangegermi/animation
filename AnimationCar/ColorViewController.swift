//
//  ChangeColorViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//

import UIKit

extension UserDefaults {

    func setColor(color:UIColor?, forKey key:String) {
        
        var colorData:NSData?
        if  let color = color {
            do {
                colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
                set(colorData,forKey: key)
            }  catch let erorr {
                print( erorr)
            }
        }

    }
    func colorForKey(key:String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: "Color"){
        do {
               color =  try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
            }catch let erorr {
                print (erorr)
            }
        }
        return color
    }

}

class ColorViewController: UIViewController {
        
    let buttonRed = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 40))
    
    let buttonPurple = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 40))
    
    let buttonYellow = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 40))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backround = UIImageView(frame: UIScreen.main.bounds)
        backround.image = UIImage(named: "color")
        backround.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backround, at: 0)
        
        navigationItem.title = "Change color"
   
        buttonRed.backgroundColor = .black
        buttonRed.layer.cornerRadius = 10
        buttonRed.center.x = view.center.x
        buttonRed.setTitle("Red color", for: .normal)
        buttonRed.setTitleColor(.white, for: .normal)
        buttonRed.addTarget(self, action: #selector(redColor), for: .touchUpInside)
        
        buttonPurple.backgroundColor = .black
        buttonPurple.layer.cornerRadius = 10
        buttonPurple.center.x = view.center.x
        buttonPurple.setTitle("Purple color", for: .normal)
        buttonPurple.setTitleColor(.white, for: .normal)
        buttonPurple.addTarget(self, action: #selector(purpleColor), for: .touchUpInside)
        
        buttonYellow.backgroundColor = .black
        buttonYellow.layer.cornerRadius = 10
        buttonYellow.center.x = view.center.x
        buttonYellow.setTitle("Yellow color", for: .normal)
        buttonYellow.setTitleColor(.white, for: .normal)
        buttonYellow.addTarget(self, action: #selector(yellowColor), for: .touchUpInside)
        
        view.addSubview(buttonRed)
        view.addSubview(buttonPurple)
        view.addSubview(buttonYellow)

    }

    @objc func redColor (_ sender:UIButton){

        var  gameVC = GameViewController()
        
        UserDefaults.standard.setColor(color:.red, forKey: "Color")
        
        gameVC.imageViewCar.tintColor = .red
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
       
    }
    
    @objc func purpleColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        
        UserDefaults.standard.setColor(color: .purple, forKey: "Color")
        gameVC.imageViewCar.tintColor = .purple
        
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
   
    }
    
    @objc func yellowColor (_ sender:UIButton){
        
        var  gameVC = GameViewController()
        
        UserDefaults.standard.setColor(color: .yellow, forKey: "Color")
        gameVC.imageViewCar.tintColor = .yellow
        
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)

    }
   
}

