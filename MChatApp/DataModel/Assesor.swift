//
//  Assesor.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/8/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import Foundation

class Assesor{
    var assesorImg:String
    var assesorDesc:String
    init?(assesorImg:String,assesorDesc:String)
    {
        if assesorImg.isEmpty || assesorDesc.isEmpty
        {
            return nil
        }
        self.assesorImg = assesorImg
        self.assesorDesc = assesorDesc
    }
    
}
