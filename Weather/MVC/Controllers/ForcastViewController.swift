//
//  ViewController.swift
//  Weather
//
//  Created by Antonio Flores on 6/11/21.
//

import UIKit

class ForcastViewController: UIViewController {
    
    @IBOutlet weak var weekForcastTableView: UITableView!
    
    @IBOutlet weak var currentForcastView: CurrentForcastView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Weather Forcast"
        weekForcastTableView.delegate = self
        weekForcastTableView.dataSource = self
        loadWeatherData()
    }
    
    private func loadWeatherData(){
        ProjectAPIClient.manager.getProjects { (results) in
            DispatchQueue.main.async {
                switch results {
                case let .success(weather):
                    dump(weather)
                
                case let .failure(error):
                    dump(error)
                }
            }
        }
    }
    
}

extension ForcastViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "7 Day Forcast"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 28)
        myLabel.font = UIFont.boldSystemFont(ofSize: 26)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
    
    
}
