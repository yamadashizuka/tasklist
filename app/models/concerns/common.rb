module Common
LIST_OF_EXCLUSION = ["id", "created_at", "updated_at"]

  def dump
    f = File.open("./LV1/#{Time.now.strftime("%Y%m%d_%H%M%S")}.txt", 'w')

    self.attributes.each{ |key, val|

      # 表示用の項目名に翻訳する
      if LIST_OF_EXCLUSION.include?(key)  # 除外リストに含まれる項目名は翻訳しない
        key_view = key
      else
        key_view = I18n.translate("activerecord.attributes."+self.class.name.downcase+"."+key)
      end

      if key.include? "_id"
        #末尾に「_id」がある項目はクラスから名称を取得する。（現状name固定）
        f.puts "#{key_view} #{key.delete("_id").classify.constantize.find(val).name}"
      else
        f.puts "#{key_view} #{val}"
      end
    }
    f.close
  end

end
