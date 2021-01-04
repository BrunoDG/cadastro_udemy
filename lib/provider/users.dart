import 'dart:math';

import 'package:cadastro_udemy/data/dummy_users.dart';
import 'package:cadastro_udemy/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  // Return all users
  List<User> get all {
    return [..._items.values];
  }

  // return the count of all users
  int get count {
    return _items.length;
  }

  // return the user at index specified
  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // creates new user
  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        !user.id.trim().isEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
            id: user.id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    // edits existing user
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
