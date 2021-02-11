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
    
    fileprivate let kBookCell = String(describing: BookCell.self)
    var viewModel = SearchBooksViewModel()
    lazy var searchController: UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()
    lazy var imageDownloadQueue: DispatchQueue = {
        return  DispatchQueue(label: Constants.Queues.imageDownloadConcurrentQueue,
                              attributes: .concurrent)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupObservables()
    }
    
    func setupObservables() {
        searchController.searchBar.rx.text.orEmpty
                .debounce(.milliseconds(1500), scheduler: MainScheduler.instance)
                .subscribe(onNext: { [unowned self] (query) in
                    print(query)
                    self.viewModel.searchBooks(query: query)
                }).disposed(by: self.disposeBag)
        
        viewModel.booksRelay.bind(to: tblBooks.rx.items(cellIdentifier: kBookCell)) { row, model, cell in
            guard let cell = cell as? BookCell else { return }
            cell.setBookItem(item: model, dispatchQueue: self.imageDownloadQueue)
        }.disposed(by: disposeBag)
        
        viewModel.loadingVariable.subscribe(onNext: { (shouldShow) in
            if (shouldShow) {
                self.showPreloader()
            } else {
                self.hidePreloader()
            }
        }).disposed(by: disposeBag)
    }
    
    func setupController() {
        definesPresentationContext = true
        tblBooks.tableHeaderView = searchController.searchBar
        tblBooks.register(UINib(nibName: kBookCell, bundle: nil), forCellReuseIdentifier: kBookCell)
        tblBooks.tableFooterView = UIView()
    }
}
