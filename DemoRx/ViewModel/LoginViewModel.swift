//
//  LoginViewModel.swift
//  DemoRx
//
//  Created by Ishipo on 07/08/2021.
//

import RxSwift
import RxCocoa


class LoginViewModel {
  
  let username = BehaviorSubject<String>(value: "")
  let password = BehaviorSubject<String>(value: "")
  
  
  func isValid() -> Observable<Bool>{
    Observable.combineLatest(username.asObserver(), password.asObserver())
      .map({ username , password in
        return username.count >= 5 && password.count >= 5
        
      })
    
  }
  
  
}
