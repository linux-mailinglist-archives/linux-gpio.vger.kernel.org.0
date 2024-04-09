Return-Path: <linux-gpio+bounces-5260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB7B89E5DC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ECB31C21BCC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8074158DB3;
	Tue,  9 Apr 2024 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlMXLTfA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED742158DB1
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703797; cv=none; b=iGnhQsjElUTaQX7ZZkbM+R+LKFv18Bv6t5G1/rGRfL3sSKSbDeF9TyJqyNgX64NQMk8s3BDgBHycXd/2+B0EgMJNjuvHcfm1FWeyDf6QuHXfGWsYcJy0f0XAaC6/4SbQbAK/kgTv8oW/lqceGS9jDo92N8ACu1QZEhk561zDkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703797; c=relaxed/simple;
	bh=WcRsNjKK1+9QQvj57OJK/LDbByUxs65RKx4IeAVQdTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8Zdk1Fl8ESlmQgwqe+Bvm7kwc0NwXDS7AqYXpkA8KA4BPLgiwYzm+EAjdDUqd7LG9pgvcOMvOm/4vRVX3QdRpT/XWijv0U6/WCtXI1xZj/LKxrT0A0zVlNfY+OpjnKi2nnNTXd9w/656u8sVc00Xi5/nN9o4SVfPgxrML+MaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlMXLTfA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703796; x=1744239796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WcRsNjKK1+9QQvj57OJK/LDbByUxs65RKx4IeAVQdTc=;
  b=WlMXLTfAbx6WUqt335EW+gdNwFPL8Qjiub7rJP6bFeAaz2gF0ZBnh5zd
   WKJ6gETReqKvHAuzkFqokzVc0jQGWP0JZokadrxklYHYQj8HivH7+O+Oe
   4KSnbMo+OVZdwDn4oYM7K4ElFKU792GAFCSw5S/RPOs607/SdeszANxNX
   XLI6OtldsxvOY1bGJca7kzpdcU+oCRbKxllserfYRVSxnYYvmzUwmaYm2
   n3ZhDiIkg7X6kXzcuqStVpaw5GdbkjaDxTHTVuPD1J3X16uxomysibmRA
   PlvKHAFZn1Mb9UnsfQZF5SJgDOYb29lRHPmZiBF9eP2gBki5zZinoRaJa
   g==;
X-CSE-ConnectionGUID: /IjzJquVS/uwencmuesShA==
X-CSE-MsgGUID: npEhBJpGRMWo+kediGytGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7899627"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7899627"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:03:11 -0700
X-CSE-ConnectionGUID: giURyjCuRui4vI2tYErc6g==
X-CSE-MsgGUID: AGzsI3dIRN2GjiZ0ElSIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20247314"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 16:03:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKUc-0006bA-2p;
	Tue, 09 Apr 2024 23:03:06 +0000
Date: Wed, 10 Apr 2024 07:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:263:1: warning: non-void function does not return
 a value
Message-ID: <202404100659.1H9VKoBw-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240410 (https://download.01.org/0day-ci/archive/20240410/202404100659.1H9VKoBw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100659.1H9VKoBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100659.1H9VKoBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ath79.c:263:1: warning: non-void function does not return a value [-Wreturn-type]
     263 | }
         | ^
   1 warning generated.


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

