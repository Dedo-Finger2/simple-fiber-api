package utils

import (
	"os"
	"strings"
)

func GetRootPath() (string, error) {
	dir, err := os.Getwd()
	if err != nil {
		return "", err
	}

	rootPath := strings.Split(dir, "api/")[0]

	if rootPath[len(rootPath)-1] == '-' {
		rootPath = rootPath + "api/"
	}

	return rootPath, nil
}
