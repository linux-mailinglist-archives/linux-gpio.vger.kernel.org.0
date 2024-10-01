Return-Path: <linux-gpio+bounces-10599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1298B21C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 04:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D10282ECF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 02:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6518B219E4;
	Tue,  1 Oct 2024 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adfqIBUl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9DE405F7;
	Tue,  1 Oct 2024 02:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750105; cv=none; b=TnuMCYgVHdkbBBzQmISQd7+kYRMw6cx1WryuXY+ip24m/Tsgzg5lOzF/jBFoBuHfL3kboR2MQb6gm98pU3e4NxIQOSTeAhI9wg1wtCPXrJFvvqpLDApTROYCWNqYdFYqrbmqVJZmTRKdksItrYqPQcUDbPCX1md3rxlHq0GUbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750105; c=relaxed/simple;
	bh=bJ3XmuTZRMaT92snBVHbenWK+ikqJ8+OYO+Z69mc+Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHb8ItgwX9xhvFsomyQGo5sE5KV2VnyNOFoCmj/3M/IqURA2igAqbMzv19ePKGsU6TqsRbgtnKzRYEDgrHBeCYArAZI91FUsW/hC24Hh+xyKs6YIHGuzq3Jw/3NCe5uHdtptLuFu/qdiBXS6MjzEdy9LUjTaWfhdNPflIrR0uWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adfqIBUl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727750103; x=1759286103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bJ3XmuTZRMaT92snBVHbenWK+ikqJ8+OYO+Z69mc+Qo=;
  b=adfqIBUlgNGdapvvKEN0YtsQh3Gpc4CsRkAyV7wfq/GnxitYBRMpXGbY
   TuijlmW732FnujlcI97w/PM9vzQioYLR++Ilq7vimjSRrdFZhH14TSggy
   yjP7XALFw0AZWxxno0yWXhtmzjSXiCXFyFD6BtibXrofa5alF6OFfapOs
   qS9pVqsUQAPSFPnqba1LK/aPMfI9Q4aR+GLQCNLMo/Ns/HRpGjzjA7rtc
   gNiQI6TqN5pd/+8XUHEU5oisysKtE/QeNeEzC0/acwNqdcnXLngf61PR4
   pkFQqLwM+CGYMPmWKK5Id0Ou/wlvPgGPh+4uQKTNQXkOFvZpr2KKsgywj
   Q==;
X-CSE-ConnectionGUID: 45NeapnlTnmRozs3I4RX/Q==
X-CSE-MsgGUID: oytZWz30Qv6h2dsaeBndtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26745450"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26745450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:34:36 -0700
X-CSE-ConnectionGUID: yyCxdH10SiCYmQzPTDL6yw==
X-CSE-MsgGUID: BsyXkYvqT4KD8WzlMyW2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73807359"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2024 19:24:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSZB-000Q9l-2z;
	Tue, 01 Oct 2024 02:24:45 +0000
Date: Tue, 1 Oct 2024 10:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: davinci: allow building the module with
 COMPILE_TEST=y
Message-ID: <202410011000.hRJ0JPdV-lkp@intel.com>
References: <20240930115116.54626-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930115116.54626-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.12-rc1 next-20240930]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-davinci-use-generic-device-properties/20240930-195251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240930115116.54626-1-brgl%40bgdev.pl
patch subject: [PATCH 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
config: sh-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011000.hRJ0JPdV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011000.hRJ0JPdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011000.hRJ0JPdV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-davinci.c:652:34: warning: 'davinci_gpio_ids' defined but not used [-Wunused-const-variable=]
     652 | static const struct of_device_id davinci_gpio_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/davinci_gpio_ids +652 drivers/gpio/gpio-davinci.c

0651a730924b17 Devarsh Thakkar   2022-06-13  648  
8507f35447e6e5 Min-Hua Chen      2023-06-09  649  static DEFINE_SIMPLE_DEV_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
0651a730924b17 Devarsh Thakkar   2022-06-13  650  			 davinci_gpio_resume);
0651a730924b17 Devarsh Thakkar   2022-06-13  651  
c770844c3e30be KV Sujith         2013-11-21 @652  static const struct of_device_id davinci_gpio_ids[] = {
0c6feb0796ea64 Grygorii Strashko 2014-02-13  653  	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
6a4d8b6bd27932 Keerthy           2019-06-05  654  	{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
0c6feb0796ea64 Grygorii Strashko 2014-02-13  655  	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
c770844c3e30be KV Sujith         2013-11-21  656  	{ /* sentinel */ },
c770844c3e30be KV Sujith         2013-11-21  657  };
c770844c3e30be KV Sujith         2013-11-21  658  MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
c770844c3e30be KV Sujith         2013-11-21  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

