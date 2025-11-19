Return-Path: <linux-gpio+bounces-28716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A00C6C33A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 01:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23E6B3823FA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C51E21D3F8;
	Wed, 19 Nov 2025 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrdwrK9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99F184E;
	Wed, 19 Nov 2025 00:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513741; cv=none; b=YNG8HaGosu20jHQ821R1vLnHqWyW8e6Ru1uV667igqncMrt4dO5qPrPyPNdRUW+L+gqiMA6VDIB8eSSSOAcMxs3ukK/UvwYB6ouVRIW5CyRQemrvMwndwPk7aijFVvTCmvU32pKww32w9qZtADnT0zh+jnBHDUZl+61mp1UUznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513741; c=relaxed/simple;
	bh=u0Qq0YbxbHCN1eZRe+dJ2fIaduGkFYl26dgK+ZBByYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgFSgIU/+yH44D5So4Yv69r3OWUxuEPe1jvt+TVo/ALx2CrCDsbL3Wrqh9lpwxSObBPcGTNTQvio8JwSpO3w7BxKANZGxZ+WuQj5uNdhFe+2FpnwuGqz276lbtXrSD1MVSUa1G7Zzto3pnFwqK9oELb9In5A5s1eABQ0KmC46ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrdwrK9u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763513740; x=1795049740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u0Qq0YbxbHCN1eZRe+dJ2fIaduGkFYl26dgK+ZBByYI=;
  b=WrdwrK9u37+yiPLcj5o8jks1dl247Z7HnMfad/2afAZ+neaJAhUpbtaQ
   8PT63grvAeQOlAsuzgrFHq5ryTC1T60yu+o5/uTyeMfH2xWPnrtLg1iQ2
   wMWNtrbzSZOinQ4ptcfqGIOB/BFAGkU9FfTMFcR2cDB8OccBAcSNUjqzO
   CEzLCbK8phYeVAdmeMh0pCENkkDxzULDOcLXnFTCz9nmid6sEVCfR6Qn3
   EqGo9CW3GtVcbEwR/Z/gTE//gk42f6hA7mbKZYs03DLq159YHyvGj6sdh
   k4xBnlLLfIxaeGWaassKvI2XSjXq+Y/B3mslddWdjPg3o89UAwJGvZT3A
   w==;
X-CSE-ConnectionGUID: AgRXaKBJR0GIZDPMfmFUlw==
X-CSE-MsgGUID: 1851ddQBQEK2r3bXiPJ+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88201035"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="88201035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:55:39 -0800
X-CSE-ConnectionGUID: 5c+6PfFLSim5pSaSYdRr+w==
X-CSE-MsgGUID: L29TR0mCSRSMOk1MDcaW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221547609"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2025 16:55:36 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLWTt-0002JX-30;
	Wed, 19 Nov 2025 00:55:33 +0000
Date: Wed, 19 Nov 2025 08:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: 429368636@qq.com, lee@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pavel@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
Subject: Re: [PATCH] leds: add aw91xxx driver
Message-ID: <202511190823.KypHuQek-lkp@intel.com>
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/429368636-qq-com/leds-add-aw91xxx-driver/20251117-175335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908%40qq.com
patch subject: [PATCH] leds: add aw91xxx driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251119/202511190823.KypHuQek-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190823.KypHuQek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190823.KypHuQek-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-aw91xxx.c:653:23: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     653 |         if (sscanf(buf, "%x %x", &databuf[0]) == 1)
         |                             ~^
>> drivers/leds/leds-aw91xxx.c:1309:13: warning: no previous prototype for function 'aw91xxx_irq_func' [-Wmissing-prototypes]
    1309 | irqreturn_t aw91xxx_irq_func(int irq, void *key_data)
         |             ^
   drivers/leds/leds-aw91xxx.c:1309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1309 | irqreturn_t aw91xxx_irq_func(int irq, void *key_data)
         | ^
         | static 
>> drivers/leds/leds-aw91xxx.c:1395:6: warning: no previous prototype for function 'aw91xxx_int_work' [-Wmissing-prototypes]
    1395 | void aw91xxx_int_work(struct work_struct *work)
         |      ^
   drivers/leds/leds-aw91xxx.c:1395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1395 | void aw91xxx_int_work(struct work_struct *work)
         | ^
         | static 
   drivers/leds/leds-aw91xxx.c:1425:6: warning: variable 'key_num' set but not used [-Wunused-but-set-variable]
    1425 |         int key_num = 0;
         |             ^
   4 warnings generated.


vim +653 drivers/leds/leds-aw91xxx.c

   645	
   646	static ssize_t
   647	blink_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t len)
   648	{
   649		unsigned int databuf[2];
   650		struct led_classdev *led_cdev = dev_get_drvdata(dev);
   651		struct aw91xxx *aw91xxx = container_of(led_cdev, struct aw91xxx, cdev);
   652	
 > 653		if (sscanf(buf, "%x %x", &databuf[0]) == 1)
   654			aw91xxx_led_blink(aw91xxx, databuf[0], 3);
   655	
   656		return len;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

