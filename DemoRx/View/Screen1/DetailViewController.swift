//
//  DetailViewController.swift
//  DemoRx
//
//  Created by Ishipo on 06/08/2021.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  let discriptionName = BehaviorRelay<String>(value: "")
  let imageName = BehaviorRelay<String>(value: "")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageName.map({ name in
      UIImage.init(systemName: name)
    })
    .bind(to: imageView.rx.image).disposed(by: DisposeBag())
    
    discriptionName.bind(to: titleLabel.rx.text)
      .disposed(by: DisposeBag())
    
  }
  
  
}
