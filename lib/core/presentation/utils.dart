import 'package:clean_arch2/core/domain/failures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void handleFailures(
    {required BuildContext context, required Exception failure, handler}) {
  var message;
  if (failure is NetworkFailure)
    message = "Network failure";
  else if (failure is ServerFailure || failure is NotFoundFailure)
    message = "Server failure";
  else if (failure is AuthorizationFailure) {
    //TODO : login and delete storage here
    message = "Not authorized";
  } else if (failure is UnknownFailure)
    message = "Unknown failure";
  else if (failure is OtherFailure) {
    if (handler != null)
      message = handler(failure);
    else
      message = "Unknown failure";
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
