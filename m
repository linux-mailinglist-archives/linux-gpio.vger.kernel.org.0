Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02106788EE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 21:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjAWU6u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 15:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbjAWU6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 15:58:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559E63866F
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674507494; x=1706043494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5Bpc+znc62sNJYhec5oWCnTZ3NsyrqmKocP7D05VJU=;
  b=F15UWjsGAEgyiF8qkrbQmVGSDG+dhMd2Pl973Mp70LygH8w2RjFmk43y
   DAQ3lrK471O1vXnf2Ms1PKh8IMMlDsOv5itmMafPRZElDagJkDSsc0NUt
   Y+VUIbztFX15rc/7zCK/IPq5d+Q3okAbD94dGFJJXIUlgBngPdTqYSdw3
   CjnuVxH97TnIP4DTIEx4xOmufgKs61Y6Hb42u9Ljh//os7uIKeIiJ7gb4
   g35S+7tTdXn1MN347jK+h5aOqOCtWYc10eT5xmXtssfsNpC6aw0A9Uqdp
   zKt0y6nGjmVjiiBMBlsMAnw/9dVQqLoCVbT/ZPCtK0LyCe4LmWY/bO9HJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314044917"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="314044917"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 12:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655164071"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655164071"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 12:55:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK3qb-0005tC-2I;
        Mon, 23 Jan 2023 20:55:21 +0000
Date:   Tue, 24 Jan 2023 04:54:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pierluigi Passaro <pierluigi.p@variscite.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 2/2] include/linux/gpio/driver.h:782:33:
 error: variable has incomplete type 'enum gpio_lookup_flags'
Message-ID: <202301240439.wYz6uU0k-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
commit: de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f [2/2] gpiolib: fix linker errors when GPIOLIB is disabled
config: i386-randconfig-a014-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240439.wYz6uU0k-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-current
        git checkout de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/early-quirks.c:17:
   In file included from include/linux/bcma/bcma.h:9:
   In file included from include/linux/bcma/bcma_driver_chipcommon.h:7:
>> include/linux/gpio/driver.h:782:33: error: variable has incomplete type 'enum gpio_lookup_flags'
                                               enum gpio_lookup_flags lflags,
                                                                      ^
   include/linux/gpio/driver.h:24:6: note: forward declaration of 'enum gpio_lookup_flags'
   enum gpio_lookup_flags;
        ^
>> include/linux/gpio/driver.h:783:27: error: variable has incomplete type 'enum gpiod_flags'
                                               enum gpiod_flags dflags)
                                                                ^
   include/linux/gpio/driver.h:23:6: note: forward declaration of 'enum gpiod_flags'
   enum gpiod_flags;
        ^
   2 errors generated.
--
   In file included from drivers/regulator/max8997-regulator.c:13:
   In file included from include/linux/of_gpio.h:14:
>> include/linux/gpio/driver.h:782:33: error: variable has incomplete type 'enum gpio_lookup_flags'
                                               enum gpio_lookup_flags lflags,
                                                                      ^
   include/linux/gpio/driver.h:24:6: note: forward declaration of 'enum gpio_lookup_flags'
   enum gpio_lookup_flags;
        ^
>> include/linux/gpio/driver.h:783:27: error: variable has incomplete type 'enum gpiod_flags'
                                               enum gpiod_flags dflags)
                                                                ^
   include/linux/gpio/driver.h:23:6: note: forward declaration of 'enum gpiod_flags'
   enum gpiod_flags;
        ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from drivers/regulator/max8997-regulator.c:17:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
--
   In file included from drivers/mtd/nand/raw/nand_base.c:45:
   In file included from include/linux/of_gpio.h:14:
>> include/linux/gpio/driver.h:782:33: error: variable has incomplete type 'enum gpio_lookup_flags'
                                               enum gpio_lookup_flags lflags,
                                                                      ^
   include/linux/gpio/driver.h:24:6: note: forward declaration of 'enum gpio_lookup_flags'
   enum gpio_lookup_flags;
        ^
   1 error generated.


vim +782 include/linux/gpio/driver.h

   778	
   779	static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
   780						    unsigned int hwnum,
   781						    const char *label,
 > 782						    enum gpio_lookup_flags lflags,
 > 783						    enum gpiod_flags dflags)
   784	{
   785		/* GPIO can never have been requested */
   786		WARN_ON(1);
   787		return ERR_PTR(-ENODEV);
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
