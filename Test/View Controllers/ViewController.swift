import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickOnAgree(_ sender: UIButton) {
        
        Defaults.userAgreed()
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginPage") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    
}

