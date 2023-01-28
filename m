Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10DE67F6F0
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 11:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbjA1KLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 05:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbjA1KLg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 05:11:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9F87B7AC;
        Sat, 28 Jan 2023 02:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674900692; x=1706436692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HQXTqqo0KdDTfmzzZvVs+t3mYNxq/PJALwewAE+8Cms=;
  b=BXuTdLTh+bFxxE2G4M05dGoFkOcEwnFBALERU0CBEjurHdMmZLSRw6jN
   g2mbWb6byUrvJvDbKakiushQ0NSLqT+dwec7rN2qTI3aDx5IRwTkrJ8tf
   /ofhsI4zh/2Zy0ga300QAlBAoA/WjdpZVE0q6Qqb7ShjaxWpRCE/AWRS2
   QIn979IsZpDyfZzgTkfov/pV8f1GUNBPQwtWkMRlB4+Qgg9AglFO57rgr
   vDfbhKdQXTaffm+McJPxGSv8/krJHMVNkljW9/7rChp/amYc5AmVGGs+g
   ZCuX1rqz7vkY2wsmGUVvqhe8yP31TMnH3rpS5G0ZRomEeFWLsLBUNL+lU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315234190"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315234190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 02:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="771876082"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="771876082"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 02:11:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLiBB-0000Zn-1M;
        Sat, 28 Jan 2023 10:11:25 +0000
Date:   Sat, 28 Jan 2023 18:10:42 +0800
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
Subject: Re: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
Message-ID: <202301281800.sm8woBKh-lkp@intel.com>
References: <20230127203729.10205-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127203729.10205-4-hdegoede@redhat.com>
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
[also build test ERROR on v6.2-rc5 next-20230127]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
patch link:    https://lore.kernel.org/r/20230127203729.10205-4-hdegoede%40redhat.com
patch subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
config: x86_64-randconfig-a012-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281800.sm8woBKh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
        git checkout d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/intel/int3472/discrete.c:17:
>> drivers/platform/x86/intel/int3472/common.h:107:26: error: field has incomplete type 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                                          ^
   drivers/platform/x86/intel/int3472/common.h:107:10: note: forward declaration of 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                          ^
   1 error generated.
--
   In file included from drivers/platform/x86/intel/int3472/led.c:7:
>> drivers/platform/x86/intel/int3472/common.h:107:26: error: field has incomplete type 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                                          ^
   drivers/platform/x86/intel/int3472/common.h:107:10: note: forward declaration of 'struct led_lookup_data'
                   struct led_lookup_data lookup;
                          ^
>> drivers/platform/x86/intel/int3472/led.c:57:2: error: implicit declaration of function 'led_add_lookup' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           led_add_lookup(&int3472->pled.lookup);
           ^
>> drivers/platform/x86/intel/int3472/led.c:71:2: error: implicit declaration of function 'led_remove_lookup' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           led_remove_lookup(&int3472->pled.lookup);
           ^
   3 errors generated.


vim +107 drivers/platform/x86/intel/int3472/common.h

    80	
    81	struct int3472_discrete_device {
    82		struct acpi_device *adev;
    83		struct device *dev;
    84		struct acpi_device *sensor;
    85		const char *sensor_name;
    86	
    87		const struct int3472_sensor_config *sensor_config;
    88	
    89		struct int3472_gpio_regulator {
    90			char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
    91			char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
    92			struct gpio_desc *gpio;
    93			struct regulator_dev *rdev;
    94			struct regulator_desc rdesc;
    95		} regulator;
    96	
    97		struct int3472_gpio_clock {
    98			struct clk *clk;
    99			struct clk_hw clk_hw;
   100			struct clk_lookup *cl;
   101			struct gpio_desc *ena_gpio;
   102			u32 frequency;
   103		} clock;
   104	
   105		struct int3472_pled {
   106			struct led_classdev classdev;
 > 107			struct led_lookup_data lookup;
   108			char name[INT3472_LED_MAX_NAME_LEN];
   109			struct gpio_desc *gpio;
   110		} pled;
   111	
   112		unsigned int ngpios; /* how many GPIOs have we seen */
   113		unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
   114		struct gpiod_lookup_table gpios;
   115	};
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
