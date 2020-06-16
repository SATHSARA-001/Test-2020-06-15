import UIKit
import  RxCocoa
import RxSwift

class LoginVC: UIViewController,LoadingIndicatorDelegate {
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnFPwd: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    
    let vm = LoginVM()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindData()
        
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
        
        do {
            if try  vm.validated() {
                vm.loginAttempt(completion: { success, statusCode, message in
                    // self.stopLoading()
                    if success {
                        print("Success")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeController = storyboard.instantiateViewController(withIdentifier: "MainTBC")
                        homeController.modalPresentationStyle = .fullScreen
                        self.present(homeController, animated: true, completion: nil)
                        Defaults.loggedIn()
                    } else {
                        let _action = AlertAction(title: .Dismiss, style: .default)
                        AlertProvider(vc: self).showAlert(title: .Warning, message: message, action: _action)
                    }
                })
            }
        } catch ValidateError.invalidData(let msg) {
            let _action = AlertAction(title: .Dismiss, style: .default)
            AlertProvider(vc: self).showAlert(title: .Warning, message: msg, action: _action)
        } catch {
            print("error")
        }
        
        
        
    }
    
    
    
    func bindData() {
        txtEmail.rx.text
            .orEmpty
            .bind(to: vm.email)
            .disposed(by: bag)
        
        txtPWD.rx.text
            .orEmpty
            .bind(to: vm.password)
            .disposed(by: bag)
    }
    
    
    
    
    
}
