class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forword'
        User.where('name LIKE?', content+'%')
      elsif method == 'backword'
        User.where('name LIKE?', '%'+content)
      elsif method == 'pertial'
        User.where('name LIKE?', '%'+content+'%')
      end
    elsif model == 'book'
      if method =='perfect'
        Book.where(title: content)
      elsif method == 'forword'
        Book.where('title LIKE?', content+'%')
      elsif method == 'backword'
        Book.where('title LIKE?', '%'+content)
      elsif method == 'pertial'
        Book.where('title LIKE?','%'+content+'%')
      end
    end
  end
end
