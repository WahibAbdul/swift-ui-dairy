//
//  SettingsView.swift
//  Fructus
//
//  Created by Abdul Wahib on 9/11/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - Section 1
                    GroupBox(
                        label: SettingsLabelView(title: "Fructus", imageName: "info.circle")
                    ){
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietry fibers, vitamins and much more.")
                                .font(.footnote)
                        }//: HStack
                    }//: GroupBox
                    
                    // MARK: - Section 2
                    GroupBox(label: SettingsLabelView(title: "Customization", imageName: "paintbrush")) {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you'll see the welcome screen again.")
                            .padding(8)
                            .frame(minHeight:60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        GroupBox{
                            HStack{
                                Toggle(isOn: $isOnboarding) {
                                    if isOnboarding {
                                        Text("Restarted".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.green)
                                    } else {
                                        Text("Restart".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }//: HStack
                        }//:GroupBox
                    }//: GroupBox
                                        
                    // MARK: - Section 3
                    GroupBox(
                        label: SettingsLabelView(title: "Application", imageName: "apps.iphone")) {
                            SettingsRowView(name: "Developer", content: "Abdul")
                            SettingsRowView(name: "Designer", content: "Wahib")
                            SettingsRowView(name: "Compatibility", content: "iOS 14")
                            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                            SettingsRowView(name: "Twitter", linkLabel: "@AbdulWahib", linkDestination: "twitter.com/abdulwahib")
                            SettingsRowView(name: "SwiftUI", content: "4.0")
                            SettingsRowView(name: "Version", content: "1.1.0")
                        }//: GroupBox
                    
                }//: VStack
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar(content: {
                    Button {
                        self.dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "xmark")
                    }
                })
                .padding()
            }//: ScrollView
        }//: NavigationView
    }
}
// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
