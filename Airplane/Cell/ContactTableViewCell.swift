//
//  ContactTableViewCell.swift
//  Airplane
//
//  Created by Carlos on 28/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit
import MessageUI

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureShadow(view: mView)
        tapPhone()
        tapEmail()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.phone.text = ""
        self.email.text = ""
    }
    
    func configureCell(user: UserResult) {
        guard let phone = user.phone,
            let email = user.email
            else { return }
        
        self.phone.text = "Phone: \(phone)"
        self.email.text = "\(email)"        
    }
    
}

extension ContactTableViewCell {
    
    func tapPhone() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapPhoneFunction))
        self.phone.isUserInteractionEnabled = true
        self.phone.addGestureRecognizer(tap)
    }
    
    @objc func tapPhoneFunction(sender: UITapGestureRecognizer) {
        print("tapped")
        
        let number = "\(self.phone.text?.dropFirst(7) ?? "0")"
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(url)
            }
            
        }
    }
    
}
extension ContactTableViewCell : MFMailComposeViewControllerDelegate {
    
    func tapEmail() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEmailFunction))
        self.email.isUserInteractionEnabled = true
        self.email.addGestureRecognizer(tap)
    }
    
    @objc func tapEmailFunction(sender: UITapGestureRecognizer) {
        print("tapped")
        
        let email = "\(self.email.text ?? "")"
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            window?.rootViewController?.present(mail, animated: true, completion: nil)
            //present(mail, animated: true)
        } else {
            // show failure alert
            let alert = UIAlertController(title: "Email no disponible", message: "Verifique que el correo es válido", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}
