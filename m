Return-Path: <linux-gpio+bounces-16095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6AA375AF
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 17:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E0D31887ACA
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 16:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC17019AA5D;
	Sun, 16 Feb 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1C49KRH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B94191499;
	Sun, 16 Feb 2025 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739723192; cv=none; b=lm968MhnMnEnzBkLLcASt5AX6p4HJnznsUiW1f8JafjCX7sRacoZJ/rSNTlVzsv35v8N+D8xXeJp6pwzxHTn/9CZhYUrRPfvrFZfvlNzQnxZLhKy2nnj3+Y3ztNEcK7trP1gvqpI0WmMw3uAaHj8etpAfpmVKti5HOpFxnXtwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739723192; c=relaxed/simple;
	bh=pdXqxA4mn1LXn6gauTPZ9l945Lc3FsmLdchU+slJBRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGO46M7bX9gV1vNiCw4GFqS32YEJQdvVqNbCbDoSYZlBhhDQquH8SIolbdZ4wUQlc/faQBpyMByftMwuBNjceZn6261lXM1FlM9NTFa88WdlODqvpVN93A7dTLajE/ZCThyOR+OUUbb2Fi7sLB36SJ3gdp4MWATvi6qbvINT00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1C49KRH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739723191; x=1771259191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pdXqxA4mn1LXn6gauTPZ9l945Lc3FsmLdchU+slJBRE=;
  b=T1C49KRH79MV+4IJNZWBGxDXq+oiVzgPnbiNBGDbj5Q3d7cIuC42Q8ZL
   xKaw9ShnRTKaN14rlpIF4k+BGNg890JzQiQAmoZTITMjmZSvFSuh96ec4
   INMoU70sj1GvGLFheOek7e6uagqLoDhVoVyjQdwZsS5C6/2nOkHHADPGd
   jCMM66rKR2bOKCHaDGK/q41R/HIEoo98QRReah7YfMASz4j3mRBfPTk8w
   eNFoj6O8DV3qk0CB5WeFZjY2VjfwAROjhKfA3ChM/33VvTtunYjPJ3tU1
   UEVptjLULUJXZkZUXIICtpdaGvD2egIR+Wd0UV4UwtBH9eSGH41wvGZYe
   g==;
X-CSE-ConnectionGUID: wfEbrep7T169fjt8nl3WMw==
X-CSE-MsgGUID: IYWBG4NPTISIGnR88iX9rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="44066208"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="44066208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 08:26:30 -0800
X-CSE-ConnectionGUID: j2rYBsrySEGjBWBSY7L+pA==
X-CSE-MsgGUID: WsMvpPg4QAeFT7xmrFOKBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114398676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2025 08:26:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjhTN-001C4N-1B;
	Sun, 16 Feb 2025 16:26:25 +0000
Date: Mon, 17 Feb 2025 00:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, brgl@bgdev.pl,
	geert+renesas@glider.be, linus.walleij@linaro.org,
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/13] gpio: virtuser: convert to use gpio-pseudo
 utilities
Message-ID: <202502170056.DR6nbxpY-lkp@intel.com>
References: <20250216125816.14430-6-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216125816.14430-6-koichiro.den@canonical.com>

Hi Koichiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/gpio-aggregator-reorder-functions-to-prepare-for-configfs-introduction/20250216-210413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250216125816.14430-6-koichiro.den%40canonical.com
patch subject: [PATCH v3 05/13] gpio: virtuser: convert to use gpio-pseudo utilities
config: i386-buildonly-randconfig-003-20250216 (https://download.01.org/0day-ci/archive/20250217/202502170056.DR6nbxpY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170056.DR6nbxpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170056.DR6nbxpY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-pseudo.c:62:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |                 kfree(common->name);
         |                 ^
   drivers/gpio/gpio-pseudo.c:71:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                 kfree(common->name);
         |                 ^
   drivers/gpio/gpio-pseudo.c:83:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         kfree(common->name);
         |         ^
   3 errors generated.


vim +/kfree +62 drivers/gpio/gpio-pseudo.c

ef524a2229b717 Koichiro Den 2025-02-16  43  
ef524a2229b717 Koichiro Den 2025-02-16  44  int pseudo_gpio_register(struct pseudo_gpio_common *common,
ef524a2229b717 Koichiro Den 2025-02-16  45  			 struct platform_device_info *pdevinfo)
ef524a2229b717 Koichiro Den 2025-02-16  46  {
ef524a2229b717 Koichiro Den 2025-02-16  47  	struct platform_device *pdev;
ef524a2229b717 Koichiro Den 2025-02-16  48  	char *name;
ef524a2229b717 Koichiro Den 2025-02-16  49  
ef524a2229b717 Koichiro Den 2025-02-16  50  	name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
ef524a2229b717 Koichiro Den 2025-02-16  51  	if (!name)
ef524a2229b717 Koichiro Den 2025-02-16  52  		return -ENOMEM;
ef524a2229b717 Koichiro Den 2025-02-16  53  
ef524a2229b717 Koichiro Den 2025-02-16  54  	common->driver_bound = false;
ef524a2229b717 Koichiro Den 2025-02-16  55  	common->name = name;
ef524a2229b717 Koichiro Den 2025-02-16  56  	reinit_completion(&common->probe_completion);
ef524a2229b717 Koichiro Den 2025-02-16  57  	bus_register_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16  58  
ef524a2229b717 Koichiro Den 2025-02-16  59  	pdev = platform_device_register_full(pdevinfo);
ef524a2229b717 Koichiro Den 2025-02-16  60  	if (IS_ERR(pdev)) {
ef524a2229b717 Koichiro Den 2025-02-16  61  		bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16 @62  		kfree(common->name);
ef524a2229b717 Koichiro Den 2025-02-16  63  		return PTR_ERR(pdev);
ef524a2229b717 Koichiro Den 2025-02-16  64  	}
ef524a2229b717 Koichiro Den 2025-02-16  65  
ef524a2229b717 Koichiro Den 2025-02-16  66  	wait_for_completion(&common->probe_completion);
ef524a2229b717 Koichiro Den 2025-02-16  67  	bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
ef524a2229b717 Koichiro Den 2025-02-16  68  
ef524a2229b717 Koichiro Den 2025-02-16  69  	if (!common->driver_bound) {
ef524a2229b717 Koichiro Den 2025-02-16  70  		platform_device_unregister(pdev);
ef524a2229b717 Koichiro Den 2025-02-16  71  		kfree(common->name);
ef524a2229b717 Koichiro Den 2025-02-16  72  		return -ENXIO;
ef524a2229b717 Koichiro Den 2025-02-16  73  	}
ef524a2229b717 Koichiro Den 2025-02-16  74  
ef524a2229b717 Koichiro Den 2025-02-16  75  	common->pdev = pdev;
ef524a2229b717 Koichiro Den 2025-02-16  76  	return 0;
ef524a2229b717 Koichiro Den 2025-02-16  77  }
ef524a2229b717 Koichiro Den 2025-02-16  78  EXPORT_SYMBOL_GPL(pseudo_gpio_register);
ef524a2229b717 Koichiro Den 2025-02-16  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

