//
//  TimeLimitModel.swift
//  DeviceMonitorExtension
//
//  Created by Apple on 27/05/2023.
//

import Foundation
import FamilyControls
import DeviceActivity

class TimeLimitModel: ObservableObject {
    
    static let shared = TimeLimitModel()
    
    @Published var isMonitoring = false
    
    private let schedule = DeviceActivitySchedule(
        intervalStart: DateComponents(hour: 0, minute: 0, second: 0),
        intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),
        repeats: true
    )
        
    private let center = DeviceActivityCenter()
    private let activity = DeviceActivityName(ScreenTimeConstant.ActivityName)
    private let eventName = DeviceActivityEvent.Name(ScreenTimeConstant.EventName)
    
    var selectionToDiscourage = DataPersistence.shared.savedGroupSelection() ?? FamilyActivitySelection() {
        
        willSet {
            DataPersistence.shared.saveSelection(selection: newValue)
            ManagedSettingsStoreHelper.shared.stopApplicationsShielding()
        }
    }
    
    private init() {
        isMonitoring = DataPersistence.shared.getMonitoringState()
    }

    func initiateMonitoring() {
        ManagedSettingsStoreHelper.shared.startApplicationsShielding()
//        DataPersistence.shared.saveMonitoringState(isMonitoring: true)
//        ManagedSettingsStoreHelper.shared.stopApplicationsShielding()
//        center.stopMonitoring()
//
//        selectionToDiscourage = DataPersistence.shared.savedGroupSelection() ?? FamilyActivitySelection()
//
//        let dateC = DateComponents(hour: PublicVariable.timeLimit)
//        
//        let event = DeviceActivityEvent(
//            applications: selectionToDiscourage.applicationTokens,
//            categories: selectionToDiscourage.categoryTokens,
//            webDomains: selectionToDiscourage.webDomainTokens,
//            threshold: dateC
//        )
//        
//        do {
//            try center.startMonitoring(activity, during: schedule, events: [eventName:event])
//            
//        } catch {
//            print ("Could not start monitoring \(error)")
//        }
    }
    
    func stopMonitoring() {
        DataPersistence.shared.saveMonitoringState(isMonitoring: false)
        ManagedSettingsStoreHelper.shared.stopApplicationsShielding()
        center.stopMonitoring()
    }
}
