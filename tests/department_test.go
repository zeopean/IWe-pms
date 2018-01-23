package test


import (
	"testing"
	"runtime"
	"path/filepath"
	_ "IWe-pms/routers"

	"github.com/astaxie/beego"
	"IWe-pms/models"
)

func init() {
	_, file, _, _ := runtime.Caller(1)
	apppath, _ := filepath.Abs(filepath.Dir(filepath.Join(file, ".." + string(filepath.Separator))))
	beego.TestBeegoInit(apppath)
}


// TestBeego is a sample to run an endpoint test
func TestDepartment(t *testing.T) {
	models.FindOne(1000000)
}

