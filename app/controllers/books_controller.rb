class BooksController < ApplicationController
  $create_judge = "false"
  $delete_judge = "false"
  $update_judge = "false"

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
    if $delete_judge == "true"
      $delete_message = "Book was successfully destroyed."
      $delete_judge = "false"
    else
      $delete_message = ""
    end
      $message = ""
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      $create_judge = "true"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end

  def show
    if $create_judge == "true"
      $message = "Book was successfully created."
      $create_judge = "false"
    end
    if $update_judge == "true"
      $message = "Book was successfully updated."
      $update_judge = "false"
    end
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      $update_judge = "true"
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destory
    book = Book.find(params[:id])
    book.destroy
    $delete_judge = "true"
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
