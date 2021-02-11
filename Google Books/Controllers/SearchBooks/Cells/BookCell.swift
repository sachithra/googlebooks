//
//  BookCell.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import UIKit
import AlamofireImage

class BookCell: UITableViewCell {
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthors: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setBookItem(item: BookItem, dispatchQueue: DispatchQueue) {
        lblTitle.text = item.volumeInfo?.title
        if let authors = item.volumeInfo?.authors {
            lblAuthors.text = "by " +  authors.joined(separator: ", ")
        } else {
            lblAuthors.text = ""
        }
        lblDescription.text = item.volumeInfo?.subtitle
        activityIndicator.startAnimating()
        if let url = URL(string: item.volumeInfo?.imageLinks?.smallThumbnail ?? "") {
            imgThumbnail.af.setImage(withURL: url, progressQueue: dispatchQueue) { (imageDataResponse) in
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imgThumbnail.image = imageDataResponse.value
                }
            }
        }
    }
}
