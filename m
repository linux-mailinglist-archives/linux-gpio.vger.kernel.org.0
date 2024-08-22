Return-Path: <linux-gpio+bounces-8969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F095B148
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 11:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993D81C21E01
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 09:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D940139D1A;
	Thu, 22 Aug 2024 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRQOSWwA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193671BF2A;
	Thu, 22 Aug 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318226; cv=none; b=qkPJdQ8+BaPR9Tb0Ap+5gMKY21cH8Xx43vR8ex0V7bYQ4FIVw2+bxriYCFlSNgjZf6ZjUsg853OD3gB1Axzd6Rk5+EYkScU4BN9SzI6GPdia968Rp6ITbAp2Wb0H6d44EeUZ+j1GqsbThoLaulrD69npwKAvNx/TZVT5UsNNs+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318226; c=relaxed/simple;
	bh=a5PNgAbycCCuxa0C4C7BKpl2tPEQguQMGeFz4yS4IDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlCuktJ39+TUWn81LwxDu5W/OsgaUYSwtw2C6tABb7CU2L1kitMmvw6CkArVh/pwsi1FrK6cM5AVAkOQdUypStcqiiJheadqFyiJt2jdE4ajM0ULrC0O56gnVMl7vuSrKdfLB47Vso3sPGzY9XGhxQlsMGEUnFnM5w7olOmkJOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRQOSWwA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724318224; x=1755854224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a5PNgAbycCCuxa0C4C7BKpl2tPEQguQMGeFz4yS4IDY=;
  b=ZRQOSWwAP70nOk1RlD53e4s2ZE5nyxXgB+2ePOgdMlGnEt3Mh2OYXA4E
   tR+nb+xyXIJA9Ix8QCxCFkaN5pQhE2+NFYIJolsM3xLcArrf0EmTvCYHR
   bovgo+wZPgN1atR0IsLnGFCvieF/dgThk43IV0fGlwo+XWCgsRJLoGNKP
   KkXxVUkeKd/lys5IodEkiEA2HEEtV+JwC5IFvO5wp464pz6KAd2HhWI/w
   TXacwd1IH/PIkoZXHZYhTlDHRefu2CfsYVSGBIbTD4YAWfzIx+ISoW+oA
   84lzGOhtnb7mFn4yzttvQt1AZRfnHepbL6iTbNIYg3dw+bg0ArEp3jGVN
   g==;
X-CSE-ConnectionGUID: WdY/AILkQKWXg0lmc/FzrA==
X-CSE-MsgGUID: N/DotHE7Q9STouhZJ81VJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33873634"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="33873634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 02:17:03 -0700
X-CSE-ConnectionGUID: eN96XfaFTkanRcr91cANTg==
X-CSE-MsgGUID: RfBXsT0JSoaL6GquC24RHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61702781"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Aug 2024 02:16:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh3w9-000Ccy-1e;
	Thu, 22 Aug 2024 09:16:57 +0000
Date: Thu, 22 Aug 2024 17:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Message-ID: <202408221624.UtsHD8HQ-lkp@intel.com>
References: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240821-150951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240821070740.2378602-3-billy_tsai%40aspeedtech.com
patch subject: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408221624.UtsHD8HQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221624.UtsHD8HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221624.UtsHD8HQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-aspeed-g7.c:10:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/gpio/gpio-aspeed-g7.c:10:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpio/gpio-aspeed-g7.c:10:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-aspeed-g7.c:474:49: error: too few arguments to function call, expected 2, have 1
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                ~~~~~~~~~~~~~~~~~~~~                    ^
   include/linux/pinctrl/consumer.h:30:5: note: 'pinctrl_gpio_request' declared here
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c:479:39: error: too few arguments to function call, expected 2, have 1
     479 |         pinctrl_gpio_free(chip->base + offset);
         |         ~~~~~~~~~~~~~~~~~                    ^
   include/linux/pinctrl/consumer.h:31:6: note: 'pinctrl_gpio_free' declared here
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |      ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c:676:48: error: too few arguments to function call, expected 3, have 2
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~               ^
   include/linux/pinctrl/consumer.h:36:5: note: 'pinctrl_gpio_set_config' declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      37 |                                 unsigned long config);
         |                                 ~~~~~~~~~~~~~~~~~~~~
   17 warnings and 3 errors generated.


vim +474 drivers/gpio/gpio-aspeed-g7.c

   468	
   469	static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int offset)
   470	{
   471		if (!have_gpio(gpiochip_get_data(chip), offset))
   472			return -ENODEV;
   473	
 > 474		return pinctrl_gpio_request(chip->base + offset);
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

