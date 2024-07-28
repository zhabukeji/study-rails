module Show extend ActiveSupport::Concern
    include ActionView::Helpers::DateHelper
    def self.included(base)
        base.class_eval do
            helper_method :time_show
        end
    end
    # 这个函数单纯用来展示时间 一天以上格式 %Y-%m-%d 一天内则是 X小时 | X分钟 前
    def time_show created_at
        Time.now - created_at < 1.days ? time_ago_in_words(created_at) : created_at.strftime("%Y-%m-%d")
    end
end
