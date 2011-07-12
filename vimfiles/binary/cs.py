import glob
import os
  
file_type_list = ["h", "c", "cc", "cpp", "H", "C", "cc", "CPP", "py", "java"]  

def enum_file_write(f, find_file): 
    filelist = glob.glob(find_file) ; 
    for file in filelist: 
        f.writelines(file) ; 
        f.write("\n") ; 
     
def write_cscopefile(path, file_type): 
    gen_file = "cscope.files"  
    f = open(gen_file, "w") 
    if len(file_type_list) == 0: 
        find_file = path +"\\"+ type ; 
        enum_file_write(f, find_file) 
         
        find_file = path +"\\*\\"+ type ; 
        enum_file_write(f, find_file) 
         
    else: 
        for type in file_type: 
            find_file = path +"\\"+ type ; 
            enum_file_write(f, find_file) 
            find_file = path +"\\*\\"+ type ; 
            enum_file_write(f, find_file) 
     
    f.close() ; 

def listfiles(path, file_types, f):  
    for file in os.listdir(path):  
        listpath = path + "\\"+file ;  
        if os.path.isdir(listpath):  
            listfiles(listpath, file_types, f);  
        elif os.path.isfile(listpath):  
            splitlist = listpath.split('.')  
            m = len(splitlist)  
            prefx = splitlist[m-1]  
            #print prefx  
            if prefx in file_types:  
                f.writelines(listpath) ;  
                f.write("\n") ;  
def write_cscopefile(path, file_types, cscopefile):  
    f = open(cscopefile, "w")  
    listfiles(path, file_types, f)  
    f.close() ;  
if __name__ == '__main__':  
    path = "."  
    write_cscopefile(path, file_type_list, "cscope.files") ;  
    cmd = "cscope -bk"  
    os.system(cmd) ;  

