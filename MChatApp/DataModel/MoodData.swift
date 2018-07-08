//
//  MoodData.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/8/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import Foundation

class MoodData{
    var emotionImg:String
    var description:String
    var moodAsses:String
    init?(emotionImg:String,description:String,moodAsses:String)
    {
        if emotionImg.isEmpty || description.isEmpty || moodAsses.isEmpty
        {
            return nil
        }
        self.emotionImg = emotionImg
        self.description = description
        self.moodAsses = moodAsses
    }
}
