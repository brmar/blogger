module ArticlesHelper
  def article_params
    #for security reasons, it's not good to blindly save params
    #so we need to use Strong Parameters like this when making an article
    params.require(:article).permit(:title, :body)
  end
end
