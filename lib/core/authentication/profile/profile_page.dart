import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_page.freezed.dart';

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    String? name,
    String? bio,
    String? idNumber,
    String? course,
    String? yearLevel,
    String? email,
    String? phoneNumber,
    String? alias,
    String? gender,
    String? address,
  }) = _ProfileData;
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var isEditing = false;
  final profileData =
      const ProfileData(name: 'Hanma Baka', idNumber: '19-2841');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: isEditing
            ? IconButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                icon: const Icon(Icons.close),
              )
            : null,
        actions: [
          // Save/Edit Button
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
              if (!isEditing) {
                print('save');
                _formKey.currentState?.save();
              }
            },
            icon: Icon(isEditing ? Icons.save : Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // backgroundImage: AssetImage('assets/icon/icon.png'),
                      radius: 45,
                    ),
                    const SizedBox(height: 15),
                    ProfileTextField(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLength: 50,
                      isEditing: isEditing,
                      initialValue: profileData.name,
                      onSaved: (newValue) =>
                          profileData.copyWith(name: newValue),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Header(title: 'Bio'),
                ),
                ProfileTextField(
                  // maxLines: 8,
                  maxLength: 300,
                  isEditing: isEditing,
                  initialValue: profileData.bio,
                  onSaved: (newValue) => profileData.copyWith(bio: newValue),
                ),
                // const Divider(thickness: 2),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(
                      title: 'School Info',
                      icon: Icon(Icons.school),
                    ),
                    ProfileTextField(
                      label: 'ID Number',
                      isEditing: isEditing,
                      initialValue: profileData.idNumber,
                      onSaved: (newValue) =>
                          profileData.copyWith(idNumber: newValue),
                    ),
                    ProfileTextField(
                      label: 'Course',
                      isEditing: isEditing,
                      initialValue: profileData.course,
                      onSaved: (newValue) =>
                          profileData.copyWith(course: newValue),
                    ),
                    ProfileTextField(
                      label: 'Year Level',
                      isEditing: isEditing,
                      initialValue: profileData.yearLevel,
                      onSaved: (newValue) =>
                          profileData.copyWith(yearLevel: newValue),
                    ),
                    const Header(
                      title: 'Contact Info',
                      icon: Icon(Icons.contact_phone),
                    ),
                    ProfileTextField(
                      label: 'Email',
                      isEditing: isEditing,
                      initialValue: profileData.email,
                      onSaved: (newValue) =>
                          profileData.copyWith(yearLevel: newValue),
                    ),
                    ProfileTextField(
                      label: 'Phone Number',
                      isEditing: isEditing,
                      initialValue: profileData.phoneNumber,
                      onSaved: (newValue) =>
                          profileData.copyWith(phoneNumber: newValue),
                    ),
                    const Header(title: 'Basic Info', icon: Icon(Icons.info)),
                    ProfileTextField(
                      label: 'Alias',
                      textAlignVertical: TextAlignVertical.center,
                      isEditing: isEditing,
                      initialValue: profileData.alias,
                      onSaved: (newValue) =>
                          profileData.copyWith(alias: newValue),
                    ),
                    ProfileTextField(
                      label: 'Gender',
                      isEditing: isEditing,
                      initialValue: profileData.gender,
                      onSaved: (newValue) =>
                          profileData.copyWith(gender: newValue),
                    ),
                    ProfileTextField(
                      label: 'Address',
                      isEditing: isEditing,
                      initialValue: profileData.address,
                      onSaved: (newValue) =>
                          profileData.copyWith(address: newValue),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    Key? key,
    required this.isEditing,
    required this.onSaved,
    this.style,
    this.initialValue,
    this.textController,
    this.maxLength,
    this.maxLines,
    this.label,
    this.textAlignVertical = TextAlignVertical.center,
  }) : super(key: key);

  final TextEditingController? textController;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final bool isEditing;
  final TextStyle? style;
  final String? initialValue;
  final TextAlignVertical textAlignVertical;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: style,
        initialValue: initialValue,
        onSaved: onSaved,
        controller: textController,
        textAlignVertical: textAlignVertical,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          disabledBorder: InputBorder.none,
          filled: false,
        ),
        enabled: isEditing ? true : false,
        maxLines: maxLines,
        maxLength: maxLength,
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        avatar: icon,
        label: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        // style: ,
      ),
    );
  }
}
