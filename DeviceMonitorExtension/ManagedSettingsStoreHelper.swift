//
//  ManagedSettingsStoreHelper.swift
//  ScreenTimeMonitor
//
//  Created by Ussama Irfan on 31/05/2023.
//

import ManagedSettings
import FamilyControls

class ManagedSettingsStoreHelper {
    
    public static let shared = ManagedSettingsStoreHelper()
    
    private let store = ManagedSettingsStore()
    
    private init() {}
    
    func stopApplicationsShielding() {
        store.shield.applications?.removeAll()
        store.shield.webDomains?.removeAll()
        store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.specific([], except: Set())
    }
    
    func startApplicationsShielding() {
        let selectionToDiscourage = DataPersistence.shared.savedGroupSelection() ?? FamilyActivitySelection()
        
        store.shield.applications = selectionToDiscourage.applicationTokens
        store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.specific(selectionToDiscourage.categoryTokens, except: Set())
        store.shield.webDomains = selectionToDiscourage.webDomainTokens
    }
    
    
    private func restrictDefaultFunctionalities() {
//        store.dateAndTime.requireAutomaticDateAndTime = true
//        store.account.lockAccounts = true
//        store.passcode.lockPasscode = true
//        store.siri.denySiri = true
//        store.appStore.denyInAppPurchases = true
//        store.appStore.maximumRating = 200
//        store.appStore.requirePasswordForPurchases = true
//        store.media.denyExplicitContent = true
//        store.gameCenter.denyMultiplayerGaming = true
//        store.media.denyMusicService = false
    }
}

