//
//  ListViewModel.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/24/21.
//

import Foundation

// MARK: -  ListViewModelInputType
protocol ListViewModelInputType {
    func getRedditList()
}

// MARK: -  ListViewModelOutputType
protocol ListViewModelOutputType {
    var reloadTable: Dynamic<Bool> { get }
    func getNumberOfRows() -> Int
    func getItemForRow(index: Int) -> RedditModelChildrenData?
}

// MARK: - ListViewModelType
protocol ListViewModelType {
    var input: ListViewModelInputType { get }
    var output: ListViewModelOutputType { get }
}

// MARK: -  ListViewModel
class ListViewModel: NSObject, ListViewModelType, ListViewModelInputType, ListViewModelOutputType {
    
    var input: ListViewModelInputType { return self }
    var output: ListViewModelOutputType { return self }
    var reloadTable: Dynamic<Bool> = Dynamic(false)
    var reddits: [RedditModelChildren] = []
    private let service = ListViewService.sharedInstance

    func getRedditList() {
        service.fetchReddits { [weak self] redditsData in
            guard let self = self else { return }
            if redditsData != nil {
                self.reddits = redditsData?.data?.children ?? []
                self.reloadTable.value = true
            }
        }
    }

    func getNumberOfRows() -> Int {
        return reddits.count
    }
 
    func getItemForRow(index: Int) -> RedditModelChildrenData? {
        return reddits[index].data
    }
}

