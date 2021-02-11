//
//  BaseController.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import UIKit
import RxCocoa
import RxSwift
import JGProgressHUD

class BaseController: UIViewController {
    let disposeBag = DisposeBag()
    lazy var progressHud: JGProgressHUD = {
        let progressView = JGProgressHUD()
        return progressView
    }()
    
    func showAlert(title: String, message: String, onDefaultAction: (() -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
            onDefaultAction?()
        }))
        self.present(alert, animated: true)
    }
    
    func showPreloader() {
        DispatchQueue.main.async {
            self.progressHud.show(in: self.view, animated: true)
        }
    }
    
    func hidePreloader() {
        DispatchQueue.main.async {
            self.progressHud.dismiss()
        }
    }
}
