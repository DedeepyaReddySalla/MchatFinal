//
//  MoodsAssesorVC.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/1/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import UIKit

class MoodsAssesorVC: UIViewController {
    var assesor:Assesor?
    var subImage:UIImageView!
    @IBOutlet weak var assesorImgView: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let assesor = assesor
        {
            //never initialise an image view like this programatically
//            assesorImg.image = UIImage(named:assesor.assesorImg)
            if let img = UIImage(named:assesor.assesorImg){
                subImage = UIImageView(image:img)
                subImage.frame = CGRect(x:0, y:0, width:assesorImgView.frame.size.width, height:assesorImgView.frame.size.height)
              assesorImgView.addSubview(subImage)
            }
            desc.text = assesor.assesorDesc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
}
