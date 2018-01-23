package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type BugDetail struct {
	Id          int64 `orm:"pk"`
	Name        string
	BugId       int64
	Status      int8
	Version     string
	Notice      string
	Platform    string
	attachFiles string
	CreateTime  time.Time
	UpdateTime  time.Time
}

func (this *BugDetail) TableName() string {
	return models.TableName(consts.BUG_DETAIL)
}

func init() {
	orm.RegisterModel(new(BugDetail))
}
