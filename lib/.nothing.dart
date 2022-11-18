class Nothing {
  BlocConsumer<AuthCubit, AuthState>

  (

  listener

      :

  (

  _

  ,

  state

  ) {
  if (state is AuthError){
  customDialog(context,Text(
  state.message,
  style: const TextStyle(color: Colors.red, fontSize: 24),
  ),)
  }

  }
  builder

      :

  (

  _

  ,

  state

  ) { return Form( key: _formKey, child: Padding(

  padding: const EdgeInsets.symmetric(horizontal: 30),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  if (state is AuthSigningIn)
  const Center(child: CircularProgressIndicator()),


  const SizedBox(height: 8),
  TextField(
  controller: _emailController,
  decoration: const InputDecoration(labelText: 'Email'),

  ),

  customDialog(BuildContext context, Widget child,
  {double dialogHeight = 500, double dialogWidth = 400}) {
  return showDialog(
  context: context,
  builder: (context) => Dialog(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12.0),
  ),
  child: Container(
  height: height(dialogHeight),
  width: width(dialogWidth),
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  ),
  child: child
  ),
  ),
  );
  }
  }
