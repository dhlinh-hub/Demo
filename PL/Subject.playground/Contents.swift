import UIKit
import RxSwift

enum MyError: Error {
      case anError
    }

// Publish cung cấp giá trị mới nhất khi có scubcriber đki tới

let disposeBag = DisposeBag()
let subject = PublishSubject<String>()

subject.onNext("1")

// subscribe 1
let subscription1 = subject
  .subscribe(onNext: { value in
    print("Sub 1: ", value)
  }, onCompleted: {
    print("sub 1: completed")
  })

// emit
subject.onNext("2")

// subscribe 2
let subscription2 = subject
  .subscribe(onNext: { value in
    print("Sub 2: ", value)
  }, onCompleted: {
    print("sub 2: completed")
  })

// emit
subject.onNext("3")
subject.onNext("4")
subject.onNext("5")

// dispose subscription2
subscription2.dispose()

// emit
subject.onNext("6")
subject.onNext("7")

// completed
subject.on(.completed)
// emit
subject.onNext("8")

// subscribe 3
subject .subscribe {
  print("sub 3: ", $0.element ?? $0)
}
.disposed(by: disposeBag)
// subcribe đki tới sau không nhận đc giá trị trc đó subject phát ra


// Behavior Subject sẽ luôn cung cấp giá trị cuối cùng mà nó phát ra cho các subscriber khi đăng kí tới. Ngoài ra còn phải cung cấp giá trị ban đầu cho nó

// subcribe đki tới sau nhận đc giá trị trc đó subject phát ra

let subject2 = BehaviorSubject(value: "0")

subject2.subscribe {
       print("🔵 ", $0)
     }
   .disposed(by: disposeBag)

subject2.onNext("1")
subject2.onNext("5")

subject2.subscribe {
        print("🔴 ", $0)
      }
    .disposed(by: disposeBag)
subject2.subscribe {
       print("🟠 ", $0)
     }
   .disposed(by: disposeBag)
