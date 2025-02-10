# .\scripts\fieldsMappingsForScript\fieldNameToFieldPath.ps1

$fieldNameToFieldPath = @{

    Email_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_required_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
#
#    Text_email_no_index__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_no_index__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_no_index_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_no_index_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_externalId_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_externalId_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_unique_case_insensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_case_insensitive__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_unique_case_sensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_case_sensitive__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_unique_externalId_case_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_externalId_case_insen__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#
#    Text_email_unique_externalId_case_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_externalId_case_sensi__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }

#    Number_short_unique_external__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_unique_external__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }

#
#    Text_email_no_index__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_no_index__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }

<#
    Text_email_all_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_all_case_sensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Text_email_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Text_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text\Text_required__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text\Text_required_externalId__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_email_all_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_all_case_insensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Text_email_unique_required_sensi__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_required_sensi__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Text_email_unique_required_insen__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_unique_required_insen__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Text_email_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_required_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }#>

#    Text_email_all_case_sensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_all_case_sensitive__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_required__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-email\Text_email_required__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_autonumber_required_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\text-autonumber\Text_autonumber_required_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
#    }
#
#    Text_email_no_index__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_no_index__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_required__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_required__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#    Text_required_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_required_externalId__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#
#    Text_unique_case_insensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_case_insensitive__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#    Text_unique_case_sensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_case_sensitive__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#    Text_unique_externalId_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_externalId_insen__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#    Text_unique_externalId_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_externalId_sensi__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#
#
#    Number_short_unique_required__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_unique_required__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }
#
#    Text_autonumber_unique_req_case_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_req_case_insen__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
#    }
#    Text_autonumber_unique_req_case_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_req_case_sensi__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
#    }
#
#    Text_unique_required_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_required_insen__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#    Text_unique_required_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_required_sensi__c.field-meta.xml"
#        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
#    }
#
#
#
#
#    Text_email_unique_required_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_required_insen__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_unique_required_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_required_sensi__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_all_case_insensitive__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_all_case_insensitive__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_required_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_required_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_unique_externalId_case_insen__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_externalId_case_insen__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }
#    Text_email_unique_externalId_case_sensi__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_externalId_case_sensi__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
#    }

   # Number_required__c = @{
  #      fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\number-long\Number_required__c.field-meta.xml"
    #    recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
   #     queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
  #  }
#    Number_short_no_index_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\number-short\Number_short_no_index_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }
#    Number_short_required__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Account\fields\number-short\Number_short_required__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }






<#


    Email_all__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_all__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_externalId_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_externalId_nulls__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_no_index__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_no_index__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_no_index_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_no_index_nulls__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_required_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_unique__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_unique__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
    Email_unique_external__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_unique_external__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Email_unique_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\email\Email_unique_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }
#>

<#

    Number_short_no_index_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_no_index_nulls__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }
#    Number_short_externalId_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_externalId_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }
#    Number_short_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }
    Number_short_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }
    Number_short_unique__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_unique__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }
    Number_short_unique_external__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_unique_external__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }
#    Number_short_all__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_all__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }

    Number_short_required_extlId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_required_extlId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }

#    Number_short_no_index__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_no_index__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
#    }

    Number_short_unique_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-short\Number_short_unique_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_short_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-short.ps1"
    }

    Number_unique_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_unique_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
    }




#
#    Number_no_index_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_no_index_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }
#
#    Number_externalId_nulls__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_externalId_nulls__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }
#    Number_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }

#    Number_required_externalId__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_required_externalId__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }
#    Number_required__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_required__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }
    Number_unique__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_unique__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
    }
    Number_unique_external__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_unique_external__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
    }
#    Number_all__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_all__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }
#    Number_no_index__c = @{
#        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\number-long\Number_no_index__c.field-meta.xml"
#        recordDataFilePath = "dataToInsert\merged\Account_data_numbers_no_nulls.csv"
#        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\number-long.ps1"
#    }




<#

    Autonumber_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\autonumber\Autonumber_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }


    Autonumber_no_index__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\autonumber\Autonumber_no_index__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
#>


<#


    Text_autonumber_unique_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_case_sensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }

    Text_autonumber_all_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_all_case_sensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }


    Text_email_no_index_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_no_index_nulls__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_externalId_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_externalId_nulls__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails_no_nulls.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_unique_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_case_insensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_unique_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_unique_case_sensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }

    Text_email_all_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-email\Text_email_all_case_sensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Emails.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\email.ps1"
    }


    Text_no_index_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_no_index_nulls__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60.csv", "dataToInsert\merged\Account_data_Text_60_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_externalId_nulls__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_externalId_nulls__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60.csv", "dataToInsert\merged\Account_data_Text_60_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_no_index__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_no_index__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_externalId__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_required__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_required_externalId__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_unique_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_case_insensitive__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_unique_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_case_sensitive__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_unique_externalId_insen__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_externalId_insen__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_unique_externalId_sensi__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_unique_externalId_sensi__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_all_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_all_case_insensitive__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_all_case_sensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text\Text_all_case_sensitive__c.field-meta.xml"
        recordDataFilePath = @("dataToInsert\merged\Account_data_Text_60_no_nulls.csv", "dataToInsert\merged\Account_data_Text_60_no_nulls_part1.csv")
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\text-short.ps1"
    }
    Text_autonumber_unique_extId_case_insen__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_extId_case_insen__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }

    Text_autonumber_unique_extId_case_sensi__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_extId_case_sensi__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }








    Text_autonumber_all_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_all_case_insensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
    Text_autonumber_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
    Text_autonumber_no_index__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_no_index__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
    Text_autonumber_required__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_required__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
    Text_autonumber_required_externalId__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_required_externalId__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
    Text_autonumber_unique_case_insensitive__c = @{
        fileMetadataPath = "salesforce-metadata\main\default\objects\Test_Custom_Object__c\fields\text-autonumber\Text_autonumber_unique_case_insensitive__c.field-meta.xml"
        recordDataFilePath = "dataToInsert\merged\Account_data_Text_Autonumber.csv"
        queriesPath = "scripts\sandboxUtils\queriesPlanAndTimes\queries\autonumber.ps1"
    }
#>

}

return $fieldNameToFieldPath


