project "ANGLE"
    kind "StaticLib"  -- Or "SharedLib" if you want a dynamic library
	language "C++"
	staticruntime "off"
    targetdir "bin/%{cfg.buildcfg}"

    files {
        "src/**/*.cpp",
        "src/**/*.h"
    }

    includedirs {
        "src",  -- Include ANGLE's source headers
    }

    filter "system:windows"
        defines { "WIN32", "_WINDOWS" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter "configurations:Dist"
        defines { "DIST" }
        optimize "Full"
