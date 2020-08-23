import os.path
from whoosh.index import create_in
from whoosh.fields import Schema, TEXT, NUMERIC
from whoosh.index import open_dir
from whoosh.query import *
from whoosh.qparser import QueryParser

class WSearch():
    #def __init__(self, storage_location = "app//main_page_module//data//"):
        
        #self.storage_location = storage_location
        
    def index_create_loc(self, locations):
        #print(notes)
        
        schema = Schema(location_id=NUMERIC(stored=True), location_name=TEXT(stored=True), content=TEXT(stored=True))
        
        if not os.path.exists(".index_locations"):
            os.mkdir(".index_locations")
            

        ix = create_in(".index_locations", schema)
        writer = ix.writer()
        
        
        for f in locations:
            #print(f[2])
            writer.add_document(location_id=u"{}".format(f[0]),location_name=u"{}".format(f[1]), content=u"{}".format(f[2]))                
            
        writer.commit()
    
    
    def index_create_myth(self, myths):
        #print(notes)
        
        schema = Schema(myth_id=NUMERIC(stored=True), myth_name=TEXT(stored=True), content=TEXT(stored=True))
        
        if not os.path.exists(".index_myths"):
            os.mkdir(".index_myths")
            

        ix = create_in(".index_myths", schema)
        writer = ix.writer()
        
        
        for f in myths:
            #print(f[2])
            writer.add_document(myth_id=u"{}".format(f[0]),myth_name=u"{}".format(f[1]), content=u"{}".format(f[2]))                
            
        writer.commit()
        

    def index_search_location(self, querystring):
        #print(querystring)
        ix = open_dir(".index_locations")
        
        parser = QueryParser("content", ix.schema)
        myquery = parser.parse(querystring)
        
        locations = []
        with ix.searcher() as searcher:
            results = searcher.search(myquery)
            print(f"Found {len(results)} results.")
            
            for found in results:
                locations.append([found["location_id"], found["location_name"], found.highlights("content")])
                #print(found.highlights("content"))
            
            return locations
    
    def index_search_myth(self, querystring):
        #print(querystring)
        ix = open_dir(".index_myths")
        
        parser = QueryParser("content", ix.schema)
        myquery = parser.parse(querystring)
        
        index_myths = []
        with ix.searcher() as searcher:
            results = searcher.search(myquery)
            print(f"Found {len(results)} results.")
            
            for found in results:
                index_myths.append([found["myth_id"], found["myth_name"], found.highlights("content")])
                #print(found.highlights("content"))
            
            return index_myths
        