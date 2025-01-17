Return-Path: <linux-gpio+bounces-14922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924AA155ED
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 18:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDF216875A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 17:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE691A0BDB;
	Fri, 17 Jan 2025 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ihuj+vLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036C19EEC0;
	Fri, 17 Jan 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136041; cv=none; b=pGEAGgo2VmSw13Sf8aZQFtpf1DUscMyH6e/BbIjegNj2TgISMizQuY/v8HM+3DhiRwoqA7DubijMMMcM4bnt1PdRv0Lw7kq2NwpcKmM8qou98+o7qTfgZdHiPBBETgudCPOwsKS2QI2tl55YZ0lYGLCUv8DTFVpn50vCqI0shiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136041; c=relaxed/simple;
	bh=eRP1jBCa4I9W05NTuQlOCzeDAgnWgcjSg5ryuvhjbqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpduqKGXRl9u48M53JQQ4QTdEf0h2ZMzTA5syJEoDC4lhkosd5y6iFG7Ir0F6lhK2/4QZKSAYENdr0VJSD/UaID7Na2nyYb8Zz5zes+tGK6zfcM7adebCfr4fzB3BVcmXtEUSHipV7fqTHqbR4yNxSDgqWzD/MAqnAp0FAQ2Z24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ihuj+vLT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737136039; x=1768672039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eRP1jBCa4I9W05NTuQlOCzeDAgnWgcjSg5ryuvhjbqw=;
  b=Ihuj+vLTVLpkH9urC19jC5xYepUWZyvo3PqszTxNtaZ4/sqAss1RUR5o
   mURSpSOiOOTElTrYBp5tlyNSpmVQdBHpyTZQ/ORIqbjusP8sAb67YNKgr
   5LjFPtzByitUdVNcQ6xnfCMD+9AYrMl2dwm9HtE3XjjU89Eu0T0olWqtA
   b8jW0PLKJftj5yN6Oi/cOiLHpBnh84bkclh9PjkFTPvXzyx5PQ0cbeA4X
   IKaCTKFppX/GW32DtIincFA6Jetxm0h8krxwDfEKpyR8tILIU677JAzpt
   fnnhk4GmFFROkzsVNl+lGmVmAt+MG0MBiLPpEGarhM2tF5n0CTTwGMrhb
   A==;
X-CSE-ConnectionGUID: UJvE3c/pRzOimkUFsWd8pg==
X-CSE-MsgGUID: HDWBft3hRYOghHWMcppnCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36786665"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="36786665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 09:47:18 -0800
X-CSE-ConnectionGUID: B0+WehJbS1GfiAMDiJFPoQ==
X-CSE-MsgGUID: xcYSeKIhR6GOgvOePao0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105912316"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2025 09:47:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYqR6-000TXb-2I;
	Fri, 17 Jan 2025 17:47:12 +0000
Date: Sat, 18 Jan 2025 01:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, m-leonard@ti.com,
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] gpio: tps65215: Add TPS65215 to
 platform_device_id table
Message-ID: <202501180129.Eu47rQjQ-lkp@intel.com>
References: <20250113225530.124213-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113225530.124213-2-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250113]
[also build test ERROR on linus/master v6.13-rc7]
[cannot apply to tmlind-omap/for-next v6.13-rc7 v6.13-rc6 v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/gpio-tps65215-Add-TPS65215-to-platform_device_id-table/20250114-065813
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113225530.124213-2-s-ramamoorthy%40ti.com
patch subject: [PATCH v3 1/3] gpio: tps65215: Add TPS65215 to platform_device_id table
config: i386-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180129.Eu47rQjQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180129.Eu47rQjQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180129.Eu47rQjQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-tps65219.c:173:21: error: use of undeclared identifier 'TPS65215'
     173 |         { "tps65215-gpio", TPS65215 },
         |                            ^
>> drivers/gpio/gpio-tps65219.c:177:1: error: definition of variable with array type needs an explicit size or an initializer
     177 | MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
         | ^
   include/linux/module.h:250:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         |                     ^
   <scratch space>:249:1: note: expanded from here
     249 | __mod_device_table__platform__tps6521x_gpio_id_table
         | ^
   2 errors generated.


vim +/TPS65215 +173 drivers/gpio/gpio-tps65219.c

   171	
   172	static const struct platform_device_id tps6521x_gpio_id_table[] = {
 > 173		{ "tps65215-gpio", TPS65215 },
   174		{ "tps65219-gpio", TPS65219 },
   175		{ }
   176	};
 > 177	MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

