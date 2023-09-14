//
//  MapView.swift
//  Africa
//
//  Created by Abdul Wahib on 9/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    )
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // ANNOTATIONS
        Map(coordinateRegion: $region, annotationItems: locations) { item in
//          MapMarker(coordinate: item.location, tint: .accentColor)
            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
                MapAnnotationView(location: item)
            }//: ANNOTATION
            
        }//: MAP
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HSTACK
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HSTACK
                }//:VSTACK
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black.cornerRadius(8).opacity(0.6))
            .padding()
            ,alignment: .top
        )
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
