//
//  AppDelegate.swift
//  YWNativeDemo
//
//  Created by odd on 4/17/24.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

///< MARK: print
func YWLog<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):funciton:\(function):line:\(lineNumber)]- \(message)")
    #endif
}

let YWWAppDelegate = UIApplication.shared.delegate as? YWAppDelegate

@main
class YWAppDelegate: UIResponder, UIApplicationDelegate {

    lazy var flutterEngine = FlutterEngine(name: "flutter engine")

    var window: UIWindow?
    var tab: YWTabBarCtrl?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        initRootViewController()
        return true
    }

    
    func initRootViewController() {
        
        self.tab = YWTabBarCtrl()        
        self.window?.rootViewController = self.tab!
        self.window?.makeKeyAndVisible()
    }
}

