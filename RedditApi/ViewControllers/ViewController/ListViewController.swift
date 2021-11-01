//
//  ViewController.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/23/21.
//

import UIKit

class ListViewController: UIViewController {
    let listTableView = UITableView()
    private let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        view.addSubview(listTableView)
        setTableViewConstraints()
        configureTableView()
        bindObject()
        self.viewModel.input.getRedditList()
        
    }
     
    private func setTableViewConstraints() {
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        listTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    // MARK: - Bind object
    private func bindObject() {
        viewModel.output.reloadTable.bind { [weak self] status in
            guard let self = self else { return }
            if status {
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
    
    func configureTableView(){
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        listTableView.estimatedRowHeight = Constants.tableRowHeight
        listTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupNavigation() {
        navigationItem.title = Constants.navigationTitle
        navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? ListTableViewCell
            let model = viewModel.output.getItemForRow(index: indexPath.row)
        cell?.loadDataOnCell(thumbnailUrl: model?.thumbnail ?? "", title: model?.title ?? "", commentNumber: model?.num_comments ?? 0, scoreApi: model?.score ?? 0)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Constants
extension ListViewController {
    private enum Constants {
        static let tableRowHeight = 100.0
        static let navigationTitle = "T Mobile Project"
        static let cellIdentifier = "redditCell"
    }
}

