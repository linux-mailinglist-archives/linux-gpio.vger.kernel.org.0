Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FAA67FAFF
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 21:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjA1Uv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 15:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA1Uv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 15:51:56 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA37E7A99
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674939114; x=1706475114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GLaT6oc+okyZu1qwx2iWRukgx4530tkAvqfrBV5G63o=;
  b=f21od4kqUl21NsaMJGSlLKNnEf1QoAlLMw433iOmU6o0CS0rH2Kqhkqu
   B5mEIBpvfaVikVqJ+RYI6CJSHKk9krs2J1sKSj90OZZ7rWkdpPTTtbVZT
   tgX9px+I7ka6vTsifbCDrKyVFzjRodS1gVvqWLKzwUxppfVeYbNSaexTE
   MCowrmWohvs+nK7IJbm6M838N6Ht645H08UjDWFO4/r85pwJLdcaGjtXo
   drM6xZKgaFj1jgkTNlVoQfAKZb7WyhcVMl6OpcHC+Xo2KAeSujy3HsNc7
   hvrueKGR6p3iKmNOC/mmAyfxicCOLvnFX9WE8qs3tFjVULUtrkZzStnQd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328619536"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328619536"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 12:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="656989763"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656989763"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 12:51:52 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLsAx-000162-1D;
        Sat, 28 Jan 2023 20:51:51 +0000
Date:   Sun, 29 Jan 2023 04:51:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h 5/5]
 arch/arm/mach-omap1/irq.c:236:11: error: call to undeclared function
 'irq_domain_add_legacy'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202301290451.rXX4STQA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
head:   df771cce328bbd37333797d0df3471c2e03ecb03
commit: df771cce328bbd37333797d0df3471c2e03ecb03 [5/5] gpio: Make the legacy <linux/gpio.h> consumer-only
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20230129/202301290451.rXX4STQA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=df771cce328bbd37333797d0df3471c2e03ecb03
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpiochip-no-driver-h
        git checkout df771cce328bbd37333797d0df3471c2e03ecb03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-omap1/irq.c:236:11: error: call to undeclared function 'irq_domain_add_legacy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           domain = irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
                    ^
>> arch/arm/mach-omap1/irq.c:237:13: error: use of undeclared identifier 'irq_domain_simple_ops'
                                          &irq_domain_simple_ops, NULL);
                                           ^
>> arch/arm/mach-omap1/irq.c:269:23: error: call to undeclared function 'irq_find_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           d = irq_get_irq_data(irq_find_mapping(domain, omap_l2_irq));
                                ^
   3 errors generated.


vim +/irq_domain_add_legacy +236 arch/arm/mach-omap1/irq.c

55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  219  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  220  	for (i = 0; i < irq_bank_count; i++) {
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  221  		irq_banks[i].va = ioremap(irq_banks[i].base_reg, 0xff);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  222  		if (WARN_ON(!irq_banks[i].va))
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  223  			return;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  224  	}
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  225  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  226  	nr_irqs = irq_bank_count * 32;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  227  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  228  	irq_base = irq_alloc_descs(-1, 0, nr_irqs, 0);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  229  	if (irq_base < 0) {
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  230  		pr_warn("Couldn't allocate IRQ numbers\n");
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  231  		irq_base = 0;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  232  	}
b694331cfb2ec3 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  233  	omap_l2_irq = cpu_is_omap7xx() ? irq_base + 1 : irq_base;
685e2d08c54b1a arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  234  	omap_l2_irq -= NR_IRQS_LEGACY;
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  235  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20 @236  	domain = irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20 @237  				       &irq_domain_simple_ops, NULL);
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  238  
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  239  	pr_info("Total of %lu interrupts in %i interrupt banks\n",
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  240  		nr_irqs, irq_bank_count);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  241  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  242  	/* Mask and clear all interrupts */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  243  	for (i = 0; i < irq_bank_count; i++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  244  		irq_bank_writel(~0x0, i, IRQ_MIR_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  245  		irq_bank_writel(0x0, i, IRQ_ITR_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  246  	}
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  247  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  248  	/* Clear any pending interrupts */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  249  	irq_bank_writel(0x03, 0, IRQ_CONTROL_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  250  	irq_bank_writel(0x03, 1, IRQ_CONTROL_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  251  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  252  	/* Enable interrupts in global mask */
59185eeeaad1f0 arch/arm/mach-omap1/irq.c Zebediah C. McClure 2009-03-23  253  	if (cpu_is_omap7xx())
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  254  		irq_bank_writel(0x0, 0, IRQ_GMR_REG_OFFSET);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  255  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  256  	/* Install the interrupt handlers for each bank */
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  257  	for (i = 0; i < irq_bank_count; i++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  258  		for (j = i * 32; j < (i + 1) * 32; j++) {
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  259  			int irq_trigger;
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  260  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  261  			irq_trigger = irq_banks[i].trigger_map >> IRQ_BIT(j);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  262  			omap_irq_set_cfg(j, 0, 0, irq_trigger);
e8d36d5dbb6a6e arch/arm/mach-omap1/irq.c Rob Herring         2015-07-27  263  			irq_clear_status_flags(j, IRQ_NOREQUEST);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  264  		}
55b44774438959 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20  265  		omap_alloc_gc(irq_banks[i].va, irq_base + i * 32, 32);
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  266  	}
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  267  
^1da177e4c3f41 arch/arm/mach-omap/irq.c  Linus Torvalds      2005-04-16  268  	/* Unmask level 2 handler */
b694331cfb2ec3 arch/arm/mach-omap1/irq.c Tony Lindgren       2015-05-20 @269  	d = irq_get_irq_data(irq_find_mapping(domain, omap_l2_irq));

:::::: The code at line 236 was first introduced by commit
:::::: 55b44774438959a957e717ecbdd9f2874b07ab31 ARM: OMAP1: Switch to use generic irqchip in preparation for sparse IRQ

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
