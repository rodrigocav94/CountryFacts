//
//  DetailController.swift
//  CountryFacts
//
//  Created by Rodrigo Cavalcanti on 04/06/24.
//

import UIKit

class DetailController: UIViewController {
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country?.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        
        
        let flagView = UIImageView()
        flagView.image = UIImage(named: country.name)
        flagView.contentMode = .scaleAspectFit
        flagView.sizeToFit()
        flagView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagView)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.alignment = .top
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        addHorizontalStack(to: vStack, title: "Name:", value: country.name)
        addHorizontalStack(to: vStack, title: "Capital:", value: country.capital)
        addHorizontalStack(to: vStack, title: "Size:", value: country.size)
        addHorizontalStack(to: vStack, title: "Population:", value: country.population)
        addHorizontalStack(to: vStack, title: "Currency:", value: country.currency)
        addHorizontalStack(to: vStack, title: "Fact:", value: country.fact)
        
        // MARK: -
        NSLayoutConstraint.activate([
            flagView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            flagView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            flagView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            flagView.heightAnchor.constraint(equalTo: flagView.widthAnchor, multiplier: 0.7),
            
            vStack.topAnchor.constraint(equalTo: flagView.bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func addHorizontalStack(to vStack: UIStackView, title: String, value: String) {
        // MARK: - Name Stack
        let nameHStack = UIStackView()
        nameHStack.axis = .horizontal
        nameHStack.widthAnchor.constraint(equalToConstant: .greatestFiniteMagnitude).isActive = true
        nameHStack.alignment = .top
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .secondaryLabel
        nameHStack.addArrangedSubview(titleLabel)
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.numberOfLines = 0
        valueLabel.textAlignment = .right
        nameHStack.addArrangedSubview(valueLabel)

        vStack.addArrangedSubview(nameHStack)
    }
}

#Preview {
    let vc = DetailController()
    vc.country = Country.all.first!
    let navController = UINavigationController(rootViewController: vc)
    return navController
}
