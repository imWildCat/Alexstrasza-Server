class Api::V1::SiteController < Api::V1::BaseApiControllerController

  def status
    @status = {
        :status => true,
        :version => '0.0.1'
    }
  end

end
