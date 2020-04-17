crumb :root do
  link "フリマ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path(current_user.id)
  parent :root
end

crumb :logout do
  link "ログアウト", logout_mypage_path
  parent :mypage
end

crumb :card_show do
  link "支払い方法",  cards_path
  parent :mypage
end

crumb :card_new do
  link "クレジットカード入力", new_cards_path
  parent :card_show
end

crumb  :likes do
  link "いいね ! 一覧", like_mypage_path
  parent :mypage
end

crumb  :exhibiting do
  link "出品した商品 - 出品中", exhibiting_mypage_path
  parent :mypage
end

crumb  :in_progress do
  link "出品した商品 - 取引中", in_progress_mypage_path
  parent :mypage
end

crumb  :completed do
  link "出品した商品 - 売却済み", completed_mypage_path
  parent :mypage
end

crumb  :purchase do
  link "購入した商品 - 取引中", purchase_mypage_path
  parent :mypage
end

crumb  :purchased do
  link "購入した商品 - 過去の取引", purchased_mypage_path
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).