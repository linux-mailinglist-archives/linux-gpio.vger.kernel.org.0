Return-Path: <linux-gpio+bounces-8707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F294E372
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 23:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B1F9B212B7
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 21:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBCC15C147;
	Sun, 11 Aug 2024 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbSYFMAM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDD2C1A5;
	Sun, 11 Aug 2024 21:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412963; cv=none; b=kobX8OLmM81bhH9Gc9++/xS/m2OKEKRrKVfISEllEkScUxWn76RaRu8LNeDzq0a4L/kM0BuyH/Q0G1BDxE2NrP2isSGG6FRQ44MkWibZvGyrss6H7vuYj6Xx2jtSUJjnRTYhx8Y9/JEflewk7I1qqBKyTKmO7bK7mFvKDVdb2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412963; c=relaxed/simple;
	bh=nEQq42SN5AAOZnh7w+2AygRKYZTre8aNMlx2TwUyidk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkSAq8FkNJ7vsokBGDBVS8O2ahkbalAR0UZuzvex2AhiTN3Pb1BzgzCpr7z/hB6xIVEDkgmregZdHMicbPalo3J/NBulRNFVxCUPF0IDdNTugISot5JNp5e6EtZZkSGTIL0tI/RFtqkqGeFqtF6R51WQQuUEdZiMlXe8AuxaXYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbSYFMAM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723412961; x=1754948961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nEQq42SN5AAOZnh7w+2AygRKYZTre8aNMlx2TwUyidk=;
  b=SbSYFMAMKCYz3BjBuZRQNZp6yd37Wz84fH0fc9e+h7iDbtLGs2HDzE4/
   7dKoh8r9/zMmE86PyadQf1HyBqELbamRD/2URGW6DqcZhuhXSQc2YdG+e
   3KnepxbVGXMEDGtQNe/ZDsH3EKBVKC5oIkZgj4cUsvIYNm3ZEmqQvYRGf
   dxCW++YS05VfO1uIDrLbz260/sTwY6hgF54aycre/IdYVskxINC+G32RO
   7lO6u6KSfdrZYfq5xGfAMA6ZNRJMmBL/RIMgwhgq9xHhRaz/orJ4An2yX
   iLmXuZ8uB+hJvDMhqm1t3nCG+oJYwYPIuHrvhrfdis2B/n38v0J1Q1Sj7
   Q==;
X-CSE-ConnectionGUID: oOjZtAisQzyEvyq0OSCi+Q==
X-CSE-MsgGUID: fCIpCsNqQwisPQTy+nTx4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21641462"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21641462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 14:49:20 -0700
X-CSE-ConnectionGUID: vVCemKyfTw2490pTvgG+iw==
X-CSE-MsgGUID: qmNzy1zlRvulI+BRioFc1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58038882"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2024 14:49:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGR7-000BA7-2T;
	Sun, 11 Aug 2024 21:49:13 +0000
Date: Mon, 12 Aug 2024 05:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <202408120556.EjlJhjXg-lkp@intel.com>
References: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-pinctrl-airoha-Add-EN7581-pinctrl-controller/20240812-001436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo%40kernel.org
patch subject: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240812/202408120556.EjlJhjXg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120556.EjlJhjXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120556.EjlJhjXg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1923:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1923 |         PINCTRL_FUNC_DESC(pon),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:279:1: note: expanded from here
     279 | "pon"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1924:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1924 |         PINCTRL_FUNC_DESC(tod_1pps),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:284:1: note: expanded from here
     284 | "tod_1pps"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1925:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1925 |         PINCTRL_FUNC_DESC(sipo),
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:289:1: note: expanded from here
     289 | "sipo"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1926:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1926 |         PINCTRL_FUNC_DESC(mdio),
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:294:1: note: expanded from here
     294 | "mdio"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1927:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1927 |         PINCTRL_FUNC_DESC(uart),
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:299:1: note: expanded from here
     299 | "uart"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1928:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1928 |         PINCTRL_FUNC_DESC(i2c),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:304:1: note: expanded from here
     304 | "i2c"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1929:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1929 |         PINCTRL_FUNC_DESC(jtag),
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:309:1: note: expanded from here
     309 | "jtag"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1930:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1930 |         PINCTRL_FUNC_DESC(pcm),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:314:1: note: expanded from here
     314 | "pcm"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1931:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1931 |         PINCTRL_FUNC_DESC(spi),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:319:1: note: expanded from here
     319 | "spi"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1932:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1932 |         PINCTRL_FUNC_DESC(pcm_spi),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:324:1: note: expanded from here
     324 | "pcm_spi"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1933:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1933 |         PINCTRL_FUNC_DESC(i2s),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:329:1: note: expanded from here
     329 | "i2s"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1934:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1934 |         PINCTRL_FUNC_DESC(emmc),
--
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1935:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1935 |         PINCTRL_FUNC_DESC(pnand),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:339:1: note: expanded from here
     339 | "pnand"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1936:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1936 |         PINCTRL_FUNC_DESC(pcie_reset),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:344:1: note: expanded from here
     344 | "pcie_reset"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1937:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1937 |         PINCTRL_FUNC_DESC(pwm),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:349:1: note: expanded from here
     349 | "pwm"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1938:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1938 |         PINCTRL_FUNC_DESC(phy1_led0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:354:1: note: expanded from here
     354 | "phy1_led0"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1939:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1939 |         PINCTRL_FUNC_DESC(phy2_led0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:359:1: note: expanded from here
     359 | "phy2_led0"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1940:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1940 |         PINCTRL_FUNC_DESC(phy3_led0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:364:1: note: expanded from here
     364 | "phy3_led0"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1941:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1941 |         PINCTRL_FUNC_DESC(phy4_led0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:369:1: note: expanded from here
     369 | "phy4_led0"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1942:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1942 |         PINCTRL_FUNC_DESC(phy1_led1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:374:1: note: expanded from here
     374 | "phy1_led1"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1943:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1943 |         PINCTRL_FUNC_DESC(phy2_led1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:379:1: note: expanded from here
     379 | "phy2_led1"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1944:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1944 |         PINCTRL_FUNC_DESC(phy3_led1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:384:1: note: expanded from here
     384 | "phy3_led1"
         | ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1945:2: warning: suggest braces around initialization of subobject [-Wmissing-braces]
    1945 |         PINCTRL_FUNC_DESC(phy4_led1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:33:13: note: expanded from macro 'PINCTRL_FUNC_DESC'
      33 |                 .desc = { #id, id##_groups, ARRAY_SIZE(id##_groups) },  \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:389:1: note: expanded from here
     389 | "phy4_led1"
         | ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2279:9: error: no member named 'name' in 'struct function_desc'
    2279 |                 desc->name, grp->grp.name);
         |                 ~~~~  ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2359:31: error: call to undeclared function '__bf_shf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2359 |         *val = (*val & reg->mask) >> __bf_shf(reg->mask);
         |                                      ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2376:14: error: call to undeclared function '__bf_shf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2376 |                            val << __bf_shf(reg->mask));
         |                                   ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2946:20: error: no member named 'name' in 'struct function_desc'
    2946 |                                                   func->desc.name,
         |                                                   ~~~~~~~~~~ ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2947:20: error: no member named 'group_names' in 'struct function_desc'
    2947 |                                                   func->desc.group_names,
         |                                                   ~~~~~~~~~~ ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2948:20: error: no member named 'num_group_names' in 'struct function_desc'
    2948 |                                                   func->desc.num_group_names,
         |                                                   ~~~~~~~~~~ ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2952:16: error: no member named 'name' in 'struct function_desc'
    2952 |                                 func->desc.name);
         |                                 ~~~~~~~~~~ ^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   29 warnings and 7 errors generated.


vim +2279 drivers/pinctrl/mediatek/pinctrl-airoha.c

  2259	
  2260	static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
  2261					 unsigned int selector,
  2262					 unsigned int group)
  2263	{
  2264		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2265		const struct airoha_pinctrl_func *func;
  2266		struct function_desc *desc;
  2267		struct group_desc *grp;
  2268		int i;
  2269	
  2270		desc = pinmux_generic_get_function(pctrl_dev, selector);
  2271		if (!desc)
  2272			return -EINVAL;
  2273	
  2274		grp = pinctrl_generic_get_group(pctrl_dev, group);
  2275		if (!grp)
  2276			return -EINVAL;
  2277	
  2278		dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
> 2279			desc->name, grp->grp.name);
  2280	
  2281		func = desc->data;
  2282		for (i = 0; i < func->group_size; i++) {
  2283			const struct airoha_pinctrl_func_group *group;
  2284			int j;
  2285	
  2286			group = &func->groups[i];
  2287			if (strcmp(group->name, grp->grp.name))
  2288				continue;
  2289	
  2290			for (j = 0; j < group->regmap_size; j++) {
  2291				void __iomem *base;
  2292	
  2293				base = pinctrl->regs.mux[group->regmap[j].mux];
  2294				airoha_pinctrl_rmw(pinctrl,
  2295						   base + group->regmap[j].offset,
  2296						   group->regmap[j].mask,
  2297						   group->regmap[j].val);
  2298			}
  2299			return 0;
  2300		}
  2301	
  2302		return -EINVAL;
  2303	}
  2304	
  2305	static int airoha_pinmux_gpio_set_direction(struct pinctrl_dev *pctrl_dev,
  2306						    struct pinctrl_gpio_range *range,
  2307						    unsigned int pin, bool input)
  2308	{
  2309		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2310		int gpio = pin - range->pin_base;
  2311	
  2312		airoha_pinctrl_gpio_set_direction(pinctrl, gpio, input);
  2313	
  2314		return 0;
  2315	}
  2316	
  2317	static int airoha_pinctrl_get_gpio_from_pin(struct pinctrl_dev *pctrl_dev,
  2318						    int pin)
  2319	{
  2320		struct pinctrl_gpio_range *range;
  2321		int gpio;
  2322	
  2323		range = pinctrl_find_gpio_range_from_pin_nolock(pctrl_dev, pin);
  2324		if (!range)
  2325			return -EINVAL;
  2326	
  2327		gpio = pin - range->pin_base;
  2328		if (gpio < 0)
  2329			return -EINVAL;
  2330	
  2331		return gpio;
  2332	}
  2333	
  2334	static const struct airoha_pinctrl_reg *
  2335	airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
  2336				    int conf_size, int pin)
  2337	{
  2338		int i;
  2339	
  2340		for (i = 0; i < conf_size; i++) {
  2341			if (conf[i].pin == pin)
  2342				return &conf[i].reg;
  2343		}
  2344	
  2345		return NULL;
  2346	}
  2347	
  2348	static int airoha_pinctrl_get_conf(void __iomem *base,
  2349					   const struct airoha_pinctrl_conf *conf,
  2350					   int conf_size, int pin, u32 *val)
  2351	{
  2352		const struct airoha_pinctrl_reg *reg;
  2353	
  2354		reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
  2355		if (!reg)
  2356			return -EINVAL;
  2357	
  2358		*val = readl(base + reg->offset);
> 2359		*val = (*val & reg->mask) >> __bf_shf(reg->mask);
  2360	
  2361		return 0;
  2362	}
  2363	
  2364	static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
  2365					   void __iomem *base,
  2366					   const struct airoha_pinctrl_conf *conf,
  2367					   int conf_size, int pin, u32 val)
  2368	{
  2369		const struct airoha_pinctrl_reg *reg = NULL;
  2370	
  2371		reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
  2372		if (!reg)
  2373			return -EINVAL;
  2374	
  2375		airoha_pinctrl_rmw(pinctrl, base + reg->offset, reg->mask,
> 2376				   val << __bf_shf(reg->mask));
  2377	
  2378		return 0;
  2379	}
  2380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

