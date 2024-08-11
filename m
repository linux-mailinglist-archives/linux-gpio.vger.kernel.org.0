Return-Path: <linux-gpio+bounces-8708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEF94E38F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 00:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A3D1F21F41
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 22:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B37A15920E;
	Sun, 11 Aug 2024 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDxBc1md"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC2441C75;
	Sun, 11 Aug 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723413623; cv=none; b=OLkFlEoriyyXVwkKGB3//aOUZBA1QZ8UEiQ5dxRtfFENsRzTt4kzo5BfOqjb9UlsO+P6Hq1JRJhKg+QJtARe6rbdHpvD+MvC0usdOMjFmdvOIjQNj+xbvRvtqTRNOQjUwyOLP0GvWVdlLjahBJlWHdlWQw7/PTurOGpjJqx1T0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723413623; c=relaxed/simple;
	bh=5dDFPzlso+518BsD7FxakDrzbMJ7pRsaOi+q4gwwmpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBDflNgcufZC7jG4x5JWoiFJSEqW+JipH//+hfgPH58CvdHeEPSTCIiBAM/Z8HBg3Lho0ZcCyB9Gio+XRXxbOJMI9ZAvyoxKoRPA80UBjf62bRPWMQTiL8t/o8m1qOpvmz0z6FxLz3sr6sMmxArBQYGotIzfE1aAtgquhVu3GQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDxBc1md; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723413622; x=1754949622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dDFPzlso+518BsD7FxakDrzbMJ7pRsaOi+q4gwwmpE=;
  b=mDxBc1mdL82QT+OtKeQoLHszsd6SlD+57qZLrqv97hCDmKEUz1Q3ES7P
   h1jkgAT+kvTFYCocIQJIXEQI1pgcRZ34KEUdEeHCFWu6N17IYwAkGzRYj
   PdB523TsPlSfGRMJzYBiT7/hDdbMEIrA70tQhkSPIIYM13dYstd8irQeb
   6zbcCnH2U3jEzk0xztEW6dqOMulX/V7jIe82VNV18Beg+Odx/EVbJBTF4
   3cxLelhzuxdWIHWggVxs4bBvaVH8TW4gvnwLekwPbIgP5hq64nZdScGLy
   jBgOEsitR5sF5Ml1eMJBMs2dBeR1VUncwyghzcIGpUaUITAvV3H071tmu
   A==;
X-CSE-ConnectionGUID: 1QN6Yv4kT+ik6WyjGRL2pg==
X-CSE-MsgGUID: noNf1N3YTwyqT5Wxto9AlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21641743"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21641743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 15:00:21 -0700
X-CSE-ConnectionGUID: iZ2rRz0tSVeF4n5itSEQOQ==
X-CSE-MsgGUID: CwV2PbkuSD+rWCyJZAoQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58040030"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2024 15:00:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGbm-000BAx-16;
	Sun, 11 Aug 2024 22:00:14 +0000
Date: Mon, 12 Aug 2024 05:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <202408120527.crbqc6PI-lkp@intel.com>
References: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-pinctrl-airoha-Add-EN7581-pinctrl-controller/20240812-001436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo%40kernel.org
patch subject: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240812/202408120527.crbqc6PI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120527.crbqc6PI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120527.crbqc6PI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
    1922 | static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
         |                                                                  ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
   In file included from include/linux/printk.h:574,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinmux_set_mux':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2279:21: error: 'struct function_desc' has no member named 'name'
    2279 |                 desc->name, grp->grp.name);
         |                     ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2278:9: note: in expansion of macro 'dev_dbg'
    2278 |         dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
         |         ^~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinctrl_get_conf':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2359:38: error: implicit declaration of function '__bf_shf' [-Werror=implicit-function-declaration]
    2359 |         *val = (*val & reg->mask) >> __bf_shf(reg->mask);
         |                                      ^~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinctrl_probe':
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2946:61: error: 'const struct function_desc' has no member named 'name'
    2946 |                                                   func->desc.name,
         |                                                             ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2947:61: error: 'const struct function_desc' has no member named 'group_names'
    2947 |                                                   func->desc.group_names,
         |                                                             ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:2948:61: error: 'const struct function_desc' has no member named 'num_group_names'
    2948 |                                                   func->desc.num_group_names,
         |                                                             ^
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/mediatek/pinctrl-airoha.c:22:
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2952:43: error: 'const struct function_desc' has no member named 'name'
    2952 |                                 func->desc.name);
         |                                           ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2951:25: note: in expansion of macro 'dev_err'
    2951 |                         dev_err(&pdev->dev, "Failed to register function %s\n",
         |                         ^~~~~~~
   cc1: some warnings being treated as errors


vim +2279 drivers/pinctrl/mediatek/pinctrl-airoha.c

  2259	
  2260	static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
  2261					 unsigned int selector,
  2262					 unsigned int group)
  2263	{
  2264		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2265		const struct airoha_pinctrl_func *func;
  2266		struct function_desc *desc;
  2267		struct group_desc *grp;
  2268		int i;
  2269	
  2270		desc = pinmux_generic_get_function(pctrl_dev, selector);
  2271		if (!desc)
  2272			return -EINVAL;
  2273	
  2274		grp = pinctrl_generic_get_group(pctrl_dev, group);
  2275		if (!grp)
  2276			return -EINVAL;
  2277	
  2278		dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
> 2279			desc->name, grp->grp.name);
  2280	
  2281		func = desc->data;
  2282		for (i = 0; i < func->group_size; i++) {
  2283			const struct airoha_pinctrl_func_group *group;
  2284			int j;
  2285	
  2286			group = &func->groups[i];
  2287			if (strcmp(group->name, grp->grp.name))
  2288				continue;
  2289	
  2290			for (j = 0; j < group->regmap_size; j++) {
  2291				void __iomem *base;
  2292	
  2293				base = pinctrl->regs.mux[group->regmap[j].mux];
  2294				airoha_pinctrl_rmw(pinctrl,
  2295						   base + group->regmap[j].offset,
  2296						   group->regmap[j].mask,
  2297						   group->regmap[j].val);
  2298			}
  2299			return 0;
  2300		}
  2301	
  2302		return -EINVAL;
  2303	}
  2304	
  2305	static int airoha_pinmux_gpio_set_direction(struct pinctrl_dev *pctrl_dev,
  2306						    struct pinctrl_gpio_range *range,
  2307						    unsigned int pin, bool input)
  2308	{
  2309		struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
  2310		int gpio = pin - range->pin_base;
  2311	
  2312		airoha_pinctrl_gpio_set_direction(pinctrl, gpio, input);
  2313	
  2314		return 0;
  2315	}
  2316	
  2317	static int airoha_pinctrl_get_gpio_from_pin(struct pinctrl_dev *pctrl_dev,
  2318						    int pin)
  2319	{
  2320		struct pinctrl_gpio_range *range;
  2321		int gpio;
  2322	
  2323		range = pinctrl_find_gpio_range_from_pin_nolock(pctrl_dev, pin);
  2324		if (!range)
  2325			return -EINVAL;
  2326	
  2327		gpio = pin - range->pin_base;
  2328		if (gpio < 0)
  2329			return -EINVAL;
  2330	
  2331		return gpio;
  2332	}
  2333	
  2334	static const struct airoha_pinctrl_reg *
  2335	airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
  2336				    int conf_size, int pin)
  2337	{
  2338		int i;
  2339	
  2340		for (i = 0; i < conf_size; i++) {
  2341			if (conf[i].pin == pin)
  2342				return &conf[i].reg;
  2343		}
  2344	
  2345		return NULL;
  2346	}
  2347	
  2348	static int airoha_pinctrl_get_conf(void __iomem *base,
  2349					   const struct airoha_pinctrl_conf *conf,
  2350					   int conf_size, int pin, u32 *val)
  2351	{
  2352		const struct airoha_pinctrl_reg *reg;
  2353	
  2354		reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
  2355		if (!reg)
  2356			return -EINVAL;
  2357	
  2358		*val = readl(base + reg->offset);
> 2359		*val = (*val & reg->mask) >> __bf_shf(reg->mask);
  2360	
  2361		return 0;
  2362	}
  2363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

