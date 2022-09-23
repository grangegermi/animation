//
//  ImageWithCatsCollectionViewCell.swift
//  AnimationCar
//
//  Created by Даша Волошина on 23.09.22.
//

import UIKit

class ImageWithCatsCollectionViewCell: UICollectionViewCell {

 
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentMode = .scaleToFill
    }

}
