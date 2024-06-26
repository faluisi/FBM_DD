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
            group(Header)
            {
                field(maxcode; maxcode)
                {
                    caption = 'Max SiteGrCode';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(General)
            {

                field("Site Code"; rec."Site Code")
                {
                    ApplicationArea = All;

                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;


                }
                field("Site Name_New"; Rec."Site Name_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Site Name" <> rec."Site Name_New";


                }
                field("Site Name 2"; Rec."Site Name 2")
                {
                    ApplicationArea = All;

                }
                field("Site Name 2_New"; Rec."Site Name 2_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Site Name 2" <> rec."Site Name 2_New";
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
            group("Address & Contact")
            {
                Caption = 'Address';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;

                    }
                    field(Address_New; Rec.Address_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.Address <> rec.Address_New;

                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;

                    }
                    field("Address 2_New"; Rec."Address 2_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Address 2" <> rec."Address 2_New";


                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = All;

                    }
                    field("Post Code_New"; Rec."Post Code_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Post Code" <> rec."Post Code_New";

                    }

                    field(City; Rec.City)
                    {
                        ApplicationArea = All;

                    }
                    field(City_New; Rec.City_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.City <> rec.City_New;

                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;

                    }
                    field(County_New; Rec.County_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.County <> rec.County_New;


                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = All;

                    }
                    field("Country/Region Code_New"; Rec."Country/Region Code_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Country/Region Code" <> rec."Country/Region Code_New";

                    }
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                AboutTitle = 'Manage the site''s invoicing';
                field("Vat Number"; Rec."Vat Number")
                {
                    ApplicationArea = All;

                }
                field("Vat Number_New"; Rec."Vat Number_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Vat Number" <> rec."Vat Number_New";


                }
            }
        }


    }
    actions
    {
        area(Processing)
        {
            action(Reject)
            {
                ApplicationArea = all;
                image = Reject;
                Promoted = true;
                PromotedIsBig = true;
                enabled = hasreq;
                trigger
                OnAction()
                var
                    req: record FBM_CustSiteReq;
                begin
                    req.SetRange(CustSiteCode, rec."Site Code");
                    req.SetRange(Status, req.Status::Received);
                    if req.FindFirst() then begin
                        req.Status := req.Status::Rejected;
                        req.Modify();
                    end;
                end;



            }
            action(Approve)
            {
                ApplicationArea = all;
                image = Approve;
                Promoted = true;
                PromotedIsBig = true;
                enabled = hasreq;
                trigger
                OnAction()
                var
                    req: record FBM_CustSiteReq;
                begin
                    req.SetRange(CustSiteCode, rec."Site Code");
                    req.SetRange(Status, req.Status::Received);
                    if req.FindFirst() then begin
                        req.Status := req.Status::Approved;
                        req.Modify();
                        if rec."Site Name" <> rec."Site Name_New" then
                            rec.validate("Site Name", rec."Site Name_New");
                        if rec."Site Name 2" <> rec."Site Name 2_New" then
                            rec.validate("Site Name 2", rec."Site Name 2_New");
                        if rec.address <> rec.Address_New then
                            rec.validate(Address, rec.Address_New);
                        if rec."Address 2" <> rec."Address 2_New" then
                            rec.validate("Address 2", rec."Address 2_New");
                        if rec.City <> rec.City_New then
                            rec.validate(City, rec.City_New);
                        if rec."Post Code" <> rec."Post Code_New" then
                            rec.validate("Post Code", rec."Post Code_New");
                        if rec."Country/Region Code" <> rec."Country/Region Code_New" then
                            rec.validate("Country/Region Code", rec."Country/Region Code_New");
                        if rec.County <> rec.County_New then
                            rec.validate(County, rec.County_New);
                        if rec."Vat Number" <> rec."Vat Number_New" then
                            rec.validate("Vat Number", rec."Vat Number_New");

                    end;
                end;



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

    trigger
    OnAfterGetRecord()

    begin
        req.setrange(rectype, 'SITE');
        REQ.setfilter(Status, '%1|%2', req.Status::Sent, req.status::Received);

        if (rec."Site Code" = req.CustSiteCode) and REQ.FindFirst() THEN begin
            hasreq := true;
            rec."Site Name_New" := req.Name;
            rec."Site Name 2_New" := req."Name 2";
            rec.Address_New := req.Address;
            rec."Address 2_New" := req."Address 2";
            rec.City_New := req.City;
            rec."Post Code_New" := req."Post Code";

            rec."Country/Region Code_New" := req."Country/Region Code";
            rec."Vat Number_New" := req."VAT registration No.";

            req.Status := req.Status::Received;
            req.Modify();
            REC.Modify();
        end;
    end;

    var
        sitename: Text;
        siteaddress: Text;
        maxcode: Text;
        cos: record FBM_CustOpSite;
        site: record FBM_Site;
        companies: record Company;
        compinfo: record "Company Information";

        hasreq: Boolean;
        req: record FBM_CustSiteReq;



    procedure getmaxsite()


    begin
        site.SetFilter("Site Code", '<%1', 'SITE9990');
        site.SetCurrentKey("Site Code");
        if site.FindLast() then
            maxcode := site."Site Code";
        //CurrPage.Update();
    end;
}