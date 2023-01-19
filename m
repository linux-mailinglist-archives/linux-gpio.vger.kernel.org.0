Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A425C6743AE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 21:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjASUvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 15:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjASUtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 15:49:40 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB984F85E;
        Thu, 19 Jan 2023 12:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674161369; x=1705697369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8tghXmucL0Dhv0Bb7MCNOCgMhU/eUvb6mKAzFMobY6Q=;
  b=ClX84jY/SURJl8WwQvnFjxQzIwYrkG+7vsyY1R6gw3lSi4w9ZgoHA2R9
   rdHrBfGXl3dwBThhJTgVrlieo6FBe3H44uNNXPlVncTfUjlbZ075yVan2
   p15gZ7ruxSggIprlJakBc6sG7Z8H/LGr5vGqhy3H1GDSer2nGGTUoX/Da
   eLgnTlD12ODRHh63frAUnsaBOS4na32JmfUYBZhNABNo/IbuKxhKr/zih
   HQyCq07DYt5NshPv704BoMHK/JYrd5M7yWX6yQL9J9JwqzFAQJN1B4f3J
   RIJ3fnMWk22GStxMyJN3xbH+yoCuez+EAifq6UsAvrpP/XyY98MNE1PMg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389935999"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="389935999"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 12:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834129006"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="834129006"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 12:49:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIbqa-0001qE-1Q;
        Thu, 19 Jan 2023 20:49:20 +0000
Date:   Fri, 20 Jan 2023 04:48:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code
 into videodev.ko
Message-ID: <202301200441.zHWxHnG4-lkp@intel.com>
References: <20230119130053.111344-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119130053.111344-7-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4]
[cannot apply to media-tree/master pavel-leds/for-next next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
patch link:    https://lore.kernel.org/r/20230119130053.111344-7-hdegoede%40redhat.com
patch subject: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230120/202301200441.zHWxHnG4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/adfeffb48aad34dd2148e22caaf13d67cd92c285
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
        git checkout adfeffb48aad34dd2148e22caaf13d67cd92c285
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_async_debugfs_exit
   >>> referenced by v4l2-dev.c:1202 (drivers/media/v4l2-core/v4l2-dev.c:1202)
   >>>               drivers/media/v4l2-core/v4l2-dev.o:(videodev_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: v4l2_async_debugfs_init
   >>> referenced by v4l2-dev.c:1194 (drivers/media/v4l2-core/v4l2-dev.c:1194)
   >>>               drivers/media/v4l2-core/v4l2-dev.o:(videodev_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
