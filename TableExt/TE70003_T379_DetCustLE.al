tableextension 70003 FBM_DetCustLEExt_DD extends "Detailed Cust. Ledg. Entry"
{
    fields
    {

        field(70100; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(70001; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            DataClassification = ToBeClassified;
        }

        field(70003; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(70004; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
        field(70006; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
    }
    var
}