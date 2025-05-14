Return-Path: <linux-gpio+bounces-20111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8BAB6307
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07E019E3FD2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 06:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77071FDA82;
	Wed, 14 May 2025 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkqdK+rw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B362F42;
	Wed, 14 May 2025 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204016; cv=none; b=JuJJ9geKBJsjg3/azOq2M/Mu7ubBdbWbr/I47wvuubSjxzb83PInMOm0xaRdaUqXmV2KH7CZkO2IiqkDPeYJjLisHHJWf0NTxBHwSP5EY92L5m+LgPqP3ZkDUYcGuxTqH/Rbo1vKcXaCIw8HWf+D75+ajdv5RsMrSsOwCMVWQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204016; c=relaxed/simple;
	bh=3r1iajkAvBe7hoDipEvS1N56ma07v5tuBZbqYRFx+CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4sqYQG1A8QPhy8Ej0tCc6SiJW5DBasJJPoLT/nzRVoEPvggwbXj2Xj6zesmcP9SfWRQ35Gg+vGNPm5hx9Gs9YieFr2Hcb4KMIAuGGxO3OvQ2yMJNIOzq9Fs7nMOGn1ZG9jGXVicvFV5yUei99BsvOMgy+aybHtQk6C7ZzbwVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkqdK+rw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204014; x=1778740014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3r1iajkAvBe7hoDipEvS1N56ma07v5tuBZbqYRFx+CM=;
  b=XkqdK+rwtqFKpFFeaRd3YPSb6UbWz6lyx2Fpizbjw2duaPbvVnZPxXZi
   lAEqmzTMs56pRVPOfuQ6m2su0SIoqbmfvZVSVTpdtBzfY00nGOV3+9qjf
   hvmNtYHg1geZrFrgHHKyuTWFyCBShENMNctU64JaNVxmffeou8oTRpbtV
   EL9Guj3jqWt+BzcbtIY5zuuLOAyXDN4WLBGYQCN1LXr9v/3z43HCBZz5P
   kzSYec2FbU7BshMY7YE8z28TvWSDF29r/knPU6yjhQr3Uyp2ONPf+H5rN
   2Xu/qKq7soaFmHQOidTAVyGoJzFKFBCUYJCj4vvhq3ipn4xSkx+NxnfNA
   Q==;
X-CSE-ConnectionGUID: 5FtYuJMKTROyghrkMxu/+w==
X-CSE-MsgGUID: PGz2qroQTfyPHkKHVuj+Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="71583275"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="71583275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:26:54 -0700
X-CSE-ConnectionGUID: bYggJomJT2SOAn9fIfk12g==
X-CSE-MsgGUID: MVlOMMPZSmyzsC6sHHCLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="169040772"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2025 23:26:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF5Zo-000GkN-22;
	Wed, 14 May 2025 06:26:48 +0000
Date: Wed, 14 May 2025 14:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Esben Haabendal <esben@geanix.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] pinctrl: freescale: Enable driver if platform is
 enabled.
Message-ID: <202505141431.u1F01XNs-lkp@intel.com>
References: <20250513150010.600656-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513150010.600656-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.15-rc6 next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/pinctrl-freescale-Enable-driver-if-platform-is-enabled/20250513-230259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250513150010.600656-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/1] pinctrl: freescale: Enable driver if platform is enabled.
config: i386-buildonly-randconfig-004-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141431.u1F01XNs-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141431.u1F01XNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141431.u1F01XNs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx.c:262:9: error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         func = pinmux_generic_get_function(pctldev, selector);
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:262:9: note: did you mean 'pinmux_generic_free_functions'?
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:262:7: error: incompatible integer to pointer conversion assigning to 'struct function_desc *' from 'int' [-Wint-conversion]
     262 |         func = pinmux_generic_get_function(pctldev, selector);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:269:7: error: incomplete definition of type 'struct function_desc'
     269 |                 func->func.name, grp->grp.name);
         |                 ~~~~^
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                        ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:248:9: note: forward declaration of 'struct function_desc'
     248 |         struct function_desc *func;
         |                ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:25: error: use of undeclared identifier 'pinmux_generic_get_function_count'; did you mean 'pinmux_generic_free_functions'?
     289 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:290:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
     290 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:291:25: error: use of undeclared identifier 'pinmux_generic_get_function_groups'; did you mean 'pinmux_generic_free_functions'?
     291 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/../pinmux.h:178:20: note: 'pinmux_generic_free_functions' declared here
     178 | static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
         |                    ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     289 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:290:23: error: incompatible function pointer types initializing 'const char *(*)(struct pinctrl_dev *, unsigned int)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     290 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:291:25: error: incompatible function pointer types initializing 'int (*)(struct pinctrl_dev *, unsigned int, const char *const **, unsigned int *)' with an expression of type 'void (struct pinctrl_dev *)' [-Wincompatible-function-pointer-types]
     291 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:590:9: error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     590 |         func = pinmux_generic_get_function(pctl, index);
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:590:7: error: incompatible integer to pointer conversion assigning to 'struct function_desc *' from 'int' [-Wint-conversion]
     590 |         func = pinmux_generic_get_function(pctl, index);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:595:6: error: incomplete definition of type 'struct function_desc'
     595 |         func->func.name = np->name;
         |         ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:596:6: error: incomplete definition of type 'struct function_desc'
     596 |         func->func.ngroups = of_get_child_count(np);
         |         ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:597:10: error: incomplete definition of type 'struct function_desc'
     597 |         if (func->func.ngroups == 0) {
         |             ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:602:45: error: incomplete definition of type 'struct function_desc'
     602 |         group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
         |                                                ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:603:20: error: incomplete definition of type 'struct function_desc'
     603 |                                    sizeof(*func->func.groups), GFP_KERNEL);
         |                                            ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
   drivers/pinctrl/freescale/pinctrl-imx.c:609:6: error: incomplete definition of type 'struct function_desc'
     609 |         func->func.groups = group_names;
         |         ~~~~^
   drivers/pinctrl/freescale/pinctrl-imx.c:583:9: note: forward declaration of 'struct function_desc'
     583 |         struct function_desc *func;
         |                ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:675:45: error: invalid application of 'sizeof' to an incomplete type 'struct function_desc'
     675 |                 function = devm_kzalloc(&pdev->dev, sizeof(*function),
         |                                                           ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:673:10: note: forward declaration of 'struct function_desc'
     673 |                 struct function_desc *function;
         |                        ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:681:28: error: no member named 'pin_function_tree' in 'struct pinctrl_dev'
     681 |                 radix_tree_insert(&pctl->pin_function_tree, i, function);
         |                                    ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
   Depends on [n]: PINCTRL [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_IMX_SCU [=y] && PINCTRL [=y] && (IMX_SCU [=y] || COMPILE_TEST [=y])


vim +/pinmux_generic_get_function +262 drivers/pinctrl/freescale/pinctrl-imx.c

b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  242  
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  243  static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  244  		       unsigned group)
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  245  {
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  246  	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  247  	const struct imx_pinctrl_soc_info *info = ipctl->info;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  248  	struct function_desc *func;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  249  	struct group_desc *grp;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  250  	struct imx_pin *pin;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  251  	unsigned int npins;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  252  	int i, err;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  253  
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  254  	/*
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  255  	 * Configure the mux mode for each pin in the group for a specific
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  256  	 * function.
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  257  	 */
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  258  	grp = pinctrl_generic_get_group(pctldev, group);
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  259  	if (!grp)
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  260  		return -EINVAL;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  261  
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30 @262  	func = pinmux_generic_get_function(pctldev, selector);
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  263  	if (!func)
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  264  		return -EINVAL;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  265  
390270f25b414fd drivers/pinctrl/freescale/pinctrl-imx.c Andy Shevchenko 2023-12-11  266  	npins = grp->grp.npins;
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  267  
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  268  	dev_dbg(ipctl->dev, "enable function %s group %s\n",
f3e0473aa834f0b drivers/pinctrl/freescale/pinctrl-imx.c Andy Shevchenko 2024-05-30 @269  		func->func.name, grp->grp.name);
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  270  
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  271  	for (i = 0; i < npins; i++) {
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  272  		/*
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  273  		 * For IMX_USE_SCU case, we postpone the mux setting
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  274  		 * until config is set as we can set them together
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  275  		 * in one IPC call
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  276  		 */
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  277  		pin = &((struct imx_pin *)(grp->data))[i];
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  278  		if (!(info->flags & IMX_USE_SCU)) {
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  279  			err = imx_pmx_set_one_pin_mmio(ipctl, pin);
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  280  			if (err)
b96eea718bf697e drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong       2018-10-30  281  				return err;
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  282  		}
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  283  	}
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  284  
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  285  	return 0;
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  286  }
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  287  
3be6f65102a859d drivers/pinctrl/freescale/pinctrl-imx.c Dong Aisheng    2017-07-25  288  struct pinmux_ops imx_pmx_ops = {
3fd6d6ad73af905 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson     2017-01-02 @289  	.get_functions_count = pinmux_generic_get_function_count,
3fd6d6ad73af905 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson     2017-01-02 @290  	.get_function_name = pinmux_generic_get_function_name,
3fd6d6ad73af905 drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson     2017-01-02 @291  	.get_function_groups = pinmux_generic_get_function_groups,
03e9f0cac5da6af drivers/pinctrl/pinctrl-imx.c           Linus Walleij   2014-09-03  292  	.set_mux = imx_pmx_set,
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  293  };
ae75ff814538400 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng    2012-04-27  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

