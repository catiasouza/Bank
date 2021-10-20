//
//  ViewController.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//
//teste
import UIKit

class DescVC: UIViewController {

    @IBOutlet weak var descTableView: UITableView!
    let cellIdentifier = "cell"
    private var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.confCell()
        
    }
    func setupTableView(){
        viewModel.fetchClient {
            [weak self] in
            self?.descTableView.dataSource = self
            self?.descTableView.delegate = self
            self?.descTableView.reloadData()
            
        }
        
    }
    func confCell(){
        descTableView.separatorStyle  = .none
        descTableView.showsVerticalScrollIndicator = false
    }
    
}
extension DescVC:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DescTVC
        
        let client = viewModel.cellForRowAt(indexpath: indexPath)
        
        cell.setupUser(client)

    
        return cell
    }
    
    
}
