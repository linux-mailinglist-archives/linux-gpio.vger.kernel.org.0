Return-Path: <linux-gpio+bounces-9791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147396BDE9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 15:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079351F20D38
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDBA1D9357;
	Wed,  4 Sep 2024 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNqeqCYa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD120334;
	Wed,  4 Sep 2024 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455173; cv=none; b=E1dKUQshN7WtQ6gn6CBxaBOdp6mB//NLH/R6eBNNHsqZEjs5Lt4Pwx5shu/pe1NnbOgPtRLjEdVBUFNTGpb52gd3wiMu8XHfi2KC/c+fE2RcZi0dsuJCfyjDlzDCWE0cDVWsyDlVh3nMUDg2jTl4ahTnNJTs7wv+TqT1+TeQVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455173; c=relaxed/simple;
	bh=mM1Ro031A08ZpqxLqSTFKpkQoEe2UZuBQXmTL877tWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TX6YAxE0TJIVHc+nTWPFECwk619k1mBKmZEdBkx27tby88KyLaJ35EDs/fplonRTdu8rRQUgDTsdpf6LE37wn24+Xz6w6Z67uGmAtnZE3uVmb8FnST1XZ0W2VH6+5vPnms0seYvcisbo8VKG9jdZGeDn3ZkJQfAEzeBFi7vmj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNqeqCYa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455172; x=1756991172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mM1Ro031A08ZpqxLqSTFKpkQoEe2UZuBQXmTL877tWo=;
  b=lNqeqCYaCAzpB9JmD2amk7JTTBzkzj5/YfbAXDvBghOIjyvUJdSGERdU
   ntV7ragFU0q62JR4+8iz18z/fl+dWWceY006g2gbGxL0QT5ls/VCXMjdP
   BasdX2KZ60MisYefv1ahSiFF6Cwrto5fQMEI98S3Ca8rlFtQeuxNqOWyR
   zOFdFyrrqh+Ca0gX+DWdUpo4ANTGTI8yv0SU1fOmg1YWIped77RQN7cCb
   DPsjSbNgSIyiBt7yDxYb9w5JEn/u3O3Vv69gYqfpNcsWzn5xecAD/Zvqv
   DsZNXNyP7DOv3ze1iIJlLGLAZ8diUKbokuKunOf6tSyFVsPZBPi7NmYUM
   Q==;
X-CSE-ConnectionGUID: apJ8ch55SjiuYsnSkYB51w==
X-CSE-MsgGUID: XGujfzHUR0OCXiqT32u3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="41611954"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="41611954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:05:18 -0700
X-CSE-ConnectionGUID: O5NtZppmScGRPLixhjd7kg==
X-CSE-MsgGUID: jEMrTlcBR4qBKW9Pj0Tg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65308473"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2024 06:05:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slphC-000863-2y;
	Wed, 04 Sep 2024 13:05:14 +0000
Date: Wed, 4 Sep 2024 21:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <202409042054.YDMtnXfx-lkp@intel.com>
References: <20240903170752.3564538-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-Replace-ifdeffery-by-pm_sleep_ptr-macro/20240904-011041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240903170752.3564538-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 2/3] pinctrl: baytrail: Replace ifdeffery by pm_sleep_ptr() macro
config: i386-buildonly-randconfig-002-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042054.YDMtnXfx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042054.YDMtnXfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042054.YDMtnXfx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/intel/pinctrl-baytrail.c: In function 'byt_pinctrl_probe':
>> drivers/pinctrl/intel/pinctrl-baytrail.c:1610:49: warning: the address of 'byt_pinctrl_pm_init' will always evaluate as 'true' [-Waddress]
    1610 |         ret = pm_sleep_ptr(byt_pinctrl_pm_init) ? byt_pinctrl_pm_init(vg) : 0;
         |                                                 ^


vim +1610 drivers/pinctrl/intel/pinctrl-baytrail.c

  1587	
  1588	static int byt_pinctrl_probe(struct platform_device *pdev)
  1589	{
  1590		const struct intel_pinctrl_soc_data *soc_data;
  1591		struct device *dev = &pdev->dev;
  1592		struct intel_pinctrl *vg;
  1593		int ret;
  1594	
  1595		soc_data = intel_pinctrl_get_soc_data(pdev);
  1596		if (IS_ERR(soc_data))
  1597			return PTR_ERR(soc_data);
  1598	
  1599		vg = devm_kzalloc(dev, sizeof(*vg), GFP_KERNEL);
  1600		if (!vg)
  1601			return -ENOMEM;
  1602	
  1603		vg->dev = dev;
  1604		ret = byt_set_soc_data(vg, soc_data);
  1605		if (ret) {
  1606			dev_err(dev, "failed to set soc data\n");
  1607			return ret;
  1608		}
  1609	
> 1610		ret = pm_sleep_ptr(byt_pinctrl_pm_init) ? byt_pinctrl_pm_init(vg) : 0;
  1611		if (ret)
  1612			return ret;
  1613	
  1614		vg->pctldesc		= byt_pinctrl_desc;
  1615		vg->pctldesc.name	= dev_name(dev);
  1616		vg->pctldesc.pins	= vg->soc->pins;
  1617		vg->pctldesc.npins	= vg->soc->npins;
  1618	
  1619		vg->pctldev = devm_pinctrl_register(dev, &vg->pctldesc, vg);
  1620		if (IS_ERR(vg->pctldev)) {
  1621			dev_err(dev, "failed to register pinctrl driver\n");
  1622			return PTR_ERR(vg->pctldev);
  1623		}
  1624	
  1625		ret = byt_gpio_probe(vg);
  1626		if (ret)
  1627			return ret;
  1628	
  1629		platform_set_drvdata(pdev, vg);
  1630	
  1631		return 0;
  1632	}
  1633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

