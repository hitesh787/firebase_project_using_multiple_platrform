import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_using_multiple_platrform/main.dart';
import 'package:firebase_project_using_multiple_platrform/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDataDilogBox extends StatefulWidget {
  CustomData? customModel;
  CollectionReference? userRef;

  AddDataDilogBox({super.key, this.customModel, this.userRef});

  @override
  State<AddDataDilogBox> createState() => _AddDataDilogBoxState();
}

class _AddDataDilogBoxState extends State<AddDataDilogBox> {
  final _formKey = GlobalKey<FormState>();

  /// Controller Text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool loading = false;

  /// Update function
  update() async {
    if (widget.customModel != null) {
      nameController.text = widget.customModel!.name!;
      numberController.text = widget.customModel!.phoneNumber!;
      addressController.text = widget.customModel!.address!;
      setState(() {});
    }
  }

  saveData() async {
    try {
      if (loading == true) {
        return;
      }

      setState(() {
        loading = true;
      });

      final customData = CustomData(
        name: nameController.text.trim(),
        phoneNumber: numberController.text.trim(),
        address: addressController.text.trim(),
        timestamp: FieldValue.serverTimestamp(),

      );

      if (widget.customModel == null) {
        customData.createAtTime = DateTime.now();
        await widget.userRef!.doc(customData.uid).set(customData.toFireStore()).then((value) {
          setState(() {
            loading = false;
          });
        });
        showMsg(context, 'Save Successfully !', isError: false);

      } else {
        customData.updateAtTime = DateTime.now();
        await widget.userRef!.doc(widget.customModel!.uid).update(customData.toFireStore()).then((value) {
          setState(() {
            loading = false;
          });
        });
        showMsg(context, 'Update Successfully !', isError: false);
      }

      Navigator.pop(context);
    } catch (e) {
      print("******************${e.toString()}***********");
      setState(() {
        loading = false;
      });
    }
  }



  @override
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: Colors.redAccent,
      insetPadding: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  decoration: const InputDecoration(label: Text("Name"), isDense: true, border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10),FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: numberController,
                  decoration: const InputDecoration(label: Text("Phone Number"), isDense: true, border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  controller: addressController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(label: Text("Address"), isDense: true, border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(height: 20),
                loading
                    ? const SizedBox(
                        height: 40,
                        width: 40,
                        child: CupertinoActivityIndicator(radius: 20),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            saveData();
                          }
                        },
                        child: widget.customModel == null ? const Text('Save Data') : const Text('Update Data')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Snack Bar Custom
showMsg(BuildContext context, String msg, {bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: isError ? Colors.red : Colors.green,
  ));
}
