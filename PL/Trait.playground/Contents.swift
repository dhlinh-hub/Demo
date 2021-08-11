import UIKit
import RxSwift

var greeting = "Hello, playground"

enum FileError: Error {
  case pathError
}

let bag = DisposeBag()

// Single
func readFile(path: String?) -> Single<String> {
  return Single.create { single -> Disposable in
    if path != nil  {
      single(.success("Success!"))
    } else {
      single(.failure(FileError.pathError))
    }
    
    return Disposables.create()
  }
}

readFile(path: "nil")
        .subscribe { event in
            switch event {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
        .disposed(by: bag)

//completable
// Maybe
