

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
        let state = UserDefaults.standard.bool(forKey: "AgreeStatus")
        
        if state {
            
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let rootController = sb.instantiateViewController(withIdentifier: "AuthNC")
            window?.rootViewController = rootController
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    func setRoot(_controller: UIViewController) {
        if window != nil {
            window?.rootViewController = _controller
        }
    }
    
    
}

