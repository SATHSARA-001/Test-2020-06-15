import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAgreeStatus()
        //UserDefaults.resetStandardUserDefaults()
        
    }
    
    @IBAction func clickOnAgree(_ sender: UIButton) {
        
        let agreeStatus = UserDefaults.standard
        agreeStatus.set(true,forKey: "AgreeStatus")
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginPage") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func checkAgreeStatus(){
        let status = UserDefaults.standard.bool(forKey: "AgreeStatus")
        
        if status == true{
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "LoginPage") as! LoginVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
        else{
            print("Did not agree")
            
        }
        
    }
    
    
}

