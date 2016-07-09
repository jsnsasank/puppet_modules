class ssh::service {
  servuce { "sshd":
    ensure 	=> 'running',
    enable	=>  true,
    require	=> Class["ssh::config"],
  }
}
