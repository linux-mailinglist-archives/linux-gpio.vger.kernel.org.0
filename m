Return-Path: <linux-gpio+bounces-8706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9732794E33E
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 23:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4142820C3
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 21:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E19015C137;
	Sun, 11 Aug 2024 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWaE0Ak1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF794157A7C;
	Sun, 11 Aug 2024 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723410497; cv=none; b=n1berLF4diGvUjEt6ovhMXI44foZ5gmXK8W8KXEXOR2GqQeAjvlMG5Nti5s1Q9dW9ffgQ/uVKlsS+1UhppCHqMxPJCF1sX9WhkpipWJfHBrZD4o/OkEMXoNnhg7yDsx8nQaueNw2nmlvFYyQbSz5dbM1BvHtW/rKbCz6xyr43QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723410497; c=relaxed/simple;
	bh=wXLKPzbEa11hhq5BdV+rbj8l5onvf1E/U18pBjpIGPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0jkSb58Xb8fE+HoMaK5mJtHS89NxXrl6C2lap35qYS3RVkrAskTpFl1QJhxOykL4IIEZAX4zIEXRoBrdDNSUIYqvYgE9H9pTn53BzjXDMzy+u23h7LXqFoXCRu8oPoYaYfzxdX38bIY9dwHfTXoHmHD6g5fhm78gGSP9PD96Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWaE0Ak1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723410495; x=1754946495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wXLKPzbEa11hhq5BdV+rbj8l5onvf1E/U18pBjpIGPk=;
  b=LWaE0Ak1q/v/0iuDfSz8t1RbnNnEnEC6qlzVGmqTvqv2bZWUUxJBc3C1
   AplTK67ahcXNfCPIeJ4D7G2XfUFZ979rs3eq20pdBB1Jd3LDMdwJxK1bY
   5sy3hlivXzisoDQxE9ewPI8cz+RAQ0BW4wMCfCKI0B8P2joIgb8tPSwp0
   onfQnij/5Oy66KWtLbx0/zX8yvCsE/mLjQPFCi/vtB1yhc+SoeJWBW8fl
   Bq/0Yjxw6OBczvDCV37VSP98TrSzecRwB1vWVnH9Tkh2xLTTs894Tq8g8
   BSJWbWNYvdTViZ6lngHnxkt2QJrOa0jUtpwzDRaLDm4X39iQ/nH7ROlFp
   Q==;
X-CSE-ConnectionGUID: UCUt1qqxS9+7Q8vqZ4puOA==
X-CSE-MsgGUID: JrmP+XVdTHG/qHItjnPp0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32187020"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="32187020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 14:08:14 -0700
X-CSE-ConnectionGUID: 2Di+hvVgSdGtNTQ7QBcckw==
X-CSE-MsgGUID: 4lOjyr8lRVOE+JjEbUHbww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57729849"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2024 14:08:10 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdFnM-000B8X-0Z;
	Sun, 11 Aug 2024 21:08:08 +0000
Date: Mon, 12 Aug 2024 05:08:01 +0800
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
Message-ID: <202408120430.3N4wwLLo-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-pinctrl-airoha-Add-EN7581-pinctrl-controller/20240812-001436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/c69c4a9b8e57eebdde0521731b8cd9f92ed4891b.1723392444.git.lorenzo%40kernel.org
patch subject: [PATCH 2/2] pinctrl: airoha: Add support for EN7581 SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240812/202408120430.3N4wwLLo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120430.3N4wwLLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120430.3N4wwLLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
    1922 | static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
         |                                                                  ^
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
>> drivers/pinctrl/mediatek/pinctrl-airoha.c:1922:66: warning: missing braces around initializer [-Wmissing-braces]
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
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/pinctrl/mediatek/pinctrl-airoha.c:9:
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinmux_set_mux':
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2279:21: error: 'struct function_desc' has no member named 'name'
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
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2359:38: error: implicit declaration of function '__bf_shf' [-Wimplicit-function-declaration]
    2359 |         *val = (*val & reg->mask) >> __bf_shf(reg->mask);
         |                                      ^~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_pinctrl_probe':
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2946:61: error: 'const struct function_desc' has no member named 'name'
    2946 |                                                   func->desc.name,
         |                                                             ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2947:61: error: 'const struct function_desc' has no member named 'group_names'
    2947 |                                                   func->desc.group_names,
         |                                                             ^
   drivers/pinctrl/mediatek/pinctrl-airoha.c:2948:61: error: 'const struct function_desc' has no member named 'num_group_names'
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


vim +1922 drivers/pinctrl/mediatek/pinctrl-airoha.c

  1921	
> 1922	static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
  1923		PINCTRL_FUNC_DESC(pon),
  1924		PINCTRL_FUNC_DESC(tod_1pps),
  1925		PINCTRL_FUNC_DESC(sipo),
  1926		PINCTRL_FUNC_DESC(mdio),
  1927		PINCTRL_FUNC_DESC(uart),
  1928		PINCTRL_FUNC_DESC(i2c),
  1929		PINCTRL_FUNC_DESC(jtag),
  1930		PINCTRL_FUNC_DESC(pcm),
  1931		PINCTRL_FUNC_DESC(spi),
  1932		PINCTRL_FUNC_DESC(pcm_spi),
  1933		PINCTRL_FUNC_DESC(i2s),
  1934		PINCTRL_FUNC_DESC(emmc),
  1935		PINCTRL_FUNC_DESC(pnand),
  1936		PINCTRL_FUNC_DESC(pcie_reset),
  1937		PINCTRL_FUNC_DESC(pwm),
  1938		PINCTRL_FUNC_DESC(phy1_led0),
  1939		PINCTRL_FUNC_DESC(phy2_led0),
  1940		PINCTRL_FUNC_DESC(phy3_led0),
  1941		PINCTRL_FUNC_DESC(phy4_led0),
  1942		PINCTRL_FUNC_DESC(phy1_led1),
  1943		PINCTRL_FUNC_DESC(phy2_led1),
  1944		PINCTRL_FUNC_DESC(phy3_led1),
  1945		PINCTRL_FUNC_DESC(phy4_led1),
  1946	};
  1947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

