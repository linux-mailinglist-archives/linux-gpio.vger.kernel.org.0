Return-Path: <linux-gpio+bounces-4181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D198741A9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 22:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA771C20CB8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 21:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DC918EAF;
	Wed,  6 Mar 2024 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aj3DbLZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF118B1B
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709759378; cv=none; b=YRNmF7MTqoPCmopWJLabAn2lcYqAsieblGYk9niMNovtL7DPQ6eshLzQg0Y4/Ay7VWHPUQxC2j3/dL2nlHM5+/qVXt+KHX5STFny2Cy/atMR7CaonQ/bb9NtxKQXgiD0d5HQixTTf2ql8k8DIC/rHSE3VBV4KJtnkISU+HiceSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709759378; c=relaxed/simple;
	bh=kbtosrtiJvmOWa2OgXigZ/GIkXP+bCq5d5mImVz7z7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhcKYwj76C5r/8rbQm1DSJRKXyBeTVOeO524APGZxxlyPQ7hU1DvCzThTvw3eUySHY8vUheLQlTbqICFK5aEpOvu+rtPpLRAspYU2jWZSnR3D37LwPY4RzUq4uD1p6v/8sofdYU3DUTZCQfsP7CaloJGwbB6Co4chjrKpqEHrns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aj3DbLZj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709759377; x=1741295377;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kbtosrtiJvmOWa2OgXigZ/GIkXP+bCq5d5mImVz7z7Q=;
  b=Aj3DbLZjpjPlwe4z9gaDdw0GJgEeyEnAugqar+k2OF5tCTwbPtnXKuEM
   XjNORR9e9L0LzWRnNBpu3iiGXNGjlraNSRsnuq21JvGW6c6gYH7TZvmpj
   d1zmN3AeDwvCyAQJVbn7x7OqeHjmetVUvUvnQbKkYi+hDqwffG2m1Tnr/
   NP1ZO0++hTHRp4meFEHEivQ027lWI1I9+Y5xn1g+4HXVALzBQ8yIrCkwm
   qkBzyhnBTYb9//KiUMdc+mC0Uk7AqDG78mmTqGe6XbUSoLCyMi5ZvODJP
   ruw/I7VnZA3h30g5byRWxBFpR/GGbdMFXEhTnQj3eM7SbHYOZzXR1TQHe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8224698"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8224698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 13:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="14531501"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2024 13:09:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhyW4-0004Y9-0J;
	Wed, 06 Mar 2024 21:09:32 +0000
Date: Thu, 7 Mar 2024 05:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-nomadik-gpio 28/28]
 drivers/gpio/gpio-nomadik.c:589:4: warning: format specifies type 'void *'
 but the argument has type 'long'
Message-ID: <202403070521.gdNupw2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   efaa90ed2cff038f12c077e9b040b97ac362b09c
commit: efaa90ed2cff038f12c077e9b040b97ac362b09c [28/28] gpio: nomadik: Back out some managed resources
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070521.gdNupw2n-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070521.gdNupw2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070521.gdNupw2n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-nomadik.c:23:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-nomadik.c:23:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpio/gpio-nomadik.c:23:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-nomadik.c:589:4: warning: format specifies type 'void *' but the argument has type 'long' [-Wformat]
     588 |                 dev_err(dev, "failed getting reset control: %pe\n",
         |                                                             ~~
         |                                                             %ld
     589 |                         PTR_ERR(reset));
         |                         ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   18 warnings generated.


vim +589 drivers/gpio/gpio-nomadik.c

966942ae493650 Théo Lebrun   2024-02-28  543  
efaa90ed2cff03 Linus Walleij 2024-03-05  544  	nmk_chip = devm_kzalloc(dev, sizeof(*nmk_chip), GFP_KERNEL);
966942ae493650 Théo Lebrun   2024-02-28  545  	if (!nmk_chip) {
966942ae493650 Théo Lebrun   2024-02-28  546  		platform_device_put(gpio_pdev);
966942ae493650 Théo Lebrun   2024-02-28  547  		return ERR_PTR(-ENOMEM);
966942ae493650 Théo Lebrun   2024-02-28  548  	}
966942ae493650 Théo Lebrun   2024-02-28  549  
50bc2a4953cceb Théo Lebrun   2024-02-28  550  	if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
50bc2a4953cceb Théo Lebrun   2024-02-28  551  		ngpio = NMK_GPIO_PER_CHIP;
efaa90ed2cff03 Linus Walleij 2024-03-05  552  		dev_dbg(dev, "populate: using default ngpio (%u)\n", ngpio);
50bc2a4953cceb Théo Lebrun   2024-02-28  553  	}
50bc2a4953cceb Théo Lebrun   2024-02-28  554  
3c30cc26df0a3f Théo Lebrun   2024-02-28  555  	nmk_chip->is_mobileye_soc = device_is_compatible(gpio_dev,
3c30cc26df0a3f Théo Lebrun   2024-02-28  556  							 "mobileye,eyeq5-gpio");
966942ae493650 Théo Lebrun   2024-02-28  557  	nmk_chip->bank = id;
966942ae493650 Théo Lebrun   2024-02-28  558  	chip = &nmk_chip->chip;
75d270fda64d4e Théo Lebrun   2024-02-28  559  	chip->base = -1;
50bc2a4953cceb Théo Lebrun   2024-02-28  560  	chip->ngpio = ngpio;
0b95fcd1f42f0f Théo Lebrun   2024-02-28  561  	chip->label = dev_name(gpio_dev);
0b95fcd1f42f0f Théo Lebrun   2024-02-28  562  	chip->parent = gpio_dev;
966942ae493650 Théo Lebrun   2024-02-28  563  
efaa90ed2cff03 Linus Walleij 2024-03-05  564  	/* NOTE: different devices! No devm_platform_ioremap_resource() here! */
efaa90ed2cff03 Linus Walleij 2024-03-05  565  	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
efaa90ed2cff03 Linus Walleij 2024-03-05  566  	base = devm_ioremap_resource(dev, res);
966942ae493650 Théo Lebrun   2024-02-28  567  	if (IS_ERR(base)) {
966942ae493650 Théo Lebrun   2024-02-28  568  		platform_device_put(gpio_pdev);
966942ae493650 Théo Lebrun   2024-02-28  569  		return ERR_CAST(base);
966942ae493650 Théo Lebrun   2024-02-28  570  	}
966942ae493650 Théo Lebrun   2024-02-28  571  	nmk_chip->addr = base;
966942ae493650 Théo Lebrun   2024-02-28  572  
efaa90ed2cff03 Linus Walleij 2024-03-05  573  	/* NOTE: do not use devm_ here! */
efaa90ed2cff03 Linus Walleij 2024-03-05  574  	clk = clk_get_optional(gpio_dev, NULL);
966942ae493650 Théo Lebrun   2024-02-28  575  	if (IS_ERR(clk)) {
966942ae493650 Théo Lebrun   2024-02-28  576  		platform_device_put(gpio_pdev);
efaa90ed2cff03 Linus Walleij 2024-03-05  577  		return ERR_CAST(clk);
966942ae493650 Théo Lebrun   2024-02-28  578  	}
966942ae493650 Théo Lebrun   2024-02-28  579  	clk_prepare(clk);
966942ae493650 Théo Lebrun   2024-02-28  580  	nmk_chip->clk = clk;
966942ae493650 Théo Lebrun   2024-02-28  581  
efaa90ed2cff03 Linus Walleij 2024-03-05  582  	/* NOTE: do not use devm_ here! */
efaa90ed2cff03 Linus Walleij 2024-03-05  583  	reset = reset_control_get_optional_shared(gpio_dev, NULL);
6ad679cfaeea92 Théo Lebrun   2024-02-28  584  	if (IS_ERR(reset)) {
efaa90ed2cff03 Linus Walleij 2024-03-05  585  		clk_unprepare(clk);
efaa90ed2cff03 Linus Walleij 2024-03-05  586  		clk_put(clk);
efaa90ed2cff03 Linus Walleij 2024-03-05  587  		platform_device_put(gpio_pdev);
efaa90ed2cff03 Linus Walleij 2024-03-05  588  		dev_err(dev, "failed getting reset control: %pe\n",
6ad679cfaeea92 Théo Lebrun   2024-02-28 @589  			PTR_ERR(reset));
6ad679cfaeea92 Théo Lebrun   2024-02-28  590  		return ERR_CAST(reset);
6ad679cfaeea92 Théo Lebrun   2024-02-28  591  	}
6ad679cfaeea92 Théo Lebrun   2024-02-28  592  
6ad679cfaeea92 Théo Lebrun   2024-02-28  593  	/*
6ad679cfaeea92 Théo Lebrun   2024-02-28  594  	 * Reset might be shared and asserts/deasserts calls are unbalanced. We
6ad679cfaeea92 Théo Lebrun   2024-02-28  595  	 * only support sharing this reset with other gpio-nomadik devices that
6ad679cfaeea92 Théo Lebrun   2024-02-28  596  	 * use this reset to ensure deassertion at probe.
6ad679cfaeea92 Théo Lebrun   2024-02-28  597  	 */
6ad679cfaeea92 Théo Lebrun   2024-02-28  598  	ret = reset_control_deassert(reset);
6ad679cfaeea92 Théo Lebrun   2024-02-28  599  	if (ret) {
efaa90ed2cff03 Linus Walleij 2024-03-05  600  		reset_control_put(reset);
efaa90ed2cff03 Linus Walleij 2024-03-05  601  		clk_unprepare(clk);
efaa90ed2cff03 Linus Walleij 2024-03-05  602  		clk_put(clk);
efaa90ed2cff03 Linus Walleij 2024-03-05  603  		platform_device_put(gpio_pdev);
efaa90ed2cff03 Linus Walleij 2024-03-05  604  		dev_err(dev, "failed reset deassert: %d\n", ret);
6ad679cfaeea92 Théo Lebrun   2024-02-28  605  		return ERR_PTR(ret);
6ad679cfaeea92 Théo Lebrun   2024-02-28  606  	}
6ad679cfaeea92 Théo Lebrun   2024-02-28  607  

:::::: The code at line 589 was first introduced by commit
:::::: 6ad679cfaeea9291e9dce3247e34656080fc1d29 gpio: nomadik: grab optional reset control and deassert it at probe

:::::: TO: Théo Lebrun <theo.lebrun@bootlin.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

