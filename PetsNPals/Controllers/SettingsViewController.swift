//
//  SettingsViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-22.
//
import Foundation
import UIKit

struct Section {
    let title: String
    let option: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Setting"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        
        models.append(Section(title: "General", option: [
            .switchCell(model: SettingsSwitchOption(title: "Dark Mode", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemRed, handler: {
            }, isOn: true)),
        ]))
                                
        models.append(Section(title: "General", option: [
            .staticCell(model: SettingsOption(title: "WIFI", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                print("Tapped First Cell")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            }),
            .staticCell(model:SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            })
        ]))
        
        models.append(Section(title: "Information", option: [
            .staticCell(model: SettingsOption(title: "WIFI", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                print("Tapped First Cell")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            }),
            .staticCell(model:SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            })
        ]))
        
        models.append(Section(title: "Apps", option: [
            .staticCell(model: SettingsOption(title: "WIFI", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                print("Tapped First Cell")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            }),
            .staticCell(model:SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            })
        ]))
    }
    
    // Display section titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier,
                                                           for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    // Handle setting cell tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
