Return-Path: <linux-gpio+bounces-5258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C195A89E5DA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08CF1C215FF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB396158DAC;
	Tue,  9 Apr 2024 23:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIkxa2uD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC9158D9A
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703793; cv=none; b=rU8sA8ocJEOgAQEmxaTY4oUwDSI7NtsVZLHnicnXQ3tt5Jf5Z4HYmPX1AAn+V7JbNi/e+aQBml8vDKBLpkYVIPDz8yLdzqM4ejs8aqCoKHee4eX6Gqgi5RAUsPiQfpnVsEfQeTO7xCAMrRet7XIjSvJRp+HuKiVADdNkBwNftZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703793; c=relaxed/simple;
	bh=IdohVNvU3qr5Wr5UrBvazvHqZcZjB8QiyZotMsuJMUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwMrvQ1ydWHT8gvDpGW5oCuJU3hUTePao0rDvptCReyBuey5cuvuzD40zapxadmXffHRvbVx4zSgGVHtdg80Z1rT+Aiib4dBmavDPhiZkTJ2gMLzmfut8Qu7hp5GjXuT5ugU2z6/1H/R8nYj6Gifik1/sSi7vdj2/cOGGM9cEKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIkxa2uD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703792; x=1744239792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IdohVNvU3qr5Wr5UrBvazvHqZcZjB8QiyZotMsuJMUo=;
  b=jIkxa2uDaQCBmUweZnMtsQosxdsIekMMKkOE4aGeT0QFF4HxpxM6w6fl
   ME538xqEUh2n/o7siga3WqrhIcEmpkpR4UihXHGTFuOIz5TQFztsyxNjI
   6f6DU7Gn29VPZbzk83vjXm3fsnGRmFxQoclciEmF/WFpkc+dw1/G5uBzZ
   5MmiJOyacFT7VHpFuDfbEdKlCdzw3uOxUJJnpuQYJwFwAzWrdNbAaaSq8
   HmslwqWJLfwIwcg7fIHSQFpUTbiDnbY0Vt3yZwy+wKTqZq8jq4TmrE/Rf
   9rKhXFKYIFGjGajxtvjTdndsu8aCakAaRr5iBEyvOfRk+2v89fBPeUwR7
   g==;
X-CSE-ConnectionGUID: 7X6ahZ46SAugxzpJQRu7nw==
X-CSE-MsgGUID: 2Y+CqXwvTju3BDqXZkYVhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18611464"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18611464"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:03:10 -0700
X-CSE-ConnectionGUID: qjZlOoSYSsiFkana82iDuQ==
X-CSE-MsgGUID: 8hIzaALlQSWg/F9xejFkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51572416"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Apr 2024 16:03:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKUc-0006b8-2j;
	Tue, 09 Apr 2024 23:03:06 +0000
Date: Wed, 10 Apr 2024 07:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:263:1: warning: no return statement in function
 returning non-void
Message-ID: <202404100626.HQOO79B8-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100626.HQOO79B8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100626.HQOO79B8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100626.HQOO79B8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ath79.c: In function 'ath79_gpio_register_wifi_descriptors':
>> drivers/gpio/gpio-ath79.c:263:1: warning: no return statement in function returning non-void [-Wreturn-type]
     263 | }
         | ^


vim +263 drivers/gpio/gpio-ath79.c

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
   240	        lookup = devm_kzalloc(&pdev->dev,
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
   251				PIO_LOOKUP_IDX(label, 0, NULL, i,
   252					       GPIO_ACTIVE_HIGH);
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
 > 263	}
   264	#endif
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

