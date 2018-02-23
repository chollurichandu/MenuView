//
//  Theme.swift
//  MenuDemo
//
//  Created by Frank Burgers on 19/11/15.
//  Copyright © 2015 Frank Burgers. All rights reserved.
//

import UIKit

var Theme = AppTheme()

class AppTheme: NSObject
{
	let httpOk = 200
	
	let customUrlSintImage = "sintimage"
	
	let textOk = NSLocalizedString("Ok", comment: "ok")
	let textError = NSLocalizedString("Fout", comment: "error")
	let textNoNetwork = NSLocalizedString("Er is geen netwerk beschikbaar", comment: "nonetwork")
	let textCantLoadWebContent = NSLocalizedString("Content kan niet worden geladen.\nIs er een netwerkverbinding?", comment: "CantLoadContent")
	
	let configAppConfigFileName = "AppConfig"
	let configContentJsonUrl = "ContentJsonUrl"
	
	let screenNameAbout = "About"
	let screenNameAgenda = "Agenda"
	let screenNameBooking = "Booking"
	let screenNameFriends = "Friends"
	let screenNameNews = "News"
	let screenNamePhotos = "Photos"
	let screenNameVideos = "Videos"
	let screenNameWelcome = "Welcome"

	let colorScreenBackground = UIColor(hexString: "#0E0A01")
	let colorIcon = UIColor.white
    let colorMenuBackground = UIColor(red: 0.8, green: 0.3, blue: 0.1, alpha: 1.0)
    let colorMenuItemText = UIColor.yellow
	let colorContentBackground = UIColor(hexString: "#CCCFDF")
    let colorTitleLabel = UIColor.yellow
    let colorText = UIColor.black
	let colorButtonBackground = UIColor(hexString: "#D0212A")
    let colorButtonDisabledBackground = UIColor(hexString: "#55555F")
	let colorTextFieldBackground = UIColor.white
	
	let defaultMarginLarge: CGFloat = 20.0
    let defaultMargin: CGFloat = 12.0
    let defaultMarginMedium: CGFloat = 8.0
    let defaultMarginSmall: CGFloat = 4.0
	let defaultOpacity: CGFloat = 0.95
	let defaultLowOpacity: CGFloat = 0.35

	let iconClose = UIImage(named: "IconCross")?.withRenderingMode(.alwaysTemplate)
	let iconDisconnectedImage = UIImage(named: "IconDisconnected")?.withRenderingMode(.alwaysOriginal)
	
    let menuContainerWidth = 250
    let menuContainerHeight = 450

	let menuItemWelcome = NSLocalizedString("Welkom", comment: "welcome")
	let menuItemNews = NSLocalizedString("Nieuws", comment: "news")
	let menuItemPhotos = NSLocalizedString("Foto's", comment: "photos")
	let menuItemVideos = NSLocalizedString("Video's", comment: "videos")
	let menuItemAgenda = NSLocalizedString("Agenda", comment: "agenda")
	let menuItemBooking = NSLocalizedString("Boeking", comment: "booking")
	let menuItemFriends = NSLocalizedString("Vrienden", comment: "friends")
	let menuItemAbout = NSLocalizedString("Over deze app", comment: "aboutthisapp")
	
    let headerPadAspectRatio: CGFloat = 2084.0 / 6250.0
	let headerPhoneAspectRatio: CGFloat = 1925.0 / 3500.0
    
    let alphaForDisabledButton: CGFloat = 0.3
    let alphaForEnabledButton:CGFloat = 1.0
    
    let defaultFontName = "HelveticaNeue"
    let defaultFontSize = 15.0
    let fontMenuItem = UIFont(name: "Coda-Heavy", size: 13)
    let fontText = UIFont(name: "Coda-Regular", size: 14)
	let fontTitleLabel = UIFont(name: "IndieFlower", size: 24)
	let fontContentTitleLabel = UIFont(name: "IndieFlower", size: 16)
	
    let affineScaleFactorX: CGFloat = 0.9
    let affineScaleFactorY: CGFloat = 0.9
    let inverseAffineScaleFactorX: CGFloat = (1.0 / 0.9)
    let inverseAffineScaleFactorY: CGFloat = (1.0 / 0.9)
    
    var defaultFont: UIFont {
        return UIFont(name: defaultFontName, size: CGFloat(defaultFontSize))!
    }
    
    func initAppearance()
    {
        UILabel.appearance().font = UIFont(name: defaultFontName, size: CGFloat(defaultFontSize))
        
        UINavigationBar.appearance().barTintColor = UIColor.orange
        UINavigationBar.appearance().backgroundColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UIBarButtonItem.appearance().tintColor = UIColor.white
    }
}
