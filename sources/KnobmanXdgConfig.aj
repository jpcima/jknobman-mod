/**
   Relocate configuration files of type .ini in the XDG directory:
   ~/.config/JKnobMan/
 */

import java.io.File;

public aspect KnobmanXdgConfig {
    Object around(): execution(String ResFilename.GetString())
    {
        ResFilename self = (ResFilename)thisJoinPoint.getTarget();
        String filename = self.str;

        boolean isConfig = filename.endsWith(".ini");
        if (isConfig) {
            File configDir = getKnobmanConfigDir();
            configDir.mkdir();
            File configFile = new File(configDir, filename);
            System.err.println("Configuration file: " + configFile);
            return configFile.toString();
        }

        return proceed();
    }

    private static File getKnobmanConfigDir()
    {
        return new File(getXdgConfigPath(), "JKnobMan");
    }

    private synchronized static String getXdgConfigPath()
    {
        String dir = cacheXdgConfigPath;
        if (dir != null)
            return dir;
        dir = System.getenv("XDG_CONFIG_HOME");
        if (dir == null)
            dir = new File(System.getProperty("user.home"), ".config").toString();
        cacheXdgConfigPath = dir;
        return dir;
    }

    private static String cacheXdgConfigPath = null;
}
