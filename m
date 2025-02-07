Return-Path: <linux-gpio+bounces-15579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BDCA2CE18
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 484453A9C1F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3F1A0BC5;
	Fri,  7 Feb 2025 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSF3MG1O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2F23C8C7;
	Fri,  7 Feb 2025 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959909; cv=none; b=B9L2+2Z0idjqeRbZI0W+3bijUCHDRASZBqUDBdZVEGCCFK2n2bBSE4TTdybx9AJIQv9QuHRbiZWt5uibr7QTpETBvFGfiJPSrkVTzfR1dOM1u/HVL5xkLJmcp8g0gthH6JHuLLkz+K2H+hHkWI9J4hWqrkDYK1HidDi7GS7du1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959909; c=relaxed/simple;
	bh=KAppddcGy75M1GijtWeVnHspaf0hv7YTbaO7eU7CW+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFz8RvFD4nE9GG+1qxDRFDXN1PVRjddbSBNI6mCf6dJ5C1fj0LIW99Umke3lUWF2gjpJXFEur1RMjFH+/08FjfKRmVEKuQ08QgJVxDuFAHvZVCzaUwaelZKsbDrCLCDi9sQU6mHw8GqHZd+jRb9SxCZvz9leWvT7yHL4oXRs8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSF3MG1O; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738959908; x=1770495908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAppddcGy75M1GijtWeVnHspaf0hv7YTbaO7eU7CW+A=;
  b=kSF3MG1OlXU4ZC9g2nzwujJQsHOUEnCoR/Ht/k/p2/oIzLhu3LU0kySU
   dWCgYAr2BLkGtyDTREKANpbbYkzGrXKcuaaBZWUTxbLDe4C1UhSVVNS1y
   tphGQdAW9F7hYEsOi+TaLypr1mXSt74NCSldrZ09EOFWQ9ZiIdWBjPk1F
   gfJu7i3zy6NsD8OfZ8a/aNeoGewqXYSPQ7OA3KeZm6lR32UYVK1/nXcqW
   /7XVtwtg2hOm1S6rh+KUH5KLzD4G+KHDhYSw8eov5t6hPjHJ21bgFUhgz
   DO0twCUFM0j+4Um/APiuu3SaVr/O+twjy1UPkwktyD7OMgTgy9/unn59Q
   Q==;
X-CSE-ConnectionGUID: G1goy+6vSNa706YyZrOzLw==
X-CSE-MsgGUID: 9V+puwXVS3mi3FUWU1VDpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="27219096"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="27219096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 12:25:07 -0800
X-CSE-ConnectionGUID: d18eyhYiScW1fPYwWK7LnQ==
X-CSE-MsgGUID: 1551tkwPTYCfUn66SQBp4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111392184"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2025 12:25:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgUuL-000z07-2H;
	Fri, 07 Feb 2025 20:25:01 +0000
Date: Sat, 8 Feb 2025 04:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Message-ID: <202502080425.N7HVOOJr-lkp@intel.com>
References: <20250207083146.17872-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083146.17872-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-don-t-build-HTE-code-with-CONFIG_HTE-disabled/20250207-163408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250207083146.17872-1-brgl%40bgdev.pl
patch subject: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
config: i386-buildonly-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080425.N7HVOOJr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080425.N7HVOOJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080425.N7HVOOJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/max8903_charger.c:9:
   include/linux/gpio/consumer.h:557:3: error: call to undeclared function 'WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     557 |                 WARN_ON(desc);
         |                 ^
>> include/linux/gpio/consumer.h:559:10: error: use of undeclared identifier 'ENOSYS'
     559 |         return -ENOSYS;
         |                 ^
   include/linux/gpio/consumer.h:565:3: error: call to undeclared function 'WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     565 |                 WARN_ON(desc);
         |                 ^
   include/linux/gpio/consumer.h:567:10: error: use of undeclared identifier 'ENOSYS'
     567 |         return -ENOSYS;
         |                 ^
   4 errors generated.


vim +/ENOSYS +559 include/linux/gpio/consumer.h

   548	
   549	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
   550	int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
   551	int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
   552	#else
   553	static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
   554						       unsigned long flags)
   555	{
   556		if (!IS_ENABLED(CONFIG_GPIOLIB))
   557			WARN_ON(desc);
   558	
 > 559		return -ENOSYS;
   560	}
   561	static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
   562							unsigned long flags)
   563	{
   564		if (!IS_ENABLED(CONFIG_GPIOLIB))
   565			WARN_ON(desc);
   566	
   567		return -ENOSYS;
   568	}
   569	#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

