//
//  SVGProcessor.swift
//  FootballLeagueApp
//
//  Created by zyad Baset on 21/11/2024.
//


import Kingfisher
import SVGKit
// Converter of SVG to Image
struct SVGKitProcessor: ImageProcessor {
    // identifier for processor
    let identifier = "com.FootballLeague.SVGKitProcessor"

    // handle SVG data
    func process(item: Kingfisher.ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            // input is already an image
            return image
        case .data(let data):
            // rendering SVG to UIImage
            return renderSVGToImage(data: data)
        }
    }

    //render SVG data
    private func renderSVGToImage(data: Data) -> KFCrossPlatformImage? {
        //parse the SVG data
        guard let svgImage = SVGKImage(data: data) else {
            print("Failed to parse SVG data")
            return nil
        }
        // size for the rendered image
        svgImage.size = CGSize(width: 200, height: 200)
        return svgImage.uiImage
    }
}
