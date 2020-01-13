class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    unless @book.iine?(current_user)
      @book.iine(current_user)
      @book.reload
      redirect_back(fallback_location: root_url)#応急処置
      respond_to do |format|
        # format.html { redirect_to request.referrer || root_url }
        format.html { redirect_back(fallback_location: root_url) }
        format.js
      end
    end
  end

  def destroy
    @book = Favorite.find(params[:id]).book
    if @book.iine?(current_user)
      @book.uniine(current_user)
      @book.reload
      redirect_back(fallback_location: root_url)#応急処置
      respond_to do |format|
        # format.html { redirect_to request.referrer || root_url }
        format.html { redirect_back(fallback_location: root_url) }
        format.js
      end
    end
  end
end

  # def create
  #   @favorite = current_user.favorites.create(book_id: params[:book_id])
  #   redirect_back(fallback_location:)
  # end

  # def destroy
  #   @favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
  #   @favorite.destroy
  #   redirect_back(fallback_location:)
  # end

  # <% if current_user.already_favorited?(@book) %>
  #   <td><%= button_to 'いいねを取り消す', book_favorite_path(@book), method: :delete %></td>
  # <% else %>
  #   <td><%= button_to 'いいね', book_favorites_path(@book) %></td>
  # <% end %>
  #   <td><h3>いいね件数: <%= @book.favorites.count %></h3></td>
  #   <tr>
        
  #   <td><h2>いいねしたユーザー</h2></td>
  #   <% @book.favorited_users.each do |user| %>
  #       <td><li><%= user.name %></li></td>
  #     </tr>
  #   <% end %>  