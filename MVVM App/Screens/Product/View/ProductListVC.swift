//
//  ProductListVC.swift
//  MVVM App
//
//  Created by Suraj Jaiswal on 08/02/23.
//

import UIKit

class ProductListVC: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}


extension ProductListVC{
    
    func configuration() {
        
        productTableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCellTableViewCell")
        
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // Data binding ---  to observe event --- communication
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                // show the indicator
                print("Loading...")
            case .stopLoading:
                // hide the indicator
                print("Stop Loading...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    // to update main thread
                    self.productTableView.reloadData()
                }
            case .error(_):
                print("Error")
            }
        }
    }
}

extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellTableViewCell") as? ProductCellTableViewCell else{
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    
}







