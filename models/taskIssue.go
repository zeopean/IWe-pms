package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type TaskIssue struct {
	Id            int64 `orm:"pk"`
	Name          string
	TaskId        int64
	ObjectId      int64
	SponsorUserId int64
	HeaderUserId  int64
	Status        int8
	CompleteTime  time.Time
	CreateTime    time.Time
	UpdateTime    time.Time
}

func (this *TaskIssue) TableName() string {
	return models.TableName(consts.TASK_ISSUE)
}

func init() {
	orm.RegisterModel(new(TaskIssue))
}
