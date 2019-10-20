//
//  DetailsViewController.swift
//  Cyfer Track
//
//  Created by Huzaifa Ahmed on 10/19/19.
//  Copyright © 2019 cyferlabs. All rights reserved.
//

import UIKit
import Alamofire
import UICircularProgressRing

class DetailsViewController: UIViewController {

    
    @IBOutlet var firstIndex: UICircularProgressRing!
    
    @IBOutlet var secondIndex: UICircularProgressRing!
    
    @IBOutlet var thirdIndex: UICircularProgressRing!
    
    @IBOutlet var fourthIndex: UICircularProgressRing!
    
    
    @IBOutlet var likeButton: UIBarButtonItem!
    @IBAction func likedButton(_ sender: Any) {

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.firstIndex.maxValue = 100.0
//        self.firstIndex.innerRingColor = mixGreenAndRed(greenAmount: 0.7)
//        self.firstIndex.innerRingWidth = 5
//        self.firstIndex.outerRingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        self.firstIndex.outerRingWidth = 5
//        self.firstIndex.style = .ontop
//        self.firstIndex.font = .systemFont(ofSize: 15)
//        self.firstIndex.startProgress(to: 70.0, duration: 5.0) {
//            print("Done animating!")
//        }
//            
//            self.secondIndex.maxValue = 100.0
//            self.secondIndex.innerRingColor = mixGreenAndRed(greenAmount: 1)
//            self.secondIndex.innerRingWidth = 5
//            self.secondIndex.outerRingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            self.secondIndex.outerRingWidth = 5
//            self.secondIndex.style = .ontop
//            self.secondIndex.font = .systemFont(ofSize: 15)
//            self.secondIndex.startProgress(to: 100.0, duration: 2.0) {
//                print("Done animating!")
//                
//            }
//                
//                
//            self.thirdIndex.maxValue = 100.0
//            self.thirdIndex.innerRingColor = mixGreenAndRed(greenAmount: 0.7)
//            self.thirdIndex.innerRingWidth = 5
//            self.thirdIndex.outerRingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            self.thirdIndex.outerRingWidth = 5
//            self.thirdIndex.style = .ontop
//            self.thirdIndex.font = .systemFont(ofSize: 15)
//            self.thirdIndex.startProgress(to: 70.0, duration: 2.0) {
//                print("Done animating!")
//            }
//                
//            self.fourthIndex.maxValue = 100.0
//        
//        self.fourthIndex.innerRingColor = mixGreenAndRed(greenAmount: 0.5)
//            self.fourthIndex.innerRingWidth = 5
//            self.fourthIndex.outerRingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            self.fourthIndex.outerRingWidth = 5
//            self.fourthIndex.style = .ontop
//            self.fourthIndex.font = .systemFont(ofSize: 15)
//            self.fourthIndex.startProgress(to: 50.0, duration: 2.0) {
//                print("Done animating!")
//        }
        Alamofire.request("http://httpbin.org/get", method: HTTPMethod.get, parameters: ["":""])
            .response{ request in
             print(request)
        }
        

        // Do any additional setup after loading the view.
    }
    
    func mixGreenAndRed(greenAmount: Float) -> UIColor {
        // the hues between red and green go from 0…1/3, so we can just divide percentageGreen by 3 to mix between them
        return UIColor(hue: CGFloat(greenAmount / 3), saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
