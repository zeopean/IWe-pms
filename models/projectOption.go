package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type ProjectOption struct {
	Id           int64 `orm:"pk"`
	Name         string
	ProjectId    int64
	HeaderUserId int64
	Status       int8
	CompleteTime time.Time
	CreateTime   time.Time
	UpdateTime   time.Time
}

func (this *ProjectOption) TableName() string {
	return models.TableName(consts.PROJECT_OPTION)
}

func init() {
	orm.RegisterModel(new(ProjectOption))
}
