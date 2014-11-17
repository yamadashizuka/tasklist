module Common
  def dump
    f = File.open("./LV1/#{Time.now.strftime("%Y%m%d_%H%M%S")}.txt", 'w')

    self.attributes.each{ |key, val|
      if key.include? "_id"
        #末尾に「_id」がある項目はクラスから名称を取得する。（現状name固定）
        f.puts "#{key} #{key.delete("_id").classify.constantize.find(val).name}"
      else
        f.puts "#{key} #{val}"
      end
    }
    f.close
  end

end
