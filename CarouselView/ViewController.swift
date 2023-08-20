//
//  ViewController.swift
//  CarouselView
//
//  Created by Imran Sayeed on 8/20/23.
//

import UIKit

class ViewController: UIViewController {
    private var carouselView: CarouselView?
    
    private var carouselData = [CarouselData]()
    private let backgroundColors: [UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.4826081395, green: 0.04436998069, blue: 0.2024421096, alpha: 1), #colorLiteral(red: 0.1728022993, green: 0.42700845, blue: 0.3964217603, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCarouselUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carouselView?.configureView(with: carouselData)
    }
    
    private func setupCarouselUI() {
        carouselData = loadData()
        let carouseView = CarouselView(pages: carouselData.count, delegate: self)
        self.carouselView = carouseView
        carouselView?.translatesAutoresizingMaskIntoConstraints = false
        guard let carouselView else {
            return
        }
        view.addSubview(carouselView)
        
        NSLayoutConstraint.activate([
            carouselView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carouselView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carouselView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }

    private func loadData() -> [CarouselData] {
        return [
            CarouselData(image: UIImage(named: "Image_1"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            CarouselData(image: UIImage(named: "Image_2"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            CarouselData(image: UIImage(named: "Image_3"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            CarouselData(image: UIImage(named: "Image_4"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
        ]
    }
}


extension ViewController: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
        UIView.animate(withDuration: 0.7) {[weak self] in
            guard let self else { return }
            self.view.backgroundColor = self.backgroundColors[page]
        }
    }
}

