//
//  ViewController2.swift
//  Cyfer Track
//
//  Created by Huzaifa Ahmed on 10/20/19.
//  Copyright © 2019 cyferlabs. All rights reserved.
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


class ViewController5: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet var capturePreviewLayer: UIView!
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureSession: AVCaptureSession?
    var barcodeDetector :VisionBarcodeDetector?
    lazy var vision = Vision.vision()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let captureSession = AVCaptureSession()
               guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
               guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
               captureSession.addInput(input)
               
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
               self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
               self.previewLayer?.connection?.videoOrientation = .portrait
               view.layer.insertSublayer(self.previewLayer!, at: 0)
               self.previewLayer?.frame = view.frame
               let dataOutput = AVCaptureVideoDataOutput()
               dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
               self.captureSession?.addOutput(dataOutput)
                self.barcodeDetector = vision.barcodeDetector()

        captureSession.startRunning()
           captureSession.addOutput(dataOutput)
               
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    //        print("Camera was able to capture a frame:", Date())
            
                if let barcodeDetector = self.barcodeDetector {
                       let visionImage = VisionImage(buffer: sampleBuffer)
                       barcodeDetector.detect(in: visionImage) { (barcodes, error) in
                           
                           if let error = error {
                               print(error.localizedDescription)
                               return
                           }
                           else if barcodes?.isEmpty != true {
                           print(barcodes!)
                            self.performSegue(withIdentifier: "presentQueries", sender: self)
                                                            
    
                            }

                       }
                }
        
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
