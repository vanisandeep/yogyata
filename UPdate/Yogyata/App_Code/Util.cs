using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Util
/// </summary>
public class Util
{
	public Util()
	{
		//
		// TODO: Add constructor logic here
		//
	}



    public  string GetPassword()
    {
        string[] arrStr1 = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,w,v,x,y,z".Split(",".ToCharArray());
        string[] arrStr2 = "1,2,3,4,5,6,7,8,9,0".Split(",".ToCharArray());
        string[] arrStr3 = "@,#,$,%,^,&,*,-,_,!".Split(",".ToCharArray());
        string sbPassword = string.Empty;

        Random r = new Random();
        for (int i = 0; i < 4; i++)
        {
            sbPassword += arrStr1[r.Next(0, arrStr1.Length - 1)];
        }

        for (int i = 0; i < 1; i++)
        {
            sbPassword += arrStr2[r.Next(0, arrStr2.Length - 1)];
        }

        for (int i = 0; i < 1; i++)
        {
            sbPassword += arrStr3[r.Next(0, arrStr3.Length - 1)];
        }
        for (int i = 0; i < 2; i++)
        {
            sbPassword += arrStr1[r.Next(0, arrStr1.Length - 1)];
        }


        return sbPassword;
    }


    public int limit(int numb)
    { int i;

        for(i=0;i<numb;i++)
        {
           
        }
        return i;

    }

    #region NumberIntoString

    public string NumbersIntoString(string Numb)
    {

        switch (Numb)
        {
            case "1": return "One";
            case "2": return "Two";
            case "3": return "Three";
            case "4": return "Four";
            case "5": return "Five";
            case "6": return "Six";
            case "7": return "Seveen";
            case "8": return "Eight";
            case "9": return "Nine";
        }
        return  "<table>" +"<tr>" +"<td>" +"Index Out Of Range."+"</td>"+"</tr>" +"</td>"+"<tr>"+"<td id='txt'>" +"Please Enter the Ranges Between the 0-9"+"</td>"+ "</tr>"+"</table>";

    }
    #endregion









   
   


   



}