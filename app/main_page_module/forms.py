# Import Form and RecaptchaField (optional)
from flask_wtf import FlaskForm # , RecaptchaField

# Import Form elements such as TextField and BooleanField (optional)
from wtforms import BooleanField, IntegerField, StringField, TextAreaField, PasswordField, HiddenField, SubmitField, SelectField, validators # BooleanField

# Import Form validators
from wtforms.validators import Email, EqualTo, ValidationError

from app.main_page_module.models import user_sql_check_username, user_sql_check_email, icon_get_all

#email verification
import re
import os.path
    

# Define the login form (WTForms)
class MTagForm(FlaskForm):
    id = HiddenField('id', [validators.InputRequired(message='Dont fiddle around with the code!')])
    
    name = StringField('Ime Oznake', [validators.InputRequired(message='Potrebno je vnesti ime Oznake'),
                                             validators.Length(max=50)])
    
    submit = SubmitField('Ustvari Oznako')
    

class MythForm(FlaskForm):
    id = HiddenField('id', [validators.InputRequired(message='Dont fiddle around with the code!')])
    
    name = StringField('Ime Pripovedke', [validators.InputRequired(message='Ime Pripovedke'),
                                               validators.Length(max=50)])
    desc_s = StringField('Kratek opis Pripovedke', [validators.InputRequired(message='Vpiši kratek opis'),
                                               validators.Length(max=100)])
    desc_l = TextAreaField('Dolg opis Pripovedke', [validators.InputRequired(message='Vpiši dolg opis Pripovedke')])    

    coord = StringField('Koordinate izvora Pripovedke', [validators.InputRequired(message='Vnesi koordinate izvora Pripovedke'),
                                               validators.Length(max=50)])
    
    info  = TextAreaField('Viri', [validators.InputRequired(message='Viri Pripovedke')])
    
    submit = SubmitField('Oddaj')
    
    
class TagForm(FlaskForm):
    id = HiddenField('id', [validators.InputRequired(message='Dont fiddle around with the code!')])
    
    name = StringField('Ime Oznake', [validators.InputRequired(message='Potrebno je vnesti ime Oznake'),
                                             validators.Length(max=50)])
    
    submit = SubmitField('Ustvari Oznako')
    

class ParkingForm(FlaskForm):
    id = HiddenField('id', [validators.InputRequired(message='Dont fiddle around with the code!')])
    
    name = StringField('Ime Parkinga', [validators.InputRequired(message='Potrebno je vnesti ime Parkinga'),
                                             validators.Length(max=50)])
    
    prices  = [(0, 'Zastonj'), (1, 'Poceni'), (2, 'Drago')]
    price   = SelectField('Cena Parkiranja', [validators.InputRequired(message='Izberi Ceno')], choices=prices, coerce=int)
    
    coord = StringField('Koordinate Parkinga', [validators.InputRequired(message='Potrebno je vnesti koordinate Parkinga'),
                                             validators.Length(max=50)]) 
    
    submit = SubmitField('Dodaj Parking')
    
    
class LocationForm(FlaskForm):
    id = HiddenField('id', [validators.InputRequired(message=u'Dont fiddle around with the code!')])
    
    name = StringField(u'Ime lokacije', [validators.InputRequired(message=u'Vnesi ime Lokacije.'),
                                               validators.Length(max=50)])
    desc_s = StringField(u'Kratek opis', [validators.InputRequired(message=u'Vnesi kratek opis Lokacije.'),
                                               validators.Length(max=50)])
    desc_l = TextAreaField(u'Dolg opis', [validators.InputRequired(message=u'Vnesi dolg opis Lokacije.'),
                                               validators.Length(max=1300)])    
    
    #ratings  = [(0, 'If you have time, go see it once'), (1, 'Nothing special, but nice to see'), (2, 'Worth seeing if you can spare the time'), (3, 'Check it out, you wont regret it'), (4, 'Really good, top and see it'), (5, 'A must every time!')]
    ratings  = [(0, u'Če imaš čas, obišči enkrat'), (1, u'Nič posebnega, vendar lepo za videt'), (2, u'Vredno ogleda, če imaš ćas'), (3, u'Obišči, ne bo ti žal'), (4, u'Zelo vredno! Ustavi se in obišči!')]
    rating   = SelectField(u'Ocena', [validators.InputRequired(message=u'Izberi oceno.')], choices=ratings, coerce=int)
    
    #Time To Spend
    tts = IntegerField(u'Čas, katerega se da kvalitetno porabiti na Lokaciji (minute)', [validators.InputRequired(message=u'Vnesi čas za Lokacijo.')])

    coord = StringField(u'Koordinate Lokacije', [validators.InputRequired(message=u'Vnesi koordinate Lokacije.'),
                                               validators.Length(max=50)])
    
    #mtlds = [(0, 'PP0 - Easy, do not bother to mention'), (1, 'PP1 - Peacefull walk'), (2, 'PP2 - Can have some climbing protections'), (3, 'PP3 - Climbing protections, but not exposed, phisical strenght needed'), (4, 'PP4 - Vertical, exposed route'), (5, 'PP5 - Basicaly rock climbing with steel cables'), (6, 'PP6 - Like 5 but harder and more vertical')]
    mtlds = [(0, u'PP0 - Lahko, ni vredno omembe'), (1, u'PP1 - Miren sprehod{'), (2, u'PP2 - Pot, na določenih mestih zavarovana'), (3, u'PP3 - Zavarovana plezalna pot, vendar ne izpostavljena. Potrebna je fizična moč'), (4, u'PP4 - Navpična, zavarovana in izpostavljena plezalna pot'), (5, u'PP5 - V praksi navadno plezanje, s feratami'), (6, u'PP6 - Kot 5, le da težje in bolj navpično')]    
    #Max To Location Difficulty
    mtld     = SelectField(u'Maksimalna težavnost do Lokacije', [validators.InputRequired(message=u'Izberi Težavnost.')], choices=mtlds, coerce=int)
    
    contact = StringField(u'Kontakt', [validators.InputRequired(message=u'Vnesi kontakt za Lokacijo.'),
                                               validators.Length(max=100)])
    
    timetable  = TextAreaField(u'Urnik', [validators.InputRequired(message=u'Vnesi urnik Lokacije.')])
    
    fees = [(0, u'Ne'), (1, u'Odvisno'), (2, 'Da')]
    fee  = SelectField('Vstopnina', [validators.InputRequired(message=u'Izberi, ali ima Lokacija vstopnino')], choices=fees, coerce=int)   
    
    childs = [(0, u'Ne'), (1, 'Odvisno'), (2, u'Da')]
    child  = SelectField(u'Ali je Lokacija primerna za otroke', [validators.InputRequired(message=u'Izberi, ali je Lokacija primerna za otroke.')], choices=childs, coerce=int)   
    
    seasons = [(0, u'Ne'), (1, u'Da')]
    season  = SelectField(u'Ali je Lokacija odvisna od letnega časa', [validators.InputRequired(message=u'Izberi, ali je Lokacija odvisna od letnega časa.')], choices=seasons, coerce=int)
    
    icons = [(i[0], i[1]) for i in icon_get_all()]
    icon  = SelectField(u'Izberi ikono', [validators.InputRequired(message=u'Izberi lokacijo.')], choices=icons, coerce=int)        
    
    submit = SubmitField(u'Oddaj')
    
         

class LoginForm(FlaskForm):
    username_or_email = StringField('Username or Email', [validators.InputRequired(message='Forgot your email address?')])
    password = PasswordField('Password', [validators.InputRequired(message='Must provide a password.')])
    remember = BooleanField()
    
    submit = SubmitField('Login')

class EditUserForm(FlaskForm):

    id = HiddenField('id', [validators.InputRequired(message='Dont fiddle around with the code!')])
    name   = StringField('Name', [validators.InputRequired(message='We need a name for the user.')])
    email    = StringField('Email', [validators.InputRequired(message='We need an email for your account.')])
    password  = PasswordField('Password')    
    password_2 = PasswordField('Repeat password', [EqualTo('password', message='Passwords must match')])
      
    submit = SubmitField('Submit changes')
    

class RegisterForm(FlaskForm):
    username   = StringField('Username', [validators.InputRequired(message='We need a username for your account.')])
    email    = StringField('Email', [validators.InputRequired(message='We need an email for your account.')])
    password  = PasswordField('Password')    
    password_2 = PasswordField('Repeat password', [validators.InputRequired(), EqualTo('password', message='Passwords must match')])
    
    submit = SubmitField('Register')
    
    #When you add any methods that match the pattern validate_<field_name>, WTForms takes those as custom validators and invokes them in addition to the stock validators
    def validate_username(self, username):
            if user_sql_check_username(username.data) is not False:
                raise ValidationError('Please use a different username.')
    
    def validate_email(self, email):
        
        regex = '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'
        
        #check if it is a real email
        if(re.search(regex,email.data)):  
            #if it is, check if there is another user with the same email
        
            if user_sql_check_username(email.data) is not False:
                raise ValidationError('Please use a different email address.')     
        
        else:  
            raise ValidationError('Please use a valid email address.')          
        