module RanksFr
  class Client
    module GetKeywordsList
      def get_keywords_list(key)
        options[:key] = normalize(key)
        options[:do] = 'getkeywordlist'

        get('/', options)
      end

      def normalize(s)
        s.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
          .gsub(/[\W]/, '-').gsub(/-+/,'-');
      end
    end
  end
end
