Return-Path: <linux-gpio+bounces-9253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24ED96207E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 09:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF74DB21D4A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 07:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46D2158216;
	Wed, 28 Aug 2024 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnjDwi43"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B7814D282;
	Wed, 28 Aug 2024 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829410; cv=none; b=tYcMVyhUELtrL+ydTYsssfWBPZvkQtPNUs+T7CiZTvY2GUO0xXmpdKI9WYH0AZTY0uLqSWst1MdX/6FmQQl30xO/R1wZcoTj/XD1RWDDoEWg/TULYzPjDFSXZIAX2vHuLpSV0h3+y/NqTKOanyjvofbbIqolx/6WS5DeUk8RTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829410; c=relaxed/simple;
	bh=t5gUXCf4GDx44h1Xin6e5g6NZ75gWQKVRnB3CEEVsW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPeQy1EXdrNVyrdcclI2cOBo+rBoYD+9WCWSf/5md//agdZKJk7CwYZar7H9ssq0+bYiy9/mbXDQHuiBTGrfq2n7d0YdrZ2KWYUfz1szEkyoaNFz+UDEA4cIduGp50tqe1xR3QL2lFQftSPHfQsQWNLH7Xt1mjNnKo9CCMyxv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnjDwi43; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724829408; x=1756365408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5gUXCf4GDx44h1Xin6e5g6NZ75gWQKVRnB3CEEVsW4=;
  b=UnjDwi43TE1P1AfpluhLwFly40CVOgRByitR1LMggXiHYGwoAY0sIlGX
   m9RR20U2Ne7kaMXzhaK5Lh3Dcm7h6zI+m1wZu8n73WIDv4CLzS6m51pHs
   tH7JQatTZDsQu2gcIWQFEEKQJtwilPx+PlgqWvRV13BnZnc3cibzgXrTu
   HjwhYOjRdb+rh4/4ZJZPH47J1W0um/VJmDDqLC/FheC+OP9tHbE2MA9II
   kYMmLSttmsiYuatJizsY68WLQCnwB4JKNQfWuRHC0jNVJli6L1IsnJjSb
   c64iSBQZh/FBW0LClrUYzIu7zyWvR8h5MsB6RUgu9QBynSJ2cy1f5FPXr
   g==;
X-CSE-ConnectionGUID: wFH5u49cS8upV/9cmeM0/A==
X-CSE-MsgGUID: Ym/AzIIYQ5GGajGThjZW2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34717281"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34717281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:16:47 -0700
X-CSE-ConnectionGUID: DviJL/pkQmibmZqjyBY3CA==
X-CSE-MsgGUID: ZALSYraISR2RjXfBsmsozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="100646498"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2024 00:16:43 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjCv3-000Kae-1p;
	Wed, 28 Aug 2024 07:16:41 +0000
Date: Wed, 28 Aug 2024 15:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Leonard <David.Leonard@digi.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <202408281442.Xos98wkO-lkp@intel.com>
References: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next shawnguo/for-next arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next linus/master v6.11-rc5 next-20240827]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Leonard/arm64-dts-ls1012a-add-pinctrl-node/20240827-104431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c0ecf4f4-94f1-2efd-b05b-fc117c62e516%40digi.com
patch subject: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
config: sh-randconfig-r113-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281442.Xos98wkO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240828/202408281442.Xos98wkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281442.Xos98wkO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/freescale/pinctrl-ls1046a.c:55:31: sparse: sparse: symbol 'ls1046a_pins' was not declared. Should it be static?
>> drivers/pinctrl/freescale/pinctrl-ls1046a.c:199:59: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct pinctrl_desc *pctldesc @@     got struct pinctrl_desc const * @@
   drivers/pinctrl/freescale/pinctrl-ls1046a.c:199:59: sparse:     expected struct pinctrl_desc *pctldesc
   drivers/pinctrl/freescale/pinctrl-ls1046a.c:199:59: sparse:     got struct pinctrl_desc const *

vim +/ls1046a_pins +55 drivers/pinctrl/freescale/pinctrl-ls1046a.c

    54	
  > 55	const struct pinctrl_pin_desc ls1046a_pins[] = {
    56		PINCTRL_PIN(PIN_L4, "L4"),
    57		PINCTRL_PIN(PIN_M4, "M4"),
    58		PINCTRL_PIN(PIN_M3, "M3"),
    59		PINCTRL_PIN(PIN_N3, "N3"),
    60	};
    61	
    62	/* Each pin is its own group */
    63	static const char * const ls1046a_groups[] = { "L4", "M4", "M3", "N3" };
    64	
    65	static int ls1046a_get_groups_count(struct pinctrl_dev *pcdev)
    66	{
    67		return ARRAY_SIZE(ls1046a_pins);
    68	}
    69	
    70	static const char *ls1046a_get_group_name(struct pinctrl_dev *pcdev,
    71		unsigned int selector)
    72	{
    73		return ls1046a_pins[selector].name;
    74	}
    75	
    76	static int ls1046a_get_group_pins(struct pinctrl_dev *pcdev,
    77		unsigned int selector, const unsigned int **pins, unsigned int *npins)
    78	{
    79		*pins = &ls1046a_pins[selector].number;
    80		*npins = 1;
    81		return 0;
    82	}
    83	
    84	static const struct pinctrl_ops ls1046a_pinctrl_ops = {
    85		.get_groups_count = ls1046a_get_groups_count,
    86		.get_group_name = ls1046a_get_group_name,
    87		.get_group_pins = ls1046a_get_group_pins,
    88		.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
    89		.dt_free_map = pinconf_generic_dt_free_map,
    90	};
    91	
    92	/* Every pin has the same set of functions */
    93	#define FUNC_i2c	0
    94	#define FUNC_gpio	1
    95	#define FUNC_evt	2
    96	#define FUNC_usb	3
    97	#define FUNC_ftm	4
    98	
    99	#define _PINFUNC(name) \
   100		[FUNC_##name] = PINCTRL_PINFUNCTION(#name, ls1046a_groups, ARRAY_SIZE(ls1046a_groups))
   101	static const struct pinfunction ls1046a_functions[] = {
   102		_PINFUNC(i2c),
   103		_PINFUNC(gpio),
   104		_PINFUNC(evt),
   105		_PINFUNC(usb),
   106		_PINFUNC(ftm),
   107	};
   108	
   109	static int ls1046a_get_functions_count(struct pinctrl_dev *pctldev)
   110	{
   111		return ARRAY_SIZE(ls1046a_functions);
   112	}
   113	
   114	static const char *ls1046a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
   115	{
   116		return ls1046a_functions[func].name;
   117	}
   118	
   119	static int ls1046a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
   120		const char * const **groups,
   121		unsigned int * const ngroups)
   122	{
   123		*groups = ls1046a_functions[func].groups;
   124		*ngroups = ls1046a_functions[func].ngroups;
   125		return 0;
   126	}
   127	
   128	static int ls1046a_set_mux(struct pinctrl_dev *pcdev,
   129		unsigned int func, unsigned int pin)
   130	{
   131		struct ls1046a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
   132		static const u32 cr0_reg_func[] = {
   133			[FUNC_i2c] = RCWPMUXCR0_FUNC_I2C,
   134			[FUNC_gpio] = RCWPMUXCR0_FUNC_GPIO,
   135			[FUNC_evt] = RCWPMUXCR0_FUNC_EVT,
   136			[FUNC_usb] = RCWPMUXCR0_FUNC_USB,
   137			[FUNC_ftm] = RCWPMUXCR0_FUNC_FTM,
   138		};
   139		static const unsigned int cr0_pin_shift[] = {
   140			[PIN_L4] = RCWPMUXCR0_IIC3_SCL_SHIFT,
   141			[PIN_M4] = RCWPMUXCR0_IIC3_SDA_SHIFT,
   142			[PIN_M3] = RCWPMUXCR0_IIC4_SCL_SHIFT,
   143			[PIN_N3] = RCWPMUXCR0_IIC4_SDA_SHIFT,
   144		};
   145		u32 cr0;
   146	
   147		if (pd->big_endian)
   148			cr0 = ioread32be(pd->cr0mem);
   149		else
   150			cr0 = ioread32(pd->cr0mem);
   151	
   152		unsigned int pin_shift = cr0_pin_shift[pin];
   153		u32 reg_func = cr0_reg_func[func];
   154		u32 newcr0 = (cr0 & ~RCWPMUXCR0_MASK(pin_shift)) |
   155			RCWPMUXCR0_FIELD(pin_shift, reg_func);
   156	
   157		if (pd->big_endian)
   158			iowrite32be(newcr0, pd->cr0mem);
   159		else
   160			iowrite32(newcr0, pd->cr0mem);
   161		return 0;
   162	}
   163	
   164	static const struct pinmux_ops ls1046a_pinmux_ops = {
   165		.get_functions_count = ls1046a_get_functions_count,
   166		.get_function_name = ls1046a_get_function_name,
   167		.get_function_groups = ls1046a_get_function_groups,
   168		.set_mux = ls1046a_set_mux,
   169	};
   170	
   171	static const struct pinctrl_desc ls1046a_pinctrl_desc = {
   172		.name = "ls1046a",
   173		.pins = ls1046a_pins,
   174		.npins = ARRAY_SIZE(ls1046a_pins),
   175		.pctlops = &ls1046a_pinctrl_ops,
   176		.pmxops = &ls1046a_pinmux_ops,
   177		.owner = THIS_MODULE,
   178	};
   179	
   180	static int ls1046a_pinctrl_probe(struct platform_device *pdev)
   181	{
   182		struct ls1046a_pinctrl_pdata *pd;
   183		int ret;
   184	
   185		pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
   186		if (!pd)
   187			return -ENOMEM;
   188		platform_set_drvdata(pdev, pd);
   189	
   190		pd->big_endian = device_is_big_endian(&pdev->dev);
   191	
   192		/* SCFG PMUX0 */
   193		pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
   194		if (IS_ERR(pd->cr0mem))
   195			return PTR_ERR(pd->cr0mem);
   196		dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
   197			pd->big_endian ? "be" : "le");
   198	
 > 199		ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
   200			pd, &pd->pctl_dev);
   201		if (ret)
   202			return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
   203	
   204		pinctrl_enable(pd->pctl_dev);
   205		return ret;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

