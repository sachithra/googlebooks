//
//  SearchBooksController.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import UIKit
import RxCocoa
import RxSwift

class SearchBooksController: BaseController {
    @IBOutlet weak var tblBooks: UITableView!
    
    var viewModel = SearchBooksViewModel()
    lazy var searchController: UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupObservables()
    }
    
    func setupObservables() {
        searchController.searchBar.rx.text.orEmpty
                .debounce(.milliseconds(1500), scheduler: MainScheduler.instance)
                .subscribe(onNext: { [unowned self] (text) in
                    print(text)
                }).disposed(by: self.disposeBag)
    }
    
    func setupController() {
        definesPresentationContext = true
        tblBooks.tableHeaderView = searchController.searchBar
    }
}
