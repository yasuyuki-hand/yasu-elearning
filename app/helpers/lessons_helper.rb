module LessonsHelper
  def is_completed(category)
      Lesson.find_by(category_id: category.id, user_id: current_user.id, is_completed: true)
  end

  def show_result(category)
      Lesson.find_by(category_id: category.id, user_id: current_user.id, is_completed: true).result
  end

  def total_words(category)
      Lesson.find_by(category_id: category.id, user_id: current_user.id, is_completed: true).words.count
  end
end
