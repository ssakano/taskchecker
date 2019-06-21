class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# ApplicationRecordはさらにActiveRecord::Baseを継承している。
# ActiveRecordは、RailsのModel全般の操作を行うライブラリのこと。