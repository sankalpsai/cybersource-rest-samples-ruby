require 'cyberSource_client'

public
class PaymentNetworkTokenization
  def main
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "TC_MPOS_Paymentech_3"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "internet"
    request.processing_information = processingInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.first_name = "RTS"
    billtoInformation.last_name = "VDP"
    billtoInformation.phone_number = "6504327113"
    billtoInformation.address1 = "901 Metro Center Blvd"
    billtoInformation.postal_code = "94404"
    billtoInformation.locality = "Foster City"
    billtoInformation.administrative_area = "CA"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "100"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    tokenizedCardInformation =CyberSource::V2paymentsPaymentInformationTokenizedCard.new
    tokenizedCardInformation.expiration_year = "2031"
    tokenizedCardInformation.number = "4111111111111111"
    tokenizedCardInformation.expiration_month = "12"
    tokenizedCardInformation.transaction_type = "1"
    paymentInformation.tokenized_card = tokenizedCardInformation
    request.payment_information = paymentInformation

    consumerAuthenticationInformation = CyberSource::V2paymentsConsumerAuthenticationInformation.new
    consumerAuthenticationInformation.cavv = "AAABCSIIAAAAAAACcwgAEMCoNh+="
    consumerAuthenticationInformation.xid = "T1Y0OVcxMVJJdkI0WFlBcXptUzE="
    request.consumer_authentication_information = consumerAuthenticationInformation
    
    puts request
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  PaymentNetworkTokenization.new.main
end
