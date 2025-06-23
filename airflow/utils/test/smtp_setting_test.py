from airflow.configuration import conf

print("SMTP connid:", conf.get('smtp', 'smtp_host', fallback='未設定'))
print("SMTP Host:", conf.get('smtp', 'smtp_host', fallback='未設定'))
print("SMTP Port:", conf.get('smtp', 'smtp_port', fallback='未設定'))
print("SMTP User:", conf.get('smtp', 'smtp_user', fallback='未設定'))
print("SMTP Password:", conf.get('smtp', 'smtp_password', fallback='未設定'))
print("SMTP StartTLS:", conf.get('smtp', 'smtp_starttls', fallback='未設定'))
print("SMTP SSL:", conf.get('smtp', 'smtp_ssl', fallback='未設定'))
print("SMTP Mail From:", conf.get('smtp', 'smtp_mail_from', fallback='未設定'))
