Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77EDF678721
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 21:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjAWUEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 15:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbjAWUEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 15:04:40 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5B872B1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 12:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674504274; x=1706040274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcS4fnIwfmjh7YQV73pqL/LT0kcUTZwDaq/D4F/4kOw=;
  b=oH8IrnjdB7XGvSbSoHBevCPBjI+KS8+alUt59fg5JLlVXv6CR+8FqHGG
   7fQC9ovwatPkNTyB+q79LQB9q/NokAmRKFULUUBgFZcTMM8kxM8QhsSz4
   pFpsuD/nh7bVlG/jlFBQ0BMkLZoFosjOdedFDwsurQ/xg57hxtslGllrS
   MfR2EI7tZXiHbj+s2azW9IqF8u26V/Bj2Ab5gc1yoD/ZXQ5JpbwZEeV1x
   vp2iRP1mAF5qtV0gqZ42u7EcdEZ1ynvrPiRI75eHjAIhQly+4zBxh3NnD
   hQguXm7xktiyiFayAioVID+/s34pN7LhQZvH6JSl+Ka45v/3rpCA8TO8B
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353405671"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353405671"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 12:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750566759"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750566759"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 12:03:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK32G-0005rU-0u;
        Mon, 23 Jan 2023 20:03:20 +0000
Date:   Tue, 24 Jan 2023 04:03:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Pierluigi Passaro <pierluigi.p@variscite.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 2/2] include/linux/gpio/driver.h:782:68:
 error: parameter 4 ('lflags') has incomplete type
Message-ID: <202301240409.tZdm0o0a-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230124/202301240409.tZdm0o0a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-current
        git checkout de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/of_gpio.h:14,
                    from drivers/net/phy/mdio_bus.c:27:
>> include/linux/gpio/driver.h:782:68: error: parameter 4 ('lflags') has incomplete type
     782 |                                             enum gpio_lookup_flags lflags,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:779:33: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     779 | static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ssb/ssb.h:10,
                    from include/linux/ssb/ssb_driver_gige.h:5,
                    from drivers/net/ethernet/broadcom/tg3.c:54:
>> include/linux/gpio/driver.h:782:68: error: parameter 4 ('lflags') has incomplete type
     782 |                                             enum gpio_lookup_flags lflags,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:783:62: error: parameter 5 ('dflags') has incomplete type
     783 |                                             enum gpiod_flags dflags)
         |                                             ~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:779:33: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     779 | static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +782 include/linux/gpio/driver.h

   778	
 > 779	static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
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
