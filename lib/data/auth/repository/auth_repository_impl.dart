import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<Either> signup(UserCreationReq user) async {
    
    return sl<AuthFirebaseService>().signup(user);
  }
  
  @override
  Future<Either> getAges() async {
    try{
      var returnedData = await FirebaseFirestore.instance.collection('Ages').get();

      return Right(
        returnedData.docs
      );
    } catch (e) {
      return Left(
        'Please try again'
      );
    }    
  }
}