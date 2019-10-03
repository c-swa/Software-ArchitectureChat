#! C:/Perl/bin/perl -w

require "cgi-lib.pl";

MAIN:
{   if(&ReadParse(*input))
    {   $random=rand;
        open(INFO, ">>Communication");
        print INFO "Company=$input{'companyname'}; Name=$input{'name'}; Email=$input{'email'}; Random=$random\n";
        close(INFO);
    print<<ABCDEF;
Content-type: text/html, charset=utf-8;


<html>
<head>
</head>
<body>
Your information has been received.
</body>
</html>
ABCDEF
    }
}