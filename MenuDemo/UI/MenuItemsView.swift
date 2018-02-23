//
//  MenuView.swift
//  De Leukste Sint
//
//  Created by Frank Burgers on 27/05/16.
//  Copyright © 2016 Frank Burgers. All rights reserved.
//

import UIKit

protocol MenuViewItemSelectedDelegate
{
    func didSelectMenuItem(_ itemTitle: String)
}

class MenuItemsView: UIView, UITableViewDelegate, UITableViewDataSource
{
    fileprivate let menuTableView = UITableView()
    fileprivate let menuItemCellId = "MenuItemCellId"
    fileprivate let menuItemHeight: CGFloat = 40.0

	fileprivate var menuItemsArray: [String]!

	internal var menuHeight: CGFloat = 0.0
	internal var menuItemsFont = UIFont.systemFont(ofSize: 13.0)
	internal var menuItemsTextColor = UIColor.white
	internal var delegate: MenuViewItemSelectedDelegate?

	var menuItems: [String] {
		
		get {
			return menuItemsArray
		}
		
		set(newItems) {
			
			menuItemsArray = newItems
			menuHeight = CGFloat(menuItems.count) * menuItemHeight
		}
	}
	
	var menuBackgroundColor: UIColor? {
		
		get {
			return menuTableView.backgroundColor
		}

		set(newColor) {
			menuTableView.backgroundColor = newColor
		}
	}
	
	// MARK: - Initialisation -
	
    override init(frame: CGRect)
    {
        super.init(frame: frame)
		
		translatesAutoresizingMaskIntoConstraints = false

		menuTableView.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
		menuTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		menuTableView.backgroundColor = UIColor.clear
		menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: menuItemCellId)
		menuTableView.separatorColor = UIColor.clear
		menuTableView.dataSource = self
		menuTableView.delegate = self
        addSubview(menuTableView)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
	
	// MARK: - Tableview delegate and datasource -
	
	internal func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return menuItemHeight
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
	
	internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: menuItemCellId), let textLabel = cell.textLabel else {
            return UITableViewCell()
        }

        cell.backgroundColor = UIColor.clear

		textLabel.font = menuItemsFont
        textLabel.textColor = menuItemsTextColor
        textLabel.text = menuItems[(indexPath as NSIndexPath).row]
		
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let del = delegate else {
            return
        }
        
        if let cell = tableView.cellForRow(at: indexPath), let textLabel = cell.textLabel, let text = textLabel.text {
            del.didSelectMenuItem(text)
        }
    }
}
