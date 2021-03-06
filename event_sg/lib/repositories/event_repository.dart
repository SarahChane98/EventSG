
import 'package:event_sg/api_clients/api_clients.dart';
import 'package:event_sg/models/models.dart';
import 'package:flutter/material.dart';

class EventRepository {
  final EventApiClient eventApiClient;

  EventRepository({@required this.eventApiClient})
      : assert(eventApiClient != null);

  Future<List<Event>> getAllEvents() async {
    return eventApiClient.getAllEvents();
  }

  Future<Event> getEventById(String eventId) async {
    return eventApiClient.getEventById(eventId);
  }

}