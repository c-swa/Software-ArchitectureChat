#! C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{   if(&ReadParse(*input))
    {   $random=rand;
        open(INFO, ">>Information");
        print INFO "Company=$input{'companyname'}; Name=$input{'name'}; Email=$input{'email'}; Random=$random\n";
        close(INFO);
    print<<ABCDEF;
Content-type: text/html, charset=utf-8;


<html>
<head>
</head>
<body>
<form name=form1>
<input type=hidden name=name value="$input{'name'}">
<input type=hidden name=comany value="$input{'company'}">
<input type=hidden name=email value="$input{'email'}">
<input type=hidden name=random value="$random">
<textarea name=disp rows=40 cols=70></textarea><br>
<br><br>
<textarea name=in rows=10 cols=70></textarea><br>
Message to send:<br>
<input type=button onclick="trans()" value="Send">
</form>
<script language=Javascript>
        if(window.XMLHttpRequest){
            request=newXMLHttpRequest();
        } else {
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }   
    function trans(){
        request.open("POST", "receive.pl", true);
        request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        request.send("name="+document.form1.name.value+"&company="+document.form1.company.value+"&email="+document.form1.email.value+"&random="+document.form1.random.value+"&msg="+document.form1.in.value);
        request.onreadystatechange = function(){
            if(request.readyState == 4 && request.status == 200){
                document.form1.disp.value+=document.form1.in.value;
                document.form1.in.value="";
            } else {
                //alert("Error " +request.status+": "+request.statusText);
            }
        }
    }
</script>
</body>
</html>
ABCDEF
    }
}