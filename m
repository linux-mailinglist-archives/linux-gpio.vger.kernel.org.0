Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D239657F690
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 20:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiGXSnT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 14:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiGXSnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 14:43:18 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477CBDEEA
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658688197; x=1690224197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kIV1eVXuz6/KJcm/BbfjWcwmIdq/szLJMEGT0VYYZs=;
  b=SzdHLDOTwN2EggyiIqhl/sZZxZ1/lwphAN26QYWZpK0TY9dxHxe19A9R
   fjmkEAWoBm/EUkXt4SOZCCs9uoYnILjy5lGPCQB78RP7DCCB4JK/GR8tE
   e9KwrfyCFnUL9IJPNr7R1iNZDJVAEjapRNeCkMwdhxxmpOd0/8KdnhG+o
   rkJQYFPbPnwweORfyuDQpWMVoyUB2Av2+pDh2hIm3vMTwACZdSTwjHIDN
   dRVyQ3n/sGg0uXR89c6W9huLuZA+gpfchORJQ2mpSyZtIB4rYciGtFuiN
   vPwYcVRDjtsUxE6gUzgHTHJrDm3TGq7nwrbEtPe/hHSaJDYaZxS1YOfL6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="267337560"
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="267337560"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 11:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="549735852"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jul 2022 11:43:14 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oFgZN-000481-1v;
        Sun, 24 Jul 2022 18:43:13 +0000
Date:   Mon, 25 Jul 2022 02:42:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Message-ID: <202207250224.0POKsKcZ-lkp@intel.com>
References: <20220724171057.18549-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724171057.18549-1-marex@denx.de>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v5.19-rc7 next-20220722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/gpio-mxc-Protect-GPIO-irqchip-RMW-with-bgpio-spinlock/20220725-011230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
config: openrisc-buildonly-randconfig-r005-20220724 (https://download.01.org/0day-ci/archive/20220725/202207250224.0POKsKcZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/af6c815e16849c7ec370f755916d06a6b1e5b759
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/gpio-mxc-Protect-GPIO-irqchip-RMW-with-bgpio-spinlock/20220725-011230
        git checkout af6c815e16849c7ec370f755916d06a6b1e5b759
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/rwsem.h:15,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:14,
                    from drivers/gpio/gpio-mxc.c:10:
   drivers/gpio/gpio-mxc.c: In function 'gpio_set_irq_type':
>> drivers/gpio/gpio-mxc.c:189:27: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     189 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           |
         |                           raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_lock_irqsave'
     242 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpio/gpio-mxc.c:189:9: note: in expansion of macro 'spin_lock_irqsave'
     189 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:322:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~
>> drivers/gpio/gpio-mxc.c:210:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     210 |         spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:402:64: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     402 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c: In function 'mxc_flip_edge':
   drivers/gpio/gpio-mxc.c:222:27: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     222 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           |
         |                           raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_lock_irqsave'
     242 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpio/gpio-mxc.c:222:9: note: in expansion of macro 'spin_lock_irqsave'
     222 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:322:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c:242:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     242 |         spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:402:64: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     402 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/spinlock_check +189 drivers/gpio/gpio-mxc.c

   145	
   146	static int gpio_set_irq_type(struct irq_data *d, u32 type)
   147	{
   148		struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
   149		struct mxc_gpio_port *port = gc->private;
   150		unsigned long flags;
   151		u32 bit, val;
   152		u32 gpio_idx = d->hwirq;
   153		int edge;
   154		void __iomem *reg = port->base;
   155	
   156		port->both_edges &= ~(1 << gpio_idx);
   157		switch (type) {
   158		case IRQ_TYPE_EDGE_RISING:
   159			edge = GPIO_INT_RISE_EDGE;
   160			break;
   161		case IRQ_TYPE_EDGE_FALLING:
   162			edge = GPIO_INT_FALL_EDGE;
   163			break;
   164		case IRQ_TYPE_EDGE_BOTH:
   165			if (GPIO_EDGE_SEL >= 0) {
   166				edge = GPIO_INT_BOTH_EDGES;
   167			} else {
   168				val = port->gc.get(&port->gc, gpio_idx);
   169				if (val) {
   170					edge = GPIO_INT_LOW_LEV;
   171					pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
   172				} else {
   173					edge = GPIO_INT_HIGH_LEV;
   174					pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
   175				}
   176				port->both_edges |= 1 << gpio_idx;
   177			}
   178			break;
   179		case IRQ_TYPE_LEVEL_LOW:
   180			edge = GPIO_INT_LOW_LEV;
   181			break;
   182		case IRQ_TYPE_LEVEL_HIGH:
   183			edge = GPIO_INT_HIGH_LEV;
   184			break;
   185		default:
   186			return -EINVAL;
   187		}
   188	
 > 189		spin_lock_irqsave(&port->gc.bgpio_lock, flags);
   190	
   191		if (GPIO_EDGE_SEL >= 0) {
   192			val = readl(port->base + GPIO_EDGE_SEL);
   193			if (edge == GPIO_INT_BOTH_EDGES)
   194				writel(val | (1 << gpio_idx),
   195					port->base + GPIO_EDGE_SEL);
   196			else
   197				writel(val & ~(1 << gpio_idx),
   198					port->base + GPIO_EDGE_SEL);
   199		}
   200	
   201		if (edge != GPIO_INT_BOTH_EDGES) {
   202			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
   203			bit = gpio_idx & 0xf;
   204			val = readl(reg) & ~(0x3 << (bit << 1));
   205			writel(val | (edge << (bit << 1)), reg);
   206		}
   207	
   208		writel(1 << gpio_idx, port->base + GPIO_ISR);
   209	
 > 210		spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
   211	
   212		return 0;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
