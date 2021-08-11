//
//  LoginViewController.swift
//  DemoRx
//
//  Created by Ishipo on 06/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  private var state = BehaviorRelay<Bool>(value: false)
  private var bag = DisposeBag()
  private var viewModel = LoginViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //    Observable.combineLatest(usernameTextField.rx.text.orEmpty,
    //                             passwordTextField.rx.text.orEmpty)
    //      .map({ username , password -> Bool in
    //        print(username , password)
    //        return username.count >= 6 && password.count >= 6
    //      })
    //      .bind(to: state)
    //      .disposed(by: bag)
    
    //
    //    state.subscribe(onNext: { state in
    //      self.loginButton.isEnabled = state
    //      switch state {
    //      case true:
    //        self.loginButton.layer.opacity = 1
    //
    //      case false:
    //        self.loginButton.layer.opacity = 0.1
    //      }
    //
    //    }).disposed(by: bag)
    
    
    
    // MARK : cach lam thu 2
    usernameTextField.rx.text.map({ $0 ?? ""})
      .bind(to: viewModel.username)
      .disposed(by: bag)
    
    passwordTextField.rx.text.map({ $0 ?? ""})
      .bind(to: viewModel.password)
      .disposed(by: bag)
    
    viewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: bag)
    viewModel.isValid().map({ $0 ? 1 : 0.1}).bind(to: loginButton.rx.alpha).disposed(by: bag)
    
// MARK: cach lam thu 3
//    viewModel.isValid().map({ status in
//                              self.loginButton.isEnabled = status
//                              switch status {
//                              case true:
//                                self.loginButton.layer.opacity = 1
//                              case false:
//                                self.loginButton.layer.opacity = 0.1
//
//                              }}).subscribe().disposed(by: bag)
    
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  
  
  @IBAction func onLogin(_ sender: Any) {
    print("tap")
  }
  
  @IBAction func onRegister(_ sender: Any) {
  }
  
  
}
