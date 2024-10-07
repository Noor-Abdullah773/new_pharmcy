import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiException {
  static handleException(DioException error) {
    switch (error.type) {
      case DioException.badResponse:
        {
          return "bad response";
        }
      case DioException.connectionError:
        {
          return "connectionError";
        }
      case DioException.connectionTimeout:
        {
          return "connectionTimeout";
        }
      default:
        {
          return "unknown exception";
        }
    }
  }
}
/*class ApiException {
  static String handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.connectionError:
        return "Connection error: Please check your internet connection.";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again later.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout.";
      case DioExceptionType.sendTimeout:
        return "Send timeout.";
      case DioExceptionType.cancel:
        return "Request canceled.";
      default:
        return "An unknown error occurred ${error.message}"; 
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response != null) {
      switch (response.statusCode) {
        case 400:
          return "Bad request.";
        case 401:
          return "Unauthorized: Please log in.";
        case 403:
          return "Forbidden: You do not have permission to access this resource.";
        case 404:
          return "Not found: The resource was not found.";
        case 500:
          return "Internal server error: Please try again later.";
        default:
          return "Bad response: ${response.statusCode} - ${response.statusMessage}";
      }
    }
    return "Bad response: No details available.";
  }
}*/