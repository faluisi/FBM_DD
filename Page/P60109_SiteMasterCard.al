page 60109 FBM_SiteMaster_DD
{
    Caption = 'Site Master';
    PageType = Card;
    DataCaptionFields = "Site Code", "Site Name";

    ApplicationArea = All;
    SourceTable = FBM_Site;


    layout
    {
        area(Content)
        {
            group(header)
            {
                field(maxcode; maxcode)
                {
                    caption = 'Max SiteGrCode';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(general)
            {

                field("Site Code"; rec."Site Code")
                {
                    ApplicationArea = All;

                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;


                }
                field("Site Name 2"; Rec."Site Name 2")
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;

                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;

                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;

                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;

                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;

                }
                field("Vat Number"; Rec."Vat Number")
                {
                    ApplicationArea = All;

                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;

                // }
                field(Company1; Rec.Company1)
                {
                    ApplicationArea = All;

                }
                field(Company2; Rec.Company2)
                {
                    ApplicationArea = All;

                }
                field(Company3; Rec.Company3)
                {
                    ApplicationArea = All;

                }
                field(ActiveRec; Rec.ActiveRec)
                {
                    ApplicationArea = All;

                }
                field(Version; Rec.Version)
                {
                    ApplicationArea = All;

                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = All;

                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = All;

                }
                field("Record Owner"; Rec."Record Owner")
                {
                    ApplicationArea = All;

                }
                field("Change Note"; Rec."Change Note")
                {
                    ApplicationArea = All;

                }


            }
            group("Linked Site")
            {

                part(LinkedSite; FBM_LinkedSite_DD)
                {
                    ApplicationArea = Basic, Suite;
                    SubPageLink = Value = FIELD("Site Code");
                }
            }
            part(History; FBM_SiteHistory_DD)
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Site Code" = FIELD("Site Code");
            }
        }


    }
    trigger
    OnNewRecord(BelowxRec: Boolean)
    var
        maxnum: integer;
    begin
        evaluate(maxnum, copystr(maxcode, 5));
        rec."Site Code" := 'SITE' + PADSTR('', 4 - strlen(FORMAT(MAXNUM + 1)), '0') + FORMAT(MAXNUM + 1);
        rec.ActiveRec := true;
    end;

    trigger
                       OnOpenPage()
    begin
        getmaxsite();

    end;

    var
        sitename: Text;
        siteaddress: Text;
        maxcode: Text;
        cos: record FBM_CustOpSite;
        site: record FBM_Site;
        companies: record Company;
        compinfo: record "Company Information";


    procedure getmaxsite()


    begin
        site.SetCurrentKey("Site Code");
        if site.FindLast() then
            maxcode := site."Site Code";
        //CurrPage.Update();
    end;
}