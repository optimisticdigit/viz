import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viz_app/data/price.dart';
import 'package:viz_app/data/price_repository.dart';

abstract class PriceBloc extends Bloc<PriceEvent,PriceState> {
  PriceBloc() : super(PriceLoading());
  @override
  Stream<PriceState> mapEvenToState(PriceEvent event) async*{
    final priceRepository = PriceRepository();
    yield PriceLoading();
    try{
      final response = await priceRepository.getPriceList();
      yield PriceLoaded(response);
    } on Exception catch(error){
      yield PriceError(error.toString());
    }
  }
}

abstract class PriceState extends Equatable {
  @override
  List<Object> get props =>[];
}
class PriceLoading extends PriceState {}

class PriceLoaded extends PriceState {
  final List<Price> prices;
  PriceLoaded(this.prices);
  @override
  List<Object> get props =>[prices];
}

class PriceError extends PriceState {
  final String message;
  PriceError(this.message);
  @override
  List<Object> get props =>[message];
}

abstract class PriceEvent extends Equatable {}

abstract class PriceEventStated extends PriceEvent {
  @override
  List<Object> get props =>[];
}