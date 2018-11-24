//
//  AppDelegate.swift
//  AroundTheMetro
//
//  Created by Siamak Eshghi on 2017-12-31.
//  Copyright © 2017 AugmentedDiscovery. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn
import GoogleMobileAds
import Fabric
import Crashlytics
import TwitterKit
import FacebookCore
import Firebase
import Proximiio

@UIApplicationMain
class AppDelegate:  UIResponder,
                    UIApplicationDelegate,
                    GIDSignInDelegate,
                    ProximiioDelegate
{
    
    var window: UIWindow?
    let defaults = UserDefaults.standard
 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
          backBtnCongfigView()
          setDefaults()
        //Mark: - Admob banner
        GADMobileAds.configure(withApplicationID: "ca-app-pub-5420876778958572~6113034677")
        
        //Mark: Firebase config
        FirebaseApp.configure()
        
        //Mark:- Twitter Configuration
        TWTRTwitter.sharedInstance().start(withConsumerKey:"hjNxRNRcsyrcOfHIuCOOCPHuN", consumerSecret:"oBb7ZeDDBxS9hSw8GLlL2SBZXBsU1jAvrY5He2AkWI9iGyO8EW")
        
        //MARK: - FACEBOOK SDK CONFIGURATION 1
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //MARK: - Google SDK CONFIGURATION 1
        GIDSignIn.sharedInstance().clientID = "999254037272-kgf3d76b6us3gbgiko8e0rnj6bfa7krt.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self

        
        //MARK: - Fabric SDK Configuration
        Fabric.with([Crashlytics.self])
        
        //MARK: - Proiximiio
        initProximiio()
       
        
        return true
    }

   
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //MArk: - Twitter Configuration2
        
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        
         //MARK: - FACEBOOK SDK CONFIGURATION 2
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        //MARK: - Google SDK CONFIGURATION 2
        _ = GIDSignIn.sharedInstance().handle(url as URL?,
                                              sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                              annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        
        return handled
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       AppEventsLogger.activate(application)
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // GIDSignInDelegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    // ProximiioDelegate
    
    func proximiioPositionUpdated(_ location: ProximiioLocation) {
        NSLog("proximiioPositionUpdated: %@", location)
    }

    func proximiioEnteredGeofence(_ geofence: ProximiioGeofence!) {
        NSLog("proximiioEnteredGeofence: %@", geofence);
    }

    func proximiioExitedGeofence(_ geofence: ProximiioGeofence!) {
        NSLog("proximiioExitedGeofence: %@", geofence);
    }

    func proximiioHandleOutput(_ payload: NSObject!) {
        NSLog("proximiioHandleOutput: %@", payload);
    }
    
    func initProximiio() {
        let token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImlzcyI6IjZhODFkMGM5LTA2YTYtNDc3OC04YTBkLTY5ZjBiODNlMDk2MiIsInR5cGUiOiJhcHBsaWNhdGlvbiIsImFwcGxpY2F0aW9uX2lkIjoiMGVhNjQyNGUtZTlhYy00ZDFkLWIzOTUtZGE3ZDQ4MzM2MzJkIn0.fNjwTaaNAg3O1Ue2cT8MxsDO_6TcqKD_PwsnKtO8X6k"
        
        let proximiio = Proximiio.sharedInstance()
        proximiio!.delegate = self
        
        proximiio!.auth(withToken: token) { (state : ProximiioState) in
            if (state == kProximiioReady) {
                proximiio!.requestPermissions()
                NSLog("Proximi.io ready")
            } else {
                NSLog("Proximi.io auth failure")
            }
        }
    }


}

