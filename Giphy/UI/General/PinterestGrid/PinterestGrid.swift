//
//  PinterestGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct PinterestGridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let title: String
}

struct PinterestGrid: View {

    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [PinterestGridItem]()
    }

    let columns: [Column]

    let spacing: CGFloat
    let horizontalPadding: CGFloat

    init(gridItems: [PinterestGridItem], numOfColumns: Int, spacing: CGFloat, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding

        var columns = [Column]()

        for _ in 0..<numOfColumns {
            columns.append(Column())
        }

        // this stores the current height of each column, sot that we can find out which one is the smallest
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)

        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight[0]
            for i in 1..<columnsHeight.count {
                let currentHeight = columnsHeight[i]
                if currentHeight < smallestHeight {
                    smallestHeight = currentHeight
                    smallestColumnIndex = i
                }
            }

            columns[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.height

        }

        self.columns = columns
    }

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: gridItem.height)
                            .overlay {
                                Text(gridItem.title)
                                    .font(.title)
                            }
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

struct PinterestGrid_Previews: PreviewProvider {

    static let gridItems: [PinterestGridItem] = {
        var gridItems = [PinterestGridItem]()
        for i in 0..<30 {
            let randomHeight = CGFloat.random(in: 100...400)
            gridItems.append(.init(height: randomHeight, title: i.description))
        }
        return gridItems
    }()
    static var previews: some View {

        ScrollView {
            PinterestGrid(gridItems: gridItems, numOfColumns: 2, spacing: 8, horizontalPadding: 16)
        }
    }
}
