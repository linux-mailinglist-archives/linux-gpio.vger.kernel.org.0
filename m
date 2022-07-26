Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6866858112C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 12:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbiGZKbI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 06:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbiGZKbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 06:31:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC2627B1B;
        Tue, 26 Jul 2022 03:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658831466; x=1690367466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=buTUpv21hPzfPEggPXI1QrQSGfzkMz+f1AZYRt7xzKw=;
  b=Uew8kbIjnX4kG/PDtrmCfUWenQDHGEcCRbP+Gce+F/cYNSeBTKSEpIor
   u+5Q1lSVVRNt5igPPPTilUX95cj36FD8XGF+WMjtrI2hZ1NDPdKcog+Ll
   lrL3ZVPcyYF587r6rDbUxHFggtwd8gQlWgR+AjYGc9noc+RqQaFQZXQL+
   Vzyx6WrylrYuAQZmUoWpYoyxEwhIt7In6jJMUD+tpqIDrJvuhqVF0jZgz
   4or0j/MsFDp1Eag2pc6P+gPomZjx/3L8Y5Sy4F+4t+kXc9H+HLqib1Kb4
   MLX/ttM76ovMxwONTMOnmyQLjgCL7h6e30EbaA9MBNvgOzG02VJkEYzEE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="289109318"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="289109318"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 03:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="550353557"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2022 03:31:02 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oGHq9-0006hQ-2O;
        Tue, 26 Jul 2022 10:31:01 +0000
Date:   Tue, 26 Jul 2022 18:30:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Message-ID: <202207261830.c3VuQ5P0-lkp@intel.com>
References: <20220721080423.156151-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721080423.156151-2-nuno.sa@analog.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Nuno,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on next-20220725]
[cannot apply to brgl/gpio/for-next hid/for-next linus/master v5.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220721-160531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20220726/202207261830.c3VuQ5P0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/357979f7c2525297178fb321c5793a4bd63dabb6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220721-160531
        git checkout 357979f7c2525297178fb321c5793a4bd63dabb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/gpio/driver.h:6,
                    from drivers/input/keyboard/adp5588-keys.c:13:
   drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpiomap_get_hwirq':
>> include/linux/irq.h:1245:25: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
    1245 | #define INVALID_HWIRQ   (~0UL)
         |                         ^
   drivers/input/keyboard/adp5588-keys.c:336:16: note: in expansion of macro 'INVALID_HWIRQ'
     336 |         return INVALID_HWIRQ;
         |                ^~~~~~~~~~~~~


vim +1245 include/linux/irq.h

2f75d9e1c90511 Thomas Gleixner 2017-09-13  1243  
d17bf24e695290 Qais Yousef     2015-12-08  1244  /* Contrary to Linux irqs, for hardware irqs the irq number 0 is valid */
d17bf24e695290 Qais Yousef     2015-12-08 @1245  #define INVALID_HWIRQ	(~0UL)
f9bce791ae2a1a Qais Yousef     2015-12-08  1246  irq_hw_number_t ipi_get_hwirq(unsigned int irq, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1247  int __ipi_send_single(struct irq_desc *desc, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1248  int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
3b8e29a82dd16c Qais Yousef     2015-12-08  1249  int ipi_send_single(unsigned int virq, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1250  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
d17bf24e695290 Qais Yousef     2015-12-08  1251  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
