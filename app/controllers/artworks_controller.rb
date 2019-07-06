class ArtworksController < ApplicationController
  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    artworks_of_user = Artwork.where(artist_id: params[:user_id])
    artworks_shared_with_user = Artwork.joins(:artwork_shares).where(artwork_shares: {viewer_id: params[:user_id]})

    index_art = artworks_of_user.to_a + artworks_shared_with_user.to_a
    
    render json: index_art
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end