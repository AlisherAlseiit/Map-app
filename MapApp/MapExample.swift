//
//  MapKitTest.swift
//  MapApp
//
//  Created by Alish Alseiit on 07.08.2022.
//

import SwiftUI
import MapKit

struct MapExample: View {
    var lat: Double = 43.240349
    var long: Double = 76.905775
    @State var shops: [Location] = []
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 43.238949,
            longitude: 76.889709
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
        )
    )
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [MapInteractionModes.pan, MapInteractionModes.zoom], annotationItems: shops) { location in
            MapMarker(coordinate: location.coordinate)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            region.center = CLLocationCoordinate2D(latitude: lat, longitude: long)
            self.shops = [Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 43.240349, longitude: 76.905775))]
        }
        
    }
}
