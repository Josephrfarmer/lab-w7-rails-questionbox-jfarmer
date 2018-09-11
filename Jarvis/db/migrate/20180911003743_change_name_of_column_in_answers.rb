class ChangeNameOfColumnInAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :answer_id, :question_id
  end
end
