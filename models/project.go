package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Project struct {
	Id           int64 `orm:"pk"`
	Name         string
	GroupId      int64
	ProjectType  int8
	HeaderUserId int64
	Status       int8
	CompleteTime time.Time
	CreateTime   time.Time
	UpdateTime   time.Time
}

func (this *Project) TableName() string {
	return models.TableName(consts.PROJECT)
}

func init() {
	orm.RegisterModel(new(Project))
}
