Return-Path: <linux-gpio+bounces-13626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7CB9E8A7A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 05:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131031646FD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 04:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3469190685;
	Mon,  9 Dec 2024 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyxRVjlU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185B189BBF;
	Mon,  9 Dec 2024 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719482; cv=none; b=o2WNkQ3PMS5L6ZQqF/JVzvItfI8w6CX2ZWmar8IcSqRU4x/IAD48vzNAq6CL8CsekIvH2mHCW/IpZMIvAGwnJCFFsdQ/qYJLyIdktJxss9H2A9kIhsRAT88IhkH//yWoDTB50HbrPXjeEwCQKSmxTaTebRH+HPGeQloLGzfP18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719482; c=relaxed/simple;
	bh=LHdowryXzqQdVdkjfptOPo5XBccx32PtE3ujdcb8Xh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM/KF37BubTm6SH+cBWoA07PYcJvTVozG6psyzRwaXKqBFOPeKgt3I4Dbk++rpmT9xtv7/E6LuxQxM2T9W1lB9rCAWH0yDSEvmKAm/HftQe2nPeHlB22IkqQZTUUEJwrPBIv7DCPF7ob914Z9SMzKec6IbvsTI1kYyLB4X3YS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyxRVjlU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719481; x=1765255481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHdowryXzqQdVdkjfptOPo5XBccx32PtE3ujdcb8Xh0=;
  b=PyxRVjlUqfRVE/ckpJDIf7xGrV32FxbgBe4o4gvpmrYd4fLTUXi/xbxQ
   XFNispItwQ/z8qT/Hrig0GDUclnLVY0cFvQS9yjJ9JiI93dtAuIw8XfyN
   98tmQ3WNeHgTSintjcADfSqaMX7ESukf6FeTOu/bHMl2dlRxpJkuj0Hkb
   t04NGQY3WxZ/tyXqV58efyashf0w8QuapoU1+PH/anIR4yBp58olpRqDQ
   GV47DMzbxNRoD5lJoyHNB2gRakJakR6q7iiQzsfD62XiVrGDjjYyY6iVr
   Ea1kWZJfqI0JS9snolCVx474l5GK2L9jc/6YiH7uf6iZ94hrtu8lhe4ii
   Q==;
X-CSE-ConnectionGUID: Y1CDNkqhT1ewT16pNvE3tw==
X-CSE-MsgGUID: UZoaPPpSSSq30EgwosRWPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33916998"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33916998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:44:40 -0800
X-CSE-ConnectionGUID: tpp8DdWqTCK1r34HNWe2jQ==
X-CSE-MsgGUID: 7XgwCz8RT7y4mjsjo7S4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118205074"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2024 20:44:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVdM-0003uH-1J;
	Mon, 09 Dec 2024 04:44:36 +0000
Date: Mon, 9 Dec 2024 12:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Hendry <kylehendrydev@gmail.com>, linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kyle Hendry <kylehendrydev@gmail.com>
Subject: Re: [PATCH] pinctrl: bcm63268: Add gpio function
Message-ID: <202412081215.VyJuftPL-lkp@intel.com>
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207223335.17535-1-kylehendrydev@gmail.com>

Hi Kyle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Hendry/pinctrl-bcm63268-Add-gpio-function/20241208-063718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241207223335.17535-1-kylehendrydev%40gmail.com
patch subject: [PATCH] pinctrl: bcm63268: Add gpio function
config: x86_64-buildonly-randconfig-005-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081215.VyJuftPL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081215.VyJuftPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081215.VyJuftPL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-bcm63268.c:630:7: warning: variable 'reg' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     630 |         case BCM63268_NOREG:
         |              ^~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:638:31: note: uninitialized use occurs here
     638 |         regmap_update_bits(pc->regs, reg, mask, val);
         |                                      ^~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:603:18: note: initialize the variable 'reg' to silence this warning
     603 |         unsigned int reg;
         |                         ^
         |                          = 0
>> drivers/pinctrl/bcm/pinctrl-bcm63268.c:630:7: warning: variable 'mask' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     630 |         case BCM63268_NOREG:
         |              ^~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:638:36: note: uninitialized use occurs here
     638 |         regmap_update_bits(pc->regs, reg, mask, val);
         |                                           ^~~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:604:24: note: initialize the variable 'mask' to silence this warning
     604 |         unsigned int val, mask;
         |                               ^
         |                                = 0
>> drivers/pinctrl/bcm/pinctrl-bcm63268.c:630:7: warning: variable 'val' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     630 |         case BCM63268_NOREG:
         |              ^~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:638:42: note: uninitialized use occurs here
     638 |         regmap_update_bits(pc->regs, reg, mask, val);
         |                                                 ^~~
   drivers/pinctrl/bcm/pinctrl-bcm63268.c:604:18: note: initialize the variable 'val' to silence this warning
     604 |         unsigned int val, mask;
         |                         ^
         |                          = 0
   3 warnings generated.


vim +/reg +630 drivers/pinctrl/bcm/pinctrl-bcm63268.c

   595	
   596	static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
   597					    unsigned selector, unsigned group)
   598	{
   599		struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
   600		const struct pingroup *pg = &bcm63268_groups[group];
   601		const struct bcm63268_function *f = &bcm63268_funcs[selector];
   602		unsigned i;
   603		unsigned int reg;
   604		unsigned int val, mask;
   605	
   606		for (i = 0; i < pg->npins; i++)
   607			bcm63268_set_gpio(pc, pg->pins[i]);
   608	
   609		switch (f->reg) {
   610		case BCM63268_LEDCTRL:
   611			reg = BCM63268_LED_REG;
   612			mask = BIT(pg->pins[0]);
   613			val = BIT(pg->pins[0]);
   614			break;
   615		case BCM63268_MODE:
   616			reg = BCM63268_MODE_REG;
   617			mask = BIT(pg->pins[0]);
   618			val = BIT(pg->pins[0]);
   619			break;
   620		case BCM63268_CTRL:
   621			reg = BCM63268_CTRL_REG;
   622			mask = BIT(pg->pins[0]);
   623			val = 0;
   624			break;
   625		case BCM63268_BASEMODE:
   626			reg = BCM63268_BASEMODE_REG;
   627			mask = f->mask;
   628			val = f->mask;
   629			break;
 > 630		case BCM63268_NOREG:
   631			/*Do nothing, leave registers as default*/
   632			break;
   633		default:
   634			WARN_ON(1);
   635			return -EINVAL;
   636		}
   637	
   638		regmap_update_bits(pc->regs, reg, mask, val);
   639	
   640		return 0;
   641	}
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

