//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `CountryCell`.
    static let countryCell = _R.nib._CountryCell()
    /// Nib `CountryDetailCell`.
    static let countryDetailCell = _R.nib._CountryDetailCell()
    
    /// `UINib(name: "CountryCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.countryCell) instead")
    static func countryCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.countryCell)
    }
    
    /// `UINib(name: "CountryDetailCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.countryDetailCell) instead")
    static func countryDetailCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.countryDetailCell)
    }
    
    static func countryCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CountryCell? {
      return R.nib.countryCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CountryCell
    }
    
    static func countryDetailCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CountryDetailCell? {
      return R.nib.countryDetailCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CountryDetailCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 5 localization keys.
    struct localizable {
      /// en translation: Capital
      /// 
      /// Locales: en
      static let detail_capital = Rswift.StringResource(key: "detail_capital", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Countries
      /// 
      /// Locales: en
      static let countries_title = Rswift.StringResource(key: "countries_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Native Name
      /// 
      /// Locales: en
      static let detail_native = Rswift.StringResource(key: "detail_native", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Population
      /// 
      /// Locales: en
      static let detail_population = Rswift.StringResource(key: "detail_population", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Region
      /// 
      /// Locales: en
      static let detail_region = Rswift.StringResource(key: "detail_region", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: Capital
      /// 
      /// Locales: en
      static func detail_capital(_: Void = ()) -> String {
        return NSLocalizedString("detail_capital", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Countries
      /// 
      /// Locales: en
      static func countries_title(_: Void = ()) -> String {
        return NSLocalizedString("countries_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Native Name
      /// 
      /// Locales: en
      static func detail_native(_: Void = ()) -> String {
        return NSLocalizedString("detail_native", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Population
      /// 
      /// Locales: en
      static func detail_population(_: Void = ()) -> String {
        return NSLocalizedString("detail_population", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Region
      /// 
      /// Locales: en
      static func detail_region(_: Void = ()) -> String {
        return NSLocalizedString("detail_region", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _CountryCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CountryCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CountryCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CountryCell
      }
      
      fileprivate init() {}
    }
    
    struct _CountryDetailCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CountryDetailCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CountryDetailCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CountryDetailCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let countryDetailsVC = StoryboardViewControllerResource<CountryDetailsVC>(identifier: "CountryDetailsVC")
      let name = "Main"
      
      func countryDetailsVC(_: Void = ()) -> CountryDetailsVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: countryDetailsVC)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.main().countryDetailsVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'countryDetailsVC' could not be loaded from storyboard 'Main' as 'CountryDetailsVC'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
