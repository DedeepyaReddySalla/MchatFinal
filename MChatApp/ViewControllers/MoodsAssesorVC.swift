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
    
    @IBOutlet weak var assesorImg: UIImageView!
    
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let assesor = assesor
        {
            assesorImg.image = UIImage(named:assesor.assesorImg)
            desc.text = assesor.assesorDesc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
}
