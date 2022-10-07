//
//  ViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 23.09.22.

//дз 3: Гонки - основной экран игры, анимированное перемещение машинки
//по кнопкам вправо-влево, анимированное перемещение препятствий,
//кустов и разметки сверху-вниз за край экрана. Столкновение с
//препятствием или выезд с трассы разбивает машину => возврат на
//экран меню

import UIKit


//protocol ChangeColorDelegate:AnyObject {
//
//    func changeColor ()
//}




class GameViewController:UIViewController {
    
    
    var colorWhite = UIColor()
    var colorPurple = UIColor()
    var colorMint = UIColor()
  
    let imageViewCar = UIImageView(frame: CGRect(x: 0, y: 600, width: 100, height: 100))
    
    let brickView1 = UIImageView(frame: CGRect(x: 50, y: -50, width: 100, height: 60))
    let brickView2 = UIImageView(frame: CGRect(x: 50, y: -50, width: 100, height: 60))
    let brickView3 = UIImageView(frame: CGRect(x: 200, y: -50, width: 100, height: 60))
    let brickView4 = UIImageView(frame: CGRect(x: 300, y: -50, width: 100, height: 60))
    
    let buttonUp = UIButton(frame: CGRect(x: 160, y: 730, width: 60, height: 30))
    let buttonDown = UIButton(frame: CGRect(x: 160, y: 800, width: 60, height: 30))
    let buttonLeft = UIButton(frame: CGRect(x: 100, y: 760, width: 60, height: 30))
    let buttonRight = UIButton(frame: CGRect(x: 220, y: 760, width: 60, height: 30))
    
    
    let viewForest = UIView(frame: CGRect(x: 0, y: 0, width:40, height: 2000))
    let viewForest1 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 2000))
    let viewForest2 = UIView(frame: CGRect(x: 380, y: 0, width:40, height: 2000))
    let viewForest3 = UIView(frame: CGRect(x: 380, y: 0, width: 40, height: 2000))
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var roadView = UIImageView(frame: CGRect(x: 0, y: -700, width: view.frame.width, height: view.frame.height))
        var roadView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        imageViewCar.image = UIImage(named: "car")
        imageViewCar.center.x = view.center.x
        
        viewForest.backgroundColor = .systemGreen
        viewForest1.backgroundColor = .systemGreen
        viewForest2.backgroundColor = .systemGreen
        viewForest3.backgroundColor = .systemGreen
        
        roadView.image = UIImage(named: "road")
        roadView1.image = UIImage(named: "road")
        
        brickView1.image = UIImage(named: "brick")
        brickView2.image = UIImage(named: "brick")
        brickView3.image = UIImage(named: "brick")
        brickView4.image = UIImage(named: "brick")
        
        view.addSubview(roadView)
        view.addSubview(roadView1)
        view.addSubview(brickView1)
        view.addSubview(brickView2)
        view.addSubview(brickView3)
        view.addSubview(brickView4)
        brickView1.backgroundColor = .systemGreen
        
        view.addSubview(imageViewCar)
        createcolorImage()

        view.addSubview(viewForest)
        view.addSubview(viewForest1)
        view.addSubview(viewForest2)
        view.addSubview(viewForest3)
        
        view.addSubview(buttonUp)
        view.addSubview(buttonDown)
        view.addSubview(buttonLeft)
        view.addSubview(buttonRight)
        
        buttonUp.createButton()
        buttonDown.createButton()
        buttonLeft.createButton()
        buttonRight.createButton()
        
        buttonUp.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(touchDown), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(touchLeft), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(touchRight), for: .touchUpInside)
        
        UIView.animate(withDuration: 30.0, delay: 0, options: [.repeat,.curveLinear], animations: {
            roadView1.frame = CGRect(x: 0, y: 0 + 900, width: self.view.frame.width, height: self.view.frame.height)
            roadView.frame = CGRect(x: 0, y: 0 , width: self.view.frame.width, height: self.view.frame.height)
        })
}
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView1.frame.origin.y += 100
                if self.brickView1.frame.intersects(self.imageViewCar.frame){
                    
                    var setting = UIStoryboard(name: "Main", bundle: nil)
                    guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                    settingView.modalPresentationStyle = .fullScreen
                    self.present(settingView, animated: true)

                    
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView2.frame.origin.y += 100
                if self.brickView2.frame.intersects(self.imageViewCar.frame){
                    
                    var setting = UIStoryboard(name: "Main", bundle: nil)
                    guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                    settingView.modalPresentationStyle = .fullScreen
                    self.present(settingView, animated: true)
                    
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView3.frame.origin.y += 100
                if self.brickView3.frame.intersects(self.imageViewCar.frame){
                    
                    var setting = UIStoryboard(name: "Main", bundle: nil)
                    guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                    settingView.modalPresentationStyle = .fullScreen
                    self.present(settingView, animated: true)
                    
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView4.frame.origin.y += 100
                if self.brickView4.frame.intersects(self.imageViewCar.frame){
                    
                    var setting = UIStoryboard(name: "Main", bundle: nil)
                    guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                    settingView.modalPresentationStyle = .fullScreen
                    self.present(settingView, animated: true)
                    
                }
            })
        })
        
    }
    func createcolorImage (){
        imageViewCar.image = imageViewCar.image!.withRenderingMode(.alwaysTemplate)
        
        if imageViewCar.tintColor != colorWhite{
            
                imageViewCar.tintColor = UIColor.clear
                imageViewCar.tintColor = colorWhite
            
            
            } else if imageViewCar.tintColor != colorPurple{
                imageViewCar.tintColor = colorPurple
                
            } else  if  imageViewCar.tintColor != colorMint{
            imageViewCar.tintColor = colorMint
        }
    }
    @objc func touchUp (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.y -= 10
        
        })
    }
    
    @objc func touchDown (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.y += 10
        
        })
    }
    
    @objc func touchLeft (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.x -= 10
            
            if self.imageViewCar.frame.origin.x <= 30 {
                
                var setting = UIStoryboard(name: "Main", bundle: nil)
                guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                settingView.modalPresentationStyle = .fullScreen
                self.present(settingView, animated: true)
            }
        
        })
    }
    
    @objc func touchRight (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
            self.imageViewCar.frame.origin.x += 10
            if self.imageViewCar.frame.origin.x >= 290 {
                
                var setting = UIStoryboard(name: "Main", bundle: nil)
                guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                settingView.modalPresentationStyle = .fullScreen
                self.present(settingView, animated: true)
            }
            
        })
    }
    
  
}

