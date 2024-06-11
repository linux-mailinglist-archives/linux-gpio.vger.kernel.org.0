Return-Path: <linux-gpio+bounces-7378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01E9046A5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 00:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769501F24D90
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 22:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC83153823;
	Tue, 11 Jun 2024 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZuq/p3I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0218EAB;
	Tue, 11 Jun 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718143336; cv=none; b=AFIuJ7mZ1fcmEm91ewK54Nil935t88rJdU+f9xc9CQ2EBEp17MaY33TvezdG0Fpa4fMMhE56Ei3i4jehanLlsTSQAFnelKbnjVssxn7wGwfFE/s/BmeqqdKP2l/Nj7gXLQg1WqWHw5HsYvnlf+SX885XXoyclPDHpvBi4i123W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718143336; c=relaxed/simple;
	bh=VCkLZ01qOLE/saYjvRrwh7cmZYLpNQtFPwMS6/R0+hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgEw0UfPq4gECs72HhXtsyAH236wvpiapkrkq+CmwZzPU6SS/8j8pEicEq+W+AjJbUHcevW3HWKElVIxoFpL7gZnNzZoVvZVrdx4B8j6SUazxvTZse5yMpZcBy0lHGDHlow/x5y5J3osHyzV1dOXJb8X7EKiogi7kM7A0NkTVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZuq/p3I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718143334; x=1749679334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCkLZ01qOLE/saYjvRrwh7cmZYLpNQtFPwMS6/R0+hs=;
  b=mZuq/p3I851ilVtc871Zg9zUCdiWgdN4uD6qd4W0HubWOE34voXyb13P
   QO+Q2puYTcfwmg/t9ieQoyBwRPz0s4f9R9v5WeLB1MbsqMJBqx9tAAzAF
   3uTavUsMLw8OdULXYJyGi7FHWDiRMaPZGRiC0DTLnLdoyGXcuDZcQikJ7
   u1OSxpbCQPSyX3tU3gPgWUKqB0hfBwRbpbir/7hb6AvvGAyA37/cBHtSe
   6buxX4thHLKvrQEamFJ9FYI316UId43muY64/zpeMmLryMz99C/0eCgW0
   1QVgRcKk7d2BXM8FnlzEs5RvHTmJIvt0EeMLMqrQ9ZgDL7yIWWPZUsq7w
   Q==;
X-CSE-ConnectionGUID: cE0vML+ZR2m1Uev2EMK9qg==
X-CSE-MsgGUID: BOXQ4o+zTgm5XVY0IN0YDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18715908"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="18715908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 15:02:13 -0700
X-CSE-ConnectionGUID: GbQSit22SReXVL13gzWa8g==
X-CSE-MsgGUID: AEPqZNkDQPiA2C8YR3rH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44121748"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 15:02:10 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH9Z9-0000wk-20;
	Tue, 11 Jun 2024 22:02:07 +0000
Date: Wed, 12 Jun 2024 06:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Shan-Chun Hung <schung@nuvoton.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
Message-ID: <202406120534.9nmyKZwv-lkp@intel.com>
References: <20240611093127.90210-4-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611093127.90210-4-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next next-20240611]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-nuvoton-Convert-to-use-struct-pingroup-and-PINCTRL_PINGROUP/20240611-173545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240611093127.90210-4-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120534.9nmyKZwv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120534.9nmyKZwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120534.9nmyKZwv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
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
   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
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
   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
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
>> drivers/pinctrl/nuvoton/pinctrl-ma35.c:228:23: error: no member named 'npins' in 'struct group_desc'
     228 |         for (i = 0; i < grp->npins; i++) {
         |                         ~~~  ^
   drivers/pinctrl/nuvoton/pinctrl-ma35.c:287:23: error: no member named 'npins' in 'struct group_desc'
     287 |         for (i = 0; i < grp->npins; i++) {
         |                         ~~~  ^
   6 warnings and 2 errors generated.


vim +228 drivers/pinctrl/nuvoton/pinctrl-ma35.c

ecc5bf86867344 Jacky Huang     2024-05-21  184  
ecc5bf86867344 Jacky Huang     2024-05-21  185  static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
ecc5bf86867344 Jacky Huang     2024-05-21  186  					    struct device_node *np,
ecc5bf86867344 Jacky Huang     2024-05-21  187  					    struct pinctrl_map **map,
ecc5bf86867344 Jacky Huang     2024-05-21  188  					    unsigned int *num_maps)
ecc5bf86867344 Jacky Huang     2024-05-21  189  {
ecc5bf86867344 Jacky Huang     2024-05-21  190  	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
888aa25ee6ce72 Andy Shevchenko 2024-06-11  191  	struct ma35_pin_setting *setting;
ecc5bf86867344 Jacky Huang     2024-05-21  192  	struct pinctrl_map *new_map;
ecc5bf86867344 Jacky Huang     2024-05-21  193  	struct device_node *parent;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  194  	struct group_desc *grp;
ecc5bf86867344 Jacky Huang     2024-05-21  195  	int map_num = 1;
ecc5bf86867344 Jacky Huang     2024-05-21  196  	int i;
ecc5bf86867344 Jacky Huang     2024-05-21  197  
ecc5bf86867344 Jacky Huang     2024-05-21  198  	/*
ecc5bf86867344 Jacky Huang     2024-05-21  199  	 * first find the group of this node and check if we need create
ecc5bf86867344 Jacky Huang     2024-05-21  200  	 * config maps for pins
ecc5bf86867344 Jacky Huang     2024-05-21  201  	 */
ecc5bf86867344 Jacky Huang     2024-05-21  202  	grp = ma35_pinctrl_find_group_by_name(npctl, np->name);
ecc5bf86867344 Jacky Huang     2024-05-21  203  	if (!grp) {
ecc5bf86867344 Jacky Huang     2024-05-21  204  		dev_err(npctl->dev, "unable to find group for node %s\n", np->name);
ecc5bf86867344 Jacky Huang     2024-05-21  205  		return -EINVAL;
ecc5bf86867344 Jacky Huang     2024-05-21  206  	}
ecc5bf86867344 Jacky Huang     2024-05-21  207  
888aa25ee6ce72 Andy Shevchenko 2024-06-11  208  	map_num += grp->grp.npins;
ecc5bf86867344 Jacky Huang     2024-05-21  209  	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
ecc5bf86867344 Jacky Huang     2024-05-21  210  	if (!new_map)
ecc5bf86867344 Jacky Huang     2024-05-21  211  		return -ENOMEM;
ecc5bf86867344 Jacky Huang     2024-05-21  212  
ecc5bf86867344 Jacky Huang     2024-05-21  213  	*map = new_map;
ecc5bf86867344 Jacky Huang     2024-05-21  214  	*num_maps = map_num;
ecc5bf86867344 Jacky Huang     2024-05-21  215  	/* create mux map */
ecc5bf86867344 Jacky Huang     2024-05-21  216  	parent = of_get_parent(np);
ecc5bf86867344 Jacky Huang     2024-05-21  217  	if (!parent)
ecc5bf86867344 Jacky Huang     2024-05-21  218  		return -EINVAL;
ecc5bf86867344 Jacky Huang     2024-05-21  219  
888aa25ee6ce72 Andy Shevchenko 2024-06-11  220  	setting = grp->data;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  221  
ecc5bf86867344 Jacky Huang     2024-05-21  222  	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
ecc5bf86867344 Jacky Huang     2024-05-21  223  	new_map[0].data.mux.function = parent->name;
ecc5bf86867344 Jacky Huang     2024-05-21  224  	new_map[0].data.mux.group = np->name;
ecc5bf86867344 Jacky Huang     2024-05-21  225  	of_node_put(parent);
ecc5bf86867344 Jacky Huang     2024-05-21  226  
ecc5bf86867344 Jacky Huang     2024-05-21  227  	new_map++;
ecc5bf86867344 Jacky Huang     2024-05-21 @228  	for (i = 0; i < grp->npins; i++) {
ecc5bf86867344 Jacky Huang     2024-05-21  229  		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  230  		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
888aa25ee6ce72 Andy Shevchenko 2024-06-11  231  		new_map[i].data.configs.configs = setting[i].configs;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  232  		new_map[i].data.configs.num_configs = setting[i].nconfigs;
ecc5bf86867344 Jacky Huang     2024-05-21  233  	}
ecc5bf86867344 Jacky Huang     2024-05-21  234  	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
ecc5bf86867344 Jacky Huang     2024-05-21  235  		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
ecc5bf86867344 Jacky Huang     2024-05-21  236  
ecc5bf86867344 Jacky Huang     2024-05-21  237  	return 0;
ecc5bf86867344 Jacky Huang     2024-05-21  238  }
ecc5bf86867344 Jacky Huang     2024-05-21  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

