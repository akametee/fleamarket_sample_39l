class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  private

  def check_captcha
    self.resource = resource_class.new sign_in_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) {render :new}
    end
  end

end
