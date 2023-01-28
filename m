Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F64A67F677
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 09:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjA1Isb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 03:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjA1Isa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 03:48:30 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDFB1D91E;
        Sat, 28 Jan 2023 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674895709; x=1706431709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9qaJ07rCNgPUvNVIftD3GYtB6DL85fMLFtIdLTf/0NQ=;
  b=I6AggZci+dHCCeD0bpkIMUNn8F4SLCuL8zETiOr3rgTp84328Hw2gBoF
   rvdC7/nBkEGYVWfYxJ04N6CWI2k4744ZKpZ5u2nhGa/IHlAloBmhJmqW6
   8ujnvQo4Vui8gLhdPu+dXOEUIW7GtucmKwz/NK1ht60YHFRrvYl1S4CHj
   Pmjc+hgMMRMbPZbFN5MZGDegX01cPCD9ThcsIO1IApsODojZxzaWN/pBC
   B63DU3hExAUSrIhSzN49nP9fBz3PWWvuc8U5oYWSM5+4hXTfCdVyfoE/d
   7+UHnk4mAi48XK0EdablbbKvqXlpSX7bMphViLXXcgK2JCvAGOHqimf10
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="325948515"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="325948515"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 00:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="695809435"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="695809435"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2023 00:48:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLgsp-0000Wz-1d;
        Sat, 28 Jan 2023 08:48:23 +0000
Date:   Sat, 28 Jan 2023 16:47:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Message-ID: <202301281654.sPeSxigX-lkp@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127203729.10205-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc5 next-20230127]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301281654.sPeSxigX-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
        git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_get_privacy_led':
   drivers/media/v4l2-core/v4l2-subdev.c:1124:27: error: implicit declaration of function 'led_get'; did you mean 'key_get'? [-Werror=implicit-function-declaration]
    1124 |         sd->privacy_led = led_get(sd->dev, "privacy-led");
         |                           ^~~~~~~
         |                           key_get
>> drivers/media/v4l2-core/v4l2-subdev.c:1124:25: warning: assignment to 'struct led_classdev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1124 |         sd->privacy_led = led_get(sd->dev, "privacy-led");
         |                         ^
   cc1: some warnings being treated as errors


vim +1124 drivers/media/v4l2-core/v4l2-subdev.c

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
