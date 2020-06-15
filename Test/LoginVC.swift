import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnFPwd: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func clickOnSignUp(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegisterPage") as! RegisterVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickOnFPwd(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ForgotPasswordPage") as! ForgotPasswordVC
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func clickOnSignIn(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomePage") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    
    
}
