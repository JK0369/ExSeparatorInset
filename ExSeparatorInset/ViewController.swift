//
//  ViewController.swift
//  ExSeparatorInset
//
//  Created by 김종권 on 2023/05/26.
//

import UIKit

class ViewController: UIViewController {
    private let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.bounces = true
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.estimatedRowHeight = 34
        view.separatorInset = .init(top: 0, left: 5, bottom: 0, right: 5) // <-
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dataSource = (1...20).map(String.init)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = dataSource[indexPath.row] + " 가나다라마바사아자차카타파하" + " ABCDEFGHIJK" + " iOS 앱 개발 알아가기"
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .green.withAlphaComponent(0.3)
        return cell
    }
}
