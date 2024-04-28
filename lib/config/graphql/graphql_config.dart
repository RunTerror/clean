import 'package:graphql/client.dart';
import 'package:map/config/enviornment_config.dart';
import 'package:map/service_locator.dart';

class GraphQLConfig {
  static String? token;
  static final HttpLink httpLink = HttpLink(
    EnviornmentConfig.httpEndpoint!,
  );

  static final AuthLink authLink = AuthLink(getToken: () async => token);

  // static WebSocketLink websocketLink =
  //     WebSocketLink(EnviornmentConfig.webSocketEndpoint!,
  //         config: SocketClientConfig(
  //           autoReconnect: true,
  //           initialPayload: {
  //             "Authorization": '${userConfig!.currentUser!.authToken}'
  //           },
  //         ));

  Future getToken() async {
    await localApiService.init();
    final user = await localApiService.getUser();
    if (user.authtoken == null) {
      return;
    }
    token = user.authtoken.toString();
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: httpLink,
    );
  }

  Future<GraphQLClient> authClient() async {
    await getToken();
    final AuthLink authLink = AuthLink(getToken: () async => '$token');
    final Link finalAuthLink = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: finalAuthLink,
    );
  }

  // GraphQLClient graphQlClient() {
  //   return GraphQLClient(
  //     cache: GraphQLCache(),
  //     link: Link.split(
  //       (request) => request.isSubscription,
  //       websocketLink,
  //       authLink.concat(httpLink),
  //     ),
  //   );
  // }
}
