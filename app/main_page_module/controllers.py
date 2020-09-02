# Import flask dependencies
from flask import Blueprint, request, render_template, \
                  flash, g, session, redirect, url_for, jsonify, send_file


# Import module forms
from app.main_page_module.forms import LoginForm, RegisterForm, EditUserForm, LocationForm, ParkingForm, TagForm, MythForm, MTagForm, ImgForm

# Import module models (i.e. User)
from app.main_page_module.models import user_sql_create, user_sql_login_check, user_sql_get_all, \
     user_sql_get_one, user_sql_delete_one, user_sql_update_one, location_create, location_get_one, location_change, parking_create, \
     parking_get_all_of_location, parking_get_one, parking_remove, tag_create, tag_get_all_of_location, tag_get_all, loc_tag_get_one, loc_tag_remove, tag_add, tag_get_one, \
     loc_tag_get_one_by, location_get_all, location_delete_one, location_get_all_with_tag, myth_create, myth_get_one, mtag_get_all_of_myth, mtag_get_all, myth_change, \
     myth_mtag_remove, myth_get_all_with_mtag, mtag_get_one, myth_mtag_get_one, myth_mtag_get_one_by, myth_get_all, mtag_create, mtag_add, myth_delete_one, location_get_all_argus, \
     myths_get_all_argus, location_get_numbers, tag_get_numbers, location_get_all_with_tag_for_argus, myth_get_numbers, mtag_get_numbers, myth_get_all_with_mtag_for_argus, \
     icon_get_one, location_get_icon_link, location_get_all_where_rating, location_get_all_with_ids, location_get_all_id_with_tag, img_create, img_get_one, img_remove, \
     img_get_all_of_location, location_get_all_where
     

#import os
import re
import os
import zipfile
import io
import pathlib
from functools import wraps
import datetime


from app.main_page_module.argus import WSearch

# Define the blueprint: 'auth', set its url prefix: app.url/auth
main_page_module = Blueprint('main_page_module', __name__, url_prefix='/')

#login decorator
def login_required(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        if 'user_id' in session:
            return f(*args, **kwargs)
        
        else:
            flash("Please login to access the site.", "error")
            
            return redirect(url_for("main_page_module.login"))
    
    return wrapper


#login check
def check_login():
    if "user_id" not in session:
        return True
    
# Set the route and accepted methods
@main_page_module.route('/', methods=['GET', 'POST'])
def index():
    locations = location_get_all()
    tags = tag_get_all()
    
    if request.method == "POST":
        try:
            rating = int(request.form["rating"].strip())
            tag = int(request.form["tag"].strip())
            
            #print(f"rating: {rating}" )
            #print(f"tag: {tag}")
            
        except:
            return render_template("main_page_module/index.html", locations=locations, tags=tags)
                
        command = ""
        
        if rating in [0,1,2,3,4]:
            command += f" AND locations.rating = {rating} "
            
        if tag != 999999:
            command += f" AND loc_tag.id_tag = {tag} "
        
        locations = location_get_all_where(command)
                        
               
    return render_template("main_page_module/index.html", locations=locations, tags=tags)


@main_page_module.route('/search_results_loc/', methods=['POST'])
def search_results_loc():
    key = request.form["key"].strip()
    choosen_tag = request.form["choosen_tag"]
    locations = None
    if key == "":
        asterix = ""
    else:
        asterix = "*"    
    
    search_object = WSearch()
    
    locations_from_argus = search_object.index_search_location(key + asterix)
    
    if choosen_tag != "choosen_tag":
        tag_location_ids = location_get_all_with_tag_for_argus(choosen_tag)[0]
        
        results = {url_for('main_page_module.view_location', location_id=int(location[0])): [location[1], location[2], url_for('static', filename='icons/' + str(location_get_icon_link(location[0])[0]))] for location in locations_from_argus if (int(location[0]) in tag_location_ids)}
 
    else:
        results = {url_for('main_page_module.view_location', location_id=int(location[0])): [location[1], location[2], url_for('static', filename='icons/' + str(location_get_icon_link(location[0])[0]))] for location in locations_from_argus}
        
    
    return jsonify(results)

@main_page_module.route('/search_results_myth/', methods=['POST'])
def search_results_myth():
    key = request.form["key"].strip()
    choosen_tag = request.form["choosen_tag"]
    locations = None
    if key == "":
        asterix = ""
    else:
        asterix = "*"    
    
    search_object = WSearch()
    
    myths_from_argus = search_object.index_search_myth(key + asterix)
    
    if choosen_tag != "choosen_tag":
        tag_myths_ids = myth_get_all_with_mtag_for_argus(choosen_tag)[0]
        
        results = {url_for('main_page_module.view_myth', myth_id=int(myth[0])): [myth[1], myth[2], myth[0]] for myth in myths_from_argus if (int(location[0]) in tag_myths_ids)}
 
    else:
        results = {url_for('main_page_module.view_myth', myth_id=int(myth[0])): [myth[1], myth[2], myth[0]] for myth in myths_from_argus}
        
    #print(results)
    
    return jsonify(results)


@main_page_module.route('/about/', methods=['GET'])
def about(): 

    return render_template("main_page_module/about.html")

@main_page_module.route('/search_locations/', methods=['GET'])
def search_locations():
    #if check_login(): return redirect(url_for("main_page_module.login"))
    all_tags = tag_get_all()
    location_numbers = location_get_numbers()[0]
    tag_numbers = tag_get_numbers()[0]
    

    return render_template("main_page_module/search_locations.html", all_tags=all_tags, location_numbers=location_numbers, tag_numbers=tag_numbers)


@main_page_module.route('/search_myths/', methods=['GET'])
def search_myths():
    #if check_login(): return redirect(url_for("main_page_module.login"))
    all_mtags = mtag_get_all()
    myth_numbers = myth_get_numbers()[0]
    mtag_numbers = mtag_get_numbers()[0]
    

    return render_template("main_page_module/search_myth.html", all_mtags=all_mtags, myth_numbers=myth_numbers, mtag_numbers=mtag_numbers)

@main_page_module.route('/all_mtags/')
def all_mtags():
    mtags = mtag_get_all()
   
    return render_template("main_page_module/all_mtags.html", mtags=mtags)


@main_page_module.route('/view_mtag/<mtag_id>')
def view_mtag(mtag_id):
    
    mtag = mtag_get_one(mtag_id)
    
    if (mtag is None):
        
        flash('Oznaka ne obstaja!', 'error')
        
        return redirect(url_for("main_page_module.all_myths"))        
    
    myths = myth_get_all_with_mtag(mtag_id)

    return render_template("main_page_module/view_mtag.html", mtag=mtag, myths=myths)


@main_page_module.route('/update_myth_search/', methods=['POST'])
@login_required
def update_myth_search():    
    if "update" != request.form["update"]:
        json_response = {"a": "-1"}
                
        return jsonify(json_response)    
    
    json_response = {"a": "OK"}
    
    try:
        myths = myths_get_all_argus()
        new_index = WSearch()
        new_index.index_create_myth(myths)  
        
        return jsonify(json_response)
    
    except:
        json_response = {"a": "-1"}
                
        return jsonify(json_response)
    
    
@main_page_module.route('/update_loc_search/', methods=['POST'])
@login_required
def update_loc_search():    
    if "update" != request.form["update"]:
        json_response = {"a": "-1"}
                
        return jsonify(json_response)    
    
    json_response = {"a": "OK"}
    
    try:
        locations = location_get_all_argus()
        new_index = WSearch()
        new_index.index_create_loc(locations)  
        
        return jsonify(json_response)
    
    except:
        json_response = {"a": "-1"}
                
        return jsonify(json_response)
   

@main_page_module.route('/remove_mtag/', methods=['POST'])
@login_required
def remove_mtag():

    myth_mtag_id = request.form["myth_mtag_id"]

    myth_mtag = myth_mtag_get_one(myth_mtag_id)
    
    json_response = {"a": "OK"}
    
    if myth_mtag is not None:
        myth_mtag_remove(myth_mtag_id, myth_mtag[2])
                
        return jsonify(json_response)
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)
    

@main_page_module.route('/add_mtag/', methods=['POST'])
@login_required
def add_mtag():

    myth = myth_get_one(request.form["myth_id"])
    mtag = mtag_get_one(request.form["mtag_id"])
    
    json_response = {"a": "OK"}
    
    if (myth is not None) and (mtag is not None):
        if myth_mtag_get_one_by(myth[0], mtag[0]) is None:
            mtag_add(myth[0], mtag[0])
                    
            return jsonify(json_response)
        
        else:
            json_response = {"a": "KO"}
            
            return jsonify(json_response)            
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)


    
@main_page_module.route('/create_mtag/', methods=['POST'])
@login_required
def create_mtag():
    form = TagForm(request.form)
    
    myth = myth_get_one(form.id.data)
        
    # Verify the sign in form
    if (form.validate_on_submit()) and (myth is not None):
        mtag_create(form.name.data, form.id.data)
        
        flash('Oznaka uspesno narejena za to Pripovedko!', 'success')
        
        return redirect(url_for("main_page_module.edit_myth", myth_id=form.id.data))
    
    
    for error in form.errors:
        print(error)
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.index"))


@main_page_module.route('/new_myth', methods=['GET', 'POST'])
@login_required
def new_myth():
    # If sign in form is submitted
    form = MythForm(request.form)

    
    # Verify the sign in form
    if form.validate_on_submit():

        myth_id = myth_create(form.name.data, form.desc_s.data, form.desc_l.data, form.coord.data, form.info.data)
        
        flash('Pripovedka uspesno narejena!', 'success')
        
        return redirect(f"edit_myth/{myth_id}")
    
    """
    for error in form.errors:
        print(error)
    """

    return render_template("main_page_module/myths/new_myth.html", form=form)

@main_page_module.route('/edit_myth/<myth_id>', methods=['GET', 'POST'])
@login_required
def edit_myth(myth_id):
    myth = myth_get_one(myth_id)
    form_mtag = MTagForm()
    
    if myth is None:
        flash('Nobena pripovedka najdena', 'error')
        
        return redirect(url_for("main_page_module.index"))
    
    form = MythForm()
    form.process(id = myth[0],
                 name = myth[1],
                 desc_s = myth[2],
                 desc_l = myth[3],
                 coord = myth[4],
                 info = myth[5])
    
    mtags = mtag_get_all_of_myth(myth_id)
    all_mtags = mtag_get_all()
    
    return render_template("main_page_module/myths/edit_myth.html", form=form, form_mtag=form_mtag, mtags=mtags, all_mtags=all_mtags)


@main_page_module.route('/view_myth/<myth_id>', methods=['GET', 'POST'])
def view_myth(myth_id):
    myth = myth_get_one(myth_id)
    mtags = mtag_get_all_of_myth(myth_id)    
    
    if myth is None:
        flash('Nobene Pripovedke ne najdemo', 'error')
        
        return redirect(url_for("main_page_module.index"))

    return render_template("main_page_module/myths/view_myth.html", myth=myth, mtags=mtags)


@main_page_module.route('/change_myth/', methods=['POST'])
@login_required
def change_myth():
    form = MythForm(request.form)
    myth_id = form.id.data
    
    myth = myth_get_one(myth_id)
    
    if form.validate_on_submit():
        
        if myth is None:
            flash('Nobena pripovedka najdena', 'error')
            
            return redirect(url_for("main_page_module.index"))  
        
        myth_change(myth_id, form.name.data, form.desc_s.data, form.desc_l.data, form.coord.data, form.info.data)
        
        flash('Pripovedka uspesno spremenjena!', 'success')
        
        return redirect(url_for("main_page_module.edit_myth", myth_id=myth_id))
    
    flash('Invalid Data', 'error')
    
    for error in form.errors:
        print(error)
    
    return redirect(url_for("main_page_module.index"))  


@main_page_module.route('/delete_myth/', methods=['POST'])
@login_required
def delete_myth():
    myth_id = request.form["id"]
    
    myth = myth_get_one(myth_id)
        
    # Verify the sign in form
    if (myth is not None):
        #get all mtags of the mzth, to delete them
        mtags = mtag_get_all_of_myth(myth_id)
        
        for mtag in mtags:
            myth_mtag_remove(mtag[0], mtag[2])
        
        myth_delete_one(myth_id)
        
        flash('Pripovedka uspesno izbrisana!', 'success')
        
        return redirect(url_for("main_page_module.all_myths"))
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.all_myths"))


@main_page_module.route('/all_myths/')
def all_myths():
    myths = myth_get_all()
   
    return render_template("main_page_module/myths/all_myths.html", myths=myths)


@main_page_module.route('/all_locations/')
def all_locations():
    locations = location_get_all()
   
    return render_template("main_page_module/locations/all_locations.html", locations=locations)


@main_page_module.route('/delete_location/', methods=['POST'])
@login_required
def delete_location():
    location_id = request.form["id"]
    
    location = location_get_one(location_id)
        
    # Verify the sign in form
    if (location is not None):
        #get all tags of the location, to delete them
        tags_querry = tag_get_all_of_location(location_id)
        
        for tag in tags_querry:
            loc_tag_remove(tag[0], tag[2])   
            
        location_delete_one(location_id)
        
        flash('Location successfully deleted!', 'success')
        
        return redirect(url_for("main_page_module.all_locations"))
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.all_locations"))


@main_page_module.route('/all_tags/')
def all_tags():
    tags = tag_get_all()
   
    return render_template("main_page_module/all_tags.html", tags=tags)


@main_page_module.route('/view_tag/<tag_id>')
def view_tag(tag_id):
    
    tag = tag_get_one(tag_id)
    
    if (tag is None):
        
        flash('The tag does not exist !', 'error')
        
        return redirect(url_for("main_page_module.all_locations"))        
    
    locations = location_get_all_with_tag(tag_id)

    return render_template("main_page_module/view_tag.html", tag=tag, locations=locations)


@main_page_module.route('/remove_tag/', methods=['POST'])
@login_required
def remove_tag():

    loc_tag_id = request.form["loc_tag_id"]

    loc_tag = loc_tag_get_one(loc_tag_id)
    
    json_response = {"a": "OK"}
    
    if loc_tag is not None:
        loc_tag_remove(loc_tag_id, loc_tag[2])
                
        return jsonify(json_response)
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)
    

@main_page_module.route('/add_tag/', methods=['POST'])
@login_required
def add_tag():

    location = location_get_one(request.form["loc_id"])
    tag = tag_get_one(request.form["tag_id"])
    
    json_response = {"a": "OK"}
    
    if (location is not None) and (tag is not None):
        if loc_tag_get_one_by(location[0], tag[0]) is None:
            tag_add(location[0], tag[0])
                    
            return jsonify(json_response)
        
        else:
            json_response = {"a": "KO"}
            
            return jsonify(json_response)            
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)


    
@main_page_module.route('/create_tag/', methods=['POST'])
@login_required
def create_tag():
    form = TagForm(request.form)
    
    location = location_get_one(form.id.data)
        
    # Verify the sign in form
    if (form.validate_on_submit()) and (location is not None):
        tag_create(form.name.data, form.id.data)
        
        flash('Tag successfully created for this location!', 'success')
        
        return redirect(url_for("main_page_module.edit_location", location_id=form.id.data))
    
    
    for error in form.errors:
        print(error)
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.index"))


@main_page_module.route('/add_img/', methods=['POST'])
@login_required
def add_img():
    form = ImgForm(request.form)
    
    location = location_get_one(form.id.data)
        
    # Verify the sign in form
    if (form.validate_on_submit()) and (location is not None):
        img_create(form.name.data, form.link.data, form.id.data)
        
        flash('Location successfully Eddited!', 'success')
        
        return redirect(url_for("main_page_module.edit_location", location_id=form.id.data))
    
    
    for error in form.errors:
        print(error)
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.index"))


@main_page_module.route('/remove_img/', methods=['POST'])
@login_required
def remove_img():

    img_id = request.form["img_id"]

    img = img_get_one(img_id)
    
    json_response = {"a": "OK"}
    
    if img is not None:
        img_remove(img_id)
                
        return jsonify(json_response)
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)


@main_page_module.route('/add_parking/', methods=['POST'])
@login_required
def add_parking():
    form = ParkingForm(request.form)
    
    location = location_get_one(form.id.data)
        
    # Verify the sign in form
    if (form.validate_on_submit()) and (location is not None):
        parking_create(form.name.data, form.price.data, form.coord.data.replace(" ", ""), form.id.data)
        
        flash('Location successfully Eddited!', 'success')
        
        return redirect(url_for("main_page_module.edit_location", location_id=form.id.data))
    
    
    for error in form.errors:
        print(error)
    
    
    flash('No access or the location does not exist!', 'error')

    return redirect(url_for("main_page_module.index"))

@main_page_module.route('/remove_parking/', methods=['POST'])
@login_required
def remove_parking():

    parking_id = request.form["parking_id"]

    parking = parking_get_one(parking_id)
    
    json_response = {"a": "OK"}
    
    if parking is not None:
        parking_remove(parking_id)
                
        return jsonify(json_response)
    
    else:
        json_response = {"a": "-1"}
        
        return jsonify(json_response)


@main_page_module.route('/new_location', methods=['GET', 'POST'])
@login_required
def new_location():
    # If sign in form is submitted
    form = LocationForm(request.form)
    
    
    # Verify the sign in form
    if form.validate_on_submit():
        coordinates = form.coord.data

        location_id = location_create(form.name.data, form.desc_s.data, form.desc_l.data, form.rating.data, form.tts.data, coordinates.replace(" ", ""), form.mtld.data, form.contact.data,
                        form.timetable.data, form.fee.data, form.child.data, form.season.data, form.icon.data)
        
        
        
        #create argus index
        locations = location_get_all_argus()
        new_index = WSearch()
        new_index.index_create_loc(locations)            
        
        flash('Location successfully created!', 'success')
        
        return redirect(f"edit_location/{location_id}")
    
    """
    for error in form.errors:
        print(error)
    """

    return render_template("main_page_module/locations/new_location.html", form=form)


@main_page_module.route('/edit_location/<location_id>', methods=['GET', 'POST'])
@login_required
def edit_location(location_id):
    location = location_get_one(location_id)
    form_parking = ParkingForm()
    form_img = ImgForm()
    form_tag = TagForm()
    
    if location is None:
        flash('No entry found', 'error')
        
        return redirect(url_for("main_page_module.index"))
    
    form = LocationForm()
    form.process(id = location_id,
                 name = location[1],
                 desc_s = location[2],
                 desc_l = location[3],
                 rating = location[4],
                 tts = location[5],
                 coord = location[6].replace(" ", ""),
                 mtld = location[7],
                 contact = location[8],
                 timetable = location[9],
                 fee = location[10],
                 child = location[11],
                 season = location[12],
                 icon = location[13])
    
    parkings = parking_get_all_of_location(location_id)
    tags = tag_get_all_of_location(location_id)
    all_tags = tag_get_all()
    all_imgs = img_get_all_of_location(location_id)
    
    return render_template("main_page_module/locations/edit_location.html", form=form, form_parking=form_parking, form_tag=form_tag, form_img=form_img, parkings=parkings, tags=tags, all_tags=all_tags, icon_get_one=icon_get_one, all_imgs=all_imgs)


@main_page_module.route('/view_location/<location_id>', methods=['GET', 'POST'])
def view_location(location_id):
    location = location_get_one(location_id)
    parkings = parking_get_all_of_location(location_id)
    tags = tag_get_all_of_location(location_id)
    all_imgs = img_get_all_of_location(location_id)
    
    if location is None:
        flash('No Location found', 'error')
        
        return redirect(url_for("main_page_module.index"))

    return render_template("main_page_module/locations/view_location.html", location=location, parkings=parkings, tags=tags, icon_get_one=icon_get_one, all_imgs=all_imgs)


@main_page_module.route('/change_location/', methods=['POST'])
@login_required
def change_location():
    form = LocationForm(request.form)
    location_id = form.id.data
    
    location = location_get_one(location_id)
    
    if form.validate_on_submit():
        
        if location is None:
            flash('No location found', 'error')
            
            return redirect(url_for("main_page_module.index"))  
        
        location_change(location_id, form.name.data, form.desc_s.data, form.desc_l.data, form.rating.data, form.tts.data, form.coord.data, form.mtld.data, form.contact.data, form.timetable.data, form.fee.data, form.child.data,
                         form.season.data, form.icon.data)
        
        flash('Location successfully Eddited!', 'success')
        
        return redirect(url_for("main_page_module.edit_location", location_id=location_id))
    
    flash('Invalid Data', 'error')
    
    for error in form.errors:
        print(error)
    
    return redirect(url_for("main_page_module.index"))    


@main_page_module.route('/get_zipped_entries/')
@login_required
def get_zipped_entries():
    now = datetime.datetime.now()
    
    base_path = pathlib.Path('app//main_page_module//data//')
    data = io.BytesIO()
    with zipfile.ZipFile(data, mode='w') as z:
        for f_name in base_path.iterdir():
            z.write(f_name, os.path.basename(f_name))
    data.seek(0)
    
    return send_file(
        data,
        mimetype='application/zip',
        as_attachment=True,
        attachment_filename=f'all_entries_{now.strftime("%Y-%m-%d_%H-%M")}.zip',
        cache_timeout=0
    )


@main_page_module.route('/admin/all_users/')
@login_required
def all_users():
    users = user_sql_get_all()
   
    return render_template("main_page_module/admin/all_users.html", users=users)


@main_page_module.route('/admin/view_user/<user_id>')
@login_required
def view_user(user_id):
    user = user_sql_get_one(user_id)
   
    if not user:
        flash('User does not exist.', 'error')
        
        return redirect(url_for("main_page_module.all_users"))     
    
    form = EditUserForm()
    form.process(id = user[0],
                 name = user[1],
                 email = user[3])
    
   
    return render_template("main_page_module/admin/view_user.html", form=form, user=user)

@main_page_module.route('/admin/modify_user/', methods=['POST'])
@login_required
def modify_user():
    form = EditUserForm(request.form)
    
    if form.validate_on_submit():
        user = user_sql_get_one(form.id.data)
        
        if not user:
            flash('User does not exist.', 'error')
        
            return redirect(url_for("main_page_module.all_users")) 
        
        user_sql_update_one(form.id.data, form.name.data, form.email.data, form.password.data)

        
        flash('User successfully Eddited!', 'success')
        
        return redirect(url_for("main_page_module.view_user", user_id=form.id.data, form=form))
    
    flash('Invalid data.', 'error')

    return redirect(url_for("main_page_module.all_users"))     
    

@main_page_module.route('/admin/delete/', methods=['POST'])
@login_required
def delete_user():
    user = user_sql_get_one(request.form["id"])
       
    if not user:
        flash('User does not exist.', 'error')
        
        return redirect(url_for("main_page_module.all_users")) 
    
    else:
        user_sql_delete_one(user[0])
        
        flash(f'User {user[1]} - {user[2]} successfully deleted.', 'success')
        
        return redirect(url_for("main_page_module.all_users")) 
    

# Set the route and accepted methods
@main_page_module.route('/login/', methods=['GET', 'POST'])
def login():

    # If sign in form is submitted
    form = LoginForm(request.form)

    # Verify the sign in form
    if form.validate_on_submit():
        user_id = user_sql_login_check(form.username_or_email.data, form.password.data)

        if user_id is not False:
            session['user_id'] = user_id[0]
            
            #set permanent login, if selected
            if form.remember.data == True:
                session.permanent = True

            flash('Welcome %s' % user_id[1], 'success')
            
            return redirect(url_for('main_page_module.index'))

        flash('Wrong email or password', 'error')
    
    try:
        if(session['user_id']):
            return redirect(url_for("main_page_module.index"))
    
    except:
        return render_template("main_page_module/auth/login.html", form=form)

@main_page_module.route('/logout/')
@login_required
def logout():
    session.pop("user_id", None)
    session.permanent = False
    
    flash('You have been logged out. Have a nice day!', 'success')

    return redirect(url_for("main_page_module.login"))

# Set the route and accepted methods
@main_page_module.route('/register/', methods=['GET', 'POST'])
def register():
    #insert check, if the user is already logged in
    '''
    form = RegisterForm(request.form)

    if form.validate_on_submit():
        user_sql_create(form.username.data, form.email.data, form.password.data)
        
        flash('Congratulations, you are now a registered user!', 'success')
        
        return redirect(url_for('main_page_module.login'))
    return render_template('main_page_module/auth/register.html', title='Register', form=form)
    '''
    
    flash('Registracija uporabnikov še ni možna!', 'error')
    
    return redirect(url_for('main_page_module.index'))