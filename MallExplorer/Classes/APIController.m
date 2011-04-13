//
//  APIController.m
//  MallExplorer
//
//  Created by Jason Dinh on 4/3/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "APIController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "Constant.h"
#import "JSON.h"

@implementation APIController
@synthesize delegate, debugMode, url, result;

- (void) getAPI: (NSString *) path {
	
	
	
	NSString *fullPath = [NSString stringWithFormat: @"%@%@", API_END_POINT, path];
	if (debugMode) {
		NSLog(@"APIController: getAPI with path: %@", fullPath);
	}
	NSURL *url = [NSURL URLWithString: fullPath];
	ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL: url];
	[request setDelegate: self];
	[request setDidFailSelector: @selector(APIFailed:)];
	[request setDidFinishSelector: @selector(APIFinished:)];
	[request setDidStartSelector: @selector(APIStarted:)];
	[request startAsynchronous];
}

- (void) hitCache: (NSURL *) url {
	//try if the request hit the cache
}

- (void) postAPI: (NSString *) path withData: (NSDictionary *) data {
	
	NSString *fullPath = [NSString stringWithFormat: @"%@%@", API_END_POINT, path];
	
	if (debugMode) {
		NSLog(@"APIController: postAPI with path: %@ and data: %@", fullPath, [data description]);
	}
	
	NSURL *url = [NSURL URLWithString: fullPath];
	
	ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
	
	NSEnumerator *enumerator = [data keyEnumerator];
	NSString *key;
	
	while ((key = [enumerator nextObject])) {
		NSLog(@"%@ %@", [data objectForKey: key], key);
		[request addPostValue: [data objectForKey: key] forKey: key];
	}
	
	[request setDelegate: self];
	[request setDidFailSelector: @selector(APIFailed:)];
	[request setDidFinishSelector: @selector(APIFinished:)];
	[request setDidStartSelector: @selector(APIStarted:)];
	[request startAsynchronous];
}

- (void) APIStarted: (ASIHTTPRequest *) request {
	if (debugMode) {
		NSLog(@"APIController: started to load");
	}
	
	self.url = [request url];
	
	if ([delegate respondsToSelector: @selector(requestDidStart:)]) {
		[delegate requestDidStart: self];
	}
}

- (void) APIFinished: (ASIHTTPRequest *) request {
	if (debugMode) {
		NSLog(@"APIController: finished load with data: %@", [request responseString]);
	}
	
	NSString *result = [request responseString];
	
	id returnObject = [result JSONValue];
	
	self.result = returnObject;
	
	if ([delegate respondsToSelector: @selector(requestDidLoad:)]) {
		[delegate requestDidLoad: self];
	}
}

- (void) APIFailed: (ASIHTTPRequest *) request {
	
	if (debugMode) {
		NSLog(@"APIController: load failed");
	}
	if ([delegate respondsToSelector: @selector(requestFail:)]) {
		[delegate requestFail: self];
	}
}


- (void) dealloc {
	[url release];
	[super dealloc];
}

@end