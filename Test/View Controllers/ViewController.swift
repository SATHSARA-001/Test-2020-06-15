import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clickOnAgree(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "AgreeStatus")
    }
    
   
    
    
}

