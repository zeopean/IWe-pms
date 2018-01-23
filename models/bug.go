package models

import (
	"time"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	"opms/models"
)

type Bug struct {
	Id            int64 `orm:"pk"`
	Name          string
	Description   string
	SponsorUserId int64
	HeaderUserId  int64
	BugType       int8
	Status        int8
	InviteUserIds string
	Level         int8
	SolveTime     time.Time
	CreateTime    time.Time
	UpdateTime    time.Time
}

func (this *Bug) TableName() string {
	return models.TableName(consts.BUG)
}

func init() {
	orm.RegisterModel(new(Bug))
}
