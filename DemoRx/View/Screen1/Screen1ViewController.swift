//
//  Screen1ViewController.swift
//  DemoRx
//
//  Created by Ishipo on 06/08/2021.
//

import UIKit
import RxCocoa
import RxSwift

class Screen1ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  private var viewModel = ProfileViewModel()
  private var bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    bindData()
  }
  
  func bindData() {
    viewModel.item.bind(to: tableView.rx.items(cellIdentifier: "ProfileTableViewCell")) {row , item , cell in
      cell.textLabel?.text = item.name
      cell.imageView?.image = UIImage(systemName: item.image!)
    }
    .disposed(by: bag)
    
    tableView.rx.modelSelected(Profile.self).bind { item in
      let detailVC = DetailViewController()
      detailVC.imageName.accept(item.image!)
      detailVC.discriptionName.accept(item.name!)
      self.present(detailVC, animated: true, completion: nil)
      
    }.disposed(by: bag)
    
    
    viewModel.fetchData()
  }
  
  
  
}
