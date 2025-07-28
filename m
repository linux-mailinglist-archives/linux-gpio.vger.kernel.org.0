Return-Path: <linux-gpio+bounces-23860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91FB134C9
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 08:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B6818946C3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7081221ADA7;
	Mon, 28 Jul 2025 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWU3hyUs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA018FDBE
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 06:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753683326; cv=none; b=N6cspT4IjhcwvZelcxsxBEKiLyHKol59Ww+OkAlGBn3Jj/aQZ/+ax6E0womTcJcXmAwHKYd4Ct9uH/pTgdgHvaDc+znInX53QJVR1w2j07DLo+ciNJS0CuXTNBEaFnlkSNWtqsrBPVVBp/xBE4M0i9bcf7RDOwZT8S1mGw3pHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753683326; c=relaxed/simple;
	bh=AebrKKZYlksX8PT21oLXExqBuM4XVnoLFmaH2rXE1XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uOY7geMrRP0zqmpRWv6DsVZWgp3V1pR9ToDPVIvvC3u3pk7ZdicLkUiWJ+KHSynCdgbopGqBS/7HoWPj61ZGzVZgvMoxuSmtroFKkAWoEjXLGbZZ+DFn4NO/hozPlhqoZhH9xq5dmG+IysEqsTf9gmnOzj14r8C5qkAEhcp+j6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWU3hyUs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753683324; x=1785219324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AebrKKZYlksX8PT21oLXExqBuM4XVnoLFmaH2rXE1XU=;
  b=OWU3hyUsvVlShG8Vlr741Nup+CGUoE4+P117B4YMQoc41i8wwPhjKjps
   HGq0S+Sp2At8mTwBbEs9apg0zgRGZvuD35UZa16vn53F6aQW/C3KHaSZ3
   /Wdb7VnX//bKz8K3XAxO7ZV5eHBagtc5AIqXpvrsqlTWg4Z2vrqpha5Fj
   o8sClnCgZ1vsQy3biSJt2uW9kAFjozmtR2EovJz/puZAbZZGp2yfHAhrj
   TGlPBkpsgz2xG2LDKMrerNN96ti93NKUobGfzb5D6ldsBaJHpQzbUjsE8
   ka+bLUzjHx2uh2Tb8IYzJhvRDnXMgALDwK9L8mNDqa9Zq2DYngegBofbg
   w==;
X-CSE-ConnectionGUID: YO8JDkUrSZSBQYUlsE1CRQ==
X-CSE-MsgGUID: YUrW1ys0Qq+buE4IArUxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56015566"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56015566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 23:15:24 -0700
X-CSE-ConnectionGUID: jnQO5fr0R8WK98Tp43xCYA==
X-CSE-MsgGUID: in4NjtWdQTyumpXAv+Icng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167668511"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2025 23:15:22 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugH8q-0000F5-1z;
	Mon, 28 Jul 2025 06:15:20 +0000
Date: Mon, 28 Jul 2025 14:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 3/3] drivers/gpio/gpio-macsmc.c:264:18: error:
 'struct gpio_chip' has no member named 'set_rv'
Message-ID: <202507281445.KgU1cN7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   9b3b82c1867fb359385df1e474972a9a2af2d812
commit: 9b3b82c1867fb359385df1e474972a9a2af2d812 [3/3] treewide: rename GPIO set callbacks back to their original names
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250728/202507281445.KgU1cN7o-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281445.KgU1cN7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281445.KgU1cN7o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-macsmc.c: In function 'macsmc_gpio_probe':
>> drivers/gpio/gpio-macsmc.c:264:18: error: 'struct gpio_chip' has no member named 'set_rv'
     264 |         smcgp->gc.set_rv = macsmc_gpio_set;
         |                  ^


vim +264 drivers/gpio/gpio-macsmc.c

9b21051b088591 Hector Martin 2025-06-10  233  
9b21051b088591 Hector Martin 2025-06-10  234  static int macsmc_gpio_probe(struct platform_device *pdev)
9b21051b088591 Hector Martin 2025-06-10  235  {
9b21051b088591 Hector Martin 2025-06-10  236  	struct macsmc_gpio *smcgp;
9b21051b088591 Hector Martin 2025-06-10  237  	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
9b21051b088591 Hector Martin 2025-06-10  238  	smc_key key;
9b21051b088591 Hector Martin 2025-06-10  239  	int ret;
9b21051b088591 Hector Martin 2025-06-10  240  
9b21051b088591 Hector Martin 2025-06-10  241  	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
9b21051b088591 Hector Martin 2025-06-10  242  	if (!smcgp)
9b21051b088591 Hector Martin 2025-06-10  243  		return -ENOMEM;
9b21051b088591 Hector Martin 2025-06-10  244  
9b21051b088591 Hector Martin 2025-06-10  245  	smcgp->dev = &pdev->dev;
9b21051b088591 Hector Martin 2025-06-10  246  	smcgp->smc = smc;
9b21051b088591 Hector Martin 2025-06-10  247  
9b21051b088591 Hector Martin 2025-06-10  248  	smcgp->first_index = macsmc_gpio_find_first_gpio_index(smcgp);
9b21051b088591 Hector Martin 2025-06-10  249  	if (smcgp->first_index < 0)
9b21051b088591 Hector Martin 2025-06-10  250  		return smcgp->first_index;
9b21051b088591 Hector Martin 2025-06-10  251  
9b21051b088591 Hector Martin 2025-06-10  252  	ret = apple_smc_get_key_by_index(smc, smcgp->first_index, &key);
9b21051b088591 Hector Martin 2025-06-10  253  	if (ret < 0)
9b21051b088591 Hector Martin 2025-06-10  254  		return ret;
9b21051b088591 Hector Martin 2025-06-10  255  
9b21051b088591 Hector Martin 2025-06-10  256  	if (key > macsmc_gpio_key(MAX_GPIO - 1))
9b21051b088591 Hector Martin 2025-06-10  257  		return -ENODEV;
9b21051b088591 Hector Martin 2025-06-10  258  
9b21051b088591 Hector Martin 2025-06-10  259  	dev_info(smcgp->dev, "First GPIO key: %p4ch\n", &key);
9b21051b088591 Hector Martin 2025-06-10  260  
9b21051b088591 Hector Martin 2025-06-10  261  	smcgp->gc.label = "macsmc-pmu-gpio";
9b21051b088591 Hector Martin 2025-06-10  262  	smcgp->gc.owner = THIS_MODULE;
9b21051b088591 Hector Martin 2025-06-10  263  	smcgp->gc.get = macsmc_gpio_get;
9b21051b088591 Hector Martin 2025-06-10 @264  	smcgp->gc.set_rv = macsmc_gpio_set;
9b21051b088591 Hector Martin 2025-06-10  265  	smcgp->gc.get_direction = macsmc_gpio_get_direction;
9b21051b088591 Hector Martin 2025-06-10  266  	smcgp->gc.init_valid_mask = macsmc_gpio_init_valid_mask;
9b21051b088591 Hector Martin 2025-06-10  267  	smcgp->gc.can_sleep = true;
9b21051b088591 Hector Martin 2025-06-10  268  	smcgp->gc.ngpio = MAX_GPIO;
9b21051b088591 Hector Martin 2025-06-10  269  	smcgp->gc.base = -1;
9b21051b088591 Hector Martin 2025-06-10  270  	smcgp->gc.parent = &pdev->dev;
9b21051b088591 Hector Martin 2025-06-10  271  
9b21051b088591 Hector Martin 2025-06-10  272  	return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
9b21051b088591 Hector Martin 2025-06-10  273  }
9b21051b088591 Hector Martin 2025-06-10  274  

:::::: The code at line 264 was first introduced by commit
:::::: 9b21051b0885912f5bb2cc9d4f95c6fca697da4d gpio: Add new gpio-macsmc driver for Apple Macs

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

