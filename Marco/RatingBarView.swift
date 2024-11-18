//
//  RatingBarView.swift
//  Marco
//
//  Created by Ricardo Jorge Rodriguez Trevino on 17/11/24.
//

import SwiftUI

struct RatingBarView: View {
    let ratings: [Int]

    var body: some View {
        let ratingCounts = calculateRatingCounts(ratings: ratings)

        VStack(alignment: .leading, spacing: 10) {
            ForEach((1...5).reversed(), id: \.self) { star in
                HStack {
                    Text("\(star) estrellas")
                        .font(.subheadline)
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color(hex: 0xED008C))
                                .frame(width: calculateBarWidth(totalCount: ratings.count, count: ratingCounts[star] ?? 0, maxWidth: geometry.size.width), height: 10)
                        }
                    }
                    .frame(height: 10)
                }
            }
        }
    }

    // Helper: Calcula la cantidad de veces que aparece cada calificación
    func calculateRatingCounts(ratings: [Int]) -> [Int: Int] {
        var counts: [Int: Int] = [:]
        for rating in ratings {
            counts[rating, default: 0] += 1
        }
        return counts
    }

    // Helper: Calcula el ancho de la barra proporcional al número de calificaciones
    func calculateBarWidth(totalCount: Int, count: Int, maxWidth: CGFloat) -> CGFloat {
        guard totalCount > 0 else { return 0 }
        let ratio = CGFloat(count) / CGFloat(totalCount)
        return maxWidth * ratio
    }
}

#Preview {
    RatingBarView(ratings: [5, 4, 5, 3, 5, 4, 2, 1, 5, 4, 3])
}
