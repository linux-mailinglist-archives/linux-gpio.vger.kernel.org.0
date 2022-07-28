Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396CC58482C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 00:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiG1WVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jul 2022 18:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiG1WVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2022 18:21:51 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F4A796AC
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659046910; x=1690582910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDTtPEezhca7r2uLqUPjcwAWL1CUm2m/nFmGccT0ESE=;
  b=MfG8yguKbsg3ofqmLcll5bkY+79g8yidhpURj290zZTrfkQ5obdDU9ys
   ePB7c8+v0J5R3XdQhkcDA6yPmdha//Vlfx11sMNkxzqaKvFYqadd37jAL
   8CnXgKxDvWGEz5tAPmGpnfdT0yHFa0v7ooghDyjlXJ5BMfWpvq9/G9WHi
   cVeZp3OVbiQ7FQDhiWCAhSY/wUeYQLKbQU8L+xAUQygpByA9iYuaZpgG0
   NIlysJmS/inSgYXkyNI4YD5lx3/EbCAA0R6FhZN4JykAZKE2mV8gGypDx
   wHvGImFBwa07lNSniHaxwCz9/RYX2u3Pw2sE7SP0DnldeL0595NGmP4r4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="289408257"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="289408257"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 15:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="633912882"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jul 2022 15:21:47 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oHBt4-000Ae4-2L;
        Thu, 28 Jul 2022 22:21:46 +0000
Date:   Fri, 29 Jul 2022 06:21:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Message-ID: <202207290626.5eWctWgO-lkp@intel.com>
References: <20220724224943.294057-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724224943.294057-1-marex@denx.de>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/gpio-mxc-Protect-GPIO-irqchip-RMW-with-bgpio-spinlock/20220725-065121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
config: mips-randconfig-r006-20220728 (https://download.01.org/0day-ci/archive/20220729/202207290626.5eWctWgO-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/670bfed8938f593e99c7784ff2efe48bc5b9e21d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/gpio-mxc-Protect-GPIO-irqchip-RMW-with-bgpio-spinlock/20220725-065121
        git checkout 670bfed8938f593e99c7784ff2efe48bc5b9e21d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/rwsem.h:15,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:14,
                    from drivers/gpio/gpio-mxc.c:10:
   drivers/gpio/gpio-mxc.c: In function 'gpio_set_irq_type':
>> drivers/gpio/gpio-mxc.c:190:27: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     190 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           |
         |                           raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_lock_irqsave'
     242 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpio/gpio-mxc.c:190:9: note: in expansion of macro 'spin_lock_irqsave'
     190 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:322:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~
>> drivers/gpio/gpio-mxc.c:211:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     211 |         spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:402:64: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     402 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c: In function 'mxc_flip_edge':
   drivers/gpio/gpio-mxc.c:223:27: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     223 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           |
         |                           raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_lock_irqsave'
     242 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpio/gpio-mxc.c:223:9: note: in expansion of macro 'spin_lock_irqsave'
     223 |         spin_lock_irqsave(&port->gc.bgpio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:322:67: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                                       ~~~~~~~~~~~~^~~~
   drivers/gpio/gpio-mxc.c:243:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]
     243 |         spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
         |                                ^~~~~~~~~~~~~~~~~~~~
         |                                |
         |                                raw_spinlock_t * {aka struct raw_spinlock *}
   include/linux/spinlock.h:402:64: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_spinlock *'}
     402 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/spinlock_check +190 drivers/gpio/gpio-mxc.c

   146	
   147	static int gpio_set_irq_type(struct irq_data *d, u32 type)
   148	{
   149		struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
   150		struct mxc_gpio_port *port = gc->private;
   151		unsigned long flags;
   152		u32 bit, val;
   153		u32 gpio_idx = d->hwirq;
   154		int edge;
   155		void __iomem *reg = port->base;
   156	
   157		port->both_edges &= ~(1 << gpio_idx);
   158		switch (type) {
   159		case IRQ_TYPE_EDGE_RISING:
   160			edge = GPIO_INT_RISE_EDGE;
   161			break;
   162		case IRQ_TYPE_EDGE_FALLING:
   163			edge = GPIO_INT_FALL_EDGE;
   164			break;
   165		case IRQ_TYPE_EDGE_BOTH:
   166			if (GPIO_EDGE_SEL >= 0) {
   167				edge = GPIO_INT_BOTH_EDGES;
   168			} else {
   169				val = port->gc.get(&port->gc, gpio_idx);
   170				if (val) {
   171					edge = GPIO_INT_LOW_LEV;
   172					pr_debug("mxc: set GPIO %d to low trigger\n", gpio_idx);
   173				} else {
   174					edge = GPIO_INT_HIGH_LEV;
   175					pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
   176				}
   177				port->both_edges |= 1 << gpio_idx;
   178			}
   179			break;
   180		case IRQ_TYPE_LEVEL_LOW:
   181			edge = GPIO_INT_LOW_LEV;
   182			break;
   183		case IRQ_TYPE_LEVEL_HIGH:
   184			edge = GPIO_INT_HIGH_LEV;
   185			break;
   186		default:
   187			return -EINVAL;
   188		}
   189	
 > 190		spin_lock_irqsave(&port->gc.bgpio_lock, flags);
   191	
   192		if (GPIO_EDGE_SEL >= 0) {
   193			val = readl(port->base + GPIO_EDGE_SEL);
   194			if (edge == GPIO_INT_BOTH_EDGES)
   195				writel(val | (1 << gpio_idx),
   196					port->base + GPIO_EDGE_SEL);
   197			else
   198				writel(val & ~(1 << gpio_idx),
   199					port->base + GPIO_EDGE_SEL);
   200		}
   201	
   202		if (edge != GPIO_INT_BOTH_EDGES) {
   203			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
   204			bit = gpio_idx & 0xf;
   205			val = readl(reg) & ~(0x3 << (bit << 1));
   206			writel(val | (edge << (bit << 1)), reg);
   207		}
   208	
   209		writel(1 << gpio_idx, port->base + GPIO_ISR);
   210	
 > 211		spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
   212	
   213		return 0;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
