//
//  BaseViewModel.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation
import RxSwift

class BaseViewModel {
    let disposeBag = DisposeBag()
    lazy var loadingVariable: PublishSubject<Bool> = {
        return PublishSubject<Bool>()
    }()
    lazy var errorVariable: PublishSubject<Errors> = {
        return PublishSubject<Errors>()
    }()
    
    func showPreloader() {
        DispatchQueue.main.async {
            self.loadingVariable.onNext(true)
        }
    }
    
    func hidePreloader() {
        DispatchQueue.main.async {
            self.loadingVariable.onNext(false)
        }
    }
}
