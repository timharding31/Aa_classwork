# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT DISTINCT yr
  FROM nobels
  WHERE subject = 'Physics' AND nobels.yr NOT IN (SELECT yr FROM nobels WHERE subject = 'Chemistry')
  SQL

  execute(<<-SQL)
  SELECT DISTINCT yr
  FROM (SELECT yr, subject FROM nobels WHERE subject NOT LIKE 'Chemistry') AS no_chemistry
  WHERE no_chemistry.subject = 'Physics'
  SQL
  
  # execute(<<-SQL) ## This does not accomplish the tas
  # SELECT yr, subject
  # FROM nobels
  # WHERE subject = 'Physics' AND subject != 'Chemistry'
  # SQL

end

# SELECT yr FROM nobels WHERE subject = 'Physics'