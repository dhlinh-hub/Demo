//
//  RegisterViewModel.swift
//  DemoRx
//
//  Created by Ishipo on 05/08/2021.
//

import Foundation
import RxSwift


enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}

enum Account : String {
  case username = "doan"
  case password = "hoai"
  case email = "linh"
}

class RegisterViewModel {
  static let shared = RegisterViewModel()
  
  public func register(username: String? , password : String? , email: String?  ) -> Observable<Bool> {
    return Observable.create({ observer in
      
      if let username = username {
        
        if username == "" {
          observer.onError(APIError.error("username is empty"))
        }
      }else{
        observer.onError(APIError.error("username is nil"))
      }
      
      
      if let password = password {
        if password == "" {
          observer.onError(APIError.error("password is empty"))
        }
      }else{
        observer.onError(APIError.error("password is nil"))
      }
      
      
      if let email = email {
        if email == "" {
          observer.onError(APIError.error("email is empty"))
        }
      }else{
        observer.onError(APIError.error("email is nil"))
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                     observer.onNext((true))
                     observer.onCompleted()
                 }

      return Disposables.create()
      
    })
  }
  
  public func registerWithSingle( username: String? , password: String? , email: String?, avarta: UIImage?) -> Single<Bool> {
    return Single.create { single in
      
      
      
      return Disposables.create()
    }
  }
  
}
