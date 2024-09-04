Return-Path: <linux-gpio+bounces-9779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31A96BAA9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60FD0281109
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677DE1D1750;
	Wed,  4 Sep 2024 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2nCEo0t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA11D0DF1;
	Wed,  4 Sep 2024 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725449355; cv=none; b=s9xTWLxT7G8PeYgkIqP0wGaspuUgwoUtL+RUD+5yEFvxvmLAGCwgASR6LkCZHnBTwLvML4IBYp/7Xwh77/CEn31eJ/FJUU/Z2hT4P7JDUlur7QWKDb9RinnA4B+k8ArD4q6Y4QWmAYy+rJARWlVOSrDLj0owNbAmrvvCGyNI5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725449355; c=relaxed/simple;
	bh=UcJbtajtAu7xfO2C1En1yneSh/P4qUKun2eqY0A5TJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/M0taWyn7sdxScrn2HEEgQ9OJ07vGs7pLqiSsHy5yw56x7fuacAzwJC7dgTkt8sqGiGj0zZ0TpZzk55tw3DQNRteaiiWi4S56uC22EULItt3Fzjxjc3qwkfdKscU/4bxShXzoN4uaa9VAAwQ9PxPY30iqzR/wcrhYhs6722HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2nCEo0t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725449352; x=1756985352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UcJbtajtAu7xfO2C1En1yneSh/P4qUKun2eqY0A5TJ8=;
  b=T2nCEo0tbXf8VEFO9mpxWFZLnDTQ0tBXJdRehI59oouNDgB45trX4t9g
   5xre0mcucvS8ckTkwEhNUTJ784EDbjvi5Xxy0oZ3MSJbCKXrEIC1ikxdB
   qp1tTfnOl58Pu5yLZ958S4eWfx7MIclgi+izyKysifSKFsQCHiIIMOLOq
   oE6Fbo+qqev7Ec8NO438ODCTJ75/Hz2gf6PNNlDe/4F/6ZMBnifd/VKUW
   vH+L3NTJyEUlKmmZ2Iud0CFFIJZVNriZ/RkSBbfV3uGFDNQI37IBS7GXO
   jt/+TFjBFzmPZiG28SYWPm66N38INYnE7aBwDWbTc7dGXZG/Nms+kcbl9
   g==;
X-CSE-ConnectionGUID: GaSHEkVtQ9qzrZCh1nCfxA==
X-CSE-MsgGUID: t9M2iAcqT02Iz9BsQXxZNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24212042"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24212042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 04:29:12 -0700
X-CSE-ConnectionGUID: qqmtXCO0Qzi35QItXG8XtQ==
X-CSE-MsgGUID: cXKirvEwS7qMLbZ5Zt3WPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69405163"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2024 04:29:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sloCB-0007uI-2x;
	Wed, 04 Sep 2024 11:29:07 +0000
Date: Wed, 4 Sep 2024 19:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] pinctrl: cherryview: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <202409041939.VrJGEW4H-lkp@intel.com>
References: <20240903170752.3564538-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-4-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-Replace-ifdeffery-by-pm_sleep_ptr-macro/20240904-011041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240903170752.3564538-4-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 3/3] pinctrl: cherryview: Replace ifdeffery by pm_sleep_ptr() macro
config: x86_64-randconfig-r073-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041939.VrJGEW4H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041939.VrJGEW4H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041939.VrJGEW4H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/intel/pinctrl-cherryview.c: In function 'chv_pinctrl_probe':
>> drivers/pinctrl/intel/pinctrl-cherryview.c:1657:49: warning: the address of 'chv_pinctrl_pm_init' will always evaluate as 'true' [-Waddress]
    1657 |         ret = pm_sleep_ptr(chv_pinctrl_pm_init) ? chv_pinctrl_pm_init(pctrl) : 0;
         |                                                 ^


vim +1657 drivers/pinctrl/intel/pinctrl-cherryview.c

  1620	
  1621	static int chv_pinctrl_probe(struct platform_device *pdev)
  1622	{
  1623		const struct intel_pinctrl_soc_data *soc_data;
  1624		struct intel_community_context *cctx;
  1625		struct intel_community *community;
  1626		struct device *dev = &pdev->dev;
  1627		struct intel_pinctrl *pctrl;
  1628		acpi_status status;
  1629		unsigned int i;
  1630		int ret, irq;
  1631	
  1632		soc_data = intel_pinctrl_get_soc_data(pdev);
  1633		if (IS_ERR(soc_data))
  1634			return PTR_ERR(soc_data);
  1635	
  1636		pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
  1637		if (!pctrl)
  1638			return -ENOMEM;
  1639	
  1640		pctrl->dev = dev;
  1641		pctrl->soc = soc_data;
  1642	
  1643		pctrl->ncommunities = pctrl->soc->ncommunities;
  1644		pctrl->communities = devm_kmemdup(dev, pctrl->soc->communities,
  1645						  pctrl->ncommunities * sizeof(*pctrl->communities),
  1646						  GFP_KERNEL);
  1647		if (!pctrl->communities)
  1648			return -ENOMEM;
  1649	
  1650		community = &pctrl->communities[0];
  1651		community->regs = devm_platform_ioremap_resource(pdev, 0);
  1652		if (IS_ERR(community->regs))
  1653			return PTR_ERR(community->regs);
  1654	
  1655		community->pad_regs = community->regs + FAMILY_PAD_REGS_OFF;
  1656	
> 1657		ret = pm_sleep_ptr(chv_pinctrl_pm_init) ? chv_pinctrl_pm_init(pctrl) : 0;
  1658		if (ret)
  1659			return ret;
  1660	
  1661		pctrl->context.communities = devm_kcalloc(dev, pctrl->soc->ncommunities,
  1662							  sizeof(*pctrl->context.communities),
  1663							  GFP_KERNEL);
  1664		if (!pctrl->context.communities)
  1665			return -ENOMEM;
  1666	
  1667		cctx = &pctrl->context.communities[0];
  1668		for (i = 0; i < ARRAY_SIZE(cctx->intr_lines); i++)
  1669			cctx->intr_lines[i] = CHV_INVALID_HWIRQ;
  1670	
  1671		irq = platform_get_irq(pdev, 0);
  1672		if (irq < 0)
  1673			return irq;
  1674	
  1675		pctrl->pctldesc = chv_pinctrl_desc;
  1676		pctrl->pctldesc.name = dev_name(dev);
  1677		pctrl->pctldesc.pins = pctrl->soc->pins;
  1678		pctrl->pctldesc.npins = pctrl->soc->npins;
  1679	
  1680		pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
  1681		if (IS_ERR(pctrl->pctldev)) {
  1682			dev_err(dev, "failed to register pinctrl driver\n");
  1683			return PTR_ERR(pctrl->pctldev);
  1684		}
  1685	
  1686		ret = chv_gpio_probe(pctrl, irq);
  1687		if (ret)
  1688			return ret;
  1689	
  1690		status = acpi_install_address_space_handler(ACPI_HANDLE(dev),
  1691						community->acpi_space_id,
  1692						chv_pinctrl_mmio_access_handler,
  1693						NULL, pctrl);
  1694		if (ACPI_FAILURE(status))
  1695			dev_err(dev, "failed to install ACPI addr space handler\n");
  1696	
  1697		platform_set_drvdata(pdev, pctrl);
  1698	
  1699		return 0;
  1700	}
  1701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

