Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B460957EC24
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jul 2022 06:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiGWE5I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 00:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGWE5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 00:57:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EDD4F691;
        Fri, 22 Jul 2022 21:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658552227; x=1690088227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMSMekzxd46aJ2CW0m5a7du5wb1V2aYzSQjtKvvhHog=;
  b=Qh6GbE0jtq5Atey6+BWOvZ+MMeLsMEH4IyJkbw0XI+ENScRXZ+wUq8Zs
   4D119AQmUfBy0cptFPRlIpQ6rHJR39oHNSIRRtADgBpvl2GZYmfoARGGq
   CJqcM86hhKpEuuc1MMPV57cv6wNNZb9lIIXVpy/zRDhs+9NhkoHykvCOP
   dgnlElFT6ED5uTa2lq0f4FvE8fGauuXEJV/L0XKASkwV8iNwAglXpaMQh
   HDks5ts1kU5scBf99YiR3qNpKaa2TpVhJXOTjW3E+H2zwHrE9O3rUQ43N
   d45+d0MfO6JPyNh1MQ50gBkTqWA/ZHv48IkkHZRFNqbpGpIYXN7FdsOQC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="267219118"
X-IronPort-AV: E=Sophos;i="5.93,187,1654585200"; 
   d="scan'208";a="267219118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 21:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,187,1654585200"; 
   d="scan'208";a="549389809"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jul 2022 21:57:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oF7CI-0002Gy-2S;
        Sat, 23 Jul 2022 04:57:02 +0000
Date:   Sat, 23 Jul 2022 12:56:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Message-ID: <202207231228.n8l077iB-lkp@intel.com>
References: <20220721080423.156151-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721080423.156151-2-nuno.sa@analog.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Nuno,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on next-20220722]
[cannot apply to brgl/gpio/for-next hid/for-next linus/master v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220721-160531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220723/202207231228.n8l077iB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/357979f7c2525297178fb321c5793a4bd63dabb6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220721-160531
        git checkout 357979f7c2525297178fb321c5793a4bd63dabb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/keyboard/ drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/keyboard/adp5588-keys.c:336:9: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
           return INVALID_HWIRQ;
           ~~~~~~ ^~~~~~~~~~~~~
   include/linux/irq.h:1245:24: note: expanded from macro 'INVALID_HWIRQ'
   #define INVALID_HWIRQ   (~0UL)
                            ^~~~
   1 warning generated.


vim +336 drivers/input/keyboard/adp5588-keys.c

   323	
   324	static int adp5588_gpiomap_get_hwirq(struct device *dev, const u8 *map,
   325					     unsigned int gpio, unsigned int ngpios)
   326	{
   327		unsigned int hwirq;
   328	
   329		for (hwirq = 0; hwirq < ngpios; hwirq++)
   330			if (map[hwirq] == gpio)
   331				return hwirq;
   332	
   333		/* should never happen */
   334		dev_warn_ratelimited(dev, "could not find the hwirq for gpio(%u)\n", gpio);
   335	
 > 336		return INVALID_HWIRQ;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
