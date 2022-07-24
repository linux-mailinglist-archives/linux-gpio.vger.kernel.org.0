Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489D457F678
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 20:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiGXSdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 14:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiGXSdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 14:33:18 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EC4DF7B
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658687597; x=1690223597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnBS4cmtNEdvQdzG3C5h2n5+yQ8J1uEcZpHMuBUSM5U=;
  b=U6LwWl7VBjOcURWM8nVntyR3AJeRkbfemZ5zvp5C/rENJgnxykN5il66
   SyRZ23gzQ1lQsoKmfxz5dgKT6eGky3MIB1f2A457fDrpJFpa24gb7TNmT
   sDAirApp9dZjpossyXmszvxobZZas7LJkEus3gXqi2KnShdhadtR1JRrm
   18JeC0TRexMfHsOF58AIN9f0CPajaHKeMs7/FL0Isbs9ps0yhjvKx66Fl
   DJkbbAKTKw+yYUqv69Izo++qdpEPIr0fIJaILJjEl8tE7OaNEYQM4GTRL
   EUvaVprzGPqmXlZSk9FrE25P/jlmxfMsghrzdnTArfVXKWrspaBBiXKyu
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="287576019"
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="287576019"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 11:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="688816520"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2022 11:33:13 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oFgPh-00047J-0d;
        Sun, 24 Jul 2022 18:33:13 +0000
Date:   Mon, 25 Jul 2022 02:32:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-gpio@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Message-ID: <202207250224.XFYIB7dF-lkp@intel.com>
References: <20220724171057.18549-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724171057.18549-1-marex@denx.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
config: hexagon-randconfig-r041-20220724 (https://download.01.org/0day-ci/archive/20220725/202207250224.XFYIB7dF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/af6c815e16849c7ec370f755916d06a6b1e5b759
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/gpio-mxc-Protect-GPIO-irqchip-RMW-with-bgpio-spinlock/20220725-011230
        git checkout af6c815e16849c7ec370f755916d06a6b1e5b759
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mxc.c:189:20: error: incompatible pointer types passing 'raw_spinlock_t *' (aka 'struct raw_spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Werror,-Wincompatible-pointer-types]
           spin_lock_irqsave(&port->gc.bgpio_lock, flags);
                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:379:39: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
                                                ^~~~
   include/linux/spinlock.h:264:26: note: expanded from macro 'raw_spin_lock_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                                          ^~~~
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
                                                                  ^~~~
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                        ^~~~
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                                     ^~~~
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
                                  ^~~~
   include/linux/spinlock.h:322:67: note: passing argument to parameter 'lock' here
   static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
                                                                     ^
   drivers/gpio/gpio-mxc.c:210:25: error: incompatible pointer types passing 'raw_spinlock_t *' (aka 'struct raw_spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Werror,-Wincompatible-pointer-types]
           spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:402:64: note: passing argument to parameter 'lock' here
   static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
                                                                  ^
   drivers/gpio/gpio-mxc.c:222:20: error: incompatible pointer types passing 'raw_spinlock_t *' (aka 'struct raw_spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Werror,-Wincompatible-pointer-types]
           spin_lock_irqsave(&port->gc.bgpio_lock, flags);
                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:379:39: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
                                                ^~~~
   include/linux/spinlock.h:264:26: note: expanded from macro 'raw_spin_lock_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                                          ^~~~
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
                                                                  ^~~~
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                        ^~~~
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                                     ^~~~
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
                                  ^~~~
   include/linux/spinlock.h:322:67: note: passing argument to parameter 'lock' here
   static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
                                                                     ^
   drivers/gpio/gpio-mxc.c:242:25: error: incompatible pointer types passing 'raw_spinlock_t *' (aka 'struct raw_spinlock *') to parameter of type 'spinlock_t *' (aka 'struct spinlock *') [-Werror,-Wincompatible-pointer-types]
           spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:402:64: note: passing argument to parameter 'lock' here
   static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
                                                                  ^
   4 errors generated.


vim +189 drivers/gpio/gpio-mxc.c

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
   210		spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
   211	
   212		return 0;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
