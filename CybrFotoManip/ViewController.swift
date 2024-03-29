//
//  ViewController.swift
//  CatwangFree
//
//  Created by Franky Aguilar on 9/16/15.
//  Copyright (c) 2015 99centbrains. All rights reserved.
//

import UIKit
import Foundation
import SafariServices
import iNotify
import KiteSDK
import TMTumblrSDK
import FBSDKCoreKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var ibo_systemModel:UILabel!
    @IBOutlet weak var ibo_backgroundView:UIImageView!

    override func viewDidLoad() {
        
       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //SET FREE STICKERS//
        
        UserDefaults.standard.set(true, forKey: "com.99centbrains.cybrfm.free00")
        UserDefaults.standard.set(true, forKey: "com.99centbrains.cybrfm.free01")
        
        UserDefaults.standard.set(true, forKey: "emojitab01")
        UserDefaults.standard.set(true, forKey: "emojitab02")
        UserDefaults.standard.set(true, forKey: "emojitab03")
        UserDefaults.standard.set(true, forKey: "emojitab04")
        UserDefaults.standard.set(true, forKey: "emojitab05")
        
  
        navigationController?.navigationBar.tintColor = UIColor.magenta
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ui_cropview_checkers")!)
        
        let bundle = "CyberNetArt"
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        ibo_systemModel.text = "\(bundle)::\(version)"
    
       
        
    
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
//        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        
    
    }
    
    override func viewDidLayoutSubviews() {
        //
        super.viewDidLayoutSubviews()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iba_openEditor(){
        
        let storyboard = self.storyboard
        let playView = storyboard?.instantiateViewController(withIdentifier: "sb_CWPlayViewController") as! CWPlayViewController
        self.navigationController?.pushViewController(playView, animated: true)

    }
    
    @IBAction func iba_openEdits(){
    
    }
    
    @IBAction func iba_openInternet(){
    
    }
    
    @IBAction func iba_openTwitter(){
        
        let webview = SFSafariViewController(url: URL(string:"https://www.instagram.com/99centbrains")!)
        self.present(webview, animated: true, completion: nil)
        
        FBSDKAppEvents.logEvent("Social Instagram")
    
    }
    
    @IBAction func iba_openSettings(){
        
        let alertController = UIAlertController(
            title: "Choose Image",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        
        alertController.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
            })
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            })
        
        if ibo_backgroundView.image != nil {
            alertController.addAction(UIAlertAction(title: "Clear", style: .default) { _ in
                imagePicker.sourceType = .photoLibrary
                self.ibo_backgroundView.image = nil
                DocumentManager().clearDirectory(kAlbum.kSettings)
            })
        }
        
        alertController.addAction(UIAlertAction(title: "Never Mind", style: .cancel) { _ in
            alertController.dismiss(animated: true, completion: { () -> Void in
                //
            })
            })
        //
        //        if let popoverController = alertController.popoverPresentationController {
        //            popoverController.sourceView = sender
        //            popoverController.sourceRect = sender.bounds
        //        }
        
        
        present(alertController, animated: true) { () -> Void in
            //
        }

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: { () -> Void in
            
            print("Dismiss")
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                self.ibo_backgroundView.image = pickedImage
                DocumentManager().clearDirectory(kAlbum.kSettings)
                DocumentManager().saveImage(pickedImage, directory: kAlbum.kSettings)
                
            }
            
        })
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func iba_openTexter(){
        
    }
    
    
    @IBAction func iba_openChatter(){
        
        let webview = SFSafariViewController(url: URL(string:"http://cybrfm.chatango.com")!)
        self.present(webview, animated: true, completion: nil)
        
        FBSDKAppEvents.logEvent("Social Chatter")
        
    }
    
    @IBAction func iba_printImage(_ sender:UIButton){
        let asset = OLAsset(imageAsPNG: UIImage(named:"ui_bg_aqua.png"))
        let kViewCon = OLKiteViewController.init(assets: [asset!])
        present(kViewCon!, animated: true, completion: nil)
        
        FBSDKAppEvents.logEvent("Print Shop")
        
    }
    
  
}

class HeaderCollectionCell:UICollectionReusableView {
    
    @IBOutlet var ibo_backgroundView:UIView!
    @IBOutlet var ibo_dailyImage:UIImageView!
    
    @objc func setView(){
    
//        ibo_backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "ui_cropview_checkers")!)
//        
        
//        TMAPIClient.sharedInstance().posts("cybrfm.99centbrains.com", type: "photo", parameters:
//            ["limit" : 1, "offset" : 0, "filter" : "raw"]) { (result:AnyObject!, error:NSError!) -> Void in
//                
//                if (error == nil){
//                    
//                    //print(result)
//                    
//                }
//        }

    }
    
    
}

class UserImageCollectionCell:UICollectionViewCell {
    
    @objc var userImagePath:String!
    @IBOutlet var ibo_imagePath:UIImageView!
    
    @objc func setupImage(_ path:String){
        
        ibo_imagePath.image = nil
        
        print(path)
        
        let image = UIImage(contentsOfFile: path)
        if image != nil {
            ibo_imagePath.image = image
        }
        
    }
    
}

