package unit_test

import (
	"testing"

	"github.com/Dedo-Finger2/simple-fiber-api/internal/config"
)

func Test_GetEnvFunction(t *testing.T) {
	env, err := config.GetEnv()
	if err != nil {
		t.Errorf("failed to get env. err: %v", err)
	}

	exoected := env.PORT != ""

	if !exoected {
		t.Error("expected env.PORT to have a value, but got an empty string.")
	}
}
