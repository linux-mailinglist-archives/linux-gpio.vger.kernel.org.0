Return-Path: <linux-gpio+bounces-9242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21347961949
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 23:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B41F3B222E6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 21:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB0A1D4156;
	Tue, 27 Aug 2024 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZb7+YW0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2411552E0;
	Tue, 27 Aug 2024 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724794342; cv=none; b=EMIZyPigTm72Aeln3gmJoZXrOBBwafQ7cu2YJHRMvw+oCKjmvRp8vPpGwI/pgkRZ1nAFmELXpkaZEhuglGtI8YXPAbwgrygXdwv0RhxR6wts+PutIOJIWq/JESjkwoctEmJt1z3YmCFW9klw3Vbmxs11xrmI+6FwEsUd4wBo26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724794342; c=relaxed/simple;
	bh=mQ6qbHzgB38r7y4pyZPdkblRm04jYvDuwRoZqtAcNok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soYDDz72W7kpYM1xr0DoAetRLBSUUlR3/cje2UR76qPoVxcEksLTeGsn0ByNXmPesZAzBsxG0tUKWq2xFPFn0jCmE+pq7vYEmW4UMwqDDvxW3vQpJtN4/ukfQLye7I7ihSmaJe3G6IefVDg8Nks16hcJXbVv5Og1TvyvUt6e0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZb7+YW0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724794340; x=1756330340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mQ6qbHzgB38r7y4pyZPdkblRm04jYvDuwRoZqtAcNok=;
  b=AZb7+YW0MwC4du1TqlZ+BOrRiFEJx2DdAmtn51L135GNSShIrXb3fffX
   OfzyvJeTD0XB88COAU7/qwdcunpgARyKuj8mTj8dumEsmazloyRg+wTle
   pWSzmpirD12116e/V6sCEmxkHLSNzMQUE67lNOmjSi/ABXQ+SNNrHnIVB
   lT4kv06oTyrxEwNlmN3y/9hb++V/N5GNDcf46qxps5P54zZffv4J/YKby
   mhJqjW0tiM5Ea8RzhBhURANdl0j2B8NEW7d7Fsvf3d08mfbZiOVsVl7qU
   330mLV17udRyHofGzSTm8ICC3j4NX3dkrzoJBCxZSZphwjbzUMGP3kbk6
   w==;
X-CSE-ConnectionGUID: qibPJ4/KT/W5V9h+4LtIMQ==
X-CSE-MsgGUID: FPZ8f9OITyiOndA0m3+K2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23472915"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23472915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 14:32:20 -0700
X-CSE-ConnectionGUID: SZ7GQYnnRDKEUTZXIx+mgQ==
X-CSE-MsgGUID: HgirASMTTQmt+plh8jjpQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67705584"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2024 14:32:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj3nT-000K6G-0P;
	Tue, 27 Aug 2024 21:32:15 +0000
Date: Wed, 28 Aug 2024 05:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Leonard <David.Leonard@digi.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <202408280532.YGyLCCNL-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next shawnguo/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.11-rc5 next-20240827]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Leonard/arm64-dts-ls1012a-add-pinctrl-node/20240827-104431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c0ecf4f4-94f1-2efd-b05b-fc117c62e516%40digi.com
patch subject: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408280532.YGyLCCNL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280532.YGyLCCNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280532.YGyLCCNL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-ls1046a.c: In function 'ls1046a_pinctrl_probe':
>> drivers/pinctrl/freescale/pinctrl-ls1046a.c:199:58: warning: passing argument 2 of 'devm_pinctrl_register_and_init' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     199 |         ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/freescale/pinctrl-ls1046a.c:10:
   include/linux/pinctrl/pinctrl.h:180:54: note: expected 'struct pinctrl_desc *' but argument is of type 'const struct pinctrl_desc *'
     180 |                                 struct pinctrl_desc *pctldesc,
         |                                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~


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

