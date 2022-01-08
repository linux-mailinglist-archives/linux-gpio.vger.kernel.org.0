Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61055488569
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jan 2022 19:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbiAHSzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Jan 2022 13:55:07 -0500
Received: from mga06.intel.com ([134.134.136.31]:8439 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbiAHSzH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 8 Jan 2022 13:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641668107; x=1673204107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zdkIaLVAS9ojJaEnKgNW7+GHQwXL2mbZsLCaNEGLpfo=;
  b=OyNpwJ/F41w/HnvyuN+7V0HTMGhHipIbSf5tpfxdVluzKx+1AkyssMKr
   HOaWv5eFMip1sNi1bTCmWJ5V/c8VNqxJpZDB8AcdUKY8D/3v1SW/MyAc0
   u65NMfdO7IFs7qLV8eyLTF7JYtfA51BQea+rxkJ9eqHv670T/MzvIch4z
   BhdPBqHj3GbEkL2F6meSsjvxPOQnPNAmOLlMY06OEaRhLXLc3Qp6+LnV6
   UXJ5c74jJheqY/7GErIHXjW4BIae6eDa2oD11N0MoIU62cH7zyQYhhzGX
   aG5XY+UbUHS0LXHSvwjDy6ZHU2mclDB62N5/ux1vb3xifEfC7yupjnDC/
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10221"; a="303776133"
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="303776133"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 10:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,273,1635231600"; 
   d="scan'208";a="622266559"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2022 10:55:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n6Gro-0000vp-AR; Sat, 08 Jan 2022 18:55:04 +0000
Date:   Sun, 9 Jan 2022 02:54:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <202201090243.oStM3Qc9-lkp@intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107234456.148389-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: i386-randconfig-r013-20220108 (https://download.01.org/0day-ci/archive/20220109/202201090243.oStM3Qc9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/fc9eb527f62b0bebde64745ec5b0a838fde7ef41
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
        git checkout fc9eb527f62b0bebde64745ec5b0a838fde7ef41
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pinctrl/intel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/pinctrl/intel/pinctrl-baytrail.c:9:
   drivers/pinctrl/intel/pinctrl-baytrail.c: In function 'byt_direct_irq_sanity_check':
>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:20: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
    1483 |   dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:27: note: in definition of macro 'dev_printk'
     129 |   _dev_printk(level, dev, fmt, ##__VA_ARGS__);  \
         |                           ^~~
   include/linux/dev_printk.h:163:31: note: in expansion of macro 'dev_fmt'
     163 |   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                               ^~~~~~~
   drivers/pinctrl/intel/pinctrl-baytrail.c:1483:3: note: in expansion of macro 'dev_dbg'
    1483 |   dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
         |   ^~~~~~~
   drivers/pinctrl/intel/pinctrl-baytrail.c:1483:47: note: format string is defined here
    1483 |   dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
         |                                             ~~^
         |                                               |
         |                                               long int
         |                                             %d


vim +1483 drivers/pinctrl/intel/pinctrl-baytrail.c

  1468	
  1469	static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
  1470	{
  1471		u8 *match, direct_irq[16];
  1472	
  1473		if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
  1474			dev_warn(vg->dev,
  1475				 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
  1476			return false;
  1477		}
  1478	
  1479		memcpy_fromio(direct_irq, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
  1480			      sizeof(direct_irq));
  1481		match = memchr(direct_irq, pin, sizeof(direct_irq));
  1482		if (match)
> 1483			dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
  1484		else
  1485			dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
  1486	
  1487		return match;
  1488	}
  1489	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
