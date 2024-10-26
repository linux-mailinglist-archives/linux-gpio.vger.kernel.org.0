Return-Path: <linux-gpio+bounces-12145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7369B1A0C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 19:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516291F21C5A
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 17:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A921531EA;
	Sat, 26 Oct 2024 17:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4rYhU/J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B013AA3E;
	Sat, 26 Oct 2024 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729963460; cv=none; b=nJkUwLMhebruc6GPEDAea3aJa8M1wDlSNptFR3/TaLfHFo7mvbZMmuJhV0158o4UN7xW24PBl1HoKwIjfvn+9Ms9J1xkbnX9BDVBKn+c5Xk5/YY++yX+HpIF3I8a73jw5H6raOPLuaOtLHgLAu2OWmIC/CMnO4qRPQkJJlMHwok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729963460; c=relaxed/simple;
	bh=PTmHaILYsAwilqS/hZZgOcih1/Rs6s3SWbbYVTuO7p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ9R3d13c03vvXhKvyZrjhJ68o34GHaSgvLT5BqbqCyRgP2rq5ZuS//yVsT9zSt/7BjeNN9JWEoqPP82oXrJOMKBdsIkl2Tav+/DIrww1T4Qe3I2+jbfbSpDnOUOHqIXJPAbsDdXfRkoJBHJej7Zx1St0wcMWwlWeSp40GQj9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4rYhU/J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729963456; x=1761499456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTmHaILYsAwilqS/hZZgOcih1/Rs6s3SWbbYVTuO7p0=;
  b=J4rYhU/J07nF1g2iKE4Q/1HKPXV49qBJehmERXo60B2UCIRi7rg/Eamr
   /26wFoRhwchm/NJ9TvaOPXD/99E5uAP9Tbp+JSaGEItO/juASHI6uu18R
   o7O1sa91KdfRa5qxP0MC3L+mp3GOJwFlnOXzNtCqfr11fINkMd772yL2M
   7IyGSM+aKqRZ/GsOyYjGyOqxwkXQfZ9DVvXkhJc0NORiOdIy+ZurArkY7
   RKMeaTKHRVmJZu04JUfsGhVJZ5rTJBL/1njt2onUue/VwdvaKPG6m6vbk
   9GMnt4nj8Wamvc3pdgtsvgpTSFbpTEIFqUqI6iiodRPvJykSHyqeGUjqp
   A==;
X-CSE-ConnectionGUID: 5q0nQRTORZOEnNa2PwvgGg==
X-CSE-MsgGUID: hmhuGEOESR2Ea4/ziVkJKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29396768"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29396768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 10:24:16 -0700
X-CSE-ConnectionGUID: 0uorn6DtSqidOYI8dtQiaw==
X-CSE-MsgGUID: jjZQgiM/T7qQ526j4KVy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="85983381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Oct 2024 10:24:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4kWK-000Zsy-0E;
	Sat, 26 Oct 2024 17:24:12 +0000
Date: Sun, 27 Oct 2024 01:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
Message-ID: <202410270016.f3oIhZ0P-lkp@intel.com>
References: <20241024192758.91748-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024192758.91748-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-relax-the-Kconfig-dependency-on-OF_GPIO-in-drivers/20241025-032925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241024192758.91748-1-brgl%40bgdev.pl
patch subject: [PATCH] gpio: relax the Kconfig dependency on OF_GPIO in drivers
config: m68k-randconfig-r051-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270016.f3oIhZ0P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270016.f3oIhZ0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270016.f3oIhZ0P-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-brcmstb.c: In function 'brcmstb_gpio_of_xlate':
>> drivers/gpio/gpio-brcmstb.c:406:15: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     406 |         if (gc->of_gpio_n_cells != 2) {
         |               ^~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/gpio/gpio-brcmstb.c:5:
   drivers/gpio/gpio-brcmstb.c:411:46: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     411 |         if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
         |                                              ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-brcmstb.c: In function 'brcmstb_gpio_probe':
   drivers/gpio/gpio-brcmstb.c:689:19: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     689 |                 gc->of_gpio_n_cells = 2;
         |                   ^~
>> drivers/gpio/gpio-brcmstb.c:690:19: error: 'struct gpio_chip' has no member named 'of_xlate'
     690 |                 gc->of_xlate = brcmstb_gpio_of_xlate;
         |                   ^~
--
   drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
>> drivers/gpio/gpio-lpc32xx.c:517:49: error: 'struct gpio_chip' has no member named 'of_xlate'
     517 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
         |                                                 ^
>> drivers/gpio/gpio-lpc32xx.c:518:49: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     518 |                         lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
         |                                                 ^
--
   drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
>> drivers/gpio/gpio-mt7621.c:246:17: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     246 |         rg->chip.of_gpio_n_cells = 2;
         |                 ^
>> drivers/gpio/gpio-mt7621.c:247:17: error: 'struct gpio_chip' has no member named 'of_xlate'
     247 |         rg->chip.of_xlate = mediatek_gpio_xlate;
         |                 ^
--
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/gpio/gpio-tegra186.c:9:
   drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
>> drivers/gpio/gpio-tegra186.c:469:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     469 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
         |                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-tegra186.c:472:44: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     472 |         if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
         |                                            ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_irq_domain_translate':
   drivers/gpio/gpio-tegra186.c:676:31: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     676 |         if (WARN_ON(gpio->gpio.of_gpio_n_cells < 2))
         |                               ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-tegra186.c:679:53: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     679 |         if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_cells))
         |                                                     ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpio/gpio-tegra186.c: At top level:
>> drivers/gpio/gpio-tegra186.c:462:12: warning: 'tegra186_gpio_of_xlate' defined but not used [-Wunused-function]
     462 | static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
         |            ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +406 drivers/gpio/gpio-brcmstb.c

3b0213d56eb7f7 Gregory Fong  2015-05-28  398  
3b0213d56eb7f7 Gregory Fong  2015-05-28  399  static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
3b0213d56eb7f7 Gregory Fong  2015-05-28  400  		const struct of_phandle_args *gpiospec, u32 *flags)
3b0213d56eb7f7 Gregory Fong  2015-05-28  401  {
3b0213d56eb7f7 Gregory Fong  2015-05-28  402  	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
0f4630f3720e7e Linus Walleij 2015-12-04  403  	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
3b0213d56eb7f7 Gregory Fong  2015-05-28  404  	int offset;
3b0213d56eb7f7 Gregory Fong  2015-05-28  405  
3b0213d56eb7f7 Gregory Fong  2015-05-28 @406  	if (gc->of_gpio_n_cells != 2) {
3b0213d56eb7f7 Gregory Fong  2015-05-28  407  		WARN_ON(1);
3b0213d56eb7f7 Gregory Fong  2015-05-28  408  		return -EINVAL;
3b0213d56eb7f7 Gregory Fong  2015-05-28  409  	}
3b0213d56eb7f7 Gregory Fong  2015-05-28  410  
3b0213d56eb7f7 Gregory Fong  2015-05-28  411  	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
3b0213d56eb7f7 Gregory Fong  2015-05-28  412  		return -EINVAL;
3b0213d56eb7f7 Gregory Fong  2015-05-28  413  
ec37529e544c59 Doug Berger   2024-04-23  414  	offset = gpiospec->args[0] - bank->gc.offset;
19a7b6940b7812 Gregory Fong  2015-07-31  415  	if (offset >= gc->ngpio || offset < 0)
3b0213d56eb7f7 Gregory Fong  2015-05-28  416  		return -EINVAL;
3b0213d56eb7f7 Gregory Fong  2015-05-28  417  
3b0213d56eb7f7 Gregory Fong  2015-05-28  418  	if (unlikely(offset >= bank->width)) {
3b0213d56eb7f7 Gregory Fong  2015-05-28  419  		dev_warn_ratelimited(&priv->pdev->dev,
3b0213d56eb7f7 Gregory Fong  2015-05-28  420  			"Received request for invalid GPIO offset %d\n",
3b0213d56eb7f7 Gregory Fong  2015-05-28  421  			gpiospec->args[0]);
3b0213d56eb7f7 Gregory Fong  2015-05-28  422  	}
3b0213d56eb7f7 Gregory Fong  2015-05-28  423  
3b0213d56eb7f7 Gregory Fong  2015-05-28  424  	if (flags)
3b0213d56eb7f7 Gregory Fong  2015-05-28  425  		*flags = gpiospec->args[1];
3b0213d56eb7f7 Gregory Fong  2015-05-28  426  
3b0213d56eb7f7 Gregory Fong  2015-05-28  427  	return offset;
3b0213d56eb7f7 Gregory Fong  2015-05-28  428  }
3b0213d56eb7f7 Gregory Fong  2015-05-28  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

