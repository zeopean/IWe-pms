package models

import (
	"time"
	"opms/models"
	"IWe-pms/consts"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Department struct {
	Id           int64 `orm:"pk"`
	Company      string
	Name         string
	Status       int8
	HeaderUserId int64
	CreateTime   time.Time
	UpdateTime   time.Time
}

func (this *Department) TableName() string {
	return models.TableName(consts.DEPARTMENT)
}

func init() {
	orm.RegisterModel(new(Department))
}

func FindOne(id int64) Department {
	var department Department
	var _ error

	o := orm.NewOrm()
	department = Department{Id:id}
	_ = o.Read(&department)

	return department
}

func FindAll() (department[] Department, err error) {
	return nil, nil
}