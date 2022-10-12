//
//  ChangeBarrierViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 30.09.22.
//

import UIKit

class ChangeBarrierViewController: UIViewController {
   
    let buttonCar = UIButton(frame: CGRect(x: 0, y: 200, width: 200, height: 30))
    
    let buttonDioxide = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 30))
    
    let buttonBus = UIButton(frame: CGRect(x: 0, y: 400, width: 200, height: 30))

   var viewSelf = UIImageView()
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonCar.backgroundColor = .gray
        buttonCar.layer.cornerRadius = 10
        buttonCar.center.x = view.center.x
        buttonCar.setTitle("Car barrier", for: .normal)
        buttonCar.addTarget(self, action: #selector(barrierCar), for: .touchUpInside)
        
        
        
        buttonDioxide.backgroundColor = .gray
        buttonDioxide.layer.cornerRadius = 10
        buttonDioxide.center.x = view.center.x
        buttonDioxide.setTitle("Dioxide barrier", for: .normal)
        buttonDioxide.addTarget(self, action: #selector(barrierDioxide), for: .touchUpInside)
        
        buttonBus.backgroundColor = .gray
        buttonBus.layer.cornerRadius = 10
        buttonBus.center.x = view.center.x
        buttonBus.setTitle("Bus barrier", for: .normal)
        buttonBus.addTarget(self, action: #selector(barrierBus), for: .touchUpInside)
        view.addSubview(buttonCar)
        view.addSubview(buttonDioxide)
        view.addSubview(buttonBus)
        viewSelf.image = UIImage(systemName: "bolt.car.fill")
    }

    @objc func barrierCar(_ sender:UIButton){

        var gameVC = GameViewController()
        gameVC.brickView1.image = UIImage(named: "car")
        gameVC.brickView2.image = UIImage(systemName: "bus.fill")
        gameVC.brickView3.image = UIImage(systemName: "bus.fill")
        gameVC.brickView4.image = UIImage(systemName: "bus.fill")
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
    

        
    }
    @objc func barrierDioxide(_ sender:UIButton){
        var gameVC = GameViewController()
        gameVC.brickView2.image = UIImage(systemName: "carbon.dioxide.cloud")
        gameVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(gameVC, animated: true)
    
    }
    
    @objc func barrierBus (_ sender:UIButton){
  
        
    }
}
