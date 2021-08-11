//
//  RegisterViewController.swift
//  DemoRx
//
//  Created by Ishipo on 04/08/2021.
//

import UIKit
import RxCocoa
import RxSwift


class RegisterViewController: UIViewController {
  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var usernameLabel: UITextField!
  @IBOutlet weak var passwordLabel: UITextField!
  @IBOutlet weak var emailLabel: UITextField!
  
  private let bag = DisposeBag()
  private let image = BehaviorRelay<UIImage?>(value: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    userImage.layer.cornerRadius = 60

  }
  
  
  @IBAction func changrAvatar(_ sender: Any) {
    gotoLibary()
    
  }
  
  private func gotoLibary() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
    self.present(imagePicker, animated: true, completion: nil)
  }
  
  @IBAction func onRegister(_ sender: Any) {
    RegisterViewModel.shared.register(username: usernameLabel.text,
                                      password: passwordLabel.text,
                                      email: emailLabel.text)
      
      
      .subscribe(onNext: { state in
       print("Register successfully")
        self.gotoMusicScreen()

        
      }, onError: { error in
        if let myerror = error as? APIError {
          print("Register with error : \(myerror.localizedDescription)")
        }
      }, onCompleted: {
        print("Register completed")
      })
      .disposed(by: bag)
    
    
  }
  private func gotoMusicScreen(){
    let vc = Screen1ViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
  
}

extension RegisterViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let imagePick = info[.originalImage] as? UIImage {
      userImage.image = imagePick
      picker.dismiss(animated: true, completion: nil)
      
    }
  }
}
