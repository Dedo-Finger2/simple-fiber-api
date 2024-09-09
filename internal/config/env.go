package config

import (
	"fmt"
	"os"
	"path"

	"github.com/Dedo-Finger2/simple-fiber-api/internal/utils"
	"github.com/joho/godotenv"
)

type env struct {
	PORT string
}

func GetEnv() (*env, error) {
	rootPath, err := utils.GetRootPath()
	if err != nil {
		return &env{}, nil
	}

	err = godotenv.Load(path.Join(rootPath, ".env"))
	if err != nil {
		return &env{}, fmt.Errorf("Error trying to load .env file. err: %v", err)
	}

	PORT := os.Getenv("PORT")

	variables := map[string]string{
		"PORT": PORT,
	}

	err = validateEnvFiles(variables)
	if err != nil {
		return &env{}, fmt.Errorf("Error during .env file variables validation. err: %v", err)
	}

	return &env{
		PORT: PORT,
	}, nil
}

func validateEnvFiles(values map[string]string) error {
	for variable, value := range values {
		if value == "" {
			return fmt.Errorf("Env variable '%s' has no value.", variable)
		}
	}

	return nil
}
