//
//  RepTableViewCell.swift
//  FindMyRep
//
//  Created by Eva Marie Bresciano on 6/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var partyLabel: UILabel!
    
    @IBOutlet weak var districtLabel: UILabel!
    
    @IBOutlet weak var officeLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithRep(rep: Rep) {
        nameLabel.text = rep.name
        partyLabel.text = rep.party
        districtLabel.text = rep.district
        officeLabel.text = rep.office
        phoneLabel.text = rep.phone
    }

  
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
