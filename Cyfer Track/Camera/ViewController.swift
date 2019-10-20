//
//  ViewController.swift
//  AI Hackathon 2019
//
//  Created by Huzaifa Ahmed on 3/30/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import CoreML
import Firebase
import FirebaseMLVision
import Vision
import AVKit
import AVFoundation
import Photos
import Alamofire

class ViewController: UIViewController, UINavigationControllerDelegate{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    lazy var vision = Vision.vision()
    var barcodeDetector :VisionBarcodeDetector?
    @IBOutlet weak var boxView: UIView!
    let cameraController = CameraController()
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var capturePreviewView: UIView!
    var imageViewImage: UIImage?
    
    @IBAction func captureImage(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8, animations: {
            self.captureButton.backgroundColor = .white
        })
        UIView.animate(withDuration: 0.8, animations: {
            self.captureButton.backgroundColor = .clear
        })

        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        cameraController.captureImage {(image, error) in
            
            guard image != nil else {
                print(error ?? "Image capture error")
                return
            }
        
          
        }

    }

    override var prefersStatusBarHidden: Bool { return true }
}
extension ViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Check for camera here
    }
    @objc func continueToQuery(string: String){

        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nav1") as? NavViewController {
            self.modalPresentationStyle = .formSheet
            self.present(viewController, animated: true, completion: nil)
         }
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "presentQueries", sender: self)
//        }

    }
    override func viewDidLoad() {
        func configureCameraController() {
            cameraController.prepare {(error) in
                if let error = error {
                    print(error)
                }
                try? self.cameraController.displayPreview(on: self.capturePreviewView)
            }
            
        
        }
        
        func styleCaptureButton() {
            captureButton.layer.borderColor = UIColor.white.cgColor
            captureButton.layer.borderWidth = 4
            captureButton.layer.cornerRadius = min(captureButton.frame.width, captureButton.frame.height) / 2
            boxView.layer.cornerRadius = 10
            boxView.layer.borderWidth = 1
            boxView.layer.borderColor = UIColor.white.cgColor
            boxView.layer.masksToBounds = true
        }
            
        
        styleCaptureButton()
        configureCameraController()
    }



    
}
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}



