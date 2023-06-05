//
//  RestrictionUIView.swift
//  ScreenTimeMonitor
//
//  Created by Apple on 27/05/2023.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    
    @StateObject var model = TimeLimitModel.shared
    @State var isPresented = false
    
    var body: some View {
        VStack {
            List{
                
                HStack {
                    Button("Select Apps to Limit") {
                        isPresented = true
                    }
                    .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 12, height: 18)
                        .foregroundColor(Color(#colorLiteral(red: 0.7569770813, green: 0.7566842437, blue: 0.765483737, alpha: 1)))
                    
                }
                Toggle("Start Monitoring", isOn: $model.isMonitoring)
                    .foregroundColor(Color(.systemBlue))
                    .onChange(of: model.isMonitoring) { newValue in
                        model.isMonitoring = newValue
                        
                        if newValue {
                            model.initiateMonitoring()
                            
                        } else {
                            model.stopMonitoring()
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
