//
//  SceneDelegate.swift
//  Finity
//
//  Created by michelidze'smacbook on 25.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//        let onboardingViewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
//        window?.rootViewController = UINavigationController(rootViewController: onboardingViewController)
//        window?.makeKeyAndVisible()
        
        guard let scene = (scene as? UIWindowScene) else { return }
                window = UIWindow(windowScene: scene)
                window?.makeKeyAndVisible()
                let vc = UIStoryboard(name: "TabBarController", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
                window?.rootViewController = UINavigationController(rootViewController: vc)
        

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if let blurView = window?.subviews.first(where: { $0 is UIVisualEffectView }) {
            blurView.removeFromSuperview()
        }
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        NotificationCenter.default.post(name: NSNotification.Name("sceneDidBecomeActive"), object: nil)
        }
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        NotificationCenter.default.post(name: NSNotification.Name("sceneWillResignActive"), object: nil)
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = window?.frame ?? .zero
               window?.addSubview(blurView)
        
        }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

