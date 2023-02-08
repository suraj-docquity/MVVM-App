//
//  ProductCellTableViewCell.swift
//  MVVM App
//
//  Created by Suraj Jaiswal on 08/02/23.
//

import UIKit

class ProductCellTableViewCell:
    UITableViewCell {
    
    @IBOutlet private var productCellBG: UIView!
    @IBOutlet private var productTitleLabel: UILabel!
    @IBOutlet private var productCategory: UILabel!
    @IBOutlet private var productRateBtn: UIButton!
    @IBOutlet private var productDescription: UILabel!
    @IBOutlet private var productPrice: UILabel!
    @IBOutlet private var productImgView: UIImageView!
    
    var product: Product? {
        
        // property observer
        didSet{
            productConfig()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func productConfig(){
        guard let product else { return }
        productTitleLabel.text = product.title
        productCategory.text = product.category
        productRateBtn.setTitle("\(product.rating.rate)", for: .normal)
        productDescription.text = product.description
        productPrice.text = "$\(product.price)"
        productImgView.setImage(with: product.image)
        
    }
    
}
