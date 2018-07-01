//
//  ViewController.swift
//  AdMobTutorial
//
//  Created by Chinmay Patel on 5/16/18.
//  Copyright © 2018 Chinmay Patel. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate  {

    
    @IBOutlet weak var bannerAds: GADBannerView!
    
    var bannerView :GADBannerView!
    var fullScreenAds: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "ca-app-pub-1225287311267200/8812562900"];
        
        bannerAds.adUnitID = "ca-app-pub-1225287311267200/8812562900"
        bannerAds.rootViewController = self
        bannerAds.load(request)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnShowFullScreenAds(_ sender: Any) {
        
        self.fullScreenAds = CreateAndLoadInterstitial()
        
    }
    
    
    func CreateAndLoadInterstitial() -> GADInterstitial? {
        
        fullScreenAds = GADInterstitial(adUnitID: "ca-app-pub-1225287311267200/9470328000")
        guard let fullScreenAds = fullScreenAds else {
            return nil
        }
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "ca-app-pub-1225287311267200/9470328000"]
        fullScreenAds.load(request)
        fullScreenAds.delegate = (self)
        
        return fullScreenAds
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Ads Loaded")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("Ads not Load")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

