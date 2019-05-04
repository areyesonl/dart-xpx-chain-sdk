part of nem2_sdk_dart;

class TransactionRoutesApi {
  final ApiClient apiClient;

  TransactionRoutesApi([ApiClient apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  /// Announce a cosignature transaction
  ///
  /// Announces a [cosignature transaction](https://nemtech.github.io/concepts/aggregate-transaction.html#cosignature-transaction) to the network.
  Future<Object> announceCosignatureTransaction(
      TransactionPayload payload) async {
    Object postBody = payload;

    // verify required params are set
    if (payload == null) {
      throw new ApiException(400, "Missing required param: payload");
    }

    // create path and map variables
    String path = "/transaction/cosignature".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'PUT', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }

  /// Announce an aggregate bonded transaction
  ///
  /// Announces an [aggregate bonded transaction](https://nemtech.github.io/concepts/aggregate-transaction.html#aggregate-bonded) to the network.
  Future<Object> announcePartialTransaction(TransactionPayload payload) async {
    Object postBody = payload;

    // verify required params are set
    if (payload == null) {
      throw new ApiException(400, "Missing required param: payload");
    }

    // create path and map variables
    String path = "/transaction/partial".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'PUT', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }

  /// Announce a new transaction
  ///
  /// Announces a transaction to the network. It is recommended to use the NEM2-SDK to announce transactions as they should be [serialized](https://nemtech.github.io/api.html#serialization).
  Future<Object> announceTransaction(TransactionPayload payload) async {
    Object postBody = payload;

    // verify required params are set
    if (payload == null) {
      throw new ApiException(400, "Missing required param: payload");
    }

    // create path and map variables
    String path = "/transaction".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'PUT', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }

  /// Get transaction information
  ///
  /// Returns transaction information given a transactionId or hash.
  Future<Object> getTransaction(String transactionId) async {
    Object postBody = null;

    // verify required params are set
    if (transactionId == null) {
      throw new ApiException(400, "Missing required param: transactionId");
    }

    // create path and map variables
    String path = "/transaction/{transactionId}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "transactionId" + "}", transactionId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }

  /// Get transaction status
  ///
  /// Returns the transaction status for a given hash.
  Future<TransactionStatusDTO> getTransactionStatus(String hash) async {
    Object postBody = null;

    // verify required params are set
    if (hash == null) {
      throw new ApiException(400, "Missing required param: hash");
    }

    // create path and map variables
    String path = "/transaction/{hash}/status"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "hash" + "}", hash.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'TransactionStatusDTO')
          as TransactionStatusDTO;
    } else {
      return null;
    }
  }

  /// Get transactions information
  ///
  /// Returns transactions information for a given array of transactionIds.
  Future<List<Object>> getTransactions(TransactionIds transactionIds) async {
    Object postBody = transactionIds;

    // verify required params are set
    if (transactionIds == null) {
      throw new ApiException(400, "Missing required param: transactionIds");
    }

    // create path and map variables
    String path = "/transaction".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<Object>') as List)
          .map((item) => item as Object)
          .toList();
    } else {
      return null;
    }
  }

  /// Get transactions status.
  ///
  /// Returns an array of transaction statuses for a given array of transaction hashes.
  Future<List<TransactionStatusDTO>> getTransactionsStatuses(
      TransactionHashes transactionHashes) async {
    Object postBody = transactionHashes;

    // verify required params are set
    if (transactionHashes == null) {
      throw new ApiException(400, "Missing required param: transactionHashes");
    }

    // create path and map variables
    String path = "/transaction/statuses".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      http.MultipartRequest mp = new http.MultipartRequest(null, null);

      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<TransactionStatusDTO>')
              as List)
          .map((item) => item as TransactionStatusDTO)
          .toList();
    } else {
      return null;
    }
  }
}
