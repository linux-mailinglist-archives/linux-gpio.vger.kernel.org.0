Return-Path: <linux-gpio+bounces-9241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB89961906
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 23:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B63284D46
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 21:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E5D1D362C;
	Tue, 27 Aug 2024 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JodbmpKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881E1D1F7C;
	Tue, 27 Aug 2024 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724793083; cv=none; b=aHOHSE7gMwk8FItrjho91DW0BGkTQ8CIDnABn0hoPfuJ0PVXM6VSIO9RnErmpmM/sdaAMbaiPEbvUCWcKSAwU0pytn7bjRCsSWZiUU2cXcqK8sLc984qZR6ytxOR6Ng9HMWNNOirdaLXBWMi7BlQDs2D+GPGg+0a0UUqYbiL3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724793083; c=relaxed/simple;
	bh=hX9UxprD85FtuIPVMil0tW9A26h2eibinJjk2tisZ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLk6tewJFbDnwM07jGBgEZhEgkBC0qGs9RsIZGcxKILL3bsFrvkDD0jzmAGjkaw2aZfnWYu9KnGSE+thZFPL+XXEl3IpArPGEczAl4orUXqI5oC+78LIc1d8FNkhKe06IfyfNFNhn8BILEC2hf9j/TovdmIx9NvTeq8knH/vT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JodbmpKq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724793081; x=1756329081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hX9UxprD85FtuIPVMil0tW9A26h2eibinJjk2tisZ+4=;
  b=JodbmpKqU2bJse15Wuo0VpvRvxl/sDIjySjHfvBM+D5xzBsFvhYxnjvN
   unw2PaRVqvVLPpk2dmHjBq7R04lC7YtwuSYbsLyMbVZ+RWZIcyGe+CVnO
   DJMMliq5fpM8f9VAn87bhjJynQFHSCPYiF/FQI9/QTSzu8WGrTIhsatVi
   +CEOTCN5+PcQqViin2qpRB7RaYt4AnkXt/medDiRp2Tugsl5Iw3bsVFNa
   x6wtWiv6ZhAiCxwo61H+aGroGygxnpS7sLEQ2P/0v112vdQ7RuHUqlT8L
   wQ2NjWL+F64SRBt1QoBi/Dnjm3s62dxqy/X79Gb3kU0zjaku6p33Kqry0
   A==;
X-CSE-ConnectionGUID: 0dM9r5eCTS+hOJkHCqLzGA==
X-CSE-MsgGUID: nW8MlfGETsquGjz4EDfK0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23101649"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23101649"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 14:11:20 -0700
X-CSE-ConnectionGUID: Of5xkQfCSTynNfwGFbyAYA==
X-CSE-MsgGUID: NlDceEr4StyItgZaBL9+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62837941"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2024 14:11:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj3T8-000K5i-2E;
	Tue, 27 Aug 2024 21:11:14 +0000
Date: Wed, 28 Aug 2024 05:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Leonard <David.Leonard@digi.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <202408280509.Jr3oFGGy-lkp@intel.com>
References: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next shawnguo/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.11-rc5 next-20240827]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Leonard/arm64-dts-ls1012a-add-pinctrl-node/20240827-104431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c0ecf4f4-94f1-2efd-b05b-fc117c62e516%40digi.com
patch subject: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408280509.Jr3oFGGy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280509.Jr3oFGGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280509.Jr3oFGGy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/freescale/pinctrl-ls1046a.c:8:
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
   In file included from drivers/pinctrl/freescale/pinctrl-ls1046a.c:14:
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
   In file included from drivers/pinctrl/freescale/pinctrl-ls1046a.c:14:
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
   In file included from drivers/pinctrl/freescale/pinctrl-ls1046a.c:14:
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
>> drivers/pinctrl/freescale/pinctrl-ls1046a.c:199:51: error: passing 'const struct pinctrl_desc *' to parameter of type 'struct pinctrl_desc *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     199 |         ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/pinctrl.h:180:26: note: passing argument to parameter 'pctldesc' here
     180 |                                 struct pinctrl_desc *pctldesc,
         |                                                      ^
   17 warnings and 1 error generated.


vim +199 drivers/pinctrl/freescale/pinctrl-ls1046a.c

   179	
   180	static int ls1046a_pinctrl_probe(struct platform_device *pdev)
   181	{
   182		struct ls1046a_pinctrl_pdata *pd;
   183		int ret;
   184	
   185		pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
   186		if (!pd)
   187			return -ENOMEM;
   188		platform_set_drvdata(pdev, pd);
   189	
   190		pd->big_endian = device_is_big_endian(&pdev->dev);
   191	
   192		/* SCFG PMUX0 */
   193		pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
   194		if (IS_ERR(pd->cr0mem))
   195			return PTR_ERR(pd->cr0mem);
   196		dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
   197			pd->big_endian ? "be" : "le");
   198	
 > 199		ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
   200			pd, &pd->pctl_dev);
   201		if (ret)
   202			return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
   203	
   204		pinctrl_enable(pd->pctl_dev);
   205		return ret;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

