//
//  VCMovieDetail.swift
//  LampaMovie
//
//  Created by 1 on 18.03.2022.
//

import UIKit

class VCMovieDetail: UIViewController {

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
   // @IBOutlet var dataLabel: UILabel!
   
    @IBOutlet var releaseTextLabel: UILabel!
    
    var movies : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 12/255, green: 8/255, blue: 48/255, alpha: 10)

        openView()
        
    }
    func openView(){
        titleLabel.text = "\((movies?.originalTitle)!)"
        overviewLabel.text = "Description:\n\((movies?.overview)!)"
        releaseTextLabel.text = "Release:\((movies?.releaseDate)!)"
    }

}

