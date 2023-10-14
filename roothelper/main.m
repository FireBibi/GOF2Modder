#include <stdio.h>
@import Foundation;

int main(int argc, char *argv[], char *envp[]) {
	@autoreleasepool {
        if (argc != 3) {
            NSLog(@"Not enough arguments !");
            return -1;
        }
        NSString *dest = [NSString stringWithUTF8String:argv[2]];
        
        NSError *error = nil;
        NSError *error1 = nil;
        if ([[NSFileManager defaultManager] fileExistsAtPath:dest]) {
            [[NSFileManager defaultManager] removeItemAtPath:dest error:&error1];
        }
        [[NSFileManager defaultManager] copyItemAtPath:[NSString stringWithUTF8String:argv[1]] toPath:dest error:&error];
        
        NSLog(@"%@", error1);
        NSLog(@"%@", error);
	}
}
