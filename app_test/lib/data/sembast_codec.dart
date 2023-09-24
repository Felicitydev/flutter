import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:meta/meta.dart';
import 'package:sembast/src/api/v2/sembast.dart';

var _random = Random.secure();

//Random bytes generator
Uint8List _randBytes(int length){
  return Uint8List.fromList(
    List<int>.generate(length, (i) => _random.nextInt(256)));
}

//Generate an encryption pwd based on a user input pwd

//It was MD5 which generate a 16 bytes blob, size needed for Salsa20

Uint8List _generateEncryptPassword(String password){
  var blob = Uint8List.fromList(md5.convert(utf8.encode(password
  )).bytes);
  assert(blob.length == 16);
  return blob;
}