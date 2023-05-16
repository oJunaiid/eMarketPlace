//
//  delete.swift
//  eSewaMarket
//
//  Created by Omar  on 5/8/23.
//

import UIKit

class KanyeViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "k"))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
