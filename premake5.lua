project "Spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++11"
	staticruntime "on"

	targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediates/" .. outputdir .. "/%{prj.name}")

	includedirs 
	{		
		"./include",
	}

	files
	{
		"include/spdlog/**.h",
		"src/**.cpp",
	}

	defines
	{
		"SPDLOG_COMPILED_LIB"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
