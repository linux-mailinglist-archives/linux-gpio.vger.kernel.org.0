Return-Path: <linux-gpio+bounces-27413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0DBFA063
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2EF91A02FD1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 05:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118E22E0902;
	Wed, 22 Oct 2025 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzDIUEzF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38DA2E0930;
	Wed, 22 Oct 2025 05:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761109494; cv=none; b=cgsam/n9tdqETLd4jP/nZpDBVs4tWvvEVvgnQ/TUa8J7snUx9iPDdh3BMilK3SqeZRJiYu9ZNy8jSWOLNNghM0wv7bAfftJRgT4SeI1ERr1GBwetlYElypnSYLpjftDDWmcoikhKOG7U7b130412lMYHUDntqSBLzmuO3Xlnbp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761109494; c=relaxed/simple;
	bh=t4fVfuI1HdHc+jpCjhLSlAa3pfyB6tpSdTYZs5svI1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpVn6YeJ45cLIa0kKVnMvbGdPslRlsJfs1bxjuESpRiCKm3GumUFoFgyNsBwd6lRGOgXIYNPsVj+vXjvAxR84Rw08zyps0R/LRGNKkT5+mNZ9BffMtZ+d2gDO7yJEdtNvbuiO3n5OTFrp+z0QZIlvxSs0/cevMVw+ec/x9lFKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzDIUEzF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761109493; x=1792645493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4fVfuI1HdHc+jpCjhLSlAa3pfyB6tpSdTYZs5svI1M=;
  b=PzDIUEzFc0POfPBSlzvOA4NHX7HUQZim14uTZ4OAqzEDp+HTf/kap/2q
   hvlmgDETJZkZqWW5kj9ZPZXFcHQhOxCi7tZuxl4Q5vZSjpnJ7XbXImEVy
   y9+ylw0HWS4mwGD2lTy3t24yD5RE3nwKBZVC9u++L/h2gA4ceH3LkAWWb
   R//zGEVz1Syn4aKIhibIQJWW32IxbYVJtIjhfuxCL6+Icml5nJK5kmlRY
   tSL7LYmlQOsoy9strntVgQU7970PYKlbPKLbJq5M37is9lPo74tej4ATa
   Ve/yTA1JmDP/ccW2PPfbBVneB7tjJuXexgXmc9D1JDF13vkrCUzToTLHf
   w==;
X-CSE-ConnectionGUID: NXkZFk5zROaPpbTL7EWE6w==
X-CSE-MsgGUID: CSxFDOoIS4iHK2TF7JWHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63143445"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63143445"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:04:52 -0700
X-CSE-ConnectionGUID: uqZlMfscTbGXlOyP80R4jg==
X-CSE-MsgGUID: yTCBgEp6Ts6RrnrU7T3ySw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2025 22:04:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBR0f-000C0l-2a;
	Wed, 22 Oct 2025 05:03:55 +0000
Date: Wed, 22 Oct 2025 13:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sander Vanheule <sander@svanheule.net>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
Message-ID: <202510221215.irTQwvxA-lkp@intel.com>
References: <20251021142407.307753-7-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021142407.307753-7-sander@svanheule.net>

Hi Sander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes linusw-pinctrl/devel linusw-pinctrl/for-next lee-leds/for-leds-next linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/gpio-regmap-Force-writes-for-aliased-data-regs/20251021-222846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251021142407.307753-7-sander%40svanheule.net
patch subject: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251022/202510221215.irTQwvxA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221215.irTQwvxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221215.irTQwvxA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-rtl8231.c: In function 'rtl8231_pinctrl_init_functions':
>> drivers/pinctrl/pinctrl-rtl8231.c:354:67: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     354 |                 err = pinmux_generic_add_pinfunction(pctl, &func, (void *) flag);
         |                                                                   ^


vim +354 drivers/pinctrl/pinctrl-rtl8231.c

   321	
   322	static int rtl8231_pinctrl_init_functions(struct pinctrl_dev *pctl,
   323		const struct pinctrl_desc *pctl_desc)
   324	{
   325		struct pinfunction func;
   326		const char **groups;
   327		unsigned int f_idx;
   328		unsigned int flag;
   329		const char *name;
   330		unsigned int pin;
   331		int num_groups;
   332		int err;
   333	
   334		for (f_idx = 0; f_idx < ARRAY_SIZE(rtl8231_pin_functions); f_idx++) {
   335			name = rtl8231_pin_functions[f_idx].name;
   336			flag = rtl8231_pin_functions[f_idx].flag;
   337	
   338			for (pin = 0, num_groups = 0; pin < pctl_desc->npins; pin++)
   339				if (rtl8231_pin_data[pin].functions & flag)
   340					num_groups++;
   341	
   342			groups = devm_kcalloc(pctl->dev, num_groups, sizeof(*groups), GFP_KERNEL);
   343			if (!groups)
   344				return -ENOMEM;
   345	
   346			for (pin = 0, num_groups = 0; pin < pctl_desc->npins; pin++)
   347				if (rtl8231_pin_data[pin].functions & flag)
   348					groups[num_groups++] = rtl8231_pins[pin].name;
   349	
   350			func = PINCTRL_PINFUNCTION(name, groups, num_groups);
   351			if (flag == RTL8231_PIN_FUNCTION_GPIO)
   352				func.flags |= PINFUNCTION_FLAG_GPIO;
   353	
 > 354			err = pinmux_generic_add_pinfunction(pctl, &func, (void *) flag);
   355			if (err < 0)
   356				return err;
   357		}
   358	
   359		return 0;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

