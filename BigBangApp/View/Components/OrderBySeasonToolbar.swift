//
//  OrderBySeasonToolbar.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//
import SwiftUI

struct OrderBySeasonToolbar: ViewModifier {
    @Binding var orderByOption: OrderBySeason
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(OrderBySeason.allCases) { season in
                            Button {
                                orderByOption = season
                            } label: {
                                Text("Season \(season.rawValue)")
                            }
                        }
                    } label: {
                        Text("Select season")
                    }
                }
            }
    }
}

extension View {
    func orderBySeason(_ orderBySeason: Binding<OrderBySeason>) -> some View {
        modifier(OrderBySeasonToolbar(orderByOption: orderBySeason))
    }
}

enum OrderBySeason: Int, CaseIterable, Identifiable {
    case season1 = 1
    case season2 = 2
    case season3 = 3
    case season4 = 4
    case season5 = 5
    case season6 = 6
    case season7 = 7
    case season8 = 8
    case season9 = 9
    case season10 = 10
    case season11 = 11
    case season12 = 12
    
    var id: Self { self }
    
    static let defaultSeason: OrderBySeason = .season1
}
