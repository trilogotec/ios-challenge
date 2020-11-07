//
//  MovieTableViewCell.swift
//  iOSChallenge
//
//  Created by Yuri Moura on 07/11/20.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    static let identifier = "MoviesTableViewCell"
    
    lazy var moviePosterImageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var movieTitle: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var movieRating: UILabel = {
        let obj = UILabel()
        obj.textColor = .white
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupConstraints()
        self.backgroundColor = .clear
    }
    
    func setupCell(_ movie: Movie) {
        self.movieTitle.text = movie.title
        self.movieRating.text = "Rating: \(movie.voteAverage)"
    }
    
    func setupConstraints(){
        self.addSubview(self.moviePosterImageView)
        self.addSubview(self.movieTitle)
        self.addSubview(self.movieRating)
        
        let distanceFromMoviePoster = CGFloat(8)
        
        NSLayoutConstraint.activate([
            self.moviePosterImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.moviePosterImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1.0),
            self.moviePosterImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25),
            self.moviePosterImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.movieTitle.leadingAnchor.constraint(equalTo: self.moviePosterImageView.trailingAnchor, constant: distanceFromMoviePoster),
            self.movieTitle.topAnchor.constraint(equalTo: self.moviePosterImageView.topAnchor, constant: 8),
            self.movieTitle.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.65),
            self.movieTitle.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            self.movieRating.leadingAnchor.constraint(equalTo: self.moviePosterImageView.trailingAnchor, constant: distanceFromMoviePoster),
            self.movieRating.bottomAnchor.constraint(equalTo: self.moviePosterImageView.bottomAnchor, constant: -8),
            self.movieRating.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.65),
            self.movieRating.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.2)
        ])
    }
    
}