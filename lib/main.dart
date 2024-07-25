import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  QuizApp()
    );
  }
}
class QuizApp extends StatefulWidget{
     QuizApp({super.key});

@override 

State createState()=> _QuizAppState();
}
class Modelclass {

  final String? question;
  final List <String>? options;
 final int?  answerindex;
const Modelclass({this.question,this.options,this.answerindex});

}
class  _QuizAppState extends State{
  bool isQuestion = true;
 int  queindex = 0;
 int selectedansIndex = -1;
 int correct = 0;
 int check = 0;
List allQuestion = [
  
 const  Modelclass(

  question:"When was the first general election held in India after gaining independence?",
  options:["1947", "1948" ,"1950", "1952"],
  answerindex:3,
  ),
const Modelclass(

  question:"Which state in India has the highest number of Lok Sabha seats?",
  options:["Uttar Pradesh", "Maharastra" ,"Bihar", "West Bangal"],
  answerindex:0,
),
const Modelclass(
  question:"In which year were Electronic Voting Machines (EVMs) introduced for the first time in Indian elections?" ,
  options:["1992", "1996" ,"1998", "2002"],
  answerindex:1,
),
const Modelclass(
  question:"What is the minimum voting age in India for participating in elections?",
  options:["18 years", "20 years" ,"22 years", "23 years"],
  answerindex:0,

),
const Modelclass(
  question:"How often are general elections held in India for the Lok Sabha ?",
  options:[" Every 4 years", " Every 5 years" ," Every 6 years", " Every 7 years"],
  answerindex:1,
),
];
MaterialStateProperty<Color?> correctans(int optionIndex){
   
   if(selectedansIndex!=-1){

if(optionIndex == allQuestion[queindex].answerindex){
        
    return const  MaterialStatePropertyAll(Colors.green);

}else if(optionIndex==selectedansIndex){
      
      return const MaterialStatePropertyAll(Colors.red);
      } 
else{

return const MaterialStatePropertyAll(Color.fromARGB(255,17,69,175));

}
}else{

 return const MaterialStatePropertyAll(Color.fromARGB(255, 17,69, 175));
 
 }
}

void nextQue(){
   
if(selectedansIndex==-1){
      return ;
}if(selectedansIndex == allQuestion[queindex].answerindex){
    correct++;
}if(selectedansIndex!=-1){
if(queindex == allQuestion.length-1){

    isQuestion = false;
}
  setState(() {
     queindex++;
  selectedansIndex = -1;
  });
 }
}
Scaffold isQuestionScreen(){

if(isQuestion==true){
      
      return Scaffold(
      appBar: AppBar(
        title:  const Text("Quiz App",style: TextStyle(fontWeight:FontWeight.w800,),),
        centerTitle: true,
        backgroundColor: Colors.blue,
 ),
body:  Column(
  
  children: [
 const SizedBox(
height: 38,
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:[

  const  Text("Question : ",style: TextStyle(
    fontWeight: FontWeight.w600,fontSize: 18
   ),
   ), 
    Text("${queindex+1}/${allQuestion.length}",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 18),),        
 ]
),
 const SizedBox(
  height: 20,
),
Container(
  height:100,
  width:380,
 decoration:  BoxDecoration(
  borderRadius:  BorderRadius.all(Radius.circular(20)),
border: Border.all(color: Colors.black),

 ),
 alignment: Alignment.center,
 
  child:
         
        Text("${allQuestion[queindex].question}",textAlign: TextAlign.center,style:const  TextStyle(fontWeight: FontWeight.w600,fontSize: 23),),
), 

     const  SizedBox(
          height: 20,
 ),
 Container(

    height: 50,
    width: 180,
    
    child:
  ElevatedButton(
 style: ButtonStyle(backgroundColor: correctans(0),),
     onPressed: (){
      if(selectedansIndex==-1){
       setState(() {
         selectedansIndex = 0;
    });
}
     },
child: 
       Text("A.${allQuestion[queindex].options[0]}",style:  const TextStyle(fontSize: 20,),),),),
const SizedBox(
  height: 15,
),

Container(

    height: 50,
    width: 180,
    
   child:
ElevatedButton(

 style: ButtonStyle(backgroundColor: correctans(1),),
        
      onPressed: (){
        if(selectedansIndex==-1){
       setState(() {
         selectedansIndex = 1;
   });
}
      },
 child:
  Text("B.${allQuestion[queindex].options[1]}",style: TextStyle(fontSize: 20),),),
),
SizedBox(
  height: 15,
),
Container(

    height: 50,
    width: 180,
    
    
    child:
ElevatedButton(
  
 style: ButtonStyle(backgroundColor: correctans(2),),
 
      onPressed: (){
        if(selectedansIndex==-1){
      setState(() {
         selectedansIndex = 2;
}
);

}
      },
child: 

Text("C.${allQuestion[queindex].options[2]}",style: TextStyle(fontSize: 20),),),),
SizedBox(
  height: 15,
),
Container(

    height: 50,
    width: 180,
    
    
    child:

ElevatedButton(
 style: ButtonStyle(backgroundColor: correctans(3),),
 
      onPressed: (){
        if(selectedansIndex==-1){
    setState(() {
         selectedansIndex = 3;
});

 }
      },
  child: Text("D.${allQuestion[queindex].options[3]}",style: TextStyle(fontSize: 20),),),),
],
) ,
floatingActionButton: FloatingActionButton(
  onPressed: (){
    nextQue();

  },
  child:  const Icon(Icons.forward),
),

);
}
else{

 return   Scaffold(
appBar: AppBar(
  title: const Text("Quiz app",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),
centerTitle:true,
backgroundColor: Colors.black,
),
body: Column(
      children: [
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmoGE8pGXE4aUURpYIETqvw6W5RZB-iVvKdw&usqp=CAU",
        height: 500,
        width: 380,
        ), 
       const Text("Congratulations!!",style: TextStyle(fontWeight:FontWeight.w600,color: Colors.orange,fontSize:20)), 
       
      const  SizedBox(
        height: 20,
       ),
         const Text("You sucessfully completed the quiz",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
         const  SizedBox(
            height: 20,
          ),
           
        Text(" Score :$correct/${allQuestion.length}",style:const  TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
  const  SizedBox(
  height: 10,
 ),
      ElevatedButton(onPressed: (){
          selectedansIndex = -1;
          queindex = 0;
          isQuestion = true;
          correct = 0;
          
          setState(() {
         });
   },
       child: const Text("Reset ",style: TextStyle(fontWeight: FontWeight.w600),
       ),
      ),
],
),
  );
}
}
@override
Widget build(BuildContext context){
  return isQuestionScreen(
);
    }
      }
