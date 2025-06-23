import smtplib
from email.message import EmailMessage

msg = EmailMessage()
msg['Subject'] = '測試信件'
msg['From'] = 'no-reply@silika-ace.com'
msg['To'] = 'etashieh@silika-ace.com'
msg.set_content('這是SMTP2GO的測試信件')

with smtplib.SMTP('mail.smtp2go.com', 587) as smtp:
    smtp.starttls()
    smtp.login('no-reply@silika-ace.com', 'P@ssword')
    smtp.send_message(msg)

print("✅ Email sent!")
