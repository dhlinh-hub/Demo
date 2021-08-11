import UIKit
import RxSwift

enum MyError: Error {
  case anError
}

let iOS = 1
let ad = 2
let flutter = 3
let bag = DisposeBag()

let osb1 = Observable<Int>.just(iOS)
let osb2 = Observable.of(iOS,ad,flutter)
let osb3 = Observable.from([iOS,ad,flutter])

osb2.subscribe({ event in
  if let element = event.element {
    print(element)
    
  }
  
})
.disposed(by: bag)

//osb3.subscribe(onNext: { (value) in
//        print(value)
//    }, onError: { (error) in
//        print(error.localizedDescription)
//    }, onCompleted: {
//        print("Completed")
//    }) {
//        print("Disposed")
//    }
//
let observable = Observable<Int>.range(start: 1, count: 10)
    var sum = 0
    observable
        .subscribe(
            onNext: { i in
                sum += i
        } , onCompleted: {
            print("Sum = \(sum)")
        }
    )


// dispose
let osb4 = Observable<String>.create({ observer -> Disposable in
  observer.onNext("1")
          
          observer.onNext("2")
          
          observer.onNext("3")
          
          observer.onNext("4")
          observer.onError(MyError.anError)
          observer.onNext("5")
          
          observer.onCompleted()
          
          observer.onNext("6")
          
          return Disposables.create()
})
osb4.subscribe(onNext: { print($0)},
               onError: {print($0)},
               onCompleted: {print("complete")},
               onDisposed:{ print("Dispose")}
)
.disposed(by: bag)

let obs = Observable<Void>.empty()

obs.subscribe(onNext: {value in
  print(value)

}, onCompleted: {
  print("conpletion")
})
