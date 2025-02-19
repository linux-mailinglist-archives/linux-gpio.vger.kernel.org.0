Return-Path: <linux-gpio+bounces-16217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DAA3B608
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5C57178431
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3091DED7C;
	Wed, 19 Feb 2025 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeeMj26g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00011DED6B
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955037; cv=none; b=ccn9kOeTZYLvZTv0yN5/iF35ZW2WJdzQp/U96UdPCMMNmBFi1j1twgOhmRqlm/OEb7EwRX8M9qDOlGzq9GPRc89J+2KHZVeu/Ljq9HNY9+IQUsa8ZbpREPV8dozQqARJ7SbeB/DRHpUikC+ataTMcYUTtKVzGSMh2O/PhUDjSgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955037; c=relaxed/simple;
	bh=gkGF5TGnILOlooV/zopZEYtR/PIV++EoGIcVcIa8KWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPPVGO/Gjgf4g+u/lWF3ugWtkpG2SM6vfGq/BKSu+AyJmwiIzHkjYLkN6fNkvYCv/e0GLp9MC9Vkq42N/lanN1QYFLhygArY5mElGAtuT2+vzudhho/SOyV46s0AZxNR8yv6t4Tvk15t0WWons2gKNJ5HbeHSpg5uFEC8C2k2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeeMj26g; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739955032; x=1771491032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkGF5TGnILOlooV/zopZEYtR/PIV++EoGIcVcIa8KWw=;
  b=IeeMj26gmt7rjMPXo2vMQ3O5NN+5APWJ6XUzC3//hMcoAsEK6CnADKIU
   n53J5ucRTt9K83PNYyZ4KPgraRsllntmYRoaXy6nDwHvFqkV6pbXBtmJU
   cI/2cbB93YWnj6v5njTpu/u5HDf1OT+2Ujd1fyYylulOkX5y5GBKXc4Fe
   E0WRFxvoU6k9fDd6zoPGoy4HWFrn85+wrnP2//FxR/4HnThNKqvUxh3HG
   DdnAXBtvCE5or/j73BW5Kh0MYnSEKo3cA4sBEgAv0bOgHgCCbIf8sgN+l
   R0MCwfJMplF7XbbZfFKL+h7r3M7RBy+01SkvBS4HKnOLgb3ucIlSqe6o8
   Q==;
X-CSE-ConnectionGUID: Tkei4ajVTeqeMqpxdN7ECQ==
X-CSE-MsgGUID: aUoLqQZNTg6DqqyJvK5gFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28279432"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="28279432"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 00:50:31 -0800
X-CSE-ConnectionGUID: O7wGV6TvS0akj8W7jvr4+g==
X-CSE-MsgGUID: JEJMzDRoQ+KNxiHBhrI9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137900858"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 00:50:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkfmh-0001d3-0n;
	Wed, 19 Feb 2025 08:50:23 +0000
Date: Wed, 19 Feb 2025 16:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: amd: Add an LPS0 check() callback
Message-ID: <202502191627.fRgoBwcZ-lkp@intel.com>
References: <20250218024702.2139216-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218024702.2139216-1-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.14-rc3 next-20250219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/pinctrl-amd-Add-an-LPS0-check-callback/20250218-104906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250218024702.2139216-1-superm1%40kernel.org
patch subject: [PATCH] pinctrl: amd: Add an LPS0 check() callback
config: x86_64-buildonly-randconfig-003-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191627.fRgoBwcZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191627.fRgoBwcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191627.fRgoBwcZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_probe':
>> drivers/pinctrl/pinctrl-amd.c:1211:15: error: implicit declaration of function 'acpi_register_lps0_dev'; did you mean 'acpi_register_gsi'? [-Werror=implicit-function-declaration]
    1211 |         ret = acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               acpi_register_gsi
>> drivers/pinctrl/pinctrl-amd.c:1211:39: error: 'pinctrl_amd_s2idle_dev_ops' undeclared (first use in this function)
    1211 |         ret = acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c:1211:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_remove':
>> drivers/pinctrl/pinctrl-amd.c:1232:9: error: implicit declaration of function 'acpi_unregister_lps0_dev'; did you mean 'acpi_unregister_gsi'? [-Werror=implicit-function-declaration]
    1232 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         acpi_unregister_gsi
   drivers/pinctrl/pinctrl-amd.c:1232:35: error: 'pinctrl_amd_s2idle_dev_ops' undeclared (first use in this function)
    1232 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-amd.c: At top level:
>> drivers/pinctrl/pinctrl-amd.c:40:25: warning: 'pinctrl_dev' defined but not used [-Wunused-variable]
      40 | static struct amd_gpio *pinctrl_dev;
         |                         ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1211 drivers/pinctrl/pinctrl-amd.c

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
  1210	
> 1211		ret = acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
  1212		if (ret)
  1213			return ret;
  1214	
  1215		dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
  1216		return ret;
  1217	
  1218	out2:
  1219		gpiochip_remove(&gpio_dev->gc);
  1220	
  1221		return ret;
  1222	}
  1223	
  1224	static void amd_gpio_remove(struct platform_device *pdev)
  1225	{
  1226		struct amd_gpio *gpio_dev;
  1227	
  1228		gpio_dev = platform_get_drvdata(pdev);
  1229	
  1230		gpiochip_remove(&gpio_dev->gc);
  1231		acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
> 1232		acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
  1233	}
  1234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

