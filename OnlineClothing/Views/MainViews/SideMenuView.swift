//
//  SideMenuView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI

struct SideMenuViewTemp: View {
    @State var presentSideMenu = true

    var body: some View {
        ZStack {
            SideMenuView()
        }.background(.black)
        
    }

    @ViewBuilder
    private func SideMenuView() -> some View {
        SideView(isShowing: $presentSideMenu, content:
            AnyView(SideMenuViewContents(presentSideMenu:
            $presentSideMenu)), direction: .leading)

    }

}

struct SideMenuViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewTemp()
    }
}

struct SideMenuViewContents: View {
    @Binding var presentSideMenu: Bool

    var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.Dress.rawValue,
    Categories.TShirt.rawValue]

    @State private var selectedCategory: Int = 0

    var body: some View {
        HStack {
            ZStack {
                VStack(alignment: .leading) {
                    SideMenuTopView()
                    HStack(spacing: 10) {
                        GenderView(isSelected: selectedCategory == 0,
                            title: "WOMEN")
                            .onTapGesture {
                                selectedCategory = 0
                            }
                        GenderView(isSelected: selectedCategory == 1,
                            title: "MEN")
                            .onTapGesture {
                                selectedCategory = 1
                            }
                    }
                    .frame(maxWidth: .infinity)

                    ForEach(0..<categories.count, id: \.self) { i in
                        CategoryItem(title: categories[i]) {

                        }
                    }

                    Spacer()

                    Button {

                    } label: {
                        HStack {
                            Image("Cell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("078 xxxxxx")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                    }

                    Button {

                    } label: {
                        HStack {
                            Image("Location")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("Store locator")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                    }

                    VStack(alignment: .center) {
                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)

                    
                }
            }
        }.padding([.leading, .trailing], 20)
    }

    func SideMenuTopView() -> some View {
        VStack {
            HStack {

                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("Close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.top, 40)
        .padding(.bottom, 30)
    }

    func CategoryItem(title: String, action: @escaping (() -> Void)) ->
        some View {
            Button {
                action()
            } label: {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(tenorSans(16))
                        .foregroundColor(.BodyGrey)
                }
            }
            .frame(height: 50)
            .padding(.leading, 30)
            .padding(.top, 10)
        }
        
}

