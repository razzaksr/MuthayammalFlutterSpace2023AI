const express = require('express')
const cors = require('cors')
const mysql = require('mysql2')
const bodyParser=require('body-parser')

const app = express()
app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())

const base = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'Razak@123',
    database:'muthayammal'
})

base.connect(()=>{
    console.log("database connected")
})

app.listen(2020,()=>{
    console.log("server is running!!!!!!!!!!!!!!")
})

// Routings

app.delete("/del/:id",async(req,res)=>{
    const id=req.params.id
    const sql="delete from placement where student_id=?"
    base.query(sql,[id],(err,ack)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(ack.affectedRows==0){
            res.status(404).json({error:"unable to delete"})
            return
        }
        res.status(200).json({message:"Candidate deleted"})
    })
})

app.put("/up",async(req,res)=>{
    const{student_id,student_name,student_dept,student_skill,student_cgpa,student_interest,student_placed}=req.body
    const sql="update placement set student_name=?, student_dept=?, student_cgpa=?, student_skill=?, student_interest=?, student_placed=? where student_id=?"
    base.query(sql,[student_name,student_dept,student_cgpa,student_skill,student_interest,student_placed,student_id],(err,ack)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(ack.affectedRows==0){
            res.status(404).json({error:"unable to update"})
            return
        }
        res.status(200).json({message:"Candidate updated"})
    })
})

app.get("/find/:id",async(req,res)=>{
    const id=req.params.id
    const sql="select * from placement where student_id=?"
    base.query(sql,[id],(err,results)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(results.length==0){
            res.status(404).json({error:"no candidates available"})
            return
        }
        res.status(200).json({message:results[0]})
    })
})

app.post("/",async(req,res)=>{
    const{student_id,student_name,student_dept,student_skill,student_cgpa,student_interest}=req.body
    const sql="insert into placement(student_id,student_name,student_dept,student_skill,student_cgpa,student_interest) values(?,?,?,?,?,?)"
    base.query(sql,[student_id,student_name,student_dept,student_skill,student_cgpa,student_interest],(err,ack)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(ack.affectedRows==0){
            res.status(404).json({error:"unable to enroll"})
            return
        }
        res.status(200).json({message:"Candidate enrolled"})
    })
})

app.get("/",async(req,res)=>{
    const sql="select * from placement"
    base.query(sql,(err,results)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(results.length==0){
            res.status(404).json({error:"no candidates available"})
            return
        }
        res.status(200).json({message:results})
    })
})

app.get("/department/:dept",async(req,res)=>{
    const dept=req.params.dept
    const sql="select * from placement where student_dept=?"
    base.query(sql,[dept],(err,results)=>{
        if(err){
            res.status(500).json({error:err.message})
            return
        }
        if(results.length==0){
            res.status(404).json({error:"no candidates available"})
            return
        }
        res.status(200).json({message:results})
    })
})