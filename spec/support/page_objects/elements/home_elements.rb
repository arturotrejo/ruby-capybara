# frozen_string_literal: true

module HomeElements

  def close_consent_manager_button; '.osano-cm-close'; end

  def create_label; 'Create'; end

  def create_client_label; 'Create client'; end

  def user_profile_button; '#user-avatar'; end

  def success_toast; '.spds-toast-message.success'; end

  def nav_bar_option(page_name) ".nav-items a[aria-label*='#{page_name}']" end

end
