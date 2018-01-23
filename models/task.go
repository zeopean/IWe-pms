package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Task struct {
	Id            int64 `orm:"pk"`
	Name          string
	TaskType      int8
	ObjectId      int64
	SponsorUserId int64
	Status        int8
	CompleteTime  time.Time
	CreateTime    time.Time
	UpdateTime    time.Time
}

func (this *Task) TableName() string {
	return models.TableName(consts.TASK)
}

func init() {
	orm.RegisterModel(new(Task))
}
