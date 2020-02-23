<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUser" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonlogOut" runat="server" Text="Log out" OnClick="Button4_Click" />
            <table style="width: 31%; height: 219px; margin-left: 24px; margin-top: 47px;" aria-atomic="True">
         
            <tr>
                <td class="modal-sm" style="width: 112px; height: 34px;">Name</td>
                <td style="width: 190px; height: 34px">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="modal-sm" style="width: 112px; height:34px;">Release Date&nbsp;&nbsp;&nbsp; </td>
                <td style="width: 190px">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                
            </tr>
        
       
            <tr>
                <td style="width: 112px; height:34px;">Views&nbsp; </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td style="width: 112px; height:34px;">Trailer</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td style="width: 112px; height:34px;">Budget</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                
            </tr>
       
        
            <tr>
                <td style="width: 112px; height:34px;">Revenue</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                
            </tr>
      
             <td class="modal-sm" style="width: 112px">
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="INSERT" />
                </td>
        </table>
   
    <table style="height: 1px; width: 32%; margin-top: 50px; margin-left: 24px;">
        <tr>
            <td class="modal-sm" style="width: 112px; height: 34px;">Movie ID</td>
            <td style="height: 29px">
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
        </tr>
        
            <td class="modal-sm" style="width: 112px">
            
                &nbsp;
                <asp:Button ID="Button2" runat="server" Text="DELETE" CssClass="col-xs-offset-0" Height="27px" OnClick="Button2_Click" />
            </td>
            
        
    </table>

    <table style="width: 31%; height: 219px; margin-left: 24px; margin-top: 47px;" aria-atomic="True">
         <tr>
                <td class="modal-sm" style="width: 112px; height: 34px;">Movie ID</td>
                <td style="width: 190px; height: 34px">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="modal-sm" style="width: 112px; height: 34px;">Name</td>
                <td style="width: 190px; height: 34px">
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="modal-sm" style="width: 112px; height:34px;">Release Date&nbsp;&nbsp;&nbsp; </td>
                <td style="width: 190px">
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
                
            </tr>
        
       
            <tr>
                <td style="width: 112px; height:34px;">Views&nbsp; </td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td style="width: 112px; height:34px;">Trailer</td>
                <td>
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td style="width: 112px; height:34px;">Budget</td>
                <td>
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
                
            </tr>
       
        
            <tr>
                <td style="width: 112px; height:34px;">Revenue</td>
                <td>
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                </td>
                
            </tr>
          
             <td class="modal-sm" style="width: 112px">
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="UPDATE" />
                </td>
        </table>
        </div>
    </form>
</body>
</html>
