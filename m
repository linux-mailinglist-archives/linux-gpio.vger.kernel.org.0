Return-Path: <linux-gpio+bounces-4182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335688741DE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 22:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419D51C2127E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 21:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D971A5AC;
	Wed,  6 Mar 2024 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWyJL79n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE5175A5
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709760037; cv=none; b=DSO65uxi74gVNadl+Rl04auqRaYRSK/+1BNqmpb7Dj0w4GamXnusTxkT+ZEjyY4Pnj1TRYZmMsPzd3BMxa3d2m9OD757E99v386XnGLyreUDR9OIcTJ0ui/ck0Qru9BjJiT6a3togpf8rJwiT/mXwDws3jQIPLEtN8lvl1IxETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709760037; c=relaxed/simple;
	bh=Hc0TaumimTSCcg53DnIFqXQAemvOswmEtUzE/ogw84A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axeHod6emp3gZuv6XUNwjKCODsJ3OfaEpHXNJS9eEutBDle/7ciOW9oZguxxqx7Vihz/729ulfNq3HG8OGQ92l0N8mVOM8tHMCzAF0pIkh4pprrV/9OR6PMY6oTC2kjN7FHFL1OuS7BXLNHLQfQs6sCrOfYSMqOET5oSCOjErE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWyJL79n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709760037; x=1741296037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hc0TaumimTSCcg53DnIFqXQAemvOswmEtUzE/ogw84A=;
  b=LWyJL79n6ZdEb8qC1x9xj/B7Ek1e7o6jpPxmIhZFBY01wg1SaDKVwrdJ
   lG+23ZTyydvvtYWIiXFbpQZavNSB86CG7UZQIdIG33UzCgtrk5Jgeb1Lj
   3Nrd/uhWDn9L0ijUmnYBVHyyR1m2BtenUJvIdPwahRWH4mkXQH2zIsawA
   mTjtmaZIfEAgjWOYl/WUW/jKR7JEG7uaMZNu6EW3GYAY0X5/dUBu5MJmZ
   gsd0STCE8/0dSKldnkctfGDcwE0l/7CPvPbtIacxFzGYs7CQIpWaMMg4R
   yMZ3lS7Qn0dgj+LteknpjvODntkPDTKT0AUDEjlRXIuGiSTuleq8hknD9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8214970"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8214970"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 13:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9865444"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2024 13:20:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhygi-0004YH-0T;
	Wed, 06 Mar 2024 21:20:32 +0000
Date: Thu, 7 Mar 2024 05:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-nomadik-gpio 28/28]
 drivers/gpio/gpio-nomadik.c:588:30: warning: format '%p' expects argument of
 type 'void *', but argument 3 has type 'long int'
Message-ID: <202403070558.ud4m0mNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   efaa90ed2cff038f12c077e9b040b97ac362b09c
commit: efaa90ed2cff038f12c077e9b040b97ac362b09c [28/28] gpio: nomadik: Back out some managed resources
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070558.ud4m0mNn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070558.ud4m0mNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070558.ud4m0mNn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/gpio/gpio-nomadik.c:28:
   drivers/gpio/gpio-nomadik.c: In function 'nmk_gpio_populate_chip':
>> drivers/gpio/gpio-nomadik.c:588:30: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'long int' [-Wformat=]
     588 |                 dev_err(dev, "failed getting reset control: %pe\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpio/gpio-nomadik.c:588:17: note: in expansion of macro 'dev_err'
     588 |                 dev_err(dev, "failed getting reset control: %pe\n",
         |                 ^~~~~~~
   drivers/gpio/gpio-nomadik.c:588:62: note: format string is defined here
     588 |                 dev_err(dev, "failed getting reset control: %pe\n",
         |                                                             ~^
         |                                                              |
         |                                                              void *
         |                                                             %ld


vim +588 drivers/gpio/gpio-nomadik.c

   543	
   544		nmk_chip = devm_kzalloc(dev, sizeof(*nmk_chip), GFP_KERNEL);
   545		if (!nmk_chip) {
   546			platform_device_put(gpio_pdev);
   547			return ERR_PTR(-ENOMEM);
   548		}
   549	
   550		if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
   551			ngpio = NMK_GPIO_PER_CHIP;
   552			dev_dbg(dev, "populate: using default ngpio (%u)\n", ngpio);
   553		}
   554	
   555		nmk_chip->is_mobileye_soc = device_is_compatible(gpio_dev,
   556								 "mobileye,eyeq5-gpio");
   557		nmk_chip->bank = id;
   558		chip = &nmk_chip->chip;
   559		chip->base = -1;
   560		chip->ngpio = ngpio;
   561		chip->label = dev_name(gpio_dev);
   562		chip->parent = gpio_dev;
   563	
   564		/* NOTE: different devices! No devm_platform_ioremap_resource() here! */
   565		res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
   566		base = devm_ioremap_resource(dev, res);
   567		if (IS_ERR(base)) {
   568			platform_device_put(gpio_pdev);
   569			return ERR_CAST(base);
   570		}
   571		nmk_chip->addr = base;
   572	
   573		/* NOTE: do not use devm_ here! */
   574		clk = clk_get_optional(gpio_dev, NULL);
   575		if (IS_ERR(clk)) {
   576			platform_device_put(gpio_pdev);
   577			return ERR_CAST(clk);
   578		}
   579		clk_prepare(clk);
   580		nmk_chip->clk = clk;
   581	
   582		/* NOTE: do not use devm_ here! */
   583		reset = reset_control_get_optional_shared(gpio_dev, NULL);
   584		if (IS_ERR(reset)) {
   585			clk_unprepare(clk);
   586			clk_put(clk);
   587			platform_device_put(gpio_pdev);
 > 588			dev_err(dev, "failed getting reset control: %pe\n",
   589				PTR_ERR(reset));
   590			return ERR_CAST(reset);
   591		}
   592	
   593		/*
   594		 * Reset might be shared and asserts/deasserts calls are unbalanced. We
   595		 * only support sharing this reset with other gpio-nomadik devices that
   596		 * use this reset to ensure deassertion at probe.
   597		 */
   598		ret = reset_control_deassert(reset);
   599		if (ret) {
   600			reset_control_put(reset);
   601			clk_unprepare(clk);
   602			clk_put(clk);
   603			platform_device_put(gpio_pdev);
   604			dev_err(dev, "failed reset deassert: %d\n", ret);
   605			return ERR_PTR(ret);
   606		}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

