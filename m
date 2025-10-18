Return-Path: <linux-gpio+bounces-27265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FCEBECF07
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E236425969
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 12:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C205286D55;
	Sat, 18 Oct 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edXbh1RW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880382AF1B;
	Sat, 18 Oct 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760789201; cv=none; b=h/umvftV1ewuJVbcJ5xj4L5n1EldSbzNdCnrwHvVSRCr1Zpj/iYykN/KVLktkofWGnRn7Sbm5pW03lcMGpuvIC3Z2FmX1t/5r47fkavpJYFocxM+cgU3YkxFc1yzheSOt3kKVHjTB9BWifnOnBq0A/k/xKttht5cUgdtMzd7MR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760789201; c=relaxed/simple;
	bh=amcyDQ0ZSqfKRHQvB06Ill1m9TP4roTiAJ8m7kuDqWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MewneMWHxwBBrjw18P8drYVpeQCB+7doqMCfzxzu5VPuqzAvbkNGjmqJ1JdGqMQpJGm28//hKcDg+K2NKtngKa8SFe8R9Ws9S9gHgZ+yNNmzf9ZNMDpvUGRQi1C+Fhd37EtiA655KhHtmOXpYm4vQQXcbQdvQFH9SGOhdATo9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edXbh1RW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760789199; x=1792325199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amcyDQ0ZSqfKRHQvB06Ill1m9TP4roTiAJ8m7kuDqWI=;
  b=edXbh1RWHKpAZQbyP1UajbtdybMeDPXOdrQsT4B9GV1D7JLPmhIC8zjC
   AvgHTwV/QJ5W2deXoe9fpoh1kJ7SW4T75/FoETIzbaj35HcmTUM556bse
   VI7VPL2gwXFiCq5jFGSqR8V/ziSwnHpyzIUrmAFa6guUitCewEmWOFY0o
   4TREYG/5tsayony1nj4Oid4HUXN5DP8ipPcBb8UvJObcUk2b6IjlEi0fQ
   48fOCraqu+LSSty0CHsAuj+Zy3iSbEnGeYBExNhHe2Ba/jb7uOhrslux3
   iFVpWkBy2zmmIJAcdvts/XVGf8rO545Owxp0VrV7OGfWUO6kTuaoH5I1F
   w==;
X-CSE-ConnectionGUID: 5CcoLTWZS2+9Uo2Ej/me7Q==
X-CSE-MsgGUID: sVGmGAogTdqS4aWjfxP82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="88457169"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="88457169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 05:06:37 -0700
X-CSE-ConnectionGUID: nfs33RDKS5m+TSeTk1j45w==
X-CSE-MsgGUID: 2VrXg+YDTn6HK9yWeDUEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182957412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 05:06:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA5hT-0008Gf-1J;
	Sat, 18 Oct 2025 12:06:25 +0000
Date: Sat, 18 Oct 2025 20:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
Message-ID: <202510181916.q32y7Jel-lkp@intel.com>
References: <20251017074646.3344924-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-pinctrl-Add-cix-sky1-pinctrl/20251017-155001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20251017074646.3344924-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
config: nios2-randconfig-r121-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181916.q32y7Jel-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     got unsigned int [usertype] *pin_reg
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     got unsigned int [usertype] *pin_reg

vim +289 drivers/pinctrl/cix/pinctrl-sky1-base.c

   282	
   283	static int sky1_pmx_set_one_pin(struct sky1_pinctrl *spctl,
   284					    unsigned int pin, unsigned char muxval)
   285	{
   286		u32 reg_val;
   287		u32 *pin_reg;
   288	
 > 289		pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
 > 290		reg_val = readl(pin_reg);
   291		reg_val &= ~SKY1_MUX_MASK;
   292		reg_val |= muxval << SKY1_MUX_SHIFT;
 > 293		writel(reg_val, pin_reg);
   294	
   295		dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
   296			pin * SKY1_PIN_SIZE, reg_val);
   297		return 0;
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

