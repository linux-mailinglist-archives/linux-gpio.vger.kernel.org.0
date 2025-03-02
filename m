Return-Path: <linux-gpio+bounces-16877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B6A4AE99
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 01:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBF816E6A3
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 00:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50D7C148;
	Sun,  2 Mar 2025 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpkKSyOX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DB4A944
	for <linux-gpio@vger.kernel.org>; Sun,  2 Mar 2025 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740875320; cv=none; b=aXTU7XTyxSrXgKhM+mWtQlxf5VHJlvn+w1+Nw/RWkYgn4vI/eQcSe67CGVzwAhfNs9MsxdE+RoWOfFHoePhK+81oe5Dvl4Hf0L4x5KVD/0U48NK+Zanf0J12yuAtU1Vn6aBk0csb3oGFoBuN5mcpQXHYGRHiklJZlPuwoXYFebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740875320; c=relaxed/simple;
	bh=coxWUmmNx97w4l33J/Yb+7uJfTmL1Yv3/UE1VvBSjgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/aRAAyB1wij1gyR72YuXslzHjUqe+7truYX60+0opY1wnoIm6oF66byoFT8Ix4oDFmRI5zeVUxvy4P8cGZIJLwcV3p8Ih54kyiCR2u0/qW4pxwN9ZQXuo/U5YiEuRhSqdW9GV6DUhqvBAAYmzH28vr5UpD3vlxnwKR4+EZkNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpkKSyOX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740875319; x=1772411319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=coxWUmmNx97w4l33J/Yb+7uJfTmL1Yv3/UE1VvBSjgY=;
  b=RpkKSyOXArvd4zTvPGiDbnTbMFykSQhka2PKNOkdC5g7OlTmmOkSRBr5
   57HP3GCO1XhfdOLeEEfdJdD4qPFaWj+SslVz8MhzxgzYJ/51yQLJtPGlS
   WTAQPsTVtCpT6F4sLM7g2yZlA9a2C1re4kNI0HBvBZ3z7o4uzBsa7ikvi
   kRZF67larLV0w2x2hfFAciE12FKqiPailONSEJjBLhUzwU++szl844jm0
   YNgqVvDXaO2io0hM4I7XGgZqoyuQY9anjwpO2hl8T4dlAx7pD7XWtELhp
   cah2hz6fZRDVlfM00jrTiGEeLl55qb3XKz/8rkPljJjs9qbQAiTh83qZ4
   Q==;
X-CSE-ConnectionGUID: Tc+mqh5JQPKhQ36Z/q7HLw==
X-CSE-MsgGUID: K+TojjtLSsiGXxcqNLmupw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="29361460"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="29361460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 16:28:39 -0800
X-CSE-ConnectionGUID: oXG5t3tdT0ioO23T9sNliw==
X-CSE-MsgGUID: CXjXPWKDQJetiY6G8nrucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="140888793"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 16:28:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toXC6-000Gt4-21;
	Sun, 02 Mar 2025 00:28:34 +0000
Date: Sun, 2 Mar 2025 08:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
Message-ID: <202503020849.ZhLZ4W63-lkp@intel.com>
References: <20250227205049.765309-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227205049.765309-3-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-missing-prototype-for-non-CONFIG_SUSPEND-CONFIG_X86-case/20250228-045242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250227205049.765309-3-superm1%40kernel.org
patch subject: [PATCH v3 2/2] pinctrl: amd: Add an LPS0 check() callback
config: hexagon-randconfig-r062-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020849.ZhLZ4W63-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020849.ZhLZ4W63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020849.ZhLZ4W63-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-amd.c:1210:2: error: call to undeclared function 'acpi_register_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1210 |         acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^
>> drivers/pinctrl/pinctrl-amd.c:1210:26: error: use of undeclared identifier 'pinctrl_amd_s2idle_dev_ops'
    1210 |         acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |                                 ^
   drivers/pinctrl/pinctrl-amd.c:1229:2: error: call to undeclared function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1229 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^
   drivers/pinctrl/pinctrl-amd.c:1229:28: error: use of undeclared identifier 'pinctrl_amd_s2idle_dev_ops'
    1229 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |                                   ^
   4 errors generated.


vim +/pinctrl_amd_s2idle_dev_ops +1210 drivers/pinctrl/pinctrl-amd.c

  1151	
  1152		gpio_dev->pdev = pdev;
  1153		gpio_dev->gc.get_direction	= amd_gpio_get_direction;
  1154		gpio_dev->gc.direction_input	= amd_gpio_direction_input;
  1155		gpio_dev->gc.direction_output	= amd_gpio_direction_output;
  1156		gpio_dev->gc.get			= amd_gpio_get_value;
  1157		gpio_dev->gc.set			= amd_gpio_set_value;
  1158		gpio_dev->gc.set_config		= amd_gpio_set_config;
  1159		gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
  1160	
  1161		gpio_dev->gc.base		= -1;
  1162		gpio_dev->gc.label			= pdev->name;
  1163		gpio_dev->gc.owner			= THIS_MODULE;
  1164		gpio_dev->gc.parent			= &pdev->dev;
  1165		gpio_dev->gc.ngpio			= resource_size(res) / 4;
  1166	
  1167		gpio_dev->hwbank_num = gpio_dev->gc.ngpio / 64;
  1168		gpio_dev->groups = kerncz_groups;
  1169		gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
  1170	
  1171		amd_pinctrl_desc.name = dev_name(&pdev->dev);
  1172		amd_get_iomux_res(gpio_dev);
  1173		gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
  1174							gpio_dev);
  1175		if (IS_ERR(gpio_dev->pctrl)) {
  1176			dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
  1177			return PTR_ERR(gpio_dev->pctrl);
  1178		}
  1179	
  1180		/* Disable and mask interrupts */
  1181		amd_gpio_irq_init(gpio_dev);
  1182	
  1183		girq = &gpio_dev->gc.irq;
  1184		gpio_irq_chip_set_chip(girq, &amd_gpio_irqchip);
  1185		/* This will let us handle the parent IRQ in the driver */
  1186		girq->parent_handler = NULL;
  1187		girq->num_parents = 0;
  1188		girq->parents = NULL;
  1189		girq->default_type = IRQ_TYPE_NONE;
  1190		girq->handler = handle_simple_irq;
  1191	
  1192		ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
  1193		if (ret)
  1194			return ret;
  1195	
  1196		ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
  1197					0, 0, gpio_dev->gc.ngpio);
  1198		if (ret) {
  1199			dev_err(&pdev->dev, "Failed to add pin range\n");
  1200			goto out2;
  1201		}
  1202	
  1203		ret = devm_request_irq(&pdev->dev, gpio_dev->irq, amd_gpio_irq_handler,
  1204				       IRQF_SHARED | IRQF_COND_ONESHOT, KBUILD_MODNAME, gpio_dev);
  1205		if (ret)
  1206			goto out2;
  1207	
  1208		platform_set_drvdata(pdev, gpio_dev);
  1209		acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
> 1210		acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
  1211	
  1212		dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
  1213		return ret;
  1214	
  1215	out2:
  1216		gpiochip_remove(&gpio_dev->gc);
  1217	
  1218		return ret;
  1219	}
  1220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

