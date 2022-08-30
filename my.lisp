(flet ((read-lines (s)
	 (loop for line = (read-line s nil nil)
	       while line
	       collect line)))

  (ssh:with-connection (conn "192.168.1.238" (ssh:pass "ansible" "Password123!"))
    (values
     (ssh:with-command (conn iostream "hostname -f")
       (read-lines iostream))
     (ssh:with-command (conn iostream "lsb_release --id --release --codename")
                                         (read-lines iostream)))))
