module ExhibitionHelper
  def text_placeholder
    <<-"EOS".strip_heredoc
    商品説明（1000文字以内）
    （色、素材、重さ、定価、注意点、など）
    
    例）2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。合わせやすいのでおすすめです。
    EOS
  end
end
