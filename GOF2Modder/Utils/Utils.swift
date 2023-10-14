//
//  Utils.swift
//  GOF2Modder
//
//  Created by BibiFire on 06/09/2023.
//

import SwiftUI


func checkTrollStore() -> Bool {
    if Bundle.main.url(forResource: "../_TrollStore", withExtension: nil) == nil{
        print("Should display error !")
        errorToShow = "You need to install this app using TrollStore, follow the instructions on GitHub !"
        shouldDisplayError = true


    } else {
        print("TrollStore is used !")
        return true
    }
    return false
}

func ensurePath(file: String?, isDirectory: Bool) {
    do {
        if (file != nil) {} // Dummy call to check if the file really exists
    } catch {
        do {
            if isDirectory { try FileManager.default.createDirectory(atPath: file!, withIntermediateDirectories: true) }
            else { try FileManager.default.createFile(atPath: file!, contents: nil) }
        } catch { print("Real error this time : \(error)")}
    }


}

func ensureBackupDir() {
    let fileManager = FileManager.default
        do {
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            backupDir = documentsDirectory.appendingPathComponent("Backup")
            binPath = gof2BundleURL!.appendingPathComponent("Galaxy on Fire 2 HD.app/data/bin").path
            tempPath = documentsDirectory.appendingPathComponent("Temp")
            
            
            ensurePath(file: backupDir!.path, isDirectory: true)
            ensurePath(file: tempPath!.path, isDirectory: true)
            
            
            
            for item in try fileManager.contentsOfDirectory(atPath: binPath!) {
                
                do {
                    if !(fileManager.fileExists(atPath: URL(fileURLWithPath: binPath!).appendingPathComponent(item).path)) {
                        try fileManager.copyItem(at: URL(fileURLWithPath: binPath!).appendingPathComponent(item), to: backupDir!.appendingPathComponent(item))
                    }

                } catch {
                    writeStringToLogFile("\(error)", fileName: "log.txt")
                    
                }
            }
            

        } catch {
            print("Error: \(error.localizedDescription)")
        }
}

func findGOF2Bundle(bundleIdentifier: String) -> URL? {
    do {

        let url: URL = URL(string: "/var/containers/Bundle/Application")!
        
        let items = try FileManager.default.contentsOfDirectory(atPath: url.absoluteString)
        var str: [String] = []
        for item in items {
            if searchForPropertyInPlist(plist: url.appendingPathComponent(item), propertyName: "MCMMetadataIdentifier") as! String == bundleIdentifier {
                return url.appendingPathComponent(item)
            }
            
        }
        
    } catch {print("Error : \(error)")}
    return nil
}

func searchForPropertyInPlist(plist: URL, propertyName: String) -> Any? {
    let plistPath: String = plist.appendingPathComponent(".com.apple.mobile_container_manager.metadata.plist").absoluteString
    
    let plistData = FileManager.default.contents(atPath: plistPath)

    do {
        let plistDictionary = try PropertyListSerialization.propertyList(from: plistData!, format: nil) as? NSDictionary
        return plistDictionary?[propertyName]
    } catch {
        writeStringToLogFile("Error loading plist: \(error)", fileName: "log.txt")
        return nil
    }
}

func resetLogFile() {
    do {
        var logFile: URL = Bundle.main.url(forResource: "log", withExtension: ".txt")!
        if FileManager.default.fileExists(atPath: logFile.path) {
            try FileManager.default.removeItem(at: logFile)
        }
        
    } catch { print("An error occured emptying log file !") }
}

func writeStringToLogFile(_ text: String, fileName: String) {
    
    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        
    let logFileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            try text.write(to: logFileURL, atomically: false, encoding: .utf8)
        } catch {
            print("Error writing to log file: \(error.localizedDescription)")
        }
    }
}

func createTempBinFile(data: Data, file: URL) {
    do {
        ensurePath(file: file.path, isDirectory: false)
        try data.write(to: file)
        
    } catch {
        writeStringToLogFile("Error \(error)", fileName: "log.txt")
    }
    
}

func copyFileAsRoot(from: URL, to: URL) {
    
    var stdOut: NSString?
    var stdErr: NSString?
    
    var ret = spawnRoot(Bundle.main.bundlePath + "/RootHelper", [from.path, to.path], &stdOut, &stdErr)
    
    if ret != 0 {
        writeStringToLogFile(String(stdOut!), fileName: "log.txt")
        writeStringToLogFile(String(stdErr!), fileName: "log.txt")
        
        errorToShow = String(stdErr!)
        shouldDisplayError = true
    }

    writeStringToLogFile("return value is \(ret) !", fileName: "log.txt")

}

func initApp() -> Bool {
    if appInited {
        return false
    }
    ensurePath(file: Bundle.main.path(forResource: "log", ofType: ".txt"), isDirectory: false)
    checkTrollStore()
    
    if let gof2Bundle = findGOF2Bundle(bundleIdentifier: "www.fishlabs.net.gof2hd") {
        gof2BundleURL = gof2Bundle
        writeStringToLogFile("Found GOF2 HD bundle path", fileName: "log.txt")
        
        ensureBackupDir()
        
        appInited = true
        
    } else {
        
        errorToShow = "Please install GOF2 HD in order to use this app !"
        shouldDisplayError = true
        return false
    }
    return true

}

