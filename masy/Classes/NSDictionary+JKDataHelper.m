//
//  NSDictionary+JKDataHelper.m
//  Pods
//
//  Created by Jack on 17/3/28.
//
//

#import "NSDictionary+JKDataHelper.h"
#import "NSObject+JK.h"
#import <objc/message.h>
@interface NSDictionary()

+ (instancetype)JKsafedictionaryWithObjectsAndKeys:(id)firstObject, ...;

@end

@implementation NSDictionary (JKDataHelper)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //Class targetClass = NSClassFromString(@"__NSDictionaryI");
        Class targetClass = [self class];
        [self JKswizzleMethod:@selector(dictionaryWithObject:forKey:) withMethod:@selector(JKsafeDictionaryWithObject:forKey:) withClass:targetClass];
       
        [self JKswizzleMethod:@selector(dictionaryWithObjectsAndKeys:) withMethod:@selector(JKsafedictionaryWithObjectsAndKeys:) withClass:targetClass];
        
        [self JKswizzleMethod:@selector(dictionaryWithObjects:forKeys:) withMethod:@selector(JKsafeDictionaryWithObjects:forKeys:) withClass:targetClass];
        
    });
    
    
}


+ (instancetype)JKsafeDictionaryWithObject:(id)object forKey:(id <NSCopying>)key{

    if (object) {
        if (key) {
            
            return [self JKsafeDictionaryWithObject:object forKey:key];
            
        }else{
            JKDataHelperLog(@"[__NSDictionaryI dictionaryWithObject:forKey:] key can't be nil");
            return nil;
        }
    }else{
        JKDataHelperLog(@"[__NSDictionaryI dictionaryWithObject:forKey:] object can't be nil");
        return nil;
    }
}


+ (instancetype)JKsafedictionaryWithObjectsAndKeys:(id)firstObject, ...{
    
    NSMutableArray *objects =[NSMutableArray new];
    va_list list;
    va_start(list, firstObject);
    [objects addObject:firstObject];
    id arg = nil;
    while (arg = va_arg(list, id)) {
        
        [objects addObject:arg];
        
    }

    va_end(list);
    if (objects.count%2 != 0) {
        
        JKDataHelperLog(@"[__NSDictionaryI dictionaryWithObjectsAndKeys:]: second object of each pair must be non-nil");
        return nil;

    }
    NSDictionary *dic = [NSDictionary dictionary];
    
    id value = nil;
    id key = nil;
    NSMutableArray *values = [NSMutableArray new];
    NSMutableArray *keys = [NSMutableArray new];
    for (NSInteger i =0; i<objects.count; i++) {
        
        if (i%2==0) {
            
            value =objects[i];
            [values addObject:value];
            
            
        }else{
            
            key =objects[i];
            [keys addObject:key];
            
    
        }
    }
        return [self dictionaryWithObjects:[values copy] forKeys:[keys copy]];

}

+ (instancetype)JKsafeDictionaryWithObjects:(NSArray<id> *)objects forKeys:(NSArray<id <NSCopying>> *)keys{
    if ((objects && [objects isKindOfClass:[NSArray class]]) && (keys &&[keys isKindOfClass:[NSArray class]]) &&(objects.count ==keys.count)) {
        return [self JKsafeDictionaryWithObjects:objects forKeys:keys];
    }else{
    
        JKDataHelperLog(@"[__NSdictionaryI dictionaryWithObjects:forKeys:] please check you objects and keys");
        return nil;
    }
    


}

- (void)setValue:(nullable id)value forKey:(NSString *)key{


}

@end
