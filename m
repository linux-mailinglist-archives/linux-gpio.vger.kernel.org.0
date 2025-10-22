Return-Path: <linux-gpio+bounces-27409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF91BF9A38
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 03:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D40485A7B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 01:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94DC20F067;
	Wed, 22 Oct 2025 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDJTNDzi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46221F3B9E;
	Wed, 22 Oct 2025 01:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097662; cv=none; b=tQ2iPrYRH+Gyi6IUNYqsmkTC3JyEoyu+LAnJPrcLaPh+oB2Fp8xaxD3S9/KEzL/FTT0SZgjtDigC1RA96D9dwJW7m51rBmFAtFy9jUaG0tyT9JvfXsYVnZ9zsGxhFJ75AY2YFOA6P/5V655vJdQrl3JfjGGNXoehQgv6Yaq2bP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097662; c=relaxed/simple;
	bh=icObdIfSuL7dHxX4YyPeT+ngbOJTLgO4yM+wSfIaRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNd9aY65AOwUF+XEYHzl8A2SiGbNunciDJ1x346WIkLNCQuD+RNi3qOOe3BWO6e3wzaAsbAt4o3nFh/BT7JO5/EnBduVQGlSP4KM8WvrE4QJ02Jwm2NvR8ZYrRuJvBK8RMkb96muDIIuENoTvdI/52tshTmPtgFQNPxc2tux8qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDJTNDzi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761097661; x=1792633661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icObdIfSuL7dHxX4YyPeT+ngbOJTLgO4yM+wSfIaRPA=;
  b=SDJTNDziSVsA3M8+4j2HdQTXjScb05NEPu7oJLT7NLolP9sP3cRTdCeq
   0EWgx7kQn7sW/b2/bnZBwYS1BAOpUhpYocVPGegicII34h0QcgTw/zlld
   fUfp3EeScGPg8WcO6AM5k/4K3kYV4l9WhoMoN6kswY7G581bmVaRB6vDp
   ynz5+vfMFhfj8t9s2OrAA4lvwr/OCO7DpgVUW87odx63qh2kNcZcMFN/K
   Ck4E8F4nsPthjFxGj1c4odyGEKCjaRaDPgYJjdEr3q5RrlSXJvWLUwq2O
   i9gLIUv6kq3PS3LOQOs7yr8uIH/zSyEuJfVjcrt327kXEJ/Dr8EFO/yko
   A==;
X-CSE-ConnectionGUID: 6Bkgqts+T3az0qw4MpBO3Q==
X-CSE-MsgGUID: MRM06qL3Rpubj8XThYA1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63332404"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63332404"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:47:40 -0700
X-CSE-ConnectionGUID: E5YXi9HKRUyhbUXzBSLhpg==
X-CSE-MsgGUID: o30Buig6Rmam2zVLHuRqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188150280"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 18:47:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNws-000BuT-2C;
	Wed, 22 Oct 2025 01:47:34 +0000
Date: Wed, 22 Oct 2025 09:47:30 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
Message-ID: <202510220909.HJVE90Ky-lkp@intel.com>
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
config: x86_64-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220909.HJVE90Ky-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220909.HJVE90Ky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220909.HJVE90Ky-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-rtl8231.c:354:53: warning: cast to 'void *' from smaller integer type 'unsigned int' [-Wint-to-void-pointer-cast]
     354 |                 err = pinmux_generic_add_pinfunction(pctl, &func, (void *) flag);
         |                                                                   ^~~~~~~~~~~~~
   1 warning generated.


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

