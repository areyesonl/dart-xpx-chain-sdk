part of xpx_chain_sdk;

class NetworkRoutesApi {
  NetworkRoutesApi([_ApiClient apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final _ApiClient apiClient;

  /// Get the current network type of the chain
  ///
  /// Returns the current network type.
  Future<NetworkType> getNetworkType() async {
    Object postBody;

    // create path and map variables
    final String path = '/network'.replaceAll('{format}', 'json');

    final response = await apiClient.get(path, postBody);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'NetworkTypeDTO');
    } else {
      return null;
    }
  }
}
