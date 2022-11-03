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

class GameViewController:UIViewController {
    
    var count:Int = 0
    
    let defaults = UserDefaults.standard
    
    let label = UILabel(frame: CGRect(x: 60, y: 730, width: 100, height: 30))
    
    let imageViewCar = UIImageView(frame: CGRect(x: 0, y: 600, width: 100, height: 100))
    
    var brickView1 = UIImageView(frame: CGRect(x: 50, y: -50, width: 100, height: 60))
    var brickView2 = UIImageView(frame: CGRect(x: 50, y: -50, width: 100, height: 60))
    var brickView3 = UIImageView(frame: CGRect(x: 200, y: -50, width: 100, height: 60))
    var brickView4 = UIImageView(frame: CGRect(x: 300, y: -50, width: 100, height: 60))
    
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
  
    navigationItem.leftBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),style: .plain, target: self, action: #selector(back))
     
      
        var roadView = UIImageView(frame: CGRect(x: 0, y: -700, width: view.frame.width, height: view.frame.height))
        var roadView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        imageViewCar.image = UIImage(systemName: "car.fill")
        imageViewCar.center.x = view.center.x

    
        viewForest.backgroundColor = .systemGreen
        viewForest1.backgroundColor = .systemGreen
        viewForest2.backgroundColor = .systemGreen
        viewForest3.backgroundColor = .systemGreen
        
        roadView.image = UIImage(named: "road")
        roadView1.image = UIImage(named: "road")
        
        view.addSubview(roadView)
        view.addSubview(roadView1)
        view.addSubview(brickView1)
        view.addSubview(brickView2)
        view.addSubview(brickView3)
        view.addSubview(brickView4)
      
        
        view.addSubview(imageViewCar)
        view.addSubview(viewForest)
        view.addSubview(viewForest1)
        view.addSubview(viewForest2)
        view.addSubview(viewForest3)
        
        view.addSubview(buttonUp)
        view.addSubview(buttonDown)
        view.addSubview(buttonLeft)
        view.addSubview(buttonRight)
        
        view.addSubview(label)
        
        label.textColor = .white
        label.text = "Scores"
        
        count = defaults.integer(forKey: "score")
        
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
        
        var color  = UserDefaults.standard.colorForKey(key: "Color")
        imageViewCar.tintColor = color
        
        var image = UserDefaults.standard.imageForKey(key: "Image")
        brickView1.image = image
        brickView2.image = image
        brickView3.image = image
        brickView4.image = image
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView1.frame.origin.y += 100
                
                    if self.brickView1.frame.intersects(self.imageViewCar.frame) {
                    
                    var records = RecordsViewController()
                    
                    guard  let vc = self.navigationController?.self.viewControllers.last(where: {$0 is MenuViewController}) as? MenuViewController else {
                        return
                    }
                    self.defaults.set(self.count, forKey: "score")
                    records.cell.label.text =  "Score \(self.count)"
                    self.navigationController?.pushViewController(records, animated: true)
                    records.tableView.reloadData()
                       
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView2.frame.origin.y += 100
                
                if self.brickView2.frame.intersects(self.imageViewCar.frame){
                    
                    var records = RecordsViewController()
                    
                    guard  let vc = self.navigationController?.self.viewControllers.last(where: {$0 is MenuViewController}) as? MenuViewController else {
                        return
                    }
                    self.defaults.set(self.count, forKey: "score")
                    records.cell.label.text =  "Score \(self.count)"
                    self.navigationController?.pushViewController(records, animated: true)
                    records.tableView.reloadData()
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView3.frame.origin.y += 100
                
                    if self.brickView3.frame.intersects(self.imageViewCar.frame){
                        
                        var records = RecordsViewController()
                        
                        guard  let vc = self.navigationController?.self.viewControllers.last(where: {$0 is MenuViewController}) as? MenuViewController else {
                            return
                        }
                        self.defaults.set(self.count, forKey: "score")
                        records.cell.label.text =  "Score \(self.count)"
                        self.navigationController?.pushViewController(records, animated: true)
                        records.tableView.reloadData()
                    
                    
                }
            })
        })
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { timer in
            
            UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat, .curveLinear], animations: {
                self.brickView4.frame.origin.y += 100
                
                if self.brickView4.frame.intersects(self.imageViewCar.frame){
                    
                    var records = RecordsViewController()
                    
                    guard  let vc = self.navigationController?.self.viewControllers.last(where: {$0 is MenuViewController}) as? MenuViewController else {
                        return
                    }
                    self.defaults.set(self.count, forKey: "score")
                    records.cell.label.text =  "Score \(self.count)"
                    self.navigationController?.pushViewController(records, animated: true)
                    records.tableView.reloadData()
                }
            })
        })
        
    
    }

    
   @objc func back() {
        
       self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
   
    
    @objc func touchUp (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.y -= 10
                self.count += 10
                self.label.text = "Score: \(self.count)"
               
        
        })
    }
    
    @objc func touchDown (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.y += 10
                self.count += 10
            self.label.text = "Score: \(self.count)"
        })
    }
    
    @objc func touchLeft (_ sender:UIButton) {
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.curveLinear], animations: {
            
                self.imageViewCar.frame.origin.x -= 10
                self.count += 10
            self.label.text = "Score: \(self.count)"
            
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
            self.count += 10
            self.label.text = "Score: \(self.count)"
            if self.imageViewCar.frame.origin.x >= 290 {
                
                var setting = UIStoryboard(name: "Main", bundle: nil)
                guard let settingView = self.storyboard!.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
                settingView.modalPresentationStyle = .fullScreen
                self.present(settingView, animated: true)
            }
        })
    }
  }


