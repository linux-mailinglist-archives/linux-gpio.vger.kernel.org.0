Return-Path: <linux-gpio+bounces-5265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B425289E9E0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 07:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E901EB227DE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 05:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6363199C2;
	Wed, 10 Apr 2024 05:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZrlONGM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B017552
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 05:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712727698; cv=none; b=C1bcdLFtzX+qyspMyZMMRK8dysJGnt4ivRelceezzj709SWJs83q5p6XlPGDFFvRb3BGqTXU2X8RrbmuyOpehKI4IH24wMsSsYakvTUEiyV1+kri2ac3O13RjFN9CwVlsKG29hYk1i0oBC3wRtzOe11nIF0XVNRw+1OOiOcqXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712727698; c=relaxed/simple;
	bh=pMSRmRBfDuHuy4muvLZqPq8Sv099ZO5wjzDO2yjjTms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lu/3R5G5OMW48fIj/o2jMwrbeImXNCqvnBAx3GmTV1wXrCPCXxfx2G5gyx1ZrF/5yfFdk3Zmsebb3WCHegDViMXNsCXbE9vEV3aJGgN13iaBuOd0fzoMPE5l9rwtJS7MizMKYm2WkT2uC6D4JZxSfK/3jeI0nidL3FWYRfIaiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZrlONGM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712727697; x=1744263697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMSRmRBfDuHuy4muvLZqPq8Sv099ZO5wjzDO2yjjTms=;
  b=aZrlONGMkZlLM9BLgw7/NWuUxo85bozY+0Yx4Cs0La0WY3O8r58IQn15
   bsygkLZNSf0p2aZo3eUVftdw0Z4JkZNCpGkLVlU5c0hNG9/l4hxzPDQtQ
   BFUwPtKKSsab6talhH7JlrrhXIBzmYF/VBubqix/vzuGJRVafZFOaOT9P
   IJHBTM6BgLzTsOVqlrJGyUv3iOA1tT6Fa3wsUOWTRL/E1SN73nwpSbWo0
   P69vwXqqgdOVJLx0TF/1ET9wpHlkIdmbhHpIcZgpZpao2T+0QFLYr5wM3
   LhNp/99vuDyN+umj9OuCwoMgAP+cq+1eP2nT+9Eu3TlG6iLAglR6xFft9
   A==;
X-CSE-ConnectionGUID: uWNQPpRdR/6tXYjN2Nn3LA==
X-CSE-MsgGUID: YPub4uSvTbuldBhwpGA9/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11845674"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11845674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 22:41:36 -0700
X-CSE-ConnectionGUID: E9p33JQDS+yPMOHfLF1Aug==
X-CSE-MsgGUID: xErRgW6cRf+rBO5kynUOyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20513631"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Apr 2024 22:41:35 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruQiC-0006xe-2p;
	Wed, 10 Apr 2024 05:41:32 +0000
Date: Wed, 10 Apr 2024 13:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:240:32: error: use of undeclared identifier
 'pdev'; did you mean 'dev'?
Message-ID: <202404101357.XagbwkcW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53
commit: 3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53 [2/2] wifi: ath9k: Obtain system GPIOS from descriptors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404101357.XagbwkcW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101357.XagbwkcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101357.XagbwkcW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpio-ath79.c:11:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpio/gpio-ath79.c:11:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpio/gpio-ath79.c:11:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/gpio/gpio-ath79.c:240:32: error: use of undeclared identifier 'pdev'; did you mean 'dev'?
     240 |         lookup = devm_kzalloc(&pdev->dev,
         |                                ^~~~
         |                                dev
   drivers/gpio/gpio-ath79.c:233:64: note: 'dev' declared here
     233 | static int ath79_gpio_register_wifi_descriptors(struct device *dev,
         |                                                                ^
>> drivers/gpio/gpio-ath79.c:240:38: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
     240 |         lookup = devm_kzalloc(&pdev->dev,
         |                                      ^~~
         |                                      devt
   include/linux/device.h:776:10: note: 'devt' declared here
     776 |         dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
         |                                 ^
>> drivers/gpio/gpio-ath79.c:251:4: error: call to undeclared function 'PIO_LOOKUP_IDX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |                         PIO_LOOKUP_IDX(label, 0, NULL, i,
         |                         ^
>> drivers/gpio/gpio-ath79.c:250:22: error: used type 'struct gpiod_lookup' where arithmetic or pointer type is required
     250 |                 lookup->table[i] = (struct gpiod_lookup)
         |                                    ^
     251 |                         PIO_LOOKUP_IDX(label, 0, NULL, i,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                                        GPIO_ACTIVE_HIGH);
         |                                        ~~~~~~~~~~~~~~~~~
   6 warnings and 4 errors generated.


vim +240 drivers/gpio/gpio-ath79.c

   225	
   226	#if IS_ENABLED(CONFIG_ATH9K_AHB)
   227	/*
   228	 * This registers all of the ath79k GPIOs as descriptors to be picked
   229	 * directly from the ATH79K wifi driver if the two are jitted together
   230	 * in the same SoC.
   231	 */
   232	#define ATH79K_WIFI_DESCS 32
   233	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   234							const char *label)
   235	{
   236		struct gpiod_lookup_table *lookup;
   237		int i;
   238	
   239		/* Create a gpiod lookup using gpiochip-local offsets + 1 for NULL */
 > 240	        lookup = devm_kzalloc(&pdev->dev,
   241				      struct_size(lookup, table, ATH79K_WIFI_DESCS + 1),
   242				      GFP_KERNEL);
   243	
   244		if (!lookup)
   245			return -ENOMEM;
   246	
   247		lookup->dev_id = "ath9k";
   248	
   249		for (i = 0; i < ATH79K_WIFI_DESCS; i++) {
 > 250			lookup->table[i] = (struct gpiod_lookup)
 > 251				PIO_LOOKUP_IDX(label, 0, NULL, i,
   252					       GPIO_ACTIVE_HIGH);
   253		}
   254	
   255		gpiod_add_lookup_table(lookup);
   256	
   257		return 0;
   258	}
   259	#else
   260	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   261							const char *label)
   262	{
   263	}
   264	#endif
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

