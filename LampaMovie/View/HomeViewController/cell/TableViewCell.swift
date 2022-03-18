//
//  TableViewCell.swift
//  LampaMovie
//
//  Created by 1 on 18.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseMovieLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ovarviewTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func update(data: Result){
        backgroundColor = UIColor(red: 12/255, green: 8/255, blue: 48/255, alpha: 10)
        releaseMovieLabel.text = data.releaseDate
        ovarviewTextLabel.text = data.overview
        titleLabel.text = data.originalTitle
        
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w300\(data.posterPath ?? "/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg")")!)){
            (data, req,error) in
            do {
                let datas = try data
                DispatchQueue.main.async { [self] in
                    
                    self.posterImage.image = UIImage(data: datas!)
                }
            } catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
