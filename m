Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1512367F5B4
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 08:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbjA1HgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 02:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjA1Hfr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 02:35:47 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1458E17A;
        Fri, 27 Jan 2023 23:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674891328; x=1706427328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2IGlG08LzZjsRh15w/36FW5g5Yh+zOPUK0S/8aQnkuw=;
  b=fZ577Frujdic2V8cQzByn/v/682d2t+sbR9kAIPjd3AHFy9nWOQxU5UP
   LqOl/2Qc5IbfEYWks4Bk5qIeQITnK/A/VhjVGxn5QA3aprJs13n7jPhnS
   Ceq0+rb7+7R9nI0bw2xB9oBii5Qh8oTBehWMrGVSPucmh6TIx3vgkgmEF
   BZl+a8HF5/VY/rc66gtRK7TocJCI9o/bUESYNUldAY+IHzA0NESqCp9gv
   1r82i/HqD0x9bHlkBydS0sV2vnxF8I52H2eHD4QZUHDgS1zEZelaO1K6r
   0ignYGsB53yjf0QkY+B1/VN/qQgvrzLU0alqL9nUWBgnVL5dBEXRF/GSa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315226503"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315226503"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 23:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="771853680"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="771853680"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2023 23:35:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLfk9-0000UT-0d;
        Sat, 28 Jan 2023 07:35:21 +0000
Date:   Sat, 28 Jan 2023 15:35:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Message-ID: <202301281534.9Z8xRsrX-lkp@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127203729.10205-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc5]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
        git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           sd->privacy_led = led_get(sd->dev, "privacy-led");
                             ^
>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
           sd->privacy_led = led_get(sd->dev, "privacy-led");
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/led_get +1124 drivers/media/v4l2-core/v4l2-subdev.c

  1120	
  1121	int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
  1122	{
  1123	#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> 1124		sd->privacy_led = led_get(sd->dev, "privacy-led");
  1125		if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
  1126			return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led), "getting privacy LED\n");
  1127	
  1128		if (!IS_ERR_OR_NULL(sd->privacy_led)) {
  1129			mutex_lock(&sd->privacy_led->led_access);
  1130			led_sysfs_disable(sd->privacy_led);
  1131			led_trigger_remove(sd->privacy_led);
  1132			led_set_brightness(sd->privacy_led, 0);
  1133			mutex_unlock(&sd->privacy_led->led_access);
  1134		}
  1135	#endif
  1136		return 0;
  1137	}
  1138	EXPORT_SYMBOL_GPL(v4l2_subdev_get_privacy_led);
  1139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
