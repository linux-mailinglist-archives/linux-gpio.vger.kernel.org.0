Return-Path: <linux-gpio+bounces-9774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016F96B744
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0225D1F25F98
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2B7145B35;
	Wed,  4 Sep 2024 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiSgayjV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1F187847;
	Wed,  4 Sep 2024 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443231; cv=none; b=vBsipW9THzjlgCP1sAg/M/qDKMiXIXSlaH4Ioju1OhQupLMGk0MNJO1g8IlQrtm4Qf2ykUBFJYz0WjrZVlAKANOpphyc9iBoOON/IR8EYxO1CMjiurN7Cuqm5gQfWtJmQb5OXU1iqiy4tSLuzD+8a0sxKcDixph2XmJm7bttgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443231; c=relaxed/simple;
	bh=3mgE5K36qqLINQ3oA0RYMk9lxm6QskumFLe9GMAiztE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLSSt/6AWqMIsm/umQa56A+k9X8cpiWw/oFc1lKH90ey7M+lfxexYtJBUUyTXlooV6bbRYuAydpXmks2FQ5o5/eg6VJfu8zQpHooaFpOZJzU3RYUCmdHC/OUNgn/BwpmR7DE15ya1OSjmX7VsOQMZKpXJgOwiaFgP8fy+PRldes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiSgayjV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725443229; x=1756979229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mgE5K36qqLINQ3oA0RYMk9lxm6QskumFLe9GMAiztE=;
  b=XiSgayjVvMVlv5ZTxDiIalKW8wuiJeR8MGtugkKMFeJNJX4aETI+RV8M
   cCQgWYJjzIIZh6PlolNvk17sRFPQUpvPoxKFylsaSK1wyAA5g+Uv2HEPM
   sd3jakdum3Rw75ObfAcrXC5ic1tOgFawrZoL9tv81xavss7fD7BDKG8MJ
   D/7i0/wgp9zl31FtNo1nc2Wf6qI1aiPo1kUXA0l1kkfxpes7+oH2NMZtH
   siAKv/x5+gIcf7zVSuVc+/5VrgpXN0iQCqdKIYkhJs7DSCAFueR9/VaPd
   QCcDNL4cDlA2DTQD1k6jQEAGCrrmo3fTH1KHFDLedVNUgbT30lZx8d+im
   w==;
X-CSE-ConnectionGUID: l41y8X2sTKmwL8jphSTGbg==
X-CSE-MsgGUID: HES9v6IGSmOr/7I+NnAWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24246232"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24246232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:47:09 -0700
X-CSE-ConnectionGUID: Qwrmw2UwT3CHFyaeieD3UQ==
X-CSE-MsgGUID: RmCpXEIgRXaej6SSbN3SSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="102623895"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2024 02:47:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slmbQ-0007pE-2J;
	Wed, 04 Sep 2024 09:47:04 +0000
Date: Wed, 4 Sep 2024 17:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <202409041756.jHFGLs72-lkp@intel.com>
References: <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-Replace-ifdeffery-by-pm_sleep_ptr-macro/20240904-011041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240903170752.3564538-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro
config: i386-buildonly-randconfig-002-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041756.jHFGLs72-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041756.jHFGLs72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041756.jHFGLs72-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/intel/pinctrl-intel.c: In function 'intel_pinctrl_probe':
>> drivers/pinctrl/intel/pinctrl-intel.c:1600:51: warning: the address of 'intel_pinctrl_pm_init' will always evaluate as 'true' [-Waddress]
    1600 |         ret = pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_init(pctrl) : 0;
         |                                                   ^


vim +1600 drivers/pinctrl/intel/pinctrl-intel.c

  1503	
  1504	int intel_pinctrl_probe(struct platform_device *pdev,
  1505				const struct intel_pinctrl_soc_data *soc_data)
  1506	{
  1507		struct device *dev = &pdev->dev;
  1508		struct intel_pinctrl *pctrl;
  1509		int i, ret, irq;
  1510	
  1511		pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
  1512		if (!pctrl)
  1513			return -ENOMEM;
  1514	
  1515		pctrl->dev = dev;
  1516		pctrl->soc = soc_data;
  1517		raw_spin_lock_init(&pctrl->lock);
  1518	
  1519		/*
  1520		 * Make a copy of the communities which we can use to hold pointers
  1521		 * to the registers.
  1522		 */
  1523		pctrl->ncommunities = pctrl->soc->ncommunities;
  1524		pctrl->communities = devm_kcalloc(dev, pctrl->ncommunities,
  1525						  sizeof(*pctrl->communities), GFP_KERNEL);
  1526		if (!pctrl->communities)
  1527			return -ENOMEM;
  1528	
  1529		for (i = 0; i < pctrl->ncommunities; i++) {
  1530			struct intel_community *community = &pctrl->communities[i];
  1531			void __iomem *regs;
  1532			u32 offset;
  1533			u32 value;
  1534	
  1535			*community = pctrl->soc->communities[i];
  1536	
  1537			regs = devm_platform_ioremap_resource(pdev, community->barno);
  1538			if (IS_ERR(regs))
  1539				return PTR_ERR(regs);
  1540	
  1541			/*
  1542			 * Determine community features based on the revision.
  1543			 * A value of all ones means the device is not present.
  1544			 */
  1545			value = readl(regs + REVID);
  1546			if (value == ~0u)
  1547				return -ENODEV;
  1548			if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
  1549				community->features |= PINCTRL_FEATURE_DEBOUNCE;
  1550				community->features |= PINCTRL_FEATURE_1K_PD;
  1551			}
  1552	
  1553			/* Determine community features based on the capabilities */
  1554			offset = CAPLIST;
  1555			do {
  1556				value = readl(regs + offset);
  1557				switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
  1558				case CAPLIST_ID_GPIO_HW_INFO:
  1559					community->features |= PINCTRL_FEATURE_GPIO_HW_INFO;
  1560					break;
  1561				case CAPLIST_ID_PWM:
  1562					community->features |= PINCTRL_FEATURE_PWM;
  1563					break;
  1564				case CAPLIST_ID_BLINK:
  1565					community->features |= PINCTRL_FEATURE_BLINK;
  1566					break;
  1567				case CAPLIST_ID_EXP:
  1568					community->features |= PINCTRL_FEATURE_EXP;
  1569					break;
  1570				default:
  1571					break;
  1572				}
  1573				offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
  1574			} while (offset);
  1575	
  1576			dev_dbg(dev, "Community%d features: %#08x\n", i, community->features);
  1577	
  1578			/* Read offset of the pad configuration registers */
  1579			offset = readl(regs + PADBAR);
  1580	
  1581			community->regs = regs;
  1582			community->pad_regs = regs + offset;
  1583	
  1584			if (community->gpps)
  1585				ret = intel_pinctrl_add_padgroups_by_gpps(pctrl, community);
  1586			else
  1587				ret = intel_pinctrl_add_padgroups_by_size(pctrl, community);
  1588			if (ret)
  1589				return ret;
  1590	
  1591			ret = intel_pinctrl_probe_pwm(pctrl, community);
  1592			if (ret)
  1593				return ret;
  1594		}
  1595	
  1596		irq = platform_get_irq(pdev, 0);
  1597		if (irq < 0)
  1598			return irq;
  1599	
> 1600		ret = pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_init(pctrl) : 0;
  1601		if (ret)
  1602			return ret;
  1603	
  1604		pctrl->pctldesc = intel_pinctrl_desc;
  1605		pctrl->pctldesc.name = dev_name(dev);
  1606		pctrl->pctldesc.pins = pctrl->soc->pins;
  1607		pctrl->pctldesc.npins = pctrl->soc->npins;
  1608	
  1609		pctrl->pctldev = devm_pinctrl_register(dev, &pctrl->pctldesc, pctrl);
  1610		if (IS_ERR(pctrl->pctldev)) {
  1611			dev_err(dev, "failed to register pinctrl driver\n");
  1612			return PTR_ERR(pctrl->pctldev);
  1613		}
  1614	
  1615		ret = intel_gpio_probe(pctrl, irq);
  1616		if (ret)
  1617			return ret;
  1618	
  1619		platform_set_drvdata(pdev, pctrl);
  1620	
  1621		return 0;
  1622	}
  1623	EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, PINCTRL_INTEL);
  1624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

