//
//  DescTVC.swift
//  DesafioSantanderIOS
//
//  Created by Cátia Souza on 24/03/21.
//

import UIKit

class DescTVC: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var valor: UILabel!
    
    @IBOutlet weak var view: UIView!{
        didSet {
            
            view.layer.cornerRadius = 10
            view.layer.shadowOpacity = 100
            view.layer.shadowRadius = 4
            view.layer.shadowColor = UIColor.systemGray6.cgColor
            view.layer.shadowOffset = CGSize (width: 0, height: 9)
            view.layer.borderColor = UIColor.systemGray4.cgColor
            view.layer.borderWidth = 0.2
            
        }
    }
    
    func setupUser(_ user: Users){
        update(title: user.title, desc: user.desc, date: user.date, value: user.value)
    }
   
    private func update(title: String?, desc: String?,date: String?,value: Double?){
        self.title.text = title
        self.desc.text = desc
        self.date.text = convertDateFormater(date)
        self.valor.text = " \(String(format: "%2.f",value as! CVarArg))"
    }
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd/MM/yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }

}
