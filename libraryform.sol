    pragma solidity ^0.4.0;

contract libraryy {
    uint256 f;
    uint256 time;
    uint256 fines;
    uint256 totalbook;
    uint256 stime;
    //uint256 differ;
    //uint256 etime;
    uint256 validity;
    uint256[] isbndetails;
    uint256[] iddetails;
    struct getbooks {
        string bookname;
        string authorname;
        uint256 ISBN;
    }
    struct getparties {
        string pname;
    }
    mapping(address=>getbooks)books;
    mapping(uint256=>getparties)party;
    

   
    
    function get(address add,string bname,string auname,uint256 isbnno) public {
        books[add].bookname=bname;
        books[add].authorname=auname;
        books[add].ISBN=isbnno;
        isbndetails.push(isbnno);
        
    }
    function put(address add) public view returns(string,string,uint256) {
        return(books[add].bookname,books[add].authorname,books[add].ISBN);
    
    }
    function getparty(uint256 _id,string namep) public {
        party[_id].pname=namep;
        iddetails.push(_id);
        
    }
    function setparty(uint256 _id) public view returns(string) {
        return(party[_id].pname);
    }
    function isbnnums() public view returns(uint256[]) {
        return(isbndetails);
    }
   function idviews() public view returns(uint256[]) {
            return(iddetails);
        }
    function totalbooks() public view returns(uint256) {
        return(totalbook=isbndetails.length);
    }
    
    
    
   function availablebooks(uint256 isbnno) public view returns(uint256)  {
       
        for(uint256 i=0;i<=isbndetails.length;i++) {
          if(isbndetails[i] == isbnno) {
            //time=now;
            return(isbndetails.length-1);
          }
        }
          }
          
    function givenbook() public {
        time=now;
        validity=time +2 * 1 minutes;
    }
 
   function bookkret(uint256 isbnno) public  {
        uint256 fine=1;
        uint256 rettime=now;
        
        if(rettime>validity) {
            uint256 blc = rettime - validity;
            blc=blc/60;
            fines= blc * fine;
            f=fines;
        }
    }
        function getfine() public view returns(uint256) {
            return(f);
        }
            
        }
      
      
              
              
            
              
     
