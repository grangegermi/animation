//
//  SecondViewController.swift
//  AnimationCar
//
//  Created by Даша Волошина on 23.09.22.

// (дз 2 Циклическое листание массива картинок вправо-влево. Картинка
// прилетает из-за края экрана на нужное место в центре)


import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images = [UIImage()]
    
    @IBOutlet weak var collectionView: UICollectionView!
        override func viewDidLoad() {
            
        super.viewDidLoad()
            
            let imageCar = UIImage(named: "car")!
            let image1 = UIImage(named: "cat0") ?? imageCar
            let image2 = UIImage(named: "cat1") ?? imageCar
            let image3 = UIImage(named: "cat2") ?? imageCar
            
            
        images.append(image1)
        images.append(image2)
        images.append(image3)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageWithCatsCollectionViewCell", for: indexPath) as! ImageWithCatsCollectionViewCell
        
        let imageFromArray = images[indexPath.item]
        
        cell.imageView.image = imageFromArray
        return cell
    }
    func collectionView(_ collectionView:UICollectionView,layot collectionViewLayout:UICollectionViewLayout,sizeForItemAT indexPath:IndexPath) -> CGSize{
        
        return CGSize(width: 200, height: 500)
    }
    
   func collectioView(_ collectionView:UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       
        return 0
    }
    
  
    }
    
