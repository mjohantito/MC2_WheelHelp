//
//  PlaceView.swift
//  MC2_WheelHelp
//
//  Created by Angelo Kusuma on 21/06/23.
//

import SwiftUI

struct PlaceView: View {
    @State private var search = ""
    @State private var categoryViews: [KategoriCardView] = []
    @EnvironmentObject var authManager: AuthManager
    
    @State private var userEmail: String = ""
    @State private var userId: String = ""
    
    @State private var activeTag: String = "Makan"
    
    var tags: [String] = [
        "Makan", "Wisata", "Hotel", "Belanja"
    ]
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
                HStack{
                    Text("Telusuri")
                        .foregroundColor(Color(red: 19/255, green: 70/255, blue: 97/255))
                        .font(.largeTitle.bold())
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 30)
                        .padding(.trailing)
                }
                .padding(.top)
                
                //Search Bar
                NavigationLink(destination: SearchView()){
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Cari Restoran & Cafe, Tempat Wisata, Hotel dan Tempat Belanja")
                        Spacer()
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.quaternary)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                }
                TagsView()
                
                ScrollView{
                    VStack{
                        ForEach (0..<3, id: \.self){_ in
                            KategoriCardView(imageURL: URL(string: "https://fastly.4sqi.net/img/general/100x100/12259266_cx_Jge3F8nlmV-h0Jgg_s35sIbb7LCxdEYjDGojruIw.jpg")!, placeName: "Bebek Tepi Sawah", address: "Somewhere over the rainbow", kategori: activeTag, rating: 2.2, jumlahUlasan: 5, fsq_id: "123", latitude: 1.0, longitude: 1.0, health_facilities_id: ["default"])
                            
                                .padding(.horizontal, 8)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.gray.opacity(0.1))
        }
    }
    
    //TagView
    @ViewBuilder
    func TagsView() -> some View {
        HStack (){
            ForEach(tags, id: \.self) { tag in
                VStack{
                    Image(tag)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 30)
                        .padding(.top, 5)
                        
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 22)
                        .padding(.bottom, 5)
                }
                
                //Active
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                        activeTag = tag
                    }
                }
                .background( content: {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.bar)
                })
                .font(Font.headline.weight(activeTag == tag ? .bold : .light))
                .opacity(activeTag == tag ? 1 : 0.3)
                .contentShape(Rectangle())
                .padding(.horizontal, 2)
            }
        }
    }
    
    struct PlaceView_Previews: PreviewProvider {
        static var previews: some View {
            PlaceView()
        }
    }
}
