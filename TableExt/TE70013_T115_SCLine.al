tableextension 70013 FBM_SCLineExt_DD extends "Sales Cr.Memo Line"
{
    fields
    {
        field(70100; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
        }
        field(70101; "FBM_Period End"; Date)
        {
            caption = 'Period End';
        }

        field(70102; FBM_IsPeriodEnabled; Boolean)
        {
            caption = 'Period Enabled';
        }
        field(70103; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
    }
}
