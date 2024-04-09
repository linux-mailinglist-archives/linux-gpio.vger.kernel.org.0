Return-Path: <linux-gpio+bounces-5259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B740989E5DB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7109D282E25
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD4C158DB2;
	Tue,  9 Apr 2024 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+DGsmQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35473158DAD
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703795; cv=none; b=tKqwC+cEJBdjtHSd/FZ8R4v4JZ5nqer0yXj7PIbeaq5eWG1SzLPmkCQGrYO3aILPyo4zURhTwTbCTniLvFh0KqRow7ggUHhGkJJHThMMAGgHOoL7Vu6xKYb3vUXvdrg9L505bzCCrCHShll46VXzcf6PDkTsI6kEJiwAHG2j6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703795; c=relaxed/simple;
	bh=Qu76JXn8dQqXebQRDlocfL+b7uNDQ4ZTIjTiZf4Cctg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMD99X0xwvkQcPWVV+soyxoTOBYjiIsAn0jaJgeq84d+rN9ebWvaBdc1Sb9nRUtH9moZX9XN4kdSmhCWF4qFuby8wHbBRNjGoBrg7/LcX0n7wdZROg6fSoiK8X50b7fc4MeMhvOcvc8aIZrmlJMNoKcrlBEtanFdpTZoZklu0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+DGsmQO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703794; x=1744239794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qu76JXn8dQqXebQRDlocfL+b7uNDQ4ZTIjTiZf4Cctg=;
  b=i+DGsmQOCFK6BEpF1SDOMEQsL/S65U17Ys5fQFQq2PYTzZApbAsmKInM
   67or6h66MDSrjvAqOZKdt29vcfuWKKwvba8RO+l2y5v/k8uyQhuUU8kGw
   ddC/OMySPck2VHvJFJTZqE84Jk7PJKiV6m6PXsrgIk2KlyIUMmtaTAJIW
   xxoqyudQlm2FuX2Ehp06nff+W1wHa6OKRr1Ph/UEdpe1w0Uq4nkeWN4Tt
   VitLekThBTvcfAEiPFPR/6tlLZdnmxvDcim/MS2Xs25+yv4TMZpK60ILm
   +FVYpcdnFxcncyF/YjuqWqL+i882QV+sBN/DpqRYOMsXEo/R+Q2h05KF/
   w==;
X-CSE-ConnectionGUID: JxiO4pVvQaSze4KUF3ChLA==
X-CSE-MsgGUID: R6naiFdGT5+I+AyCssCMqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7899624"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7899624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:03:11 -0700
X-CSE-ConnectionGUID: y6g2VrOWTECaqsl5CFAc/Q==
X-CSE-MsgGUID: X7NjIqP+TISOCEqWP9okLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20247313"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 16:03:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKUc-0006bE-2x;
	Tue, 09 Apr 2024 23:03:06 +0000
Date: Wed, 10 Apr 2024 07:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:240:32: error: 'pdev' undeclared; did you mean
 'dev'?
Message-ID: <202404100624.vZIIfZvs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53
commit: 3ca0eec7ecfa5c404f41e9b1e7690ec64de77b53 [2/2] wifi: ath9k: Obtain system GPIOS from descriptors
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100624.vZIIfZvs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100624.vZIIfZvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100624.vZIIfZvs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-ath79.c: In function 'ath79_gpio_register_wifi_descriptors':
>> drivers/gpio/gpio-ath79.c:240:32: error: 'pdev' undeclared (first use in this function); did you mean 'dev'?
     240 |         lookup = devm_kzalloc(&pdev->dev,
         |                                ^~~~
         |                                dev
   drivers/gpio/gpio-ath79.c:240:32: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpio/gpio-ath79.c:251:25: error: implicit declaration of function 'PIO_LOOKUP_IDX'; did you mean 'GPIO_LOOKUP_IDX'? [-Werror=implicit-function-declaration]
     251 |                         PIO_LOOKUP_IDX(label, 0, NULL, i,
         |                         ^~~~~~~~~~~~~~
         |                         GPIO_LOOKUP_IDX
>> drivers/gpio/gpio-ath79.c:252:40: error: conversion to non-scalar type requested
     252 |                                        GPIO_ACTIVE_HIGH);
         |                                        ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +240 drivers/gpio/gpio-ath79.c

   225	
   226	#if IS_ENABLED(CONFIG_ATH9K_AHB)
   227	/*
   228	 * This registers all of the ath79k GPIOs as descriptors to be picked
   229	 * directly from the ATH79K wifi driver if the two are jitted together
   230	 * in the same SoC.
   231	 */
   232	#define ATH79K_WIFI_DESCS 32
   233	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   234							const char *label)
   235	{
   236		struct gpiod_lookup_table *lookup;
   237		int i;
   238	
   239		/* Create a gpiod lookup using gpiochip-local offsets + 1 for NULL */
 > 240	        lookup = devm_kzalloc(&pdev->dev,
   241				      struct_size(lookup, table, ATH79K_WIFI_DESCS + 1),
   242				      GFP_KERNEL);
   243	
   244		if (!lookup)
   245			return -ENOMEM;
   246	
   247		lookup->dev_id = "ath9k";
   248	
   249		for (i = 0; i < ATH79K_WIFI_DESCS; i++) {
   250			lookup->table[i] = (struct gpiod_lookup)
 > 251				PIO_LOOKUP_IDX(label, 0, NULL, i,
 > 252					       GPIO_ACTIVE_HIGH);
   253		}
   254	
   255		gpiod_add_lookup_table(lookup);
   256	
   257		return 0;
   258	}
   259	#else
   260	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   261							const char *label)
   262	{
   263	}
   264	#endif
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

