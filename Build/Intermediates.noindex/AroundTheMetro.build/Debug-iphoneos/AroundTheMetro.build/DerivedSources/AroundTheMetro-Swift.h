// Generated by Apple Swift version 4.0.3 (swiftlang-900.0.74.1 clang-900.0.39.2)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import UIKit;
@import HDAugmentedReality;
@import Foundation;
@import CoreGraphics;
@import GoogleSignIn;
@import AKSideMenu;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("AroundTheMetro")
@class UIImageView;
@class UILabel;
@class NSCoder;

SWIFT_CLASS("_TtC14AroundTheMetro18ARCategoryListCell")
@interface ARCategoryListCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified iconView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified titleLabel;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSBundle;

SWIFT_CLASS("_TtC14AroundTheMetro20ARListViewController")
@interface ARListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
- (void)awakeFromNib;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end



@class ARViewController;
@class ARAnnotation;
@class ARAnnotationView;

@interface ARListViewController (SWIFT_EXTENSION(AroundTheMetro)) <ARDataSource>
- (ARAnnotationView * _Nonnull)ar:(ARViewController * _Nonnull)arViewController viewForAnnotation:(ARAnnotation * _Nonnull)viewForAnnotation SWIFT_WARN_UNUSED_RESULT;
@end


@interface ARListViewController (SWIFT_EXTENSION(AroundTheMetro))
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
@end


SWIFT_CLASS("_TtC14AroundTheMetro7ARPlace")
@interface ARPlace : ARAnnotation
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
@end

@class UISlider;

@interface ARViewController (SWIFT_EXTENSION(AroundTheMetro))
- (void)viewDidLoad;
- (void)sliderValueDidChange:(UISlider * _Null_unspecified)sender;
@end

@class UITouch;
@class UIEvent;

SWIFT_CLASS("_TtC14AroundTheMetro14AnnotationView")
@interface AnnotationView : ARAnnotationView
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)touchesEnded:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC14AroundTheMetro11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (BOOL)application:(UIApplication * _Nonnull)app openURL:(NSURL * _Nonnull)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> * _Nonnull)options SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




SWIFT_CLASS("_TtC14AroundTheMetro20ContentNavController")
@interface ContentNavController : UINavigationController
- (void)awakeFromNib;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=5.0);
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14AroundTheMetro18HomeViewController")
@interface HomeViewController : UIViewController <UIGestureRecognizerDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface HomeViewController (SWIFT_EXTENSION(AroundTheMetro)) <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC14AroundTheMetro23ImageCollectionViewCell")
@interface ImageCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionViewFlowLayout;
@class InfiniteCollectionView;

SWIFT_CLASS("_TtC14AroundTheMetro22Infinite2TableViewCell")
@interface Infinite2TableViewCell : UITableViewCell
- (void)awakeFromNib;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout * _Null_unspecified collectionFlowLayout;
@property (nonatomic, weak) IBOutlet InfiniteCollectionView * _Null_unspecified collectionView;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier SWIFT_UNAVAILABLE;
@end

@class UICollectionView;
@class NSIndexPath;
@class UIScrollView;

SWIFT_PROTOCOL("_TtP14AroundTheMetro30InfiniteCollectionViewDelegate_")
@protocol InfiniteCollectionViewDelegate
@optional
- (void)didSelectCellAtIndexPathWithCollectionView:(UICollectionView * _Nonnull)collectionView indexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_DEPRECATED_MSG("", "infiniteCollectionView(_:didSelectItemAt:)");
- (void)didUpdatePageIndexWithIndex:(NSInteger)index SWIFT_DEPRECATED_MSG("", "scrollView(_:pageIndex:)");
- (void)infiniteCollectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAt:(NSIndexPath * _Nonnull)usableIndexPath;
- (void)scrollView:(UIScrollView * _Nonnull)scrollView pageIndex:(NSInteger)pageIndex;
@end


SWIFT_PROTOCOL("_TtP14AroundTheMetro32InfiniteCollectionViewDataSource_")
@protocol InfiniteCollectionViewDataSource
@optional
- (NSInteger)numberOfItemsWithCollectionView:(UICollectionView * _Nonnull)collectionView SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_MSG("", "number(ofItems:)");
- (UICollectionViewCell * _Nonnull)cellForItemAtIndexPathWithCollectionView:(UICollectionView * _Nonnull)collectionView dequeueIndexPath:(NSIndexPath * _Nonnull)dequeueIndexPath indexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_MSG("", "collectionView(_:dequeueForItemAt:cellForItemAt:)");
@required
- (NSInteger)numberOfItems:(UICollectionView * _Nonnull)collectionView SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView dequeueForItemAt:(NSIndexPath * _Nonnull)dequeueIndexPath cellForItemAt:(NSIndexPath * _Nonnull)usableIndexPath SWIFT_WARN_UNUSED_RESULT;
@end


@interface Infinite2TableViewCell (SWIFT_EXTENSION(AroundTheMetro)) <InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate>
- (NSInteger)numberOfItems:(UICollectionView * _Nonnull)collectionView SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView dequeueForItemAt:(NSIndexPath * _Nonnull)dequeueIndexPath cellForItemAt:(NSIndexPath * _Nonnull)usableIndexPath SWIFT_WARN_UNUSED_RESULT;
- (void)infiniteCollectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAt:(NSIndexPath * _Nonnull)usableIndexPath;
@end

@class UICollectionViewLayout;

SWIFT_CLASS("_TtC14AroundTheMetro22InfiniteCollectionView")
@interface InfiniteCollectionView : UICollectionView
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout * _Nonnull)layout OBJC_DESIGNATED_INITIALIZER;
- (void)rotate:(NSNotification * _Nonnull)notification;
- (void)selectItemAtIndexPath:(NSIndexPath * _Nullable)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition;
@end


@interface InfiniteCollectionView (SWIFT_EXTENSION(AroundTheMetro)) <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end


@interface InfiniteCollectionView (SWIFT_EXTENSION(AroundTheMetro)) <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
@end





@class UIPageControl;

SWIFT_CLASS("_TtC14AroundTheMetro21InfiniteTableViewCell")
@interface InfiniteTableViewCell : UITableViewCell
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, weak) IBOutlet InfiniteCollectionView * _Null_unspecified collectionView;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout * _Null_unspecified layout;
@property (nonatomic, weak) IBOutlet UIPageControl * _Null_unspecified pageControl;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier SWIFT_UNAVAILABLE;
@end


@interface InfiniteTableViewCell (SWIFT_EXTENSION(AroundTheMetro)) <InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate>
- (NSInteger)numberOfItems:(UICollectionView * _Nonnull)collectionView SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView dequeueForItemAt:(NSIndexPath * _Nonnull)dequeueIndexPath cellForItemAt:(NSIndexPath * _Nonnull)usableIndexPath SWIFT_WARN_UNUSED_RESULT;
- (void)infiniteCollectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAt:(NSIndexPath * _Nonnull)usableIndexPath;
- (void)scrollView:(UIScrollView * _Nonnull)scrollView pageIndex:(NSInteger)pageIndex;
@end


SWIFT_CLASS("_TtC14AroundTheMetro22LeftMenuViewController")
@interface LeftMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (void)awakeFromNib;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)sectionIndex SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end

@class UIButton;

SWIFT_CLASS("_TtC14AroundTheMetro19LoginViewController")
@interface LoginViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified facebookLoginBtn;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified googleLoginBtn;
- (void)viewDidLoad;
- (IBAction)facebookLoginTapped:(UIButton * _Nonnull)sender;
- (IBAction)googleLoginTapped:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class GIDSignIn;
@class GIDGoogleUser;

@interface LoginViewController (SWIFT_EXTENSION(AroundTheMetro)) <GIDSignInDelegate, GIDSignInUIDelegate>
- (void)signIn:(GIDSignIn * _Null_unspecified)signIn didSignInForUser:(GIDGoogleUser * _Null_unspecified)user withError:(NSError * _Null_unspecified)error;
- (void)signIn:(GIDSignIn * _Null_unspecified)signIn presentViewController:(UIViewController * _Null_unspecified)viewController;
- (void)signIn:(GIDSignIn * _Null_unspecified)signIn dismissViewController:(UIViewController * _Null_unspecified)viewController;
@end

@class UIView;

SWIFT_CLASS("_TtC14AroundTheMetro23MetroPlanViewController")
@interface MetroPlanViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified scrollView;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (UIView * _Nullable)viewForZoomingInScrollView:(UIScrollView * _Nonnull)scrollView SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWebView;

SWIFT_CLASS("_TtC14AroundTheMetro22RentFormViewController")
@interface RentFormViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified cancelBt;
- (IBAction)cancellBtn:(UIButton * _Nonnull)sender;
@property (nonatomic, weak) IBOutlet UIWebView * _Null_unspecified webView;
- (void)awakeFromNib;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14AroundTheMetro18RootViewController")
@interface RootViewController : AKSideMenu <AKSideMenuDelegate>
- (void)awakeFromNib;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)sideMenu:(AKSideMenu * _Nonnull)sideMenu willShowMenuViewController:(UIViewController * _Nonnull)menuViewController;
- (void)sideMenu:(AKSideMenu * _Nonnull)sideMenu didShowMenuViewController:(UIViewController * _Nonnull)menuViewController;
- (void)sideMenu:(AKSideMenu * _Nonnull)sideMenu willHideMenuViewController:(UIViewController * _Nonnull)menuViewController;
- (void)sideMenu:(AKSideMenu * _Nonnull)sideMenu didHideMenuViewController:(UIViewController * _Nonnull)menuViewController;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14AroundTheMetro19ShareViewController")
@interface ShareViewController : UIViewController
- (void)awakeFromNib;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14AroundTheMetro4User")
@interface User : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIPickerView;
@class NSAttributedString;

SWIFT_CLASS("_TtC14AroundTheMetro25WorldScreenViewcontroller")
@interface WorldScreenViewcontroller : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified pickerView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified cityLable;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)animated;
- (IBAction)btnConfirmTapped:(UIButton * _Nonnull)sender;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (NSAttributedString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
