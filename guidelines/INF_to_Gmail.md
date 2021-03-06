# Redirect UFRGS INF emails to GMail.

## Summary  
  The process consists in:
  0. Verify if you have a *@ufrgs.br* email active;  
  1. Redirect the *@inf.ufrgs.br* emails to *@ufrgs.br* email;  
  2. Import the *@ufrgs.br* email in Gmail;  
  3. (Optional) Configure Gmail to send *@inf.ufrgs.br* emails.  

## Steps  
0. To verify if your *@ufrgs.br* is active:   
  * Access your account in http://ufrgs.br -> Aluno  
  * Go to Chasque -> Correio Eletrônico -> Informação sobre sua conta de email pessoal  
    - If it is not activate, follow the site instructions to activate.  
  * To access your *@ufrgs.br* account:  
    - Go to: https://webmail.ufrgs.br  
      - **User**: UFRGS id (00XXXXXX)  
      - **Pass**: your ufrgs password.  
  
1. Configure your *@inf.ufrgs.br* email to redirect messages to *@ufrgs.br* email:  
  * Go to: https://www.inf.ufrgs.br/myinf/forward/ (or find the redirecting option in http://www.inf.ufrgs.br/admrede/)  
  * Fill the form with:  
    - **Login**: your INF user (not your email)  
    - **Pass**: your INF password  
    - Check the "Redirecionar" checkbox and put your *login@ufrgs.br* (not the ID) in the form.  
  PS. One email will be sent to you to confirm the redirection.  
  * Access the email and send the form requested.  
  
2. Configure GMail to import *@ufrgs.br* emails:  
  * Settings-> Accounts and Import-> Add a POP3 mail account you own  
  * Email address: *login@ufrgs.br* (not the ID)  
    - **User**: UFRGS id (00XXXXXX)  
    - **Pass**: your ufrgs password.  
    - **POP** : pop.ufrgs.br 995  
    
3. Configure Gmail to send *@inf.ufrgs.br* emails  
  * Settings-> Accounts and Import-> Add another email address you own  
  * Email address: *login@inf.ufrgs.br*    
    - **SMTP Server**: smtp.inf.ufrgs.br 465  
    - **User**: your INF user (not your email)  
    - **Pass**: your password  
  PS. One confirmation email will be sent to you.  
  
