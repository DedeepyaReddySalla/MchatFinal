//
//  MoodsTableVC.swift
//  MChatApp
//
//  Created by Dedeepya reddy Salla on 7/1/18.
//  Copyright © 2018 Motion Mentoring Org. All rights reserved.
//

import UIKit

class MoodsTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var moodTableVm = MoodTableVM()
    var moodDataObjs = [MoodData]()
    var assesorResult:Assesor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodDataObjs = moodTableVm.createMoodDataObj()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = moodTableVm.noOfEmotions()
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for: indexPath) as? MoodTableViewCell else{
            fatalError("The dequeued cell is not an instance of MoodTableViewCell")
        }
        let moodData = moodDataObjs[indexPath.row]
        cell.desc.text = moodData.description
        cell.emotionImgView.image = UIImage(named:moodData.emotionImg)
//        cell.desc.text = "test test"
//        cell.emotionImgView.image = UIImage()
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moodData = moodDataObjs[indexPath.row]
        if let assesorArry = moodTableVm.getAssesor(currentMood:moodData.moodAsses){
            if (assesorArry.count==1){
                assesorResult = assesorArry[0]
            }
        }
        performSegue(withIdentifier:"showModometer", sender:Any?.self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let vc = segue.destination as? MoodsAssesorVC
                if let vc = vc{
                    if let assesorResult = assesorResult{
                         vc.assesor = assesorResult
                    }
                }
    }

    //            if let result = assesorResult
    //            {
    //                print("segue:\(result.assesorDesc)")
    //            }
}
