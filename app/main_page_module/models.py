from datetime import datetime

# Import password / encryption helper tools
#from werkzeug import check_password_hash, generate_password_hash
from werkzeug.security import generate_password_hash, check_password_hash

from app import connection, cursor


def icon_create(name, link):
   
    sql_command = f"""INSERT INTO icons (name, link)
                  VALUES ('{name}', '{desc_s}');"""
    
    cursor.execute(sql_command)
    connection.commit()
    
    icon_id = cursor.lastrowid
    
    return icon_id


def icon_change(icon_id, name, link):
    sql_command = f"""UPDATE icons SET name = '{name}', link = '{link}'
     WHERE id = {icon_id};"""
    
    cursor.execute(sql_command)
    connection.commit()
    

def icon_get_one(icon_id):
    sql_command = f"SELECT * FROM icons WHERE id = {icon_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

        
def icon_get_all():
    sql_command = f"SELECT * FROM icons ORDER BY name ASC;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def mtag_create(name, myth_id):
    
    try:
        sql_command = f"""INSERT INTO mtags (name)
                      VALUES ('{name}');"""
        
        cursor.execute(sql_command)
        mtag_id = cursor.lastrowid
        
        #add tag to location
        sql_command = f"""INSERT INTO myth_mtag (id_mtag, id_myth)
                      VALUES ('{mtag_id}', '{myth_id}');"""
        
        cursor.execute(sql_command)
        
        connection.commit()
        
    except:
        connection.rollback()


def mtag_add(myth_id, mtag_id):
   
    sql_command = f"""INSERT INTO myth_mtag (mtag_id, myth_id)
                  VALUES ('{myth_id}', '{mtag_id}');"""
    
    cursor.execute(sql_command)
    connection.commit()
    

def myth_mtag_get_one(myth_mtag_id):
    sql_command = f"SELECT * FROM myth_mtag WHERE id = {myth_mtag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def myth_mtag_get_one_by(myth_id, mtag_id):
    sql_command = f"SELECT * FROM myth_mtag WHERE id_myth = {myth_id} AND id_mtag = {mtag_id} ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def mtag_get_one(mtag_id):
    sql_command = f"SELECT * FROM mtags WHERE id = {mtag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def myth_mtag_remove(myth_mtag_id, id_mtag):
   
    sql_command = f"DELETE FROM myth_mtag WHERE id = '{myth_mtag_id}' ;"
    cursor.execute(sql_command)
    connection.commit()
    
    try:
        #delete the tag connection
        sql_command = f"DELETE FROM myth_mtag WHERE id = '{myth_mtag_id}';"
    
        cursor.execute(sql_command)
        connection.commit()
    
        #check if the tag is connected to anything anymore
        sql_command = f"SELECT * FROM myth_mtag WHERE id_mtag = {id_mtag};"
    
        cursor.execute(sql_command)
        results = cursor.fetchall()
    
        #if not, delete it
        if (len(results) is 0):
            sql_command = f"DELETE FROM mtags WHERE id = '{id_mtag}';"
    
            cursor.execute(sql_command)
            connection.commit()
    except:
        connection.rollback()   
        
def mtag_get_all():
    sql_command = f"SELECT * FROM mtags;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def mtag_get_numbers():
    sql_command = f"SELECT COUNT(*) FROM mtags;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def mtag_get_all_of_myth(myth_id):
    sql_command = f"SELECT * FROM myth_mtag LEFT JOIN mtags ON myth_mtag.id_mtag = mtags.id WHERE myth_mtag.id_myth = {myth_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def myth_create(name, desc_s, desc_l, coord, info):
   
    sql_command = f"""INSERT INTO myths (name, desc_s, desc_l, coord, info)
                  VALUES ('{name}', '{desc_s}', '{desc_l}', '{coord}', '{info}');"""
    
    cursor.execute(sql_command)
    connection.commit()
    
    myth_id = cursor.lastrowid
    
    return myth_id

def myth_get_one(myth_id):
    sql_command = f"SELECT * FROM myths WHERE id = {myth_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def myth_get_all():
    sql_command = f"SELECT id, name, LEFT(desc_s , 20) FROM myths ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def myth_get_numbers():
    sql_command = f"SELECT COUNT(*) FROM myths;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def myth_get_all_with_mtag(mtag_id):
    sql_command = f"SELECT myths.id, myths.name, myths.desc_s FROM myth_mtag LEFT JOIN myths ON myth_mtag.id_myth = myths.id WHERE myth_mtag.id_mtag = {mtag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result

def myth_get_all_with_mtag_for_argus(mtag_id):
    sql_command = f"SELECT myths.id FROM myth_mtag LEFT JOIN myths ON myth_mtag.id_myth = myths.id WHERE myth_mtag.id_mtag = {mtag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def myth_change(myth_id, name, desc_s, desc_l, coord, info):
    sql_command = f"""UPDATE myths SET name = '{name}', desc_s = '{desc_s}', desc_l = '{desc_l}', coord = '{coord}', info = '{info}'
     WHERE id = {myth_id};"""
    
    cursor.execute(sql_command)
    connection.commit()


def myth_delete_one(myth_id):
    sql_command = f"DELETE FROM myths WHERE id = {myth_id};"
    
    cursor.execute(sql_command)
    connection.commit()
    
    
def loc_tag_remove(loc_tag_id, id_tag):
   
    sql_command = f"DELETE FROM loc_tag WHERE id = '{loc_tag_id}' ;"
    cursor.execute(sql_command)
    connection.commit()
    
    try:
        #delete the tag connection
        sql_command = f"DELETE FROM loc_tag WHERE id = '{loc_tag_id}';"
    
        cursor.execute(sql_command)
        connection.commit()
    
        #check if the tag is connected to anything anymore
        sql_command = f"SELECT * FROM loc_tag WHERE id_tag = {id_tag};"
    
        cursor.execute(sql_command)
        results = cursor.fetchall()
    
        #if not, delete it
        if (len(results) is 0):
            sql_command = f"DELETE FROM tags WHERE id = '{id_tag}';"
    
            cursor.execute(sql_command)
            connection.commit()
    except:
        connection.rollback()    
    

def tag_create(name, location_id):
    
    try:
        sql_command = f"""INSERT INTO tags (name)
                      VALUES ('{name}');"""
        
        cursor.execute(sql_command)
        tag_id = cursor.lastrowid
        
        #add tag to location
        sql_command = f"""INSERT INTO loc_tag (id_tag, id_loc)
                      VALUES ('{tag_id}', '{location_id}');"""
        
        cursor.execute(sql_command)
        
        connection.commit()
        
    except:
        connection.rollback()


def tag_add(location_id, tag_id):
   
    sql_command = f"""INSERT INTO loc_tag (id_loc, id_tag)
                  VALUES ('{location_id}', '{tag_id}');"""
    
    cursor.execute(sql_command)
    connection.commit()
    
def loc_tag_get_one(loc_tag_id):
    sql_command = f"SELECT * FROM loc_tag WHERE id = {loc_tag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def loc_tag_get_one_by(location_id, tag_id):
    sql_command = f"SELECT * FROM loc_tag WHERE id_loc = {location_id} AND id_tag = {tag_id} ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def tag_get_one(tag_id):
    sql_command = f"SELECT * FROM tags WHERE id = {tag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def tag_get_all():
    sql_command = f"SELECT * FROM tags;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def tag_get_numbers():
    sql_command = f"SELECT COUNT(*) FROM tags;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def tag_get_all_of_location(location_id):
    sql_command = f"SELECT * FROM loc_tag LEFT JOIN tags ON loc_tag.id_tag = tags.id WHERE loc_tag.id_loc = {location_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result
    
    
def tag_change(tag_id, name):
    sql_command = f"""UPDATE tags SET name = '{name}'
     WHERE id = {tag_id};"""
    
    cursor.execute(sql_command)
    connection.commit()
    
    
def parking_create(name, cost, coord, location_id):
   
    sql_command = f"""INSERT INTO parkings (name, cost, coord, id_location)
                  VALUES ('{name}', '{cost}', '{coord}', {location_id});"""
        
    cursor.execute(sql_command)
    connection.commit()


def parking_get_one(parking_id):
    sql_command = f"SELECT * FROM parkings WHERE id = {parking_id};"
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def parking_get_all_of_location(location_id):
    sql_command = f"SELECT * FROM parkings WHERE id_location = {location_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result

    
def parking_change(parking_id, cost, coord):
    sql_command = f"""UPDATE parkings SET name = '{name}', cost = '{cost}', coord = '{coord}'
     WHERE id = {parking_id};"""
    
    cursor.execute(sql_command)
    connection.commit()


def parking_remove(parking_id):
   
    sql_command = f"DELETE FROM parkings WHERE id = '{parking_id}' ;"
    cursor.execute(sql_command)
    connection.commit()
    
    
def location_create(name, desc_s, desc_l, rating, tts, coord, mtld, contact, timetable, fee, child, season, icon):
   
    sql_command = f"""INSERT INTO locations (name, desc_s, desc_l, rating, tts, coord, mtld, contact, timetable, fee, child, season, icon)
                  VALUES ('{name}', '{desc_s}', '{desc_l}', '{rating}', '{tts}', '{coord}', '{mtld}', '{contact}', '{timetable}', '{fee}', '{child}', '{season}', '{icon}');"""
    
    cursor.execute(sql_command)
    connection.commit()


def location_get_all():
    sql_command = f"SELECT locations.id, locations.name, LEFT(locations.desc_s , 20), icons.link, locations.coord FROM locations LEFT JOIN icons ON icons.id = locations.icon ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    
    return result

def location_get_all_where_rating(rating):
    sql_command = f"SELECT id FROM locations WHERE rating = {rating};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()       
    
    return result


def location_get_all_argus():
    sql_command = f"SELECT id, name, desc_l FROM locations ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result

def myths_get_all_argus():
    sql_command = f"SELECT id, name, desc_l FROM myths ;"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def location_get_all_with_ids(ids):
    ids = ','.join([str(i) for i in ids]) 
    sql_command = f"SELECT locations.id, locations.name, LEFT(locations.desc_s , 20), icons.link, locations.coord FROM locations LEFT JOIN icons ON icons.id = locations.icon WHERE locations.id IN ({ids});"
    
    print(sql_command)
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    
    return result

def location_get_all_with_tag(tag_id):
    sql_command = f"SELECT locations.id, locations.name, locations.desc_s, icons.link FROM loc_tag LEFT JOIN locations ON loc_tag.id_loc = locations.id LEFT JOIN icons ON icons.id = locations.icon WHERE loc_tag.id_tag = {tag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result

def location_get_all_id_with_tag(tag_id):
    sql_command = f"SELECT locations.id FROM loc_tag LEFT JOIN locations ON loc_tag.id_loc = locations.id LEFT JOIN icons ON icons.id = locations.icon WHERE loc_tag.id_tag = {tag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result

def location_get_all_with_tag_for_argus(tag_id):
    sql_command = f"SELECT locations.id FROM loc_tag LEFT JOIN locations ON loc_tag.id_loc = locations.id WHERE loc_tag.id_tag = {tag_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchall()
    
    return result


def location_get_one(location_id):
    sql_command = f"SELECT * FROM locations LEFT JOIN icons ON icons.id = locations.icon WHERE locations.id = {location_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def location_get_icon_link(location_id):
    sql_command = f"SELECT icons.link FROM locations LEFT JOIN icons ON icons.id = locations.icon WHERE locations.id = {location_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result


def location_get_numbers():
    sql_command = f"SELECT COUNT(*) FROM locations;"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

    
def location_change(location_id, name, desc_s, desc_l, rating, tts, coord, mtld, contact, timetable, fee, child, season, icon):
    sql_command = f"""UPDATE locations SET name = '{name}', desc_s = '{desc_s}', desc_l = '{desc_l}', rating = '{rating}', tts = '{tts}', coord = '{coord}', 
     mtld = '{mtld}', contact = '{contact}', timetable = '{timetable}', fee = '{fee}', child = '{child}', season = '{season}', icon = '{icon}' 
     WHERE id = {location_id};"""
      
    cursor.execute(sql_command)
    connection.commit()


def location_delete_one(location_id):
    sql_command = f"DELETE FROM locations WHERE id = {location_id};"
    
    cursor.execute(sql_command)
    connection.commit()
    
    
def user_sql_create(username, email, password):
    password_hash = generate_password_hash(password)
    
    sql_command = f"""INSERT INTO users (name, username, email, password, status)
        VALUES ('{username}', '{username}', '{email}', '{password_hash}', True);"""

    cursor.execute(sql_command)
    connection.commit()    

def user_sql_check_username(username):
    
    sql_command = f"SELECT id, username, password FROM users WHERE ('{username}' = username);"
    
    cursor.execute(sql_command)
    results = cursor.fetchone()
    
    #is a user is found, returns its ID
    if results is not None:
        return results
    
    return False

def user_get_id_from_username(username):
    
    sql_command = f"SELECT id FROM users WHERE ('{username}' = username);"
    
    cursor.execute(sql_command)
    results = cursor.fetchone()
    
    return results

def user_sql_check_email(email):
    
    sql_command = f"SELECT id, email, password FROM users WHERE ('{email}' = email);"
    
    cursor.execute(sql_command)
    results = cursor.fetchone()
    
    #is a user is found, returns its ID
    if results is not None:
        return results
    
    return False

def user_sql_login_check(username_or_email, password):
    
    sql_command = f"SELECT id, username, email, password FROM users WHERE ('{username_or_email}' = username) OR ('{username_or_email}' = email);"
    
    cursor.execute(sql_command)
    results = cursor.fetchone()
    
    #is a user is found, returns its ID
    if results is not None:
        if check_password_hash(results[3], password):
            
            return results
    
    return False

def user_sql_get_all():
    sql_command = f"SELECT id, name, username FROM users;"
    
    cursor.execute(sql_command)
    results = cursor.fetchall()
    
    return results


def user_sql_get_one(user_id):
    sql_command = f"SELECT * FROM users WHERE id = {user_id};"
    
    cursor.execute(sql_command)
    result = cursor.fetchone()
    
    return result

def user_sql_delete_one(user_id):
    sql_command = f"DELETE FROM users WHERE id = {user_id};"
    
    cursor.execute(sql_command)
    connection.commit()
    
def user_sql_update_one(user_id, name, email, password):
    password_for_sql = ""
    if password != "":
        password_hash = generate_password_hash(password)
        password_for_sql = f", password = '{password_hash}'"
  
    sql_command = f"UPDATE users SET name = '{name}', email = '{email}'{password_for_sql} WHERE id = {user_id}"
    
    cursor.execute(sql_command)
    connection.commit()
