class Task < ApplicationRecord
 validates :task, presence: true, length: { maximum: 255}
 
 belongs_to :user
end

 # TaskクラスはApplicationRecordクラスを継承している。
 # ApplicationRecordクラスが定義されたファイルはapp/models/application_record.rb