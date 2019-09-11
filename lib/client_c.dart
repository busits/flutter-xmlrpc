import 'dart:async';
import 'dart:convert' show Encoding, utf8;

import 'package:http/http.dart' as http show Client;

import 'client.dart' as xml_rpc show call;
import 'src/converter.dart';
import 'src/converter_extension.dart';

export 'client.dart' hide call;

final _codecs = new List<Codec>.unmodifiable(<Codec>[]
  ..addAll(standardCodecs)
  ..add(i8Codec)
  ..add(nilCodec));

Future call(
  dynamic url,
  String methodName,
  List params, {
  Map<String, String> headers,
  Encoding encoding = utf8,
  http.Client client,
}) =>
    xml_rpc.call(
      url,
      methodName,
      params,
      headers: headers,
      encoding: encoding,
      client: client,
      encodeCodecs: _codecs,
      decodeCodecs: _codecs,
    );
