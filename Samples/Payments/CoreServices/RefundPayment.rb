require 'cyberSource_client'

public
class RefundPayment
  def main
    id = '5336247664156712803527'
    request = CyberSource::RefundPaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "Testing-VDP-Payments-Refund"
    request.client_reference_information = clientReferenceInformation
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    amountDetails.currency ="USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation
    data, status_code, headers = apiInstance.refund_payment(request,id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  RefundPayment.new.main
end
