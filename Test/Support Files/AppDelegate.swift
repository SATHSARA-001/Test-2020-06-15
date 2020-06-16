
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // guard let _ = (scene as? UIWindowScene) else { return }
//        let state = UserDefaults.standard.bool(forKey: "AgreeStatus")
//
//        if state {
//            
//            let sb = UIStoryboard.init(name: "Main", bundle: nil)
//            let vc = sb.instantiateViewController(identifier: "LoginPage") as! LoginVC
//            setRoot(_controller: vc)
//        }
        return true
    }
    
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func setRoot(_controller: UIViewController) {
        if window != nil {
            window?.rootViewController = _controller
        }
    }
    
    
    
    
}

