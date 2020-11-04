class UsersInvitationsController < Devise::InvitationsController

  protected

  def invite_resource(&block)
    resource_class.invite!(invite_params.merge(office: current_office), current_inviter, &block)
    redirect_to root_path

  end
  
end
