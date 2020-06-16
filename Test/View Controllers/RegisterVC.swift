import UIKit
import RxSwift
import RxCocoa

class RegisterVC: UIViewController {
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPWD: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtPPWD: UITextField!
    
    let vm = RegisterVM()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        
        
    }
    
    
    @IBAction func clockOnRegister(_ sender: UIButton) {
        vm.validateAndRegisterUser(completion: { status, message in
            switch status {
            case true:
                //self.startLoading()
                vm.userRegisterNetworkRequest(completion: { success, statusCode, message in
                    //self.stopLoading()
                    if success {
                        ApplicationService.shared.presentViewController(in: .Main, for: .MainTBC, from: self)
                    } else {
                        let _action = AlertAction(title: .Dismiss, style: .default)
                        AlertProvider(vc: self).showAlert(title: .Warning, message: message, action: _action)
                    }
                })
            default:
                let _action = AlertAction(title: .Dismiss, style: .default)
                AlertProvider(vc: self).showAlert(title: .Warning, message: message, action: _action)
            }
        })
        
        
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
        
        txtPPWD.rx.text
            .orEmpty
            .bind(to: vm.confirmPassword)
            .disposed(by: bag)
        
        txtPhone.rx.text
            .orEmpty
            .bind(to: vm.phone)
            .disposed(by: bag)
        
        txtFName.rx.text
            .orEmpty
            .bind(to: vm.firstName)
            .disposed(by: bag)
        
        txtLName.rx.text
            .orEmpty
            .bind(to: vm.lastName)
            .disposed(by: bag)
    }
    
    
    
    
    
}
