//
//  SceneDelegate.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        let myNaviViewController = MyNaviViewController()
        let navi = UINavigationController(rootViewController: myNaviViewController)
        
        window?.rootViewController = navi
        //let cv = CollectionView()
        //window?.rootViewController = cv
        
        window?.makeKeyAndVisible()
    }
}

