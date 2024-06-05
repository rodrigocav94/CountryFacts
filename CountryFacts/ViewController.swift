//
//  ViewController.swift
//  CountryFacts
//
//  Created by Rodrigo Cavalcanti on 04/06/24.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        title = "CountryFacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(infoTapped))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func infoTapped() {
        let alertWidth: CGFloat = 250
        let alertHeight: CGFloat = 200
        let imageSize: CGFloat = 60
        let imageHPosition = (alertWidth / 2) - (imageSize / 2)
        let imageVPosition: CGFloat = 82
        
        let showAlert = UIAlertController(title: "CountryFacts", message: "An app to display facts about South American countries.", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: imageHPosition, y: imageVPosition, width: imageSize, height: imageSize))
        
        imageView.image = UIImage(systemName: "globe.desk", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .light))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        showAlert.view.addSubview(imageView)
        
        let height = NSLayoutConstraint(item: showAlert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: alertHeight)
        let width = NSLayoutConstraint(item: showAlert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: alertWidth)
        
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        
        showAlert.addAction(UIAlertAction(title: "Got it!", style: .default))
        self.present(showAlert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Country.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath)
        let rowItem = Country.all[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.textProperties.numberOfLines = 1
        content.secondaryTextProperties.numberOfLines = 0
        content.text = rowItem.name
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        content.secondaryText = rowItem.fact
        content.secondaryTextProperties.color = .secondaryLabel
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailController()
        vc.country = Country.all[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

#Preview {
    UIStoryboard(
        name: "Main",
        bundle: nil
    )
    .instantiateInitialViewController()!
}
