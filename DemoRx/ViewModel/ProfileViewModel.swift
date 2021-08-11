//
//  MusicViewModel.swift
//  DemoRx
//
//  Created by Ishipo on 05/08/2021.
//

import Foundation
import RxSwift

class ProfileViewModel {
  
  let item = PublishSubject<[Profile]>()
  
  let model = [
    Profile(name: "Home", image: "house"),
    Profile(name: "Settings", image: "gear"),
    Profile(name: "Profile", image: "person.circle"),
    Profile(name: "flights", image: "airplane"),
    Profile(name: "Activity", image: "bell")
  ]
  
  public func fetchData() {
    item.onNext(model)
    item.onCompleted()
  }

}
