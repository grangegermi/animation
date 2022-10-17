//
//  ChangeBarrierViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//

import UIKit

extension UserDefaults {

    func setImage(image:UIImage?, forKey key:String) {
        
        var imageData:NSData?
        if  let image = image {
            do {
                imageData = try NSKeyedArchiver.archivedData(withRootObject:image, requiringSecureCoding: false) as NSData?
                set(imageData,forKey: key)
            }  catch let erorr {
                print( erorr)
            }
        }

    }
    func imageForKey(key:String) -> UIImage? {
        var image: UIImage?
        if let imageData = data(forKey: "Image"){
        do {
               image =  try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: imageData)
            }catch let erorr {
                print (erorr)
            }
        }
        return image
    }

}


class ChangeBarrierViewController: UIViewController {

    let buttonCar = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 40))
    
    let buttonDioxide = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 40))
    
    let buttonBus = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 40))
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backround = UIImageView(frame: UIScreen.main.bounds)
        backround.image = UIImage(named: "barrier")
        backround.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backround, at: 0)
        
        buttonCar.backgroundColor = .black
        buttonCar.layer.cornerRadius = 10
        buttonCar.center.x = view.center.x
        buttonCar.setTitle("Car barrier", for: .normal)
        buttonCar.setTitleColor(.white, for: .normal)
        buttonCar.addTarget(self, action: #selector(barrierCar), for: .touchUpInside)
    
        buttonDioxide.backgroundColor = .black
        buttonDioxide.layer.cornerRadius = 10
        buttonDioxide.center.x = view.center.x
        buttonDioxide.setTitle("Dioxide barrier", for: .normal)
        buttonDioxide.setTitleColor(.white, for: .normal)
        buttonDioxide.addTarget(self, action: #selector(barrierDioxide), for: .touchUpInside)
        
        buttonBus.backgroundColor = .black
        buttonBus.layer.cornerRadius = 10
        buttonBus.center.x = view.center.x
        buttonBus.setTitle("Bus barrier", for: .normal)
        buttonBus.setTitleColor(.white, for: .normal)
        buttonBus.addTarget(self, action: #selector(barrierBus), for: .touchUpInside)
        
        view.addSubview(buttonCar)
        view.addSubview(buttonDioxide)
        view.addSubview(buttonBus)
    }

    @objc func barrierCar(_ sender:UIButton){

        var gameVC = GameViewController()
        
        UserDefaults.standard.setImage(image: UIImage(systemName: "bolt.car.fill"), forKey: "Image")
        
        gameVC.brickView1.image = UIImage(systemName: "bolt.car.fill")
        gameVC.brickView2.image = UIImage(systemName: "bolt.car.fill")
        gameVC.brickView3.image = UIImage(systemName: "bolt.car.fill")
        gameVC.brickView4.image = UIImage(systemName: "bolt.car.fill")

        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func barrierDioxide(_ sender:UIButton){
        
        var gameVC = GameViewController()
        
        UserDefaults.standard.setImage(image: UIImage(systemName: "carbon.dioxide.cloud"), forKey: "Image")
    
        gameVC.brickView1.image = UIImage(named: "carbon.dioxide.cloud")
        gameVC.brickView2.image = UIImage(named: "carbon.dioxide.cloud")
        gameVC.brickView3.image = UIImage(named: "carbon.dioxide.cloud")
        gameVC.brickView4.image = UIImage(named: "carbon.dioxide.cloud")
       
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
    
    }
    @objc func barrierBus (_ sender:UIButton){
        
        var gameVC = GameViewController()
        
        UserDefaults.standard.setImage(image: UIImage(systemName: "bus.fill"), forKey: "Image")
        
        gameVC.brickView1.image = UIImage(named: "bus.fill")
        gameVC.brickView2.image = UIImage(named: "bus.fill")
        gameVC.brickView3.image = UIImage(named: "bus.fill")
        gameVC.brickView4.image = UIImage(named: "bus.fill")
        
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
