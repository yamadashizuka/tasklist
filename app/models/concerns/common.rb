################################################################################################
#
#  ＜Commonモジュールの使い方＞
#   ・ modelクラスに、「include Common」を追加してください。
#   ・ 画面で更新する際に、根元になるクラスに「after_commit :dump」を追加してください。
#      ※ 親子関係やコード値テーブルなど、根元になるクラスに紐づいているテーブルの情報は
#        再帰処理で表示するため、根元のクラスだけ記載すればよいです。
#
#  ＜Commonモジュールの動作＞
#   ・ 根元のクラスのテーブルに対するコミットが完了した後に、dumpメソッドが実行されます。
#   ・ 現在は、テーブルに保存した結果がLV1ディレクトリの直下に「YYYYMMDD_HHMMSS.txt」という名前で
#      出力されます。
#
#　　＜注意点＞
#　　　・コード値関係のクラス名はお約束として、末尾を「code」で終わるようにしてください。
#        例：Statuscodeクラス（テーブル名はstatuscodes）
#
#   CTI高綱魔改造
#　　・ファイル出力する直前でキーと値のペアをハッシュに入れる
#    ・ハッシュをJSONにする
#    ・標準出力に吐き出す（STDOUT.puts）
#
################################################################################################
module Common
  def dump
    f = File.open("./LV1/#{Time.now.strftime("%Y%m%d_%H%M%S")}.txt", 'w')
    @@h = {}

    dump_recursive (f)

    f.close
    STDOUT.puts "●●●ここから●●●"
    STDOUT.puts(@@h.to_json)
    STDOUT.puts "●●●ここまで●●●"
    
  end

  LIST_OF_EXCLUSION = ["id", "created_at", "updated_at"]
  #dumpの再帰処理を行う。
  def dump_recursive (f)


    self.attributes.each{ |key, val|
      # 表示用の項目名に翻訳しつつ、その時の項目名を表示する。
      unless LIST_OF_EXCLUSION.include?(key)  # 除外リストに含まれる項目名は表示しない
      key_view = I18n.translate("activerecord.attributes."+self.class.name.downcase+"."+key)

      if key.include? "code_id"
        #末尾に「code_id」がある項目はクラスから名称を取得する。（現状name固定）
        f.puts "#{key_view} #{key.sub(/_id$/,"").classify.constantize.find(val).name}"
        @@h.store(key_view,key.sub(/_id$/,"").classify.constantize.find(val).name)
      elsif  key.include? "_id"
        ##再帰処理
        data = key.sub(/_id$/,"").classify.constantize.find(val)
        data.dump_recursive(f) if data.present?
      else
        f.puts "#{key_view} #{val}"
        @@h.store(key_view,val)
      end

    end
    }
  end


end
