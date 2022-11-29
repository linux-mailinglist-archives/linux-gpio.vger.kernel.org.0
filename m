Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4406A63B976
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 06:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbiK2F12 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 00:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235505AbiK2F11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 00:27:27 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777966244;
        Mon, 28 Nov 2022 21:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669699643; x=1701235643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOcBag3+0Od6fCrLU41tACtkO7IbIn2rAzvw+CgSmoQ=;
  b=AbyzHRTFrseEh+ylFbj+749W1opLq0GnbmfGGZobYx6m1rLUQE5s4koq
   nzNoqSnnh2t9YPj0u6kfWGyCcbK2lfwP9uDopsZGoKECJL3FDPB6K2VW1
   OQvWU/5yiGh67gbrKn+xJ5uJoWekxUptY47H3uiOweOqUTyaIrm9SYGQl
   DjTPI04aWWhOexk2QGT3hXGMxMvvjPCrnhn5YzrEnP62oOLHaHj8psMQ5
   98/px+C1wskia/BlpGot3Wq9g0/6BfOQzONC7QNMygF+osCF5f0wXRXK+
   +c3lJP/ALgktlpXCQasA6dfO47aCNhnt4dkuf0O+CG5yW0AGgTwLxYib/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="379287441"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="379287441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 21:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="749689890"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="749689890"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2022 21:27:18 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozt9K-0008fP-11;
        Tue, 29 Nov 2022 05:27:18 +0000
Date:   Tue, 29 Nov 2022 13:26:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] gpiolib: protect the GPIO device against being
 dropped while in use by user-space
Message-ID: <202211291340.68PzvPjV-lkp@intel.com>
References: <20221128175214.602612-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="T7i3AVU2e9WDQ+o6"
Content-Disposition: inline
In-Reply-To: <20221128175214.602612-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--T7i3AVU2e9WDQ+o6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.1-rc7 next-20221128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-don-t-allow-user-space-to-crash-the-kernel-with-hot-unplugs/20221129-021037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20221128175214.602612-3-brgl%40bgdev.pl
patch subject: [PATCH v2 2/2] gpiolib: protect the GPIO device against being dropped while in use by user-space
config: arm-randconfig-r046-20221128
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ccf2821b643c23a5ef6fac8a4785c2127d4125c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bartosz-Golaszewski/gpiolib-don-t-allow-user-space-to-crash-the-kernel-with-hot-unplugs/20221129-021037
        git checkout ccf2821b643c23a5ef6fac8a4785c2127d4125c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-cdev.c: In function 'lineinfo_watch_read':
>> drivers/gpio/gpiolib-cdev.c:2647:1: error: expected 'while' before 'static'
    2647 | static int gpio_chrdev_open(struct inode *inode, struct file *file)
         | ^~~~~~
>> drivers/gpio/gpiolib-cdev.c:2709:12: error: invalid storage class for function 'gpio_chrdev_release'
    2709 | static int gpio_chrdev_release(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-cdev.c:2709:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    2709 | static int gpio_chrdev_release(struct inode *inode, struct file *file)
         | ^~~~~~
>> drivers/gpio/gpiolib-cdev.c:2724:20: error: initializer element is not constant
    2724 |         .release = gpio_chrdev_release,
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2724:20: note: (near initialization for 'gpio_fileops.release')
>> drivers/gpio/gpiolib-cdev.c:2725:17: error: 'gpio_chrdev_open' undeclared (first use in this function); did you mean 'gpio_chardev_data'?
    2725 |         .open = gpio_chrdev_open,
         |                 ^~~~~~~~~~~~~~~~
         |                 gpio_chardev_data
   drivers/gpio/gpiolib-cdev.c:2725:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpio/gpiolib-cdev.c:2757:1: error: expected declaration or statement at end of input
    2757 | }
         | ^
   drivers/gpio/gpiolib-cdev.c: At top level:
   drivers/gpio/gpiolib-cdev.c:2754:6: warning: 'gpiolib_cdev_unregister' defined but not used [-Wunused-function]
    2754 | void gpiolib_cdev_unregister(struct gpio_device *gdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2736:5: warning: 'gpiolib_cdev_register' defined but not used [-Wunused-function]
    2736 | int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2543:16: warning: 'lineinfo_watch_read' defined but not used [-Wunused-function]
    2543 | static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
         |                ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:2494:12: warning: 'lineinfo_changed_notify' defined but not used [-Wunused-function]
    2494 | static int lineinfo_changed_notify(struct notifier_block *nb,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +2647 drivers/gpio/gpiolib-cdev.c

925ca36913fc7df Kent Gibson         2020-06-16  2640  
925ca36913fc7df Kent Gibson         2020-06-16  2641  /**
925ca36913fc7df Kent Gibson         2020-06-16  2642   * gpio_chrdev_open() - open the chardev for ioctl operations
925ca36913fc7df Kent Gibson         2020-06-16  2643   * @inode: inode for this chardev
49bc52798d7bb66 Kent Gibson         2020-07-08  2644   * @file: file struct for storing private data
925ca36913fc7df Kent Gibson         2020-06-16  2645   * Returns 0 on success
925ca36913fc7df Kent Gibson         2020-06-16  2646   */
49bc52798d7bb66 Kent Gibson         2020-07-08 @2647  static int gpio_chrdev_open(struct inode *inode, struct file *file)
925ca36913fc7df Kent Gibson         2020-06-16  2648  {
925ca36913fc7df Kent Gibson         2020-06-16  2649  	struct gpio_device *gdev = container_of(inode->i_cdev,
925ca36913fc7df Kent Gibson         2020-06-16  2650  						struct gpio_device, chrdev);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2651  	struct gpio_chardev_data *cdev;
925ca36913fc7df Kent Gibson         2020-06-16  2652  	int ret = -ENOMEM;
925ca36913fc7df Kent Gibson         2020-06-16  2653  
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2654  	down_read(&gdev->sem);
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2655  
925ca36913fc7df Kent Gibson         2020-06-16  2656  	/* Fail on open if the backing gpiochip is gone */
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2657  	if (!gdev->chip) {
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2658  		up_read(&gdev->sem);
925ca36913fc7df Kent Gibson         2020-06-16  2659  		return -ENODEV;
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2660  	}
925ca36913fc7df Kent Gibson         2020-06-16  2661  
e2b781c5f0dd45f Kent Gibson         2020-07-08  2662  	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2663  	if (!cdev) {
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2664  		up_read(&gdev->sem);
925ca36913fc7df Kent Gibson         2020-06-16  2665  		return -ENOMEM;
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2666  	}
925ca36913fc7df Kent Gibson         2020-06-16  2667  
e2b781c5f0dd45f Kent Gibson         2020-07-08  2668  	cdev->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2669  	if (!cdev->watched_lines)
e2b781c5f0dd45f Kent Gibson         2020-07-08  2670  		goto out_free_cdev;
925ca36913fc7df Kent Gibson         2020-06-16  2671  
e2b781c5f0dd45f Kent Gibson         2020-07-08  2672  	init_waitqueue_head(&cdev->wait);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2673  	INIT_KFIFO(cdev->events);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2674  	cdev->gdev = gdev;
925ca36913fc7df Kent Gibson         2020-06-16  2675  
e2b781c5f0dd45f Kent Gibson         2020-07-08  2676  	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
6accc376a7482ec Kent Gibson         2020-07-08  2677  	ret = blocking_notifier_chain_register(&gdev->notifier,
e2b781c5f0dd45f Kent Gibson         2020-07-08  2678  					       &cdev->lineinfo_changed_nb);
925ca36913fc7df Kent Gibson         2020-06-16  2679  	if (ret)
925ca36913fc7df Kent Gibson         2020-06-16  2680  		goto out_free_bitmap;
925ca36913fc7df Kent Gibson         2020-06-16  2681  
925ca36913fc7df Kent Gibson         2020-06-16  2682  	get_device(&gdev->dev);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2683  	file->private_data = cdev;
925ca36913fc7df Kent Gibson         2020-06-16  2684  
49bc52798d7bb66 Kent Gibson         2020-07-08  2685  	ret = nonseekable_open(inode, file);
925ca36913fc7df Kent Gibson         2020-06-16  2686  	if (ret)
925ca36913fc7df Kent Gibson         2020-06-16  2687  		goto out_unregister_notifier;
925ca36913fc7df Kent Gibson         2020-06-16  2688  
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2689  	up_read(&gdev->sem);
925ca36913fc7df Kent Gibson         2020-06-16  2690  	return ret;
925ca36913fc7df Kent Gibson         2020-06-16  2691  
925ca36913fc7df Kent Gibson         2020-06-16  2692  out_unregister_notifier:
6accc376a7482ec Kent Gibson         2020-07-08  2693  	blocking_notifier_chain_unregister(&gdev->notifier,
e2b781c5f0dd45f Kent Gibson         2020-07-08  2694  					   &cdev->lineinfo_changed_nb);
925ca36913fc7df Kent Gibson         2020-06-16  2695  out_free_bitmap:
e2b781c5f0dd45f Kent Gibson         2020-07-08  2696  	bitmap_free(cdev->watched_lines);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2697  out_free_cdev:
e2b781c5f0dd45f Kent Gibson         2020-07-08  2698  	kfree(cdev);
ccf2821b643c23a Bartosz Golaszewski 2022-11-28  2699  	up_read(&gdev->sem);
925ca36913fc7df Kent Gibson         2020-06-16  2700  	return ret;
925ca36913fc7df Kent Gibson         2020-06-16  2701  }
925ca36913fc7df Kent Gibson         2020-06-16  2702  
925ca36913fc7df Kent Gibson         2020-06-16  2703  /**
925ca36913fc7df Kent Gibson         2020-06-16  2704   * gpio_chrdev_release() - close chardev after ioctl operations
925ca36913fc7df Kent Gibson         2020-06-16  2705   * @inode: inode for this chardev
49bc52798d7bb66 Kent Gibson         2020-07-08  2706   * @file: file struct for storing private data
925ca36913fc7df Kent Gibson         2020-06-16  2707   * Returns 0 on success
925ca36913fc7df Kent Gibson         2020-06-16  2708   */
49bc52798d7bb66 Kent Gibson         2020-07-08 @2709  static int gpio_chrdev_release(struct inode *inode, struct file *file)
925ca36913fc7df Kent Gibson         2020-06-16  2710  {
e2b781c5f0dd45f Kent Gibson         2020-07-08  2711  	struct gpio_chardev_data *cdev = file->private_data;
e2b781c5f0dd45f Kent Gibson         2020-07-08  2712  	struct gpio_device *gdev = cdev->gdev;
925ca36913fc7df Kent Gibson         2020-06-16  2713  
e2b781c5f0dd45f Kent Gibson         2020-07-08  2714  	bitmap_free(cdev->watched_lines);
6accc376a7482ec Kent Gibson         2020-07-08  2715  	blocking_notifier_chain_unregister(&gdev->notifier,
e2b781c5f0dd45f Kent Gibson         2020-07-08  2716  					   &cdev->lineinfo_changed_nb);
925ca36913fc7df Kent Gibson         2020-06-16  2717  	put_device(&gdev->dev);
e2b781c5f0dd45f Kent Gibson         2020-07-08  2718  	kfree(cdev);
925ca36913fc7df Kent Gibson         2020-06-16  2719  
925ca36913fc7df Kent Gibson         2020-06-16  2720  	return 0;
925ca36913fc7df Kent Gibson         2020-06-16  2721  }
925ca36913fc7df Kent Gibson         2020-06-16  2722  
925ca36913fc7df Kent Gibson         2020-06-16  2723  static const struct file_operations gpio_fileops = {
925ca36913fc7df Kent Gibson         2020-06-16 @2724  	.release = gpio_chrdev_release,
925ca36913fc7df Kent Gibson         2020-06-16 @2725  	.open = gpio_chrdev_open,
925ca36913fc7df Kent Gibson         2020-06-16  2726  	.poll = lineinfo_watch_poll,
925ca36913fc7df Kent Gibson         2020-06-16  2727  	.read = lineinfo_watch_read,
925ca36913fc7df Kent Gibson         2020-06-16  2728  	.owner = THIS_MODULE,
925ca36913fc7df Kent Gibson         2020-06-16  2729  	.llseek = no_llseek,
925ca36913fc7df Kent Gibson         2020-06-16  2730  	.unlocked_ioctl = gpio_ioctl,
925ca36913fc7df Kent Gibson         2020-06-16  2731  #ifdef CONFIG_COMPAT
925ca36913fc7df Kent Gibson         2020-06-16  2732  	.compat_ioctl = gpio_ioctl_compat,
925ca36913fc7df Kent Gibson         2020-06-16  2733  #endif
925ca36913fc7df Kent Gibson         2020-06-16  2734  };
925ca36913fc7df Kent Gibson         2020-06-16  2735  
925ca36913fc7df Kent Gibson         2020-06-16  2736  int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
925ca36913fc7df Kent Gibson         2020-06-16  2737  {
925ca36913fc7df Kent Gibson         2020-06-16  2738  	int ret;
925ca36913fc7df Kent Gibson         2020-06-16  2739  
925ca36913fc7df Kent Gibson         2020-06-16  2740  	cdev_init(&gdev->chrdev, &gpio_fileops);
925ca36913fc7df Kent Gibson         2020-06-16  2741  	gdev->chrdev.owner = THIS_MODULE;
925ca36913fc7df Kent Gibson         2020-06-16  2742  	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
925ca36913fc7df Kent Gibson         2020-06-16  2743  
925ca36913fc7df Kent Gibson         2020-06-16  2744  	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
925ca36913fc7df Kent Gibson         2020-06-16  2745  	if (ret)
925ca36913fc7df Kent Gibson         2020-06-16  2746  		return ret;
925ca36913fc7df Kent Gibson         2020-06-16  2747  
925ca36913fc7df Kent Gibson         2020-06-16  2748  	chip_dbg(gdev->chip, "added GPIO chardev (%d:%d)\n",
925ca36913fc7df Kent Gibson         2020-06-16  2749  		 MAJOR(devt), gdev->id);
925ca36913fc7df Kent Gibson         2020-06-16  2750  
925ca36913fc7df Kent Gibson         2020-06-16  2751  	return 0;
925ca36913fc7df Kent Gibson         2020-06-16  2752  }
925ca36913fc7df Kent Gibson         2020-06-16  2753  
925ca36913fc7df Kent Gibson         2020-06-16  2754  void gpiolib_cdev_unregister(struct gpio_device *gdev)
925ca36913fc7df Kent Gibson         2020-06-16  2755  {
925ca36913fc7df Kent Gibson         2020-06-16  2756  	cdev_device_del(&gdev->chrdev, &gdev->dev);
925ca36913fc7df Kent Gibson         2020-06-16 @2757  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--T7i3AVU2e9WDQ+o6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm 6.1.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="arm-linux-gnueabi-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
CONFIG_KERNEL_LZO=y
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y
# CONFIG_TIME_KUNIT_TEST is not set
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_EXP_KTHREAD=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_NOCB_CPU_CB_BOOST is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=m
# CONFIG_IKCONFIG_PROC is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_EMBED is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# end of General setup

CONFIG_ARM=y
CONFIG_SYS_SUPPORTS_APM_EMULATION=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PHYS_OFFSET=0x00800000
CONFIG_GENERIC_BUG=y
CONFIG_PGTABLE_LEVELS=2

#
# System Type
#
# CONFIG_MMU is not set
CONFIG_ARM_SINGLE_ARMV7M=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
# CONFIG_ARCH_AT91 is not set
CONFIG_ARCH_MXC=y

#
# Cortex-A/Cortex-M asymmetric multiprocessing platforms
#
CONFIG_SOC_IMX7D_CM4=y
CONFIG_SOC_IMX7D=y
# CONFIG_SOC_IMX7ULP is not set
# CONFIG_SOC_IMXRT is not set
# CONFIG_SOC_VF610 is not set
# CONFIG_ARCH_STM32 is not set
# CONFIG_ARCH_LPC18XX is not set
CONFIG_ARCH_MPS2=y

#
# Processor Type
#
CONFIG_CPU_V7M=y
CONFIG_CPU_THUMBONLY=y
CONFIG_CPU_THUMB_CAPABLE=y
CONFIG_CPU_32v7M=y
CONFIG_CPU_ABRT_NOMMU=y
CONFIG_CPU_PABRT_LEGACY=y
CONFIG_CPU_CACHE_NOP=y
CONFIG_CPU_CACHE_V7M=y
CONFIG_CPU_V7M_NUM_IRQ=240

#
# Processor Features
#
CONFIG_ARM_THUMB=y
CONFIG_CPU_LITTLE_ENDIAN=y
# CONFIG_CPU_BIG_ENDIAN is not set
# CONFIG_CPU_ICACHE_DISABLE is not set
CONFIG_CPU_DCACHE_DISABLE=y
# CONFIG_CPU_BPREDICT_DISABLE is not set
CONFIG_ARM_L1_CACHE_SHIFT=5
# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
# CONFIG_SET_MEM_PARAM is not set
CONFIG_DRAM_BASE=0x00800000
CONFIG_DRAM_SIZE=0x00800000
CONFIG_REMAP_VECTORS_TO_RAM=y
# CONFIG_ARM_MPU is not set
# end of System Type

#
# Bus support
#
# end of Bus support

#
# Kernel Features
#
CONFIG_IRQSTACKS=y
CONFIG_PAGE_OFFSET=0x00800000
CONFIG_HZ_FIXED=0
CONFIG_HZ_100=y
# CONFIG_HZ_200 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_500 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_THUMB2_KERNEL=y
CONFIG_AEABI=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_HW_PERF_EVENTS=y
# CONFIG_ARM_MODULE_PLTS is not set
CONFIG_ARCH_FORCE_MAX_ORDER=11
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_CC_HAVE_STACKPROTECTOR_TLS=y
# end of Kernel Features

#
# Boot options
#
CONFIG_USE_OF=y
# CONFIG_ATAGS is not set
CONFIG_ZBOOT_ROM_TEXT=0x0
CONFIG_ZBOOT_ROM_BSS=0x0
# CONFIG_ARM_APPENDED_DTB is not set
CONFIG_CMDLINE=""
# CONFIG_XIP_KERNEL is not set
CONFIG_CRASH_DUMP=y
# CONFIG_AUTO_ZRELADDR is not set
# end of Boot options

#
# CPU Power Management
#

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPU Power Management

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
# end of Floating point emulation

#
# Power management options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_USERSPACE_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_APM_EMULATION is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARM_CPU_SUSPEND=y
# end of Power management options

CONFIG_AS_VFP_VMRS_FPINST=y

#
# General architecture-dependent options
#
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_KEEPINITRD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
CONFIG_SECCOMP_CACHE_DEBUG=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_MODULE_SRCVERSION_ALL=y
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
CONFIG_MODULE_COMPRESS_XZ=y
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_DECOMPRESS=y
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
# CONFIG_SOLARIS_X86_PARTITION is not set
CONFIG_UNIXWARE_DISKLABEL=y
CONFIG_LDM_PARTITION=y
CONFIG_LDM_DEBUG=y
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_ARCH_HAS_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_FLAT_OLD=y
CONFIG_BINFMT_ZFLAT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
# CONFIG_PAGE_REPORTING is not set
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
# CONFIG_TLS_DEVICE is not set
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_INTERFACE=m
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_XFRM_ESPINTCP=y
CONFIG_SMC=m
# CONFIG_SMC_DIAG is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=m
# CONFIG_NET_IPGRE_BROADCAST is not set
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=y
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
CONFIG_TCP_CONG_CUBIC=y
# CONFIG_TCP_CONG_WESTWOOD is not set
CONFIG_TCP_CONG_HTCP=m
# CONFIG_TCP_CONG_HSTCP is not set
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
# CONFIG_TCP_CONG_SCALABLE is not set
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=m
# CONFIG_TCP_CONG_ILLINOIS is not set
# CONFIG_TCP_CONG_DCTCP is not set
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=m
# CONFIG_IPV6_ROUTER_PREF is not set
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=m
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
CONFIG_IPV6_SEG6_HMAC=y
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE=y
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_IB=y
CONFIG_TIPC_MEDIA_UDP=y
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
CONFIG_ATM_CLIP_NO_ICMP=y
# CONFIG_ATM_LANE is not set
# CONFIG_ATM_BR2684 is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
# CONFIG_L2TP_V3 is not set
CONFIG_STP=y
CONFIG_GARP=y
# CONFIG_BRIDGE is not set
CONFIG_NET_DSA=m
# CONFIG_NET_DSA_TAG_AR9331 is not set
CONFIG_NET_DSA_TAG_BRCM_COMMON=m
CONFIG_NET_DSA_TAG_BRCM=m
CONFIG_NET_DSA_TAG_BRCM_LEGACY=m
CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
CONFIG_NET_DSA_TAG_HELLCREEK=m
CONFIG_NET_DSA_TAG_GSWIP=m
CONFIG_NET_DSA_TAG_DSA_COMMON=m
CONFIG_NET_DSA_TAG_DSA=m
# CONFIG_NET_DSA_TAG_EDSA is not set
CONFIG_NET_DSA_TAG_MTK=m
CONFIG_NET_DSA_TAG_KSZ=m
CONFIG_NET_DSA_TAG_OCELOT=m
CONFIG_NET_DSA_TAG_OCELOT_8021Q=m
CONFIG_NET_DSA_TAG_QCA=m
CONFIG_NET_DSA_TAG_RTL4_A=m
CONFIG_NET_DSA_TAG_RTL8_4=m
# CONFIG_NET_DSA_TAG_RZN1_A5PSW is not set
CONFIG_NET_DSA_TAG_LAN9303=m
CONFIG_NET_DSA_TAG_SJA1105=m
CONFIG_NET_DSA_TAG_TRAILER=m
CONFIG_NET_DSA_TAG_XRS700X=m
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
# CONFIG_6LOWPAN_NHC_DEST is not set
CONFIG_6LOWPAN_NHC_FRAGMENT=m
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
# CONFIG_6LOWPAN_NHC_MOBILITY is not set
CONFIG_6LOWPAN_NHC_ROUTING=m
CONFIG_6LOWPAN_NHC_UDP=m
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=m
CONFIG_6LOWPAN_GHC_UDP=m
CONFIG_6LOWPAN_GHC_ICMPV6=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=m
CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
# CONFIG_IEEE802154_SOCKET is not set
# CONFIG_IEEE802154_6LOWPAN is not set
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
CONFIG_MPLS_ROUTING=m
CONFIG_NET_NSH=m
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_SMD=m
# CONFIG_QRTR_TUN is not set
CONFIG_QRTR_MHI=m
CONFIG_NET_NCSI=y
# CONFIG_NCSI_OEM_CMD_GET_MAC is not set
# CONFIG_NCSI_OEM_CMD_KEEP_PHY is not set
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set
CONFIG_CAN_J1939=m
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=m
# CONFIG_BT_BREDR is not set
# CONFIG_BT_LE is not set
# CONFIG_BT_LEDS is not set
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_QCA=m
CONFIG_BT_MTK=m
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
CONFIG_BT_HCIBTUSB_BCM=y
CONFIG_BT_HCIBTUSB_MTK=y
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
# CONFIG_BT_HCIUART_ATH3K is not set
# CONFIG_BT_HCIUART_INTEL is not set
CONFIG_BT_HCIUART_AG6XX=y
# CONFIG_BT_HCIBCM203X is not set
CONFIG_BT_HCIBPA10X=m
# CONFIG_BT_HCIBFUSB is not set
# CONFIG_BT_HCIDTL1 is not set
CONFIG_BT_HCIBT3C=m
# CONFIG_BT_HCIBLUECARD is not set
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_BT_ATH3K=m
# CONFIG_BT_MTKSDIO is not set
CONFIG_BT_QCOMSMD=m
CONFIG_BT_VIRTIO=m
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=m
# CONFIG_AF_RXRPC_IPV6 is not set
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
# CONFIG_RXKAD is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_MCTP=y
CONFIG_MCTP_TEST=y
CONFIG_MCTP_FLOWS=y
# CONFIG_WIRELESS is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=m
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
# CONFIG_ETHTOOL_NETLINK is not set
CONFIG_NETDEV_ADDR_LIST_TEST=m

#
# Device Drivers
#
CONFIG_ARM_AMBA=y
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#
# CONFIG_OMAP_CF is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
# CONFIG_FW_CACHE is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_PM_QOS_KUNIT_TEST is not set
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
# CONFIG_DRIVER_PE_KUNIT_TEST is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SPI_AVMM=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BRCMSTB_GISB_ARB=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
CONFIG_MOXTET=m
CONFIG_HISILICON_LPC=y
CONFIG_IMX_WEIM=y
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
CONFIG_VEXPRESS_CONFIG=y
# CONFIG_FSL_MC_BUS is not set
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_EP=m
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
# CONFIG_ARM_SCMI_TRANSPORT_MAILBOX is not set
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
CONFIG_ARM_SCMI_POWER_CONTROL=y
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
CONFIG_MTK_ADSP_IPC=y
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_TURRIS_MOX_RWTM=y
# CONFIG_BCM47XX_NVRAM is not set
# CONFIG_TEE_BNXT_FW is not set
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_COREBOOT_TABLE=y
# CONFIG_GOOGLE_MEMCONSOLE_COREBOOT is not set
CONFIG_GOOGLE_VPD=y
CONFIG_IMX_DSP=y
CONFIG_IMX_SCU=y
CONFIG_IMX_SCU_PD=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_USB=m
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TCP=y
CONFIG_NVME_AUTH=y
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
CONFIG_DUMMY_IRQ=m
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_GEHC_ACHC=y
CONFIG_QCOM_COINCELL=y
CONFIG_QCOM_FASTRPC=m
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
CONFIG_SRAM_EXEC=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_HISI_HIKEY_USB=y
CONFIG_OPEN_DICE=y
CONFIG_VCPU_STALL_DETECTOR=m
CONFIG_C2PORT=m

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
CONFIG_EEPROM_IDT_89HPESX=m
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_SPI is not set
# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=m
CONFIG_ECHO=y
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
# CONFIG_CHR_DEV_ST is not set
CONFIG_CHR_DEV_SG=y
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_BRCM is not set
# CONFIG_AHCI_DA850 is not set
CONFIG_AHCI_DM816=y
# CONFIG_AHCI_DWC is not set
# CONFIG_AHCI_ST is not set
CONFIG_AHCI_IMX=m
CONFIG_AHCI_CEVA=y
# CONFIG_AHCI_MTK is not set
CONFIG_AHCI_MVEBU=y
# CONFIG_AHCI_SUNXI is not set
CONFIG_AHCI_TEGRA=y
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=m
CONFIG_SATA_FSL=m
# CONFIG_SATA_GEMINI is not set
CONFIG_SATA_AHCI_SEATTLE=m
# CONFIG_ATA_SFF is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
# CONFIG_MD_LINEAR is not set
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
CONFIG_MD_MULTIPATH=y
# CONFIG_MD_FAULTY is not set
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=y
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=y
CONFIG_DM_EBS=m
# CONFIG_DM_ERA is not set
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=y
CONFIG_DM_LOG_USERSPACE=y
CONFIG_DM_RAID=y
# CONFIG_DM_ZERO is not set
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
CONFIG_DM_MULTIPATH_HST=m
# CONFIG_DM_MULTIPATH_IOA is not set
# CONFIG_DM_DELAY is not set
# CONFIG_DM_DUST is not set
# CONFIG_DM_INIT is not set
# CONFIG_DM_UEVENT is not set
CONFIG_DM_FLAKEY=y
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=y
# CONFIG_DM_ZONED is not set
CONFIG_DM_AUDIT=y
CONFIG_TARGET_CORE=m
# CONFIG_TCM_IBLOCK is not set
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_MII=m
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
CONFIG_DUMMY=y
CONFIG_WIREGUARD=m
CONFIG_WIREGUARD_DEBUG=y
CONFIG_EQUALIZER=y
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=y
CONFIG_GENEVE=m
CONFIG_BAREUDP=m
CONFIG_GTP=m
CONFIG_AMT=m
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=y
# CONFIG_NETCONSOLE_DYNAMIC is not set
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=y
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=m
# CONFIG_VIRTIO_NET is not set
# CONFIG_NLMON is not set
CONFIG_MHI_NET=m
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=m
# CONFIG_B53_SPI_DRIVER is not set
CONFIG_B53_MDIO_DRIVER=m
CONFIG_B53_MMAP_DRIVER=m
# CONFIG_B53_SRAB_DRIVER is not set
CONFIG_B53_SERDES=m
CONFIG_NET_DSA_BCM_SF2=m
# CONFIG_NET_DSA_LOOP is not set
# CONFIG_NET_DSA_LANTIQ_GSWIP is not set
CONFIG_NET_DSA_MT7530=m
# CONFIG_NET_DSA_MV88E6060 is not set
# CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON is not set
# CONFIG_NET_DSA_MV88E6XXX is not set
# CONFIG_NET_DSA_AR9331 is not set
CONFIG_NET_DSA_QCA8K=m
# CONFIG_NET_DSA_SJA1105 is not set
CONFIG_NET_DSA_XRS700X=m
CONFIG_NET_DSA_XRS700X_I2C=m
# CONFIG_NET_DSA_XRS700X_MDIO is not set
CONFIG_NET_DSA_REALTEK=m
# CONFIG_NET_DSA_REALTEK_MDIO is not set
CONFIG_NET_DSA_REALTEK_SMI=m
# CONFIG_NET_DSA_REALTEK_RTL8365MB is not set
CONFIG_NET_DSA_REALTEK_RTL8366RB=m
CONFIG_NET_DSA_SMSC_LAN9303=m
CONFIG_NET_DSA_SMSC_LAN9303_I2C=m
# CONFIG_NET_DSA_SMSC_LAN9303_MDIO is not set
CONFIG_NET_DSA_VITESSE_VSC73XX=m
CONFIG_NET_DSA_VITESSE_VSC73XX_SPI=m
# CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM is not set
# end of Distributed Switch Architecture drivers

# CONFIG_ETHERNET is not set
CONFIG_PHYLINK=m
CONFIG_PHYLIB=m
CONFIG_SWPHY=y
CONFIG_LED_TRIGGER_PHY=y
CONFIG_FIXED_PHY=m
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=m
CONFIG_MESON_GXL_PHY=m
CONFIG_ADIN_PHY=m
CONFIG_ADIN1100_PHY=m
CONFIG_AQUANTIA_PHY=m
CONFIG_AX88796B_PHY=m
# CONFIG_BROADCOM_PHY is not set
CONFIG_BCM54140_PHY=m
CONFIG_BCM63XX_PHY=m
CONFIG_BCM7XXX_PHY=m
CONFIG_BCM84881_PHY=m
# CONFIG_BCM87XX_PHY is not set
# CONFIG_BCM_CYGNUS_PHY is not set
CONFIG_BCM_NET_PHYLIB=m
CONFIG_CICADA_PHY=m
CONFIG_CORTINA_PHY=m
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=m
CONFIG_LXT_PHY=m
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=m
CONFIG_MARVELL_PHY=m
# CONFIG_MARVELL_10G_PHY is not set
CONFIG_MARVELL_88X2222_PHY=m
# CONFIG_MAXLINEAR_GPHY is not set
CONFIG_MEDIATEK_GE_PHY=m
CONFIG_MICREL_PHY=m
CONFIG_MICROCHIP_PHY=m
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
CONFIG_NATIONAL_PHY=m
CONFIG_NXP_C45_TJA11XX_PHY=m
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_AT803X_PHY=m
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=m
CONFIG_RENESAS_PHY=m
CONFIG_ROCKCHIP_PHY=m
CONFIG_SMSC_PHY=m
# CONFIG_STE10XP is not set
CONFIG_TERANETICS_PHY=m
# CONFIG_DP83822_PHY is not set
CONFIG_DP83TC811_PHY=m
CONFIG_DP83848_PHY=m
CONFIG_DP83867_PHY=m
# CONFIG_DP83869_PHY is not set
CONFIG_DP83TD510_PHY=m
CONFIG_VITESSE_PHY=m
CONFIG_XILINX_GMII2RGMII=m
CONFIG_MICREL_KS8995MA=m
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set

#
# MCTP Device Drivers
#
CONFIG_MCTP_SERIAL=y
CONFIG_MCTP_TRANSPORT_I2C=m
# end of MCTP Device Drivers

CONFIG_MDIO_DEVICE=m
CONFIG_MDIO_BUS=m
CONFIG_FWNODE_MDIO=m
CONFIG_OF_MDIO=m
CONFIG_MDIO_DEVRES=m
CONFIG_MDIO_SUN4I=m
# CONFIG_MDIO_XGENE is not set
CONFIG_MDIO_ASPEED=m
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BCM_IPROC=m
CONFIG_MDIO_BCM_UNIMAC=m
CONFIG_MDIO_HISI_FEMAC=m
CONFIG_MDIO_MVUSB=m
CONFIG_MDIO_MSCC_MIIM=m
# CONFIG_MDIO_MOXART is not set
# CONFIG_MDIO_OCTEON is not set
# CONFIG_MDIO_IPQ4019 is not set
CONFIG_MDIO_IPQ8064=m

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=m
# CONFIG_MDIO_BUS_MUX_MESON_G12A is not set
# CONFIG_MDIO_BUS_MUX_BCM6368 is not set
CONFIG_MDIO_BUS_MUX_BCM_IPROC=m
# CONFIG_MDIO_BUS_MUX_GPIO is not set
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=m
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set

#
# PCS device drivers
#
# CONFIG_PCS_RZN1_MIIC is not set
# end of PCS device drivers

CONFIG_PPP=y
# CONFIG_PPP_BSDCOMP is not set
# CONFIG_PPP_DEFLATE is not set
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
# CONFIG_PPP_MULTILINK is not set
# CONFIG_PPPOATM is not set
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
CONFIG_PPP_ASYNC=y
CONFIG_PPP_SYNC_TTY=y
CONFIG_SLIP=m
CONFIG_SLHC=y
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=m
CONFIG_USB_CATC=m
CONFIG_USB_KAWETH=m
CONFIG_USB_PEGASUS=m
CONFIG_USB_RTL8150=m
CONFIG_USB_RTL8152=m
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
CONFIG_USB_IPHETH=m
# CONFIG_WLAN is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=y
CONFIG_IEEE802154_FAKELB=m
CONFIG_IEEE802154_AT86RF230=y
CONFIG_IEEE802154_MRF24J40=m
# CONFIG_IEEE802154_CC2520 is not set
CONFIG_IEEE802154_ATUSB=m
# CONFIG_IEEE802154_ADF7242 is not set
CONFIG_IEEE802154_CA8210=m
CONFIG_IEEE802154_CA8210_DEBUGFS=y
# CONFIG_IEEE802154_MCR20A is not set
CONFIG_IEEE802154_HWSIM=m

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
# CONFIG_KEYBOARD_ADP5520 is not set
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
CONFIG_KEYBOARD_QT1070=y
# CONFIG_KEYBOARD_QT2160 is not set
CONFIG_KEYBOARD_CLPS711X=m
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=m
CONFIG_KEYBOARD_EP93XX=m
CONFIG_KEYBOARD_GPIO=y
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=m
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
CONFIG_KEYBOARD_MAX7359=m
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
CONFIG_KEYBOARD_SNVS_PWRKEY=y
# CONFIG_KEYBOARD_IMX is not set
CONFIG_KEYBOARD_IMX_SC_KEY=y
CONFIG_KEYBOARD_NEWTON=m
CONFIG_KEYBOARD_OPENCORES=m
CONFIG_KEYBOARD_PINEPHONE=m
CONFIG_KEYBOARD_PMIC8XXX=y
CONFIG_KEYBOARD_SAMSUNG=m
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
CONFIG_KEYBOARD_ST_KEYSCAN=y
CONFIG_KEYBOARD_SUNKBD=y
CONFIG_KEYBOARD_SH_KEYSC=m
CONFIG_KEYBOARD_IQS62X=m
CONFIG_KEYBOARD_OMAP4=m
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_KEYBOARD_CAP11XX=m
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_KEYBOARD_MT6779 is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
CONFIG_MOUSE_PS2_SENTELIC=y
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=y
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=m
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADC is not set
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=m
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
# CONFIG_JOYSTICK_IFORCE_232 is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=m
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_AS5011=y
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=y
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
# CONFIG_JOYSTICK_PSXPAD_SPI is not set
CONFIG_JOYSTICK_PXRC=m
CONFIG_JOYSTICK_QWIIC=y
# CONFIG_JOYSTICK_FSIA6B is not set
CONFIG_JOYSTICK_SENSEHAT=m
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
CONFIG_TOUCHSCREEN_AD7877=m
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ADC=m
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=m
CONFIG_TOUCHSCREEN_CY8CTMG110=m
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP_SPI=m
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=m
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=m
CONFIG_TOUCHSCREEN_CYTTSP4_SPI=m
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=m
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
# CONFIG_TOUCHSCREEN_IPROC is not set
CONFIG_TOUCHSCREEN_S6SY761=y
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=y
# CONFIG_TOUCHSCREEN_MAX11801 is not set
CONFIG_TOUCHSCREEN_MCS5000=m
CONFIG_TOUCHSCREEN_MMS114=y
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
# CONFIG_TOUCHSCREEN_MSG2638 is not set
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_IMAGIS=y
CONFIG_TOUCHSCREEN_IMX6UL_TSC=m
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=m
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=m
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
CONFIG_TOUCHSCREEN_WM831X=y
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MX25=m
# CONFIG_TOUCHSCREEN_MC13783 is not set
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=m
CONFIG_TOUCHSCREEN_TS4800=y
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
CONFIG_TOUCHSCREEN_TSC2005=y
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
CONFIG_TOUCHSCREEN_SIS_I2C=m
# CONFIG_TOUCHSCREEN_ST1232 is not set
CONFIG_TOUCHSCREEN_STMFTS=m
CONFIG_TOUCHSCREEN_SUN4I=m
CONFIG_TOUCHSCREEN_SURFACE3_SPI=y
CONFIG_TOUCHSCREEN_SX8654=m
# CONFIG_TOUCHSCREEN_TPS6507X is not set
CONFIG_TOUCHSCREEN_ZET6223=m
CONFIG_TOUCHSCREEN_ZFORCE=y
CONFIG_TOUCHSCREEN_COLIBRI_VF50=m
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
# CONFIG_TOUCHSCREEN_IQS5XX is not set
# CONFIG_TOUCHSCREEN_ZINITIX is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=m
CONFIG_SERIO_AMBAKMI=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=m
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=m
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_DMA=y
# CONFIG_SERIAL_8250_CS is not set
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_BCM2835AUX is not set
CONFIG_SERIAL_8250_DW=m
CONFIG_SERIAL_8250_EM=m
CONFIG_SERIAL_8250_IOC3=m
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_LPC18XX=m
# CONFIG_SERIAL_8250_MT6577 is not set
CONFIG_SERIAL_8250_UNIPHIER=m
# CONFIG_SERIAL_8250_INGENIC is not set
# CONFIG_SERIAL_8250_PXA is not set
# CONFIG_SERIAL_8250_TEGRA is not set
CONFIG_SERIAL_8250_BCM7271=m
CONFIG_SERIAL_OF_PLATFORM=m

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_AMBA_PL011 is not set
CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST=y
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
CONFIG_SERIAL_ATMEL_PDC=y
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_MESON=y
CONFIG_SERIAL_MESON_CONSOLE=y
CONFIG_SERIAL_CLPS711X=y
# CONFIG_SERIAL_CLPS711X_CONSOLE is not set
CONFIG_SERIAL_SAMSUNG=m
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
# CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
# CONFIG_SERIAL_TEGRA is not set
# CONFIG_SERIAL_TEGRA_TCU is not set
CONFIG_SERIAL_MAX3100=y
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=y
CONFIG_SERIAL_IMX_CONSOLE=y
# CONFIG_SERIAL_IMX_EARLYCON is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_HS_LPC32XX=m
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_QCOM_GENI is not set
CONFIG_SERIAL_VT8500=y
CONFIG_SERIAL_VT8500_CONSOLE=y
CONFIG_SERIAL_OMAP=m
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_QE=y
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_SC16IS7XX_SPI=y
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
CONFIG_SERIAL_ALTERA_JTAGUART=m
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_MPS2_UART_CONSOLE is not set
CONFIG_SERIAL_MPS2_UART=y
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
CONFIG_SERIAL_ST_ASC=m
CONFIG_SERIAL_MEN_Z135=m
# CONFIG_SERIAL_SPRD is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_SERIAL_OWL=m
# CONFIG_SERIAL_RDA is not set
CONFIG_SERIAL_MILBEAUT_USIO=m
CONFIG_SERIAL_MILBEAUT_USIO_PORTS=4
# CONFIG_SERIAL_LITEUART is not set
# CONFIG_SERIAL_SUNPLUS is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
CONFIG_N_GSM=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_HVC_DCC=y
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
CONFIG_IPMI_KCS_BMC_SERIO=y
CONFIG_ASPEED_BT_IPMI_BMC=m
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_ATMEL=y
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_IPROC_RNG200=m
# CONFIG_HW_RANDOM_IXP4XX is not set
# CONFIG_HW_RANDOM_OMAP is not set
CONFIG_HW_RANDOM_OMAP3_ROM=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_IMX_RNGC=y
CONFIG_HW_RANDOM_NOMADIK=m
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_POLARFIRE_SOC=m
# CONFIG_HW_RANDOM_MESON is not set
# CONFIG_HW_RANDOM_MTK is not set
CONFIG_HW_RANDOM_EXYNOS=m
CONFIG_HW_RANDOM_NPCM=m
CONFIG_HW_RANDOM_KEYSTONE=m
CONFIG_HW_RANDOM_CCTRNG=y
CONFIG_HW_RANDOM_XIPHERA=y

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_CARDMAN_4000 is not set
CONFIG_CARDMAN_4040=m
# CONFIG_SCR24X is not set
CONFIG_IPWIRELESS=m
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=m
CONFIG_XILLYBUS=m
CONFIG_XILLYBUS_OF=m
# CONFIG_XILLYUSB is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=m
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ALTERA=y
CONFIG_I2C_ASPEED=m
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=m
CONFIG_I2C_AXXIA=m
CONFIG_I2C_BCM2835=y
CONFIG_I2C_BCM_IPROC=y
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=m
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_HIGHLANDER=m
CONFIG_I2C_HISI=y
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=m
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_IOP3XX=y
CONFIG_I2C_JZ4780=m
CONFIG_I2C_LPC2K=m
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
CONFIG_I2C_MT65XX=m
# CONFIG_I2C_MT7621 is not set
CONFIG_I2C_MV64XXX=m
CONFIG_I2C_MXS=m
# CONFIG_I2C_NOMADIK is not set
CONFIG_I2C_NPCM=m
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=y
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=m
CONFIG_I2C_PXA_SLAVE=y
CONFIG_I2C_QCOM_CCI=m
CONFIG_I2C_QCOM_GENI=m
# CONFIG_I2C_QUP is not set
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_RZV2M=m
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=m
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=m
# CONFIG_I2C_STM32F7 is not set
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_TEGRA=y
CONFIG_I2C_TEGRA_BPMP=m
# CONFIG_I2C_UNIPHIER is not set
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=m
CONFIG_I2C_WMT=m
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_CP2615=y
CONFIG_I2C_ROBOTFUZZ_OSIF=m
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_FSI is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_SLAVE_TESTUNIT=m
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
# CONFIG_CDNS_I3C_MASTER is not set
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=m
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
CONFIG_SPI_ALTERA_CORE=y
CONFIG_SPI_AR934X=y
# CONFIG_SPI_ATH79 is not set
CONFIG_SPI_ARMADA_3700=y
CONFIG_SPI_ASPEED_SMC=y
CONFIG_SPI_ATMEL=y
CONFIG_SPI_AT91_USART=m
# CONFIG_SPI_ATMEL_QUADSPI is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835 is not set
CONFIG_SPI_BCM2835AUX=m
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=m
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_CADENCE_QUADSPI=m
CONFIG_SPI_CADENCE_XSPI=y
CONFIG_SPI_CLPS711X=m
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_EP93XX is not set
# CONFIG_SPI_FSI is not set
# CONFIG_SPI_FSL_LPSPI is not set
CONFIG_SPI_FSL_QUADSPI=m
CONFIG_SPI_GXP=y
CONFIG_SPI_HISI_KUNPENG=y
# CONFIG_SPI_HISI_SFC_V3XX is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
CONFIG_SPI_GPIO=y
CONFIG_SPI_IMG_SPFI=m
CONFIG_SPI_IMX=m
CONFIG_SPI_INGENIC=y
CONFIG_SPI_INTEL=m
CONFIG_SPI_INTEL_PLATFORM=m
CONFIG_SPI_JCORE=m
# CONFIG_SPI_LP8841_RTC is not set
# CONFIG_SPI_FSL_SPI is not set
CONFIG_SPI_FSL_DSPI=m
CONFIG_SPI_MESON_SPICC=m
CONFIG_SPI_MESON_SPIFC=y
CONFIG_SPI_MICROCHIP_CORE=y
CONFIG_SPI_MICROCHIP_CORE_QSPI=y
CONFIG_SPI_MT65XX=y
CONFIG_SPI_MT7621=m
CONFIG_SPI_MTK_NOR=m
CONFIG_SPI_NPCM_FIU=m
CONFIG_SPI_NPCM_PSPI=m
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_OMAP_UWIRE=y
CONFIG_SPI_OMAP24XX=m
CONFIG_SPI_TI_QSPI=y
# CONFIG_SPI_OMAP_100K is not set
CONFIG_SPI_ORION=y
# CONFIG_SPI_PIC32 is not set
CONFIG_SPI_PIC32_SQI=y
# CONFIG_SPI_PL022 is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
CONFIG_SPI_ROCKCHIP_SFC=y
CONFIG_SPI_RPCIF=y
CONFIG_SPI_RSPI=y
CONFIG_SPI_QUP=m
# CONFIG_SPI_QCOM_GENI is not set
CONFIG_SPI_S3C64XX=m
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SH_MSIOF is not set
CONFIG_SPI_SH=y
CONFIG_SPI_SH_HSPI=y
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SLAVE_MT27XX=y
# CONFIG_SPI_SPRD is not set
# CONFIG_SPI_SPRD_ADI is not set
CONFIG_SPI_STM32=m
CONFIG_SPI_STM32_QSPI=y
# CONFIG_SPI_ST_SSC4 is not set
CONFIG_SPI_SUN4I=y
CONFIG_SPI_SUN6I=m
CONFIG_SPI_SUNPLUS_SP7021=m
CONFIG_SPI_SYNQUACER=m
# CONFIG_SPI_MXIC is not set
CONFIG_SPI_TEGRA210_QUAD=m
CONFIG_SPI_TEGRA114=y
# CONFIG_SPI_TEGRA20_SFLASH is not set
# CONFIG_SPI_TEGRA20_SLINK is not set
# CONFIG_SPI_UNIPHIER is not set
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
# CONFIG_SPI_XLP is not set
CONFIG_SPI_XTENSA_XTFPGA=y
CONFIG_SPI_ZYNQ_QSPI=y
CONFIG_SPI_ZYNQMP_GQSPI=y
CONFIG_SPI_AMD=y

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_LOOPBACK_TEST=m
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#
CONFIG_OMAP_SSI=m

#
# HSI clients
#
# CONFIG_NOKIA_MODEM is not set
CONFIG_CMT_SPEECH=m
CONFIG_SSI_PROTOCOL=m
# CONFIG_HSI_CHAR is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AS3722=m
# CONFIG_PINCTRL_AT91PIO4 is not set
CONFIG_PINCTRL_BM1880=y
CONFIG_PINCTRL_CY8C95X0=m
CONFIG_PINCTRL_DA850_PUPD=y
# CONFIG_PINCTRL_DA9062 is not set
CONFIG_PINCTRL_EQUILIBRIUM=y
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_PALMAS=y
# CONFIG_PINCTRL_PISTACHIO is not set
# CONFIG_PINCTRL_ROCKCHIP is not set
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=m
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_OWL=y
CONFIG_PINCTRL_S500=y
CONFIG_PINCTRL_S700=y
# CONFIG_PINCTRL_S900 is not set
CONFIG_PINCTRL_ASPEED=y
CONFIG_PINCTRL_ASPEED_G4=y
CONFIG_PINCTRL_ASPEED_G5=y
CONFIG_PINCTRL_ASPEED_G6=y
CONFIG_PINCTRL_BCM281XX=y
CONFIG_PINCTRL_BCM2835=m
CONFIG_PINCTRL_BCM4908=m
CONFIG_PINCTRL_BCM63XX=y
CONFIG_PINCTRL_BCM6318=y
CONFIG_PINCTRL_BCM6328=y
CONFIG_PINCTRL_BCM6358=y
# CONFIG_PINCTRL_BCM6362 is not set
CONFIG_PINCTRL_BCM6368=y
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
CONFIG_PINCTRL_BERLIN_BG4CT=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L92=y
CONFIG_PINCTRL_IMX=y
CONFIG_PINCTRL_IMX7D=y
CONFIG_PINCTRL_IMX8ULP=y
CONFIG_PINCTRL_IMXRT1050=y
# CONFIG_PINCTRL_IMX93 is not set
CONFIG_PINCTRL_IMXRT1170=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
CONFIG_PINCTRL_MT8127=y
CONFIG_PINCTRL_MT2712=y
# CONFIG_PINCTRL_MT6765 is not set
# CONFIG_PINCTRL_MT6779 is not set
CONFIG_PINCTRL_MT6795=y
CONFIG_PINCTRL_MT6797=y
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT7986 is not set
CONFIG_PINCTRL_MT8167=y
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
CONFIG_PINCTRL_MT8186=y
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
CONFIG_PINCTRL_MT8195=y
# CONFIG_PINCTRL_MT8365 is not set
CONFIG_PINCTRL_MT8516=y
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

# CONFIG_PINCTRL_MESON is not set
CONFIG_PINCTRL_WPCM450=y
CONFIG_PINCTRL_NPCM7XX=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=m
CONFIG_PINCTRL_PXA27X=y
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_APQ8064=m
CONFIG_PINCTRL_APQ8084=y
CONFIG_PINCTRL_IPQ4019=m
CONFIG_PINCTRL_IPQ8064=m
CONFIG_PINCTRL_IPQ8074=y
# CONFIG_PINCTRL_IPQ6018 is not set
CONFIG_PINCTRL_MSM8226=y
# CONFIG_PINCTRL_MSM8660 is not set
# CONFIG_PINCTRL_MSM8960 is not set
CONFIG_PINCTRL_MDM9607=y
CONFIG_PINCTRL_MDM9615=m
CONFIG_PINCTRL_MSM8X74=y
CONFIG_PINCTRL_MSM8909=y
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8953 is not set
CONFIG_PINCTRL_MSM8976=y
# CONFIG_PINCTRL_MSM8994 is not set
CONFIG_PINCTRL_MSM8996=m
# CONFIG_PINCTRL_MSM8998 is not set
CONFIG_PINCTRL_QCM2290=y
CONFIG_PINCTRL_QCS404=y
CONFIG_PINCTRL_QCOM_SSBI_PMIC=m
CONFIG_PINCTRL_SC7180=m
# CONFIG_PINCTRL_SC7280 is not set
CONFIG_PINCTRL_SC8180X=y
# CONFIG_PINCTRL_SC8280XP is not set
CONFIG_PINCTRL_SDM660=m
CONFIG_PINCTRL_SDM845=m
CONFIG_PINCTRL_SDX55=m
CONFIG_PINCTRL_SM6115=m
CONFIG_PINCTRL_SM6125=m
CONFIG_PINCTRL_SM6350=m
CONFIG_PINCTRL_SM6375=m
CONFIG_PINCTRL_SDX65=y
CONFIG_PINCTRL_SM8150=y
CONFIG_PINCTRL_SM8250=m
CONFIG_PINCTRL_SM8350=y
CONFIG_PINCTRL_SM8450=m
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A779F0=y
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
CONFIG_PINCTRL_PFC_R8A77970=y
CONFIG_PINCTRL_PFC_R8A779A0=y
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A73A4=y
# CONFIG_PINCTRL_RZA1 is not set
CONFIG_PINCTRL_RZA2=y
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
CONFIG_PINCTRL_PFC_R8A774E1=y
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
CONFIG_PINCTRL_PFC_SH7264=y
# CONFIG_PINCTRL_PFC_SH7269 is not set
CONFIG_PINCTRL_PFC_SH7720=y
# CONFIG_PINCTRL_PFC_SH7722 is not set
CONFIG_PINCTRL_PFC_SH7734=y
CONFIG_PINCTRL_PFC_SH7757=y
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
CONFIG_PINCTRL_S3C64XX=y
# CONFIG_PINCTRL_SPRD_SC9860 is not set
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
# CONFIG_PINCTRL_STM32F469 is not set
CONFIG_PINCTRL_STM32F746=y
# CONFIG_PINCTRL_STM32F769 is not set
CONFIG_PINCTRL_STM32H743=y
CONFIG_PINCTRL_STM32MP135=y
CONFIG_PINCTRL_STM32MP157=y
CONFIG_PINCTRL_TI_IODELAY=y
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
CONFIG_PINCTRL_UNIPHIER_SLD8=y
CONFIG_PINCTRL_UNIPHIER_PRO5=y
CONFIG_PINCTRL_UNIPHIER_PXS2=y
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
CONFIG_PINCTRL_UNIPHIER_PXS3=y
# CONFIG_PINCTRL_UNIPHIER_NX1 is not set
CONFIG_PINCTRL_VISCONTI=y
CONFIG_PINCTRL_TMPV7700=y
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=m
CONFIG_GPIO_ASPEED=y
CONFIG_GPIO_ASPEED_SGPIO=y
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=m
# CONFIG_GPIO_BCM_KONA is not set
CONFIG_GPIO_BCM_XGS_IPROC=m
CONFIG_GPIO_BRCMSTB=y
CONFIG_GPIO_CADENCE=y
CONFIG_GPIO_CLPS711X=m
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=m
CONFIG_GPIO_HISI=m
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_IMX_SCU=y
CONFIG_GPIO_IOP=y
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_LPC18XX=y
CONFIG_GPIO_LPC32XX=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
CONFIG_GPIO_OMAP=y
CONFIG_GPIO_PL061=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_PXA=y
CONFIG_GPIO_RCAR=y
CONFIG_GPIO_RDA=y
CONFIG_GPIO_ROCKCHIP=y
CONFIG_GPIO_SAMA5D2_PIOBU=m
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SNPS_CREG=y
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
CONFIG_GPIO_TEGRA186=y
CONFIG_GPIO_TS4800=m
# CONFIG_GPIO_UNIPHIER is not set
CONFIG_GPIO_VF610=y
# CONFIG_GPIO_VISCONTI is not set
CONFIG_GPIO_WCD934X=m
CONFIG_GPIO_XGENE_SB=y
CONFIG_GPIO_XILINX=m
CONFIG_GPIO_XLP=m
# CONFIG_GPIO_ZEVIO is not set
# CONFIG_GPIO_AMD_FCH is not set
CONFIG_GPIO_IDT3243X=m
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=m
CONFIG_GPIO_GW_PLD=m
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
CONFIG_GPIO_CRYSTAL_COVE=y
CONFIG_GPIO_DA9055=y
CONFIG_HTC_EGPIO=y
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_LP87565=m
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_SL28CPLD=m
CONFIG_GPIO_TPS65086=m
# CONFIG_GPIO_TPS65218 is not set
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65912 is not set
# CONFIG_GPIO_TWL6040 is not set
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8350 is not set
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=m
CONFIG_GPIO_MAX3191X=y
CONFIG_GPIO_MAX7301=m
CONFIG_GPIO_MC33880=m
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=m
CONFIG_GPIO_MOXTET=m
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=m
CONFIG_W1_MASTER_DS2482=m
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=m
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS250X=m
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_AS3722 is not set
CONFIG_POWER_RESET_ATC260X=m
CONFIG_POWER_RESET_BRCMKONA=y
CONFIG_POWER_RESET_BRCMSTB=y
CONFIG_POWER_RESET_GEMINI_POWEROFF=y
CONFIG_POWER_RESET_GPIO=y
CONFIG_POWER_RESET_GPIO_RESTART=y
CONFIG_POWER_RESET_LINKSTATION=m
CONFIG_POWER_RESET_OCELOT_RESET=y
CONFIG_POWER_RESET_LTC2952=y
CONFIG_POWER_RESET_REGULATOR=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_TPS65086=y
CONFIG_POWER_RESET_VERSATILE=y
CONFIG_POWER_RESET_VEXPRESS=y
# CONFIG_POWER_RESET_KEYSTONE is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
CONFIG_POWER_RESET_RMOBILE=m
CONFIG_REBOOT_MODE=m
# CONFIG_SYSCON_REBOOT_MODE is not set
CONFIG_POWER_RESET_SC27XX=y
CONFIG_NVMEM_REBOOT_MODE=m
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=y
CONFIG_WM831X_BACKUP=m
CONFIG_WM831X_POWER=m
CONFIG_WM8350_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=m
# CONFIG_BATTERY_CPCAP is not set
CONFIG_BATTERY_CW2015=m
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_LEGO_EV3=y
CONFIG_BATTERY_SAMSUNG_SDI=y
# CONFIG_BATTERY_INGENIC is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=m
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_MAX17040=m
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_CPCAP=m
CONFIG_CHARGER_ISP1704=m
CONFIG_CHARGER_MAX8903=m
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77650 is not set
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_MAX8997=m
CONFIG_CHARGER_MT6370=m
CONFIG_CHARGER_QCOM_SMBB=y
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=m
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65217 is not set
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=y
CONFIG_FUEL_GAUGE_SC27XX=m
CONFIG_CHARGER_UCS1002=y
CONFIG_CHARGER_BD99954=m
# CONFIG_RN5T618_POWER is not set
# CONFIG_BATTERY_ACER_A500 is not set
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=m
CONFIG_SENSORS_AD7414=m
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7310=m
CONFIG_SENSORS_ADT7410=m
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_ARM_SCMI=m
CONFIG_SENSORS_ARM_SCPI=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_BT1_PVT=m
CONFIG_SENSORS_BT1_PVT_ALARMS=y
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DRIVETEMP=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DA9055=m
CONFIG_SENSORS_SPARX5=m
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_GPIO_FAN=m
CONFIG_SENSORS_HIH6130=m
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LAN966X=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2947_SPI=m
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX1111=m
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6642=m
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_MLXREG_FAN is not set
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_ADCXX=m
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=m
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
CONFIG_SENSORS_NCT6775_I2C=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_NZXT_KRAKEN2=m
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_OCC_P9_SBE=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
CONFIG_SENSORS_ADM1266=m
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
# CONFIG_SENSORS_DPS920AB is not set
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
# CONFIG_SENSORS_LTC2978 is not set
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
# CONFIG_SENSORS_MP2975 is not set
CONFIG_SENSORS_MP5023=m
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=m
CONFIG_SENSORS_PLI1209BC_REGULATOR=y
CONFIG_SENSORS_PM6764TR=m
# CONFIG_SENSORS_PXE1610 is not set
CONFIG_SENSORS_Q54SJ108A2=m
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
CONFIG_SENSORS_XDPE122=m
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
# CONFIG_SENSORS_ZL6100 is not set
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_RASPBERRYPI_HWMON=m
CONFIG_SENSORS_SL28CPLD=m
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SY7636A=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VEXPRESS=m
CONFIG_SENSORS_VT1211=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM831X=m
CONFIG_SENSORS_WM8350=m
CONFIG_SENSORS_INTEL_M10_BMC_HWMON=m
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
CONFIG_BCMA_SFLASH=y
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
CONFIG_MFD_SUN4I_GPADC=m
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=m
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=m
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_ENE_KB3930 is not set
CONFIG_MFD_EXYNOS_LPASS=m
# CONFIG_MFD_GATEWORKS_GSC is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=m
CONFIG_MFD_HI6421_PMIC=m
CONFIG_MFD_HI655X_PMIC=y
# CONFIG_HTC_PASIC3 is not set
CONFIG_HTC_I2CPLD=y
CONFIG_INTEL_SOC_PMIC=y
CONFIG_MFD_IQS62X=m
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77714 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6370=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_OCELOT=m
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_CPCAP=m
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=m
# CONFIG_MFD_PCF50633 is not set
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SY7636A=m
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RT5120=m
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SL28CPLD=m
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SC27XX_PMIC=y
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_OMAP_USB_HOST=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=m
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=y
CONFIG_MFD_TPS65218=m
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
CONFIG_MFD_TPS65912_SPI=m
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TMIO=y
# CONFIG_MFD_T7L66XB is not set
CONFIG_MFD_TC6387XB=y
CONFIG_MFD_TC6393XB=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_LOCHNAGAR is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=m
CONFIG_MFD_ROHM_BD718XX=m
# CONFIG_MFD_ROHM_BD71828 is not set
CONFIG_MFD_ROHM_BD957XMUF=m
CONFIG_MFD_STM32_LPTIMER=m
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STPMIC1 is not set
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=m
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
CONFIG_MFD_KHADAS_MCU=m
CONFIG_MFD_ACER_A500_EC=m
CONFIG_MFD_QCOM_PM8008=m
CONFIG_MFD_VEXPRESS_SYSREG=m
CONFIG_MFD_INTEL_M10_BMC=m
CONFIG_MFD_RSMU_I2C=y
CONFIG_MFD_RSMU_SPI=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_ACT8945A=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_ARM_SCMI=y
CONFIG_REGULATOR_AS3722=m
CONFIG_REGULATOR_ATC260X=m
# CONFIG_REGULATOR_BD718XX is not set
CONFIG_REGULATOR_BD957XMUF=m
# CONFIG_REGULATOR_CPCAP is not set
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=m
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_FAN53880=y
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_HI6421 is not set
CONFIG_REGULATOR_HI6421V530=m
CONFIG_REGULATOR_HI655X=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP873X=m
CONFIG_REGULATOR_LP8755=m
# CONFIG_REGULATOR_LP87565 is not set
CONFIG_REGULATOR_LTC3589=m
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=m
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX77620=m
CONFIG_REGULATOR_MAX77650=m
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=m
# CONFIG_REGULATOR_MAX8907 is not set
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX8997=m
CONFIG_REGULATOR_MAX20086=y
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=m
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MAX77826=m
# CONFIG_REGULATOR_MC13783 is not set
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MCP16502=y
# CONFIG_REGULATOR_MP5416 is not set
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MP886X=m
CONFIG_REGULATOR_MPQ7920=m
CONFIG_REGULATOR_MT6311=m
# CONFIG_REGULATOR_MT6370 is not set
CONFIG_REGULATOR_MT6380=m
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PBIAS=y
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PF8X00=m
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_RPMH=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=m
CONFIG_REGULATOR_RN5T618=m
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT5120=m
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
# CONFIG_REGULATOR_RTQ6752 is not set
CONFIG_REGULATOR_S2MPA01=m
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
CONFIG_REGULATOR_SC2731=m
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_TI_ABB=y
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY7636A=m
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=m
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS6286X=m
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=m
# CONFIG_REGULATOR_TPS65218 is not set
CONFIG_REGULATOR_TPS6524X=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65912=m
# CONFIG_REGULATOR_TPS68470 is not set
# CONFIG_REGULATOR_UNIPHIER is not set
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_VEXPRESS=m
CONFIG_REGULATOR_WM831X=m
CONFIG_REGULATOR_WM8350=m
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_WM8994=m
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y
# end of Media core support

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_NET is not set
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#

#
# Analog TV USB devices
#

#
# Analog/digital TV USB devices
#

#
# Digital TV USB devices
#
CONFIG_DVB_AS102=m
CONFIG_DVB_B2C2_FLEXCOP_USB=m
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
CONFIG_DVB_USB_V2=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
CONFIG_DVB_USB_ANYSEE=m
# CONFIG_DVB_USB_AU6610 is not set
# CONFIG_DVB_USB_AZ6007 is not set
# CONFIG_DVB_USB_CE6230 is not set
# CONFIG_DVB_USB_DVBSKY is not set
# CONFIG_DVB_USB_EC168 is not set
CONFIG_DVB_USB_GL861=m
# CONFIG_DVB_USB_MXL111SF is not set
CONFIG_DVB_USB_RTL28XXU=m
# CONFIG_DVB_USB_ZD1301 is not set
CONFIG_SMS_USB_DRV=m

#
# Webcam, TV (analog/digital) USB devices
#

#
# Software defined radio USB devices
#
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=m
# CONFIG_DVB_TEST_DRIVERS is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_DEBUGFS=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_IT913X=m
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=m
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_MT2266=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=m
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_STB0899 is not set
CONFIG_DVB_STB6100=y
CONFIG_DVB_STV090x=y
# CONFIG_DVB_STV0910 is not set
CONFIG_DVB_STV6110x=y
CONFIG_DVB_STV6111=y

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=y
CONFIG_DVB_SI2165=y
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=y
CONFIG_DVB_CX24120=y
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=y
CONFIG_DVB_MB86A16=m
CONFIG_DVB_MT312=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_STB6000=y
CONFIG_DVB_STV0288=m
CONFIG_DVB_STV0299=y
CONFIG_DVB_STV0900=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_TDA10071=y
# CONFIG_DVB_TDA10086 is not set
# CONFIG_DVB_TDA8083 is not set
# CONFIG_DVB_TDA8261 is not set
# CONFIG_DVB_TDA826X is not set
CONFIG_DVB_TS2020=m
CONFIG_DVB_TUA6100=y
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_ZL10036=y
# CONFIG_DVB_ZL10039 is not set

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=m
CONFIG_DVB_AS102_FE=m
CONFIG_DVB_CX22700=y
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=y
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=m
# CONFIG_DVB_DIB7000M is not set
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=y
CONFIG_DVB_DRXD=y
# CONFIG_DVB_EC100 is not set
CONFIG_DVB_L64781=m
CONFIG_DVB_MT352=m
CONFIG_DVB_NXT6000=y
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=m
CONFIG_DVB_S5H1432=y
CONFIG_DVB_SI2168=m
CONFIG_DVB_SP887X=y
# CONFIG_DVB_STV0367 is not set
# CONFIG_DVB_TDA10048 is not set
# CONFIG_DVB_TDA1004X is not set
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_ZL10353=m
CONFIG_DVB_CXD2880=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=y
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_VES1820=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=y
CONFIG_DVB_AU8522_DTV=y
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LG2160=y
# CONFIG_DVB_LGDT3305 is not set
# CONFIG_DVB_LGDT3306A is not set
CONFIG_DVB_LGDT330X=m
# CONFIG_DVB_MXL692 is not set
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51132=y
CONFIG_DVB_OR51211=y
CONFIG_DVB_S5H1409=y
CONFIG_DVB_S5H1411=y

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=y
CONFIG_DVB_S921=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_MN88443X is not set
CONFIG_DVB_TC90522=y

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
CONFIG_DVB_TUNER_DIB0070=m
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_AF9033=m
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=y
CONFIG_DVB_HORUS3A=y
# CONFIG_DVB_ISL6405 is not set
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
# CONFIG_DVB_IX2505V is not set
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBH29=y
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_M88RS2000=y
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=y
CONFIG_TEGRA_HOST1X=y
CONFIG_TEGRA_HOST1X_FIREWALL=y
CONFIG_IMX_IPUV3_CORE=m
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_KUNIT_TEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_GEM_DMA_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# CONFIG_DRM_HDLCD is not set
CONFIG_DRM_MALI_DISPLAY=m
CONFIG_DRM_KOMEDA=m
# end of ARM devices

CONFIG_DRM_KMB_DISPLAY=m
CONFIG_DRM_ATMEL_HLCDC=y
CONFIG_DRM_RCAR_DU=y
CONFIG_DRM_RCAR_USE_CMM=y
CONFIG_DRM_RCAR_CMM=y
CONFIG_DRM_RCAR_DW_HDMI=y
# CONFIG_DRM_RCAR_USE_LVDS is not set
# CONFIG_DRM_RCAR_MIPI_DSI is not set
# CONFIG_DRM_SHMOBILE is not set
# CONFIG_DRM_SUN4I is not set
CONFIG_DRM_TILCDC=y
# CONFIG_DRM_FSL_DCU is not set
CONFIG_DRM_TEGRA=y
# CONFIG_DRM_TEGRA_DEBUG is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ABT_Y030XX067A=m
CONFIG_DRM_PANEL_ARM_VERSATILE=m
# CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
CONFIG_DRM_PANEL_BOE_HIMAX8279D=m
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_DSI_CM=m
CONFIG_DRM_PANEL_LVDS=y
CONFIG_DRM_PANEL_SIMPLE=y
CONFIG_DRM_PANEL_EDP=m
CONFIG_DRM_PANEL_EBBG_FT8719=y
# CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
CONFIG_DRM_PANEL_ILITEK_IL9322=m
CONFIG_DRM_PANEL_ILITEK_ILI9341=y
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
CONFIG_DRM_PANEL_INNOLUX_EJ030NA=y
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=m
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_JDI_R63452=y
CONFIG_DRM_PANEL_KHADAS_TS050=m
# CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
CONFIG_DRM_PANEL_LG_LB035Q02=y
# CONFIG_DRM_PANEL_LG_LG4573 is not set
CONFIG_DRM_PANEL_NEC_NL8048HL11=m
# CONFIG_DRM_PANEL_NEWVISION_NV3052C is not set
CONFIG_DRM_PANEL_NOVATEK_NT35510=m
CONFIG_DRM_PANEL_NOVATEK_NT35560=m
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
CONFIG_DRM_PANEL_NOVATEK_NT39016=y
# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=m
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
CONFIG_DRM_PANEL_SAMSUNG_DB7430=y
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=y
CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=m
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=y
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=m
# CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7703=y
CONFIG_DRM_PANEL_SITRONIX_ST7789V=m
CONFIG_DRM_PANEL_SONY_ACX565AKM=m
# CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521 is not set
CONFIG_DRM_PANEL_TDO_TL070WSH30=m
CONFIG_DRM_PANEL_TPO_TD028TTEC1=y
# CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
CONFIG_DRM_PANEL_TPO_TPG110=m
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_CDNS_DSI is not set
CONFIG_DRM_CHIPONE_ICN6211=y
# CONFIG_DRM_CHRONTEL_CH7033 is not set
CONFIG_DRM_CROS_EC_ANX7688=m
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_FSL_LDB=m
CONFIG_DRM_ITE_IT6505=y
# CONFIG_DRM_LONTIUM_LT8912B is not set
CONFIG_DRM_LONTIUM_LT9211=m
# CONFIG_DRM_LONTIUM_LT9611 is not set
CONFIG_DRM_LONTIUM_LT9611UXC=m
CONFIG_DRM_ITE_IT66121=y
CONFIG_DRM_LVDS_CODEC=m
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NWL_MIPI_DSI=m
CONFIG_DRM_NXP_PTN3460=m
# CONFIG_DRM_PARADE_PS8622 is not set
CONFIG_DRM_PARADE_PS8640=y
CONFIG_DRM_SIL_SII8620=m
CONFIG_DRM_SII902X=y
# CONFIG_DRM_SII9234 is not set
CONFIG_DRM_SIMPLE_BRIDGE=y
# CONFIG_DRM_THINE_THC63LVD1024 is not set
CONFIG_DRM_TOSHIBA_TC358762=m
# CONFIG_DRM_TOSHIBA_TC358764 is not set
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TOSHIBA_TC358768=m
# CONFIG_DRM_TOSHIBA_TC358775 is not set
# CONFIG_DRM_TI_DLPC3433 is not set
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
CONFIG_DRM_TI_SN65DSI86=y
CONFIG_DRM_TI_TPD12S015=y
CONFIG_DRM_ANALOGIX_ANX6345=m
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
CONFIG_DRM_ANALOGIX_ANX7625=m
CONFIG_DRM_I2C_ADV7511=m
# CONFIG_DRM_I2C_ADV7511_CEC is not set
# CONFIG_DRM_CDNS_MHDP8546 is not set
CONFIG_DRM_IMX8QM_LDB=y
# CONFIG_DRM_IMX8QXP_LDB is not set
# CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
# CONFIG_DRM_IMX8QXP_PIXEL_LINK is not set
CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI=y
CONFIG_DRM_DW_HDMI=y
CONFIG_DRM_DW_HDMI_CEC=y
# end of Display Interface Bridges

# CONFIG_DRM_IMX is not set
CONFIG_DRM_LOGICVC=y
# CONFIG_DRM_MXSFB is not set
# CONFIG_DRM_IMX_LCDIF is not set
CONFIG_DRM_MESON=y
# CONFIG_DRM_MESON_DW_HDMI is not set
CONFIG_DRM_ARCPGU=y
# CONFIG_DRM_PANEL_MIPI_DBI is not set
CONFIG_TINYDRM_HX8357D=y
CONFIG_TINYDRM_ILI9163=y
CONFIG_TINYDRM_ILI9225=y
CONFIG_TINYDRM_ILI9341=y
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
CONFIG_TINYDRM_REPAPER=m
CONFIG_TINYDRM_ST7586=y
CONFIG_TINYDRM_ST7735R=m
# CONFIG_DRM_PL111 is not set
CONFIG_DRM_TIDSS=y
CONFIG_DRM_SPRD=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
# CONFIG_FB is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_L4F00242T03=m
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=m
CONFIG_LCD_TDO24M=m
CONFIG_LCD_VGG2432A4=m
CONFIG_LCD_PLATFORM=m
CONFIG_LCD_AMS369FG06=m
CONFIG_LCD_LMS501KF03=m
# CONFIG_LCD_HX8357 is not set
CONFIG_LCD_OTM3225A=m
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_MT6370=y
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_WM831X=m
CONFIG_BACKLIGHT_ADP5520=y
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_TPS65217 is not set
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_LED=m
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
# end of Console display driver support
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=m
CONFIG_HID_APPLEIR=y
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
# CONFIG_HID_BETOP_FF is not set
CONFIG_HID_BIGBEN_FF=y
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CP2112=m
CONFIG_HID_CREATIVE_SB0540=m
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
CONFIG_HID_ELO=m
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_FT260 is not set
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
# CONFIG_HID_KYE is not set
CONFIG_HID_UCLOGIC=m
# CONFIG_HID_WALTOP is not set
CONFIG_HID_VIEWSONIC=m
CONFIG_HID_VRC2=y
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LETSKETCH=y
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_DJ=y
CONFIG_HID_LOGITECH_HIDPP=y
# CONFIG_LOGITECH_FF is not set
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_MEGAWORLD_FF=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NINTENDO=m
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PXRC=m
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SEMITEK=y
CONFIG_HID_SIGMAMICRO=m
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=y
# CONFIG_HID_TOPSEED is not set
CONFIG_HID_TOPRE=y
# CONFIG_HID_THINGM is not set
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=m
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=y
CONFIG_HID_MCP2221=y
# CONFIG_HID_KUNIT_TEST is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_OF=m
CONFIG_I2C_HID_OF_ELAN=m
CONFIG_I2C_HID_OF_GOODIX=m
# end of I2C HID support

CONFIG_I2C_HID_CORE=m
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_DBGCAP=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_XHCI_HISTB=m
CONFIG_USB_XHCI_MTK=m
CONFIG_USB_XHCI_MVEBU=m
# CONFIG_USB_XHCI_RCAR is not set
CONFIG_USB_BRCMSTB=m
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=m
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_SPEAR=m
# CONFIG_USB_OHCI_HCD_STI is not set
CONFIG_USB_OHCI_HCD_S3C2410=m
CONFIG_USB_OHCI_HCD_LPC32XX=m
CONFIG_USB_OHCI_HCD_AT91=m
CONFIG_USB_OHCI_HCD_OMAP3=m
CONFIG_USB_OHCI_HCD_DAVINCI=m
CONFIG_USB_OHCI_HCD_SSB=y
# CONFIG_USB_OHCI_SH is not set
CONFIG_USB_OHCI_EXYNOS=m
# CONFIG_USB_CNS3XXX_OHCI is not set
CONFIG_USB_OHCI_HCD_PLATFORM=m
CONFIG_USB_U132_HCD=m
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
CONFIG_USBIP_CORE=y
# CONFIG_USBIP_VHCI_HCD is not set
CONFIG_USBIP_HOST=y
# CONFIG_USBIP_DEBUG is not set
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS3=y
# CONFIG_USB_CDNS3_HOST is not set
CONFIG_USB_CDNS3_TI=y
CONFIG_USB_CDNS3_IMX=y
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
# CONFIG_USB_SERIAL_BELKIN is not set
CONFIG_USB_SERIAL_CH341=y
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
CONFIG_USB_SERIAL_CYPRESS_M8=m
# CONFIG_USB_SERIAL_EMPEG is not set
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=y
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=y
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=m
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
# CONFIG_USB_SERIAL_SAFE is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=m
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=m
# CONFIG_USB_SERIAL_SSU100 is not set
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=m
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=y
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=m
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_QCOM_EUD=y
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=m
# CONFIG_USB_IOWARRIOR is not set
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=m
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=y
# CONFIG_BRCM_USB_PINMAP is not set
# CONFIG_USB_ONBOARD_HUB is not set
CONFIG_USB_ATM=m
CONFIG_USB_SPEEDTOUCH=m
CONFIG_USB_CXACRU=m
CONFIG_USB_UEAGLEATM=m
CONFIG_USB_XUSBATM=m

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_ISP1301_OMAP=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=m
# CONFIG_AM335X_PHY_USB is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_TAHVO_USB=m
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_MXS_PHY=m
# CONFIG_USB_TEGRA_PHY is not set
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=m
# CONFIG_TYPEC_TCPCI is not set
# CONFIG_TYPEC_FUSB302 is not set
# CONFIG_TYPEC_UCSI is not set
CONFIG_TYPEC_TPS6598X=m
CONFIG_TYPEC_ANX7411=y
CONFIG_TYPEC_RT1719=y
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_STUSB160X=m
CONFIG_TYPEC_QCOM_PMIC=m
CONFIG_TYPEC_WUSB3801=m

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=m
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=m
# CONFIG_TYPEC_NVIDIA_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=m
# CONFIG_PWRSEQ_EMMC is not set
CONFIG_PWRSEQ_SD8787=m
CONFIG_PWRSEQ_SIMPLE=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=m
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_ARMMMCI=m
# CONFIG_MMC_QCOM_DML is not set
CONFIG_MMC_STM32_SDMMC=y
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_SDHCI_S3C is not set
CONFIG_MMC_SDHCI_SPEAR=m
CONFIG_MMC_MESON_GX=m
CONFIG_MMC_MESON_MX_SDHC=m
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_MOXART=m
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_MXC=m
CONFIG_MMC_MVSDIO=m
# CONFIG_MMC_DAVINCI is not set
CONFIG_MMC_SPI=m
# CONFIG_MMC_S3C is not set
CONFIG_MMC_TMIO_CORE=m
# CONFIG_MMC_TMIO is not set
CONFIG_MMC_SDHI=m
# CONFIG_MMC_SDHI_SYS_DMAC is not set
CONFIG_MMC_SDHI_INTERNAL_DMAC=m
CONFIG_MMC_UNIPHIER=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
CONFIG_MMC_DW_EXYNOS=m
CONFIG_MMC_DW_HI3798CV200=m
CONFIG_MMC_DW_K3=m
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_SUNXI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
CONFIG_MMC_BCM2835=m
# CONFIG_MMC_MTK is not set
CONFIG_MMC_OWL=m
CONFIG_MMC_LITEX=m
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_AN30259A=m
CONFIG_LEDS_ARIEL=m
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_CPCAP=m
CONFIG_LEDS_CR0014114=m
CONFIG_LEDS_EL15203000=m
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_S3C24XX=y
CONFIG_LEDS_COBALT_QUBE=m
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=m
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=m
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_ADP5520=m
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_NS2=y
# CONFIG_LEDS_NETXBIG is not set
# CONFIG_LEDS_ASIC3 is not set
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_MAX77650 is not set
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=m
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=y
# CONFIG_LEDS_IS31FL32XX is not set
CONFIG_LEDS_SC27XX_BLTC=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_PM8058=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=m
CONFIG_LEDS_SPI_BYTE=m
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=m
# CONFIG_LEDS_LM36274 is not set
CONFIG_LEDS_IP30=m
CONFIG_LEDS_ACER_A500=m
CONFIG_LEDS_BCM63138=m
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=m

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
# CONFIG_INFINIBAND_USER_MAD is not set
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_RDMA_SIW is not set
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=m
CONFIG_AMBA_PL08X=y
CONFIG_APPLE_ADMAC=y
CONFIG_AXI_DMAC=m
# CONFIG_BCM_SBA_RAID is not set
# CONFIG_DMA_JZ4780 is not set
CONFIG_DMA_SA11X0=y
CONFIG_DMA_SUN6I=m
# CONFIG_DW_AXI_DMAC is not set
CONFIG_EP93XX_DMA=y
CONFIG_FSL_EDMA=y
CONFIG_FSL_QDMA=m
CONFIG_IMG_MDC_DMA=m
# CONFIG_IMX_DMA is not set
CONFIG_IMX_SDMA=m
CONFIG_INTEL_IDMA64=y
# CONFIG_INTEL_IOP_ADMA is not set
# CONFIG_K3_DMA is not set
# CONFIG_LPC18XX_DMAMUX is not set
# CONFIG_MCF_EDMA is not set
CONFIG_MILBEAUT_HDMAC=y
CONFIG_MILBEAUT_XDMAC=y
# CONFIG_MMP_PDMA is not set
# CONFIG_MMP_TDMA is not set
CONFIG_MV_XOR=y
# CONFIG_MXS_DMA is not set
# CONFIG_MX3_IPU is not set
CONFIG_NBPFAXI_DMA=m
CONFIG_PL330_DMA=y
CONFIG_STM32_DMA=y
CONFIG_STM32_DMAMUX=y
# CONFIG_STM32_MDMA is not set
CONFIG_SPRD_DMA=y
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TEGRA20_APB_DMA is not set
CONFIG_TEGRA210_ADMA=y
# CONFIG_TIMB_DMA is not set
CONFIG_UNIPHIER_MDMAC=y
CONFIG_UNIPHIER_XDMAC=y
CONFIG_XGENE_DMA=m
# CONFIG_XILINX_ZYNQMP_DMA is not set
CONFIG_XILINX_ZYNQMP_DPDMA=y
# CONFIG_MTK_HSDMA is not set
CONFIG_MTK_CQDMA=m
CONFIG_QCOM_ADM=y
CONFIG_QCOM_BAM_DMA=y
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=m
# CONFIG_DW_DMAC is not set
CONFIG_SF_PDMA=m
CONFIG_RENESAS_DMA=y
# CONFIG_SH_DMAE_BASE is not set
CONFIG_RCAR_DMAC=y
CONFIG_RENESAS_USB_DMAC=m
CONFIG_RZ_DMAC=y
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=m
CONFIG_TI_DMA_CROSSBAR=y
CONFIG_INTEL_LDMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
CONFIG_DMABUF_HEAPS_SYSTEM=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
CONFIG_VFIO=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=m
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=m
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=y
# CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET is not set
CONFIG_VFIO_MDEV=y
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_VDPA=m
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VDPA=y
CONFIG_VDPA_SIM=y
CONFIG_VDPA_SIM_NET=y
CONFIG_VDPA_SIM_BLOCK=m
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_SCSI=m
CONFIG_VHOST_VDPA=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
CONFIG_GREYBUS_ES2=m
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_USB_DRIVERS=m
CONFIG_COMEDI_DT9812=m
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=m
CONFIG_COMEDI_USBDUXFAST=m
CONFIG_COMEDI_USBDUXSIGMA=m
CONFIG_COMEDI_VMK80XX=m
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=m
CONFIG_COMEDI_TESTS=m
CONFIG_COMEDI_TESTS_EXAMPLE=m
# CONFIG_COMEDI_TESTS_NI_ROUTES is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CROS_EC is not set
CONFIG_MELLANOX_PLATFORM=y
# CONFIG_MLXREG_HOTPLUG is not set
# CONFIG_MLXREG_IO is not set
CONFIG_MLXREG_LC=m
CONFIG_NVSW_SN2201=m
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
CONFIG_CLK_ICST=y
CONFIG_CLK_SP810=y
CONFIG_CLK_VEXPRESS_OSC=m
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_APPLE_NCO=m
CONFIG_COMMON_CLK_MAX77686=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_HI655X=y
CONFIG_COMMON_CLK_SCMI=y
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI514=y
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_SI570=m
CONFIG_COMMON_CLK_BM1880=y
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=m
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=m
CONFIG_COMMON_CLK_EN7523=y
CONFIG_COMMON_CLK_FSL_FLEXSPI=m
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
CONFIG_COMMON_CLK_ASPEED=y
CONFIG_COMMON_CLK_S2MPS11=m
CONFIG_CLK_TWL6040=m
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
CONFIG_CLK_LS1028A_PLLDIG=m
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PALMAS=m
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_RS9_PCIE=y
# CONFIG_COMMON_CLK_VC5 is not set
CONFIG_COMMON_CLK_VC7=y
CONFIG_COMMON_CLK_MMP2_AUDIO=m
CONFIG_COMMON_CLK_BD718XX=m
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_ACTIONS is not set
CONFIG_CLK_ANALOGBITS_WRPLL_CLN28HPC=y
CONFIG_CLK_BAIKAL_T1=y
# CONFIG_CLK_BT1_CCU_PLL is not set
CONFIG_CLK_BT1_CCU_DIV=y
# CONFIG_CLK_BT1_CCU_RST is not set
CONFIG_CLK_BCM2711_DVP=m
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
CONFIG_CLK_BCM_KONA=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
CONFIG_COMMON_CLK_HI3516CV300=y
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
CONFIG_STUB_CLK_HI6220=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX7D=y
CONFIG_CLK_IMX8MM=m
# CONFIG_CLK_IMX8MN is not set
CONFIG_CLK_IMX8MP=m
# CONFIG_CLK_IMX8MQ is not set
# CONFIG_CLK_IMX8ULP is not set
# CONFIG_CLK_IMX93 is not set

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
# CONFIG_INGENIC_CGU_X1000 is not set
CONFIG_INGENIC_CGU_X1830=y
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

# CONFIG_COMMON_CLK_KEYSTONE is not set
CONFIG_TI_SYSCON_CLK=m

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MT2701=y
CONFIG_COMMON_CLK_MT2701_MMSYS=y
# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
CONFIG_COMMON_CLK_MT2701_VDECSYS=y
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
CONFIG_COMMON_CLK_MT2701_ETHSYS=y
CONFIG_COMMON_CLK_MT2701_BDPSYS=y
CONFIG_COMMON_CLK_MT2701_AUDSYS=y
CONFIG_COMMON_CLK_MT2701_G3DSYS=y
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6795 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
CONFIG_COMMON_CLK_MT7622=y
# CONFIG_COMMON_CLK_MT7622_ETHSYS is not set
# CONFIG_COMMON_CLK_MT7622_HIFSYS is not set
CONFIG_COMMON_CLK_MT7622_AUDSYS=y
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8167=y
# CONFIG_COMMON_CLK_MT8167_AUDSYS is not set
# CONFIG_COMMON_CLK_MT8167_IMGSYS is not set
CONFIG_COMMON_CLK_MT8167_MFGCFG=y
CONFIG_COMMON_CLK_MT8167_MMSYS=y
CONFIG_COMMON_CLK_MT8167_VDECSYS=y
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_MMSYS is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
CONFIG_COMMON_CLK_MT8192=y
CONFIG_COMMON_CLK_MT8192_AUDSYS=y
CONFIG_COMMON_CLK_MT8192_CAMSYS=y
CONFIG_COMMON_CLK_MT8192_IMGSYS=y
CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8192_IPESYS=y
CONFIG_COMMON_CLK_MT8192_MDPSYS=y
CONFIG_COMMON_CLK_MT8192_MFGCFG=y
# CONFIG_COMMON_CLK_MT8192_MMSYS is not set
CONFIG_COMMON_CLK_MT8192_MSDC=y
# CONFIG_COMMON_CLK_MT8192_SCP_ADSP is not set
# CONFIG_COMMON_CLK_MT8192_VDECSYS is not set
# CONFIG_COMMON_CLK_MT8192_VENCSYS is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
CONFIG_COMMON_CLK_MT8516=y
CONFIG_COMMON_CLK_MT8516_AUDSYS=y
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
CONFIG_COMMON_CLK_MESON_REGMAP=y
CONFIG_COMMON_CLK_MESON_MPLL=y
CONFIG_COMMON_CLK_MESON_PLL=y
CONFIG_COMMON_CLK_MESON8B=y
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
CONFIG_MCHP_CLK_MPFS=y
# CONFIG_COMMON_CLK_PISTACHIO is not set
CONFIG_QCOM_GDSC=y
CONFIG_COMMON_CLK_QCOM=m
# CONFIG_QCOM_A53PLL is not set
# CONFIG_QCOM_A7PLL is not set
CONFIG_QCOM_CLK_APCS_MSM8916=m
CONFIG_QCOM_CLK_APCS_SDX55=m
CONFIG_QCOM_CLK_RPMH=m
CONFIG_APQ_GCC_8084=m
CONFIG_APQ_MMCC_8084=m
CONFIG_IPQ_APSS_PLL=m
CONFIG_IPQ_APSS_6018=m
# CONFIG_IPQ_GCC_4019 is not set
CONFIG_IPQ_GCC_6018=m
CONFIG_IPQ_GCC_806X=m
CONFIG_IPQ_LCC_806X=m
CONFIG_IPQ_GCC_8074=m
# CONFIG_MSM_GCC_8660 is not set
# CONFIG_MSM_GCC_8909 is not set
CONFIG_MSM_GCC_8916=m
CONFIG_MSM_GCC_8939=m
CONFIG_MSM_GCC_8960=m
# CONFIG_MSM_LCC_8960 is not set
CONFIG_MDM_GCC_9607=m
CONFIG_MDM_GCC_9615=m
CONFIG_MDM_LCC_9615=m
CONFIG_MSM_MMCC_8960=m
CONFIG_MSM_GCC_8953=m
CONFIG_MSM_GCC_8974=m
CONFIG_MSM_MMCC_8974=m
CONFIG_MSM_GCC_8976=m
CONFIG_MSM_MMCC_8994=m
CONFIG_MSM_GCC_8994=m
CONFIG_MSM_GCC_8996=m
# CONFIG_MSM_MMCC_8996 is not set
CONFIG_MSM_GCC_8998=m
# CONFIG_MSM_GPUCC_8998 is not set
# CONFIG_MSM_MMCC_8998 is not set
CONFIG_QCM_GCC_2290=m
# CONFIG_QCM_DISPCC_2290 is not set
CONFIG_QCS_GCC_404=m
CONFIG_SC_CAMCC_7180=m
# CONFIG_SC_CAMCC_7280 is not set
# CONFIG_SC_DISPCC_7180 is not set
CONFIG_SC_DISPCC_7280=m
CONFIG_SC_GCC_7180=m
CONFIG_SC_GCC_7280=m
CONFIG_SC_GCC_8180X=m
CONFIG_SC_GCC_8280XP=m
CONFIG_SC_GPUCC_7180=m
# CONFIG_SC_GPUCC_7280 is not set
CONFIG_SC_GPUCC_8280XP=m
CONFIG_SC_LPASSCC_7280=m
# CONFIG_SC_LPASS_CORECC_7180 is not set
CONFIG_SC_LPASS_CORECC_7280=m
# CONFIG_SC_MSS_7180 is not set
# CONFIG_SC_VIDEOCC_7180 is not set
# CONFIG_SC_VIDEOCC_7280 is not set
CONFIG_SDM_CAMCC_845=m
CONFIG_SDM_GCC_660=m
CONFIG_SDM_MMCC_660=m
# CONFIG_SDM_GPUCC_660 is not set
CONFIG_QCS_TURING_404=m
# CONFIG_QCS_Q6SSTOP_404 is not set
CONFIG_SDM_GCC_845=m
CONFIG_SDM_GPUCC_845=m
CONFIG_SDM_VIDEOCC_845=m
CONFIG_SDM_DISPCC_845=m
# CONFIG_SDM_LPASSCC_845 is not set
# CONFIG_SDX_GCC_55 is not set
# CONFIG_SDX_GCC_65 is not set
CONFIG_SM_CAMCC_8250=m
# CONFIG_SM_CAMCC_8450 is not set
CONFIG_SM_DISPCC_6125=m
CONFIG_SM_DISPCC_8250=m
CONFIG_SM_DISPCC_6350=m
CONFIG_SM_DISPCC_8450=m
# CONFIG_SM_GCC_6115 is not set
CONFIG_SM_GCC_6125=m
CONFIG_SM_GCC_6350=m
# CONFIG_SM_GCC_6375 is not set
CONFIG_SM_GCC_8150=m
CONFIG_SM_GCC_8250=m
CONFIG_SM_GCC_8350=m
CONFIG_SM_GCC_8450=m
# CONFIG_SM_GPUCC_6350 is not set
CONFIG_SM_GPUCC_8150=m
CONFIG_SM_GPUCC_8250=m
CONFIG_SM_GPUCC_8350=m
CONFIG_SM_VIDEOCC_8150=m
# CONFIG_SM_VIDEOCC_8250 is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
# CONFIG_QCOM_HFPLL is not set
# CONFIG_KPSS_XCC is not set
# CONFIG_KRAITCC is not set
CONFIG_CLK_GFM_LPASS_SM8250=m
# CONFIG_CLK_MT7621 is not set
CONFIG_CLK_RENESAS=y
# CONFIG_CLK_EMEV2 is not set
CONFIG_CLK_RZA1=y
CONFIG_CLK_R7S9210=y
CONFIG_CLK_R8A73A4=y
# CONFIG_CLK_R8A7740 is not set
# CONFIG_CLK_R8A7742 is not set
# CONFIG_CLK_R8A7743 is not set
# CONFIG_CLK_R8A7745 is not set
# CONFIG_CLK_R8A77470 is not set
# CONFIG_CLK_R8A774A1 is not set
CONFIG_CLK_R8A774B1=y
# CONFIG_CLK_R8A774C0 is not set
CONFIG_CLK_R8A774E1=y
# CONFIG_CLK_R8A7778 is not set
CONFIG_CLK_R8A7779=y
# CONFIG_CLK_R8A7790 is not set
# CONFIG_CLK_R8A7791 is not set
# CONFIG_CLK_R8A7792 is not set
CONFIG_CLK_R8A7794=y
CONFIG_CLK_R8A7795=y
CONFIG_CLK_R8A77960=y
CONFIG_CLK_R8A77961=y
CONFIG_CLK_R8A77965=y
# CONFIG_CLK_R8A77970 is not set
# CONFIG_CLK_R8A77980 is not set
# CONFIG_CLK_R8A77990 is not set
# CONFIG_CLK_R8A77995 is not set
# CONFIG_CLK_R8A779A0 is not set
# CONFIG_CLK_R8A779F0 is not set
# CONFIG_CLK_R8A779G0 is not set
CONFIG_CLK_R9A06G032=y
# CONFIG_CLK_R9A07G043 is not set
# CONFIG_CLK_R9A07G044 is not set
# CONFIG_CLK_R9A07G054 is not set
CONFIG_CLK_R9A09G011=y
# CONFIG_CLK_SH73A0 is not set
CONFIG_CLK_RCAR_CPG_LIB=y
CONFIG_CLK_RCAR_GEN2_CPG=y
CONFIG_CLK_RCAR_GEN3_CPG=y
CONFIG_CLK_RCAR_GEN4_CPG=y
# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
CONFIG_CLK_RZG2L=y
CONFIG_CLK_RENESAS_CPG_MSSR=y
CONFIG_CLK_RENESAS_CPG_MSTP=y
CONFIG_CLK_RENESAS_DIV6=y
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_CLK_SIFIVE=y
CONFIG_CLK_SIFIVE_PRCI=y
CONFIG_CLK_INTEL_SOCFPGA=y
# CONFIG_CLK_INTEL_SOCFPGA32 is not set
# CONFIG_CLK_INTEL_SOCFPGA64 is not set
# CONFIG_SPRD_COMMON_CLK is not set
CONFIG_CLK_STARFIVE_JH7100=y
CONFIG_CLK_STARFIVE_JH7100_AUDIO=y
CONFIG_CLK_SUNXI=y
CONFIG_CLK_SUNXI_CLOCKS=y
CONFIG_CLK_SUNXI_PRCM_SUN6I=y
# CONFIG_CLK_SUNXI_PRCM_SUN8I is not set
# CONFIG_CLK_SUNXI_PRCM_SUN9I is not set
CONFIG_SUNXI_CCU=y
CONFIG_SUNIV_F1C100S_CCU=y
# CONFIG_SUN20I_D1_CCU is not set
# CONFIG_SUN20I_D1_R_CCU is not set
CONFIG_SUN50I_A64_CCU=y
CONFIG_SUN50I_A100_CCU=y
# CONFIG_SUN50I_A100_R_CCU is not set
# CONFIG_SUN50I_H6_CCU is not set
CONFIG_SUN50I_H616_CCU=y
# CONFIG_SUN50I_H6_R_CCU is not set
CONFIG_SUN4I_A10_CCU=y
CONFIG_SUN5I_CCU=y
CONFIG_SUN6I_A31_CCU=m
# CONFIG_SUN6I_RTC_CCU is not set
CONFIG_SUN8I_A23_CCU=m
CONFIG_SUN8I_A33_CCU=m
# CONFIG_SUN8I_A83T_CCU is not set
CONFIG_SUN8I_H3_CCU=m
CONFIG_SUN8I_V3S_CCU=m
# CONFIG_SUN8I_DE2_CCU is not set
CONFIG_SUN8I_R40_CCU=m
# CONFIG_SUN9I_A80_CCU is not set
CONFIG_SUN8I_R_CCU=y
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
CONFIG_CLK_LGM_CGU=y
# CONFIG_XILINX_VCU is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_CLK_KUNIT_TEST=y
# CONFIG_CLK_GATE_KUNIT_TEST is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
CONFIG_OMAP_DM_TIMER=y
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
CONFIG_ROCKCHIP_TIMER=y
# CONFIG_ARMADA_370_XP_TIMER is not set
CONFIG_MESON6_TIMER=y
CONFIG_ORION_TIMER=y
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
CONFIG_SUN4I_TIMER=y
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
CONFIG_VT8500_TIMER=y
# CONFIG_NPCM7XX_TIMER is not set
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_NOMADIK_MTU=y
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
CONFIG_MXS_TIMER=y
CONFIG_NSPIRE_TIMER=y
# CONFIG_KEYSTONE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
CONFIG_CLKSRC_LPC32XX=y
CONFIG_CLKSRC_PISTACHIO=y
CONFIG_CLKSRC_TI_32K=y
# CONFIG_CLKSRC_STM32 is not set
# CONFIG_CLKSRC_STM32_LP is not set
CONFIG_CLKSRC_MPS2=y
# CONFIG_ARC_TIMERS is not set
# CONFIG_ARM_GLOBAL_TIMER is not set
# CONFIG_ARM_TIMER_SP804 is not set
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
CONFIG_ATMEL_ST=y
CONFIG_ATMEL_TCB_CLKSRC=y
# CONFIG_CLKSRC_EXYNOS_MCT is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
CONFIG_CLKSRC_JCORE_PIT=y
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_QCOM is not set
# CONFIG_CLKSRC_VERSATILE is not set
CONFIG_CLKSRC_PXA=y
CONFIG_CLKSRC_IMX_GPT=y
CONFIG_CLKSRC_IMX_TPM=y
CONFIG_TIMER_IMX_SYS_CTR=y
CONFIG_CLKSRC_ST_LPC=y
CONFIG_GXP_TIMER=y
CONFIG_MILBEAUT_TIMER=y
CONFIG_MSC313E_TIMER=y
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
CONFIG_INGENIC_OST=y
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_ARM_MHU=m
CONFIG_ARM_MHU_V2=y
CONFIG_IMX_MBOX=y
# CONFIG_PLATFORM_MHU is not set
# CONFIG_PL320_MBOX is not set
CONFIG_ARMADA_37XX_RWTM_MBOX=y
CONFIG_ROCKCHIP_MBOX=y
CONFIG_ALTERA_MBOX=y
CONFIG_MAILBOX_TEST=m
CONFIG_POLARFIRE_SOC_MAILBOX=m
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=m
CONFIG_STM32_IPCC=y
CONFIG_MTK_ADSP_MBOX=y
CONFIG_MTK_CMDQ_MBOX=m
CONFIG_SUN6I_MSGBOX=m
# CONFIG_SPRD_MBOX is not set
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# CONFIG_INGENIC_VPU_RPROC is not set
CONFIG_MTK_SCP=y
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
CONFIG_RCAR_REMOTEPROC=m
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=m
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_MTK_SCP=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=m

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
CONFIG_MESON_CLK_MEASURE=m
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_GX_PM_DOMAINS is not set
CONFIG_MESON_EE_PM_DOMAINS=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_PMGR_PWRSTATE=y
CONFIG_APPLE_RTKIT=m
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=m
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
CONFIG_BCM2835_POWER=y
CONFIG_SOC_BCM63XX=y
# CONFIG_SOC_BRCMSTB is not set
CONFIG_BCM63XX_POWER=y
CONFIG_BCM_PMB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_UCC_SLOW=y
CONFIG_UCC=y
# CONFIG_DPAA2_CONSOLE is not set
CONFIG_FSL_RCPM=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
# CONFIG_SOC_IMX8M is not set
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=m
# CONFIG_MTK_DEVAPC is not set
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=m
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# CONFIG_MTK_MMSYS is not set
CONFIG_MTK_SVS=m
# end of MediaTek SoC drivers

CONFIG_POLARFIRE_SOC_SYS_CTRL=m

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_AOSS_QMP is not set
CONFIG_QCOM_COMMAND_DB=y
CONFIG_QCOM_GENI_SE=m
CONFIG_QCOM_GSBI=m
CONFIG_QCOM_LLCC=y
CONFIG_QCOM_PDR_HELPERS=m
CONFIG_QCOM_QMI_HELPERS=m
CONFIG_QCOM_RPMH=m
# CONFIG_QCOM_RPMHPD is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
CONFIG_QCOM_APR=m
CONFIG_QCOM_ICC_BWMON=m
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
CONFIG_ROCKCHIP_PM_DOMAINS=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_MAX8997=m
CONFIG_EXTCON_PALMAS=m
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=m
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
# CONFIG_ARM_PL172_MPMC is not set
# CONFIG_ATMEL_SDRAMC is not set
# CONFIG_ATMEL_EBI is not set
# CONFIG_BRCMSTB_DPFE is not set
CONFIG_BRCMSTB_MEMC=m
# CONFIG_BT1_L2_CTL is not set
CONFIG_TI_AEMIF=y
# CONFIG_TI_EMIF is not set
CONFIG_OMAP_GPMC=y
# CONFIG_OMAP_GPMC_DEBUG is not set
CONFIG_MVEBU_DEVBUS=y
CONFIG_FSL_CORENET_CF=y
CONFIG_FSL_IFC=y
# CONFIG_JZ4780_NEMC is not set
CONFIG_MTK_SMI=m
# CONFIG_DA8XX_DDRCTL is not set
# CONFIG_PL353_SMC is not set
CONFIG_RENESAS_RPCIF=y
CONFIG_STM32_FMC2_EBI=y
CONFIG_SAMSUNG_MC=y
# CONFIG_EXYNOS_SROM is not set
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADIS16201=m
# CONFIG_ADIS16209 is not set
CONFIG_ADXL313=y
# CONFIG_ADXL313_I2C is not set
CONFIG_ADXL313_SPI=y
CONFIG_ADXL345=m
# CONFIG_ADXL345_I2C is not set
CONFIG_ADXL345_SPI=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL355_SPI is not set
CONFIG_ADXL367=m
CONFIG_ADXL367_SPI=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=y
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA180=m
CONFIG_BMA220=m
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_BMC150_ACCEL_SPI=m
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=m
# CONFIG_DA311 is not set
CONFIG_DMARD06=y
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=m
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_FXLS8962AF_SPI=m
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=m
CONFIG_KXSD9_SPI=m
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=m
CONFIG_MMA7455=m
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7455_SPI=m
CONFIG_MMA7660=m
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MSA311=m
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=m
# CONFIG_SCA3000 is not set
# CONFIG_SCA3300 is not set
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
# CONFIG_AD7091R5 is not set
CONFIG_AD7124=m
# CONFIG_AD7192 is not set
# CONFIG_AD7266 is not set
CONFIG_AD7280=m
# CONFIG_AD7291 is not set
CONFIG_AD7292=y
CONFIG_AD7298=m
CONFIG_AD7476=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD7606_IFACE_SPI is not set
CONFIG_AD7766=y
# CONFIG_AD7768_1 is not set
CONFIG_AD7780=y
CONFIG_AD7791=y
CONFIG_AD7793=m
CONFIG_AD7887=y
CONFIG_AD7923=m
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
CONFIG_AD9467=m
CONFIG_ADI_AXI_ADC=y
CONFIG_ASPEED_ADC=y
CONFIG_AT91_ADC=m
CONFIG_AT91_SAMA5D2_ADC=m
CONFIG_BCM_IPROC_ADC=y
CONFIG_BERLIN2_ADC=m
# CONFIG_CC10001_ADC is not set
# CONFIG_CPCAP_ADC is not set
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_EXYNOS_ADC=m
# CONFIG_FSL_MX25_ADC is not set
# CONFIG_HI8435 is not set
CONFIG_HX711=m
CONFIG_INA2XX_ADC=m
CONFIG_INGENIC_ADC=m
CONFIG_IMX7D_ADC=y
# CONFIG_IMX8QXP_ADC is not set
CONFIG_LPC18XX_ADC=m
# CONFIG_LPC32XX_ADC is not set
CONFIG_LTC2471=m
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=y
CONFIG_LTC2497=y
CONFIG_MAX1027=y
# CONFIG_MAX11100 is not set
CONFIG_MAX1118=y
# CONFIG_MAX11205 is not set
# CONFIG_MAX1241 is not set
CONFIG_MAX1363=y
CONFIG_MAX9611=y
# CONFIG_MCP320X is not set
CONFIG_MCP3422=y
# CONFIG_MCP3911 is not set
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=m
# CONFIG_MESON_SARADC is not set
CONFIG_NAU7802=m
CONFIG_NPCM_ADC=y
# CONFIG_PALMAS_GPADC is not set
# CONFIG_QCOM_PM8XXX_XOADC is not set
CONFIG_RCAR_GYRO_ADC=m
CONFIG_RN5T618_ADC=y
CONFIG_ROCKCHIP_SARADC=y
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_RZG2L_ADC is not set
# CONFIG_SC27XX_ADC is not set
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=y
CONFIG_STM32_ADC_CORE=y
CONFIG_STM32_ADC=m
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=m
CONFIG_TI_ADC081C=y
CONFIG_TI_ADC0832=y
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=m
CONFIG_TI_ADC128S052=m
CONFIG_TI_ADC161S626=m
# CONFIG_TI_ADS1015 is not set
CONFIG_TI_ADS7950=m
CONFIG_TI_ADS8344=y
CONFIG_TI_ADS8688=m
CONFIG_TI_ADS124S08=m
CONFIG_TI_ADS131E08=m
CONFIG_TI_TLC4541=m
CONFIG_TI_TSC2046=m
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=y
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
CONFIG_AD74413R=y
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# CONFIG_ADA4250 is not set
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
CONFIG_ATLAS_EZO_SENSOR=m
# CONFIG_BME680 is not set
CONFIG_CCS811=m
CONFIG_IAQCORE=y
# CONFIG_SCD30_CORE is not set
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# CONFIG_IIO_SCMI is not set
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R=y
CONFIG_AD5064=m
# CONFIG_AD5360 is not set
CONFIG_AD5380=m
# CONFIG_AD5421 is not set
CONFIG_AD5446=m
CONFIG_AD5449=m
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
CONFIG_AD5593R=m
CONFIG_AD5504=y
# CONFIG_AD5624R_SPI is not set
CONFIG_LTC2688=m
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
# CONFIG_AD5696_I2C is not set
# CONFIG_AD5755 is not set
CONFIG_AD5758=m
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
CONFIG_AD5766=y
CONFIG_AD5770R=y
CONFIG_AD5791=m
CONFIG_AD7293=y
CONFIG_AD7303=y
CONFIG_AD8801=y
# CONFIG_DPOT_DAC is not set
# CONFIG_DS4424 is not set
CONFIG_LPC18XX_DAC=m
CONFIG_LTC1660=y
CONFIG_LTC2632=m
CONFIG_M62332=y
CONFIG_MAX517=y
CONFIG_MAX5821=y
CONFIG_MCP4725=m
# CONFIG_MCP4922 is not set
# CONFIG_STM32_DAC is not set
CONFIG_TI_DAC082S085=y
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=y
CONFIG_TI_DAC7612=m
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=y
# CONFIG_ADF4371 is not set
# CONFIG_ADMV1013 is not set
CONFIG_ADMV4420=y
# CONFIG_ADRF6780 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=y
CONFIG_ADIS16130=m
CONFIG_ADIS16136=y
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS290 is not set
CONFIG_ADXRS450=y
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_FXAS21002C_SPI=m
CONFIG_HID_SENSOR_GYRO_3D=m
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=m
CONFIG_AFE4404=y
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
# CONFIG_DHT11 is not set
CONFIG_HDC100X=m
# CONFIG_HDC2010 is not set
CONFIG_HID_SENSOR_HUMIDITY=m
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
CONFIG_SI7005=m
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
CONFIG_ADIS16460=y
CONFIG_ADIS16475=y
CONFIG_ADIS16480=y
CONFIG_BMI160=y
# CONFIG_BMI160_I2C is not set
CONFIG_BMI160_SPI=y
# CONFIG_BOSCH_BNO055_I2C is not set
# CONFIG_FXOS8700_I2C is not set
# CONFIG_FXOS8700_SPI is not set
CONFIG_KMX61=y
CONFIG_INV_ICM42600=m
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_ICM42600_SPI=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_INV_MPU6050_SPI=m
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
CONFIG_IIO_ST_LSM9DS0_SPI=m
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
# CONFIG_ADJD_S311 is not set
# CONFIG_ADUX1020 is not set
# CONFIG_AL3010 is not set
CONFIG_AL3320A=y
CONFIG_APDS9300=m
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
CONFIG_CM3232=y
CONFIG_CM3323=m
CONFIG_CM3605=y
CONFIG_CM36651=m
# CONFIG_GP2AP002 is not set
CONFIG_GP2AP020A00F=y
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=m
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=m
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=y
# CONFIG_LTR501 is not set
CONFIG_LTRF216A=y
CONFIG_LV0104CS=m
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=m
CONFIG_OPT3001=y
# CONFIG_PA12203001 is not set
CONFIG_SI1133=m
# CONFIG_SI1145 is not set
CONFIG_STK3310=m
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=m
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
CONFIG_TSL2591=m
# CONFIG_TSL2772 is not set
# CONFIG_TSL4531 is not set
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set
# CONFIG_VCNL4035 is not set
CONFIG_VEML6030=y
CONFIG_VEML6070=m
CONFIG_VL6180=m
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
# CONFIG_BMC150_MAGN_SPI is not set
CONFIG_MAG3110=y
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=y
# CONFIG_SENSORS_HMC5843_I2C is not set
CONFIG_SENSORS_HMC5843_SPI=y
CONFIG_SENSORS_RM3100=y
# CONFIG_SENSORS_RM3100_I2C is not set
CONFIG_SENSORS_RM3100_SPI=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

CONFIG_IIO_FORMAT_KUNIT_TEST=m

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=y
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=y
CONFIG_MAX5481=m
CONFIG_MAX5487=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4131=y
# CONFIG_MCP4531 is not set
CONFIG_MCP41010=y
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_BMP280_SPI=m
CONFIG_DLHL60D=y
CONFIG_DPS310=y
CONFIG_HID_SENSOR_PRESS=m
CONFIG_HP03=m
CONFIG_ICP10100=m
CONFIG_MPL115=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL115_SPI=y
CONFIG_MPL3115=y
CONFIG_MS5611=y
CONFIG_MS5611_I2C=m
CONFIG_MS5611_SPI=m
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
# CONFIG_IIO_ST_PRESS_SPI is not set
CONFIG_T5403=y
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=y
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=y
# CONFIG_PING is not set
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
# CONFIG_SX9310 is not set
CONFIG_SX9324=y
CONFIG_SX9360=m
CONFIG_SX9500=m
# CONFIG_SRF08 is not set
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_LTC2983=m
CONFIG_MAXIM_THERMOCOUPLE=y
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=m
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TMP117=m
CONFIG_TSYS01=y
CONFIG_TSYS02D=m
# CONFIG_MAX31856 is not set
CONFIG_MAX31865=m
# end of Temperature sensors

# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_NVIC=y
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
CONFIG_JCORE_AIC=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TS4800_IRQ=m
CONFIG_XILINX_INTC=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=y
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
CONFIG_IMX_MU_MSI=y
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
CONFIG_MCHP_EIC=y
CONFIG_SUNPLUS_SP7021_INTC=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
CONFIG_RESET_BERLIN=m
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=y
CONFIG_RESET_HSDK=y
CONFIG_RESET_IMX7=y
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
CONFIG_RESET_LANTIQ=y
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=m
# CONFIG_RESET_MESON_AUDIO_ARB is not set
CONFIG_RESET_NPCM=y
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_POLARFIRE_SOC=y
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_SUNPLUS=y
CONFIG_RESET_SUNXI=y
CONFIG_RESET_TI_SCI=y
CONFIG_RESET_TI_SYSCON=m
CONFIG_RESET_TI_TPS380X=m
CONFIG_RESET_TN48M_CPLD=y
# CONFIG_RESET_UNIPHIER is not set
CONFIG_RESET_UNIPHIER_GLUE=m
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=m
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
CONFIG_PHY_PISTACHIO_USB=m
# CONFIG_PHY_XGENE is not set
CONFIG_USB_LGM_PHY=m
CONFIG_PHY_CAN_TRANSCEIVER=m
CONFIG_PHY_SUN4I_USB=m
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
CONFIG_PHY_SUN9I_USB=y
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
CONFIG_PHY_MESON8B_USB2=y
# CONFIG_PHY_MESON_GXL_USB2 is not set
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=y
# CONFIG_PHY_MESON_G12A_USB2 is not set
CONFIG_PHY_MESON_G12A_USB3_PCIE=y
CONFIG_PHY_MESON_AXG_PCIE=m
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=m
CONFIG_PHY_MESON_AXG_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_PHY_CYGNUS_PCIE=m
CONFIG_PHY_BCM_SR_USB=y
CONFIG_BCM_KONA_USB2_PHY=m
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_BCM_NS_USB3=m
CONFIG_PHY_NS2_PCIE=m
CONFIG_PHY_NS2_USB_DRD=y
# CONFIG_PHY_BRCM_SATA is not set
CONFIG_PHY_BRCM_USB=m
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=y
# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=m
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_FSL_IMX8MQ_USB=m
CONFIG_PHY_MIXEL_LVDS_PHY=m
CONFIG_PHY_MIXEL_MIPI_DPHY=m
CONFIG_PHY_FSL_IMX8M_PCIE=m
CONFIG_PHY_FSL_LYNX_28G=y
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=y
# CONFIG_PHY_HI3670_USB is not set
CONFIG_PHY_HI3670_PCIE=m
CONFIG_PHY_HISTB_COMBPHY=m
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
CONFIG_PHY_LANTIQ_RCU_USB2=y
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
CONFIG_PHY_BERLIN_SATA=m
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
CONFIG_PHY_MVEBU_A38X_COMPHY=m
CONFIG_PHY_MVEBU_CP110_UTMI=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_PCIE is not set
CONFIG_PHY_MTK_TPHY=m
# CONFIG_PHY_MTK_UFS is not set
CONFIG_PHY_MTK_XSPHY=y
CONFIG_PHY_MTK_HDMI=m
# CONFIG_PHY_MTK_MIPI_DSI is not set
CONFIG_PHY_MTK_DP=y
CONFIG_PHY_SPARX5_SERDES=m
CONFIG_PHY_LAN966X_SERDES=m
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# CONFIG_PHY_OCELOT_SERDES is not set
# CONFIG_PHY_ATH79_USB is not set
CONFIG_PHY_QCOM_EDP=m
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
CONFIG_PHY_QCOM_PCIE2=y
CONFIG_PHY_QCOM_QMP=y
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_QCOM_USB_HS_28NM=y
CONFIG_PHY_QCOM_USB_SS=y
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RCAR_GEN3_USB3=y
CONFIG_PHY_ROCKCHIP_DPHY_RX0=m
CONFIG_PHY_ROCKCHIP_INNO_HDMI=y
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=m
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=m
CONFIG_PHY_ROCKCHIP_PCIE=y
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_ROCKCHIP_TYPEC=m
CONFIG_PHY_EXYNOS_DP_VIDEO=y
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_EXYNOS_PCIE=y
# CONFIG_PHY_SAMSUNG_UFS is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
CONFIG_PHY_UNIPHIER_AHCI=y
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=m
CONFIG_PHY_STM32_USBPHYC=m
CONFIG_PHY_SUNPLUS_USB=m
# CONFIG_PHY_TEGRA194_P2U is not set
CONFIG_PHY_DA8XX_USB=m
CONFIG_PHY_DM816X_USB=m
# CONFIG_PHY_AM654_SERDES is not set
CONFIG_PHY_J721E_WIZ=y
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
CONFIG_PHY_TUSB1210=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
CONFIG_PHY_INTEL_THUNDERBAY_EMMC=m
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
CONFIG_MCB_LPC=m

#
# Performance monitor support
#
CONFIG_ARM_CCN=m
CONFIG_ARM_CMN=m
CONFIG_ARM_PMU=y
CONFIG_FSL_IMX8_DDR_PMU=m
CONFIG_ARM_DMC620_PMU=y
# CONFIG_ALIBABA_UNCORE_DRW_PMU is not set
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_NVMEM_BRCM_NVRAM is not set
CONFIG_NVMEM_IMX_IIM=y
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_JZ4780_EFUSE is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
CONFIG_NVMEM_LAYERSCAPE_SFP=y
CONFIG_NVMEM_LPC18XX_EEPROM=m
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MESON_MX_EFUSE=m
CONFIG_NVMEM_MICROCHIP_OTPC=y
CONFIG_NVMEM_MTK_EFUSE=y
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_NVMEM_NINTENDO_OTP=m
CONFIG_NVMEM_QCOM_QFPROM=y
# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_ROCKCHIP_EFUSE=y
CONFIG_NVMEM_ROCKCHIP_OTP=m
CONFIG_NVMEM_SC27XX_EFUSE=m
CONFIG_NVMEM_SNVS_LPGPR=m
# CONFIG_NVMEM_SPRD_EFUSE is not set
CONFIG_NVMEM_STM32_ROMEM=m
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
# CONFIG_STM_SOURCE_HEARTBEAT is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
CONFIG_FSI_MASTER_HUB=m
CONFIG_FSI_MASTER_AST_CF=m
CONFIG_FSI_MASTER_ASPEED=m
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=y
CONFIG_FSI_OCC=y
CONFIG_TEE=m
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_ADGS1408=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_CTRL=m
# CONFIG_SLIM_QCOM_NGD_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
# CONFIG_INTERCONNECT_SAMSUNG is not set
CONFIG_COUNTER=m
CONFIG_104_QUAD_8=m
CONFIG_INTERRUPT_CNT=m
CONFIG_STM32_TIMER_CNT=m
CONFIG_STM32_LPTIMER_CNT=m
CONFIG_TI_EQEP=m
# CONFIG_FTM_QUADDEC is not set
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
CONFIG_TI_ECAP_CAPTURE=m
# CONFIG_MOST is not set
# CONFIG_PECI is not set
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
# CONFIG_EXT4_KUNIT_TESTS is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=m
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_XFS_RT=y
# CONFIG_XFS_ONLINE_SCRUB is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=y
CONFIG_OCFS2_FS=m
# CONFIG_OCFS2_FS_O2CB is not set
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
CONFIG_OCFS2_DEBUG_FS=y
CONFIG_BTRFS_FS=m
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
CONFIG_BTRFS_FS_REF_VERIFY=y
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=m
CONFIG_QFMT_V1=m
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set
CONFIG_VIRTIO_FS=m
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_FAT_KUNIT_TEST=m
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
CONFIG_NTFS3_FS=m
# CONFIG_NTFS3_LZX_XPRESS is not set
# CONFIG_NTFS3_FS_POSIX_ACL is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ADFS_FS=m
CONFIG_ADFS_FS_RW=y
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
CONFIG_HFS_FS=y
CONFIG_HFSPLUS_FS=y
CONFIG_BEFS_FS=y
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=y
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
# CONFIG_SQUASHFS_XATTR is not set
# CONFIG_SQUASHFS_ZLIB is not set
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=m
CONFIG_MINIX_FS=y
# CONFIG_OMFS_FS is not set
CONFIG_HPFS_FS=y
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
CONFIG_ROMFS_FS=m
CONFIG_ROMFS_BACKED_BY_BLOCK=y
CONFIG_ROMFS_ON_BLOCK=y
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
# CONFIG_PSTORE_DEFLATE_COMPRESS is not set
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=m
# CONFIG_UFS_FS_WRITE is not set
CONFIG_UFS_DEBUG=y
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_DEBUG=y
# CONFIG_EROFS_FS_XATTR is not set
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_ZIP_LZMA=y
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
CONFIG_NLS_CODEPAGE_737=m
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=m
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=m
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=y
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
# CONFIG_DLM_DEBUG is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=m
CONFIG_TRUSTED_KEYS_TEE=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_LSM_MMAP_MIN_ADDR=32768
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_SECURITY_SELINUX=y
# CONFIG_SECURITY_SELINUX_BOOTPARAM is not set
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=0
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
CONFIG_SECURITY_SMACK=y
CONFIG_SECURITY_SMACK_BRINGUP=y
CONFIG_SECURITY_SMACK_APPEND_SIGNALS=y
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
# CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_LOADPIN=y
CONFIG_SECURITY_LOADPIN_ENFORCE=y
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
CONFIG_EVM_EXTRA_SMACK_XATTRS=y
CONFIG_EVM_ADD_XATTRS=y
# CONFIG_DEFAULT_SECURITY_SELINUX is not set
# CONFIG_DEFAULT_SECURITY_SMACK is not set
CONFIG_DEFAULT_SECURITY_TOMOYO=y
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
# CONFIG_RANDSTRUCT_FULL is not set
CONFIG_RANDSTRUCT_PERFORMANCE=y
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_MEMCPY=y
CONFIG_ASYNC_XOR=y
CONFIG_ASYNC_PQ=y
CONFIG_ASYNC_RAID6_RECOV=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_HCTR2=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=m
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=m
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=m
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (arm)
#
CONFIG_CRYPTO_POLY1305_ARM=y
CONFIG_CRYPTO_BLAKE2S_ARM=y
# CONFIG_CRYPTO_SHA1_ARM is not set
CONFIG_CRYPTO_AES_ARM=y
CONFIG_CRYPTO_CHACHA20_NEON=m
# end of Accelerated Cryptographic Algorithms for CPU (arm)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=m
CONFIG_FIPS_SIGNATURE_SELFTEST=y

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_HAVE_ARCH_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=9
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_HAS_DMA_WRITE_COMBINE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_GLOBAL_POOL=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=m
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

# CONFIG_DEBUG_KERNEL is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y

#
# Debug kernel data structures
#
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# end of RCU Debugging

CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# arm Debugging
#
CONFIG_UNWINDER_ARM=y
CONFIG_ARM_UNWIND=y
# CONFIG_DEBUG_USER is not set
CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
CONFIG_UNCOMPRESS_INCLUDE="debug/uncompress.h"
CONFIG_CORESIGHT=m
CONFIG_CORESIGHT_LINKS_AND_SINKS=m
CONFIG_CORESIGHT_LINK_AND_SINK_TMC=m
CONFIG_CORESIGHT_CATU=m
# CONFIG_CORESIGHT_SINK_TPIU is not set
CONFIG_CORESIGHT_SINK_ETBV10=m
CONFIG_CORESIGHT_SOURCE_ETM3X=m
CONFIG_CORESIGHT_STM=m
CONFIG_CORESIGHT_CPU_DEBUG=m
# CONFIG_CORESIGHT_CPU_DEBUG_DEFAULT_ON is not set
CONFIG_CORESIGHT_CTI=m
# CONFIG_CORESIGHT_CTI_INTEGRATION_REGS is not set
# end of arm Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=y
# CONFIG_KUNIT_ALL_TESTS is not set
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
CONFIG_CPUMASK_KUNIT_TEST=m
# CONFIG_TEST_LIST_SORT is not set
CONFIG_TEST_MIN_HEAP=m
CONFIG_TEST_SORT=y
CONFIG_TEST_DIV64=m
CONFIG_REED_SOLOMON_TEST=m
CONFIG_ATOMIC64_SELFTEST=m
CONFIG_ASYNC_RAID6_TEST=y
CONFIG_TEST_HEXDUMP=y
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_STRING_HELPERS=y
CONFIG_TEST_STRSCPY=y
CONFIG_TEST_KSTRTOX=y
CONFIG_TEST_PRINTF=y
CONFIG_TEST_SCANF=m
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
CONFIG_TEST_XARRAY=m
CONFIG_TEST_RHASHTABLE=m
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_PARMAN=m
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
CONFIG_TEST_USER_COPY=m
# CONFIG_TEST_BPF is not set
CONFIG_TEST_BLACKHOLE_DEV=m
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_SYSCTL=m
# CONFIG_BITFIELD_KUNIT is not set
# CONFIG_HASH_KUNIT_TEST is not set
# CONFIG_RESOURCE_KUNIT_TEST is not set
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
CONFIG_LINEAR_RANGES_TEST=m
CONFIG_CMDLINE_KUNIT_TEST=y
CONFIG_BITS_TEST=y
CONFIG_RATIONAL_KUNIT_TEST=m
# CONFIG_MEMCPY_KUNIT_TEST is not set
CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=y
CONFIG_OVERFLOW_KUNIT_TEST=y
# CONFIG_STACKINIT_KUNIT_TEST is not set
CONFIG_FORTIFY_KUNIT_TEST=y
CONFIG_TEST_UDELAY=y
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_DYNAMIC_DEBUG=y
CONFIG_TEST_KMOD=m
CONFIG_TEST_MEMCAT_P=m
CONFIG_TEST_MEMINIT=m
CONFIG_TEST_FREE_PAGES=y
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

CONFIG_WARN_MISSING_DOCUMENTS=y
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--T7i3AVU2e9WDQ+o6--
