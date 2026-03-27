Return-Path: <linux-gpio+bounces-34293-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCQ4MfbCxmm8OQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34293-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:48:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B43489A1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 746413069DF9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C50F3FD140;
	Fri, 27 Mar 2026 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY4SrKQM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835E3FEB11
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633562; cv=none; b=aHrZF2SY10w0cA8Miizjkg4o2OqTZEyFW/T6rA7iD7SDKbdxKX48v/x++ED+2C+QGt7wX2Px3qujRLvvehZCbVz2qrMpaAGWFTwhLp8/RKF/oIX1aT5ExJ8tn4QCoS5yALJvE5OcVx0odkfNAqhyUyFH2U21ULTleu7XQn0XQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633562; c=relaxed/simple;
	bh=VLCA2EKRhguK4rc+mD7/EgnLReoL7/Fjd1u97V5RP3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqpfTAgscjJujFVOpJ/E62nUOvl1vedL4Ih9YeL4CnE5scvWZTndNYKfg0HIZEHX/x9MhMGCCekxor2tgd9NIwhIm1XXYu40uaUb9uvuqegpxJsh2Anktaki+bStZC70aOWI+p/bfoqtk1V0ROnmDMsImxH1oibLrkWr0eLRRYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY4SrKQM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774633561; x=1806169561;
  h=date:from:to:cc:subject:message-id;
  bh=VLCA2EKRhguK4rc+mD7/EgnLReoL7/Fjd1u97V5RP3o=;
  b=KY4SrKQMO6zN/GYzBW09+yXzwIyfbZV+dqTMvmbfAAXGuNUaMkbEZOpK
   g4R4r8aZJgB8fJAStZ+UAi6MuSZyF2dGxsQycexG2VkB/Y0epio9FvJMP
   0/yWfxQJ5U/plEcJ+EHRYGKc62sPFfhnxjDFkgCB3z9VAA86D/Tg8eGyj
   y8DZY/ZHo1MUctd07G05s/rqbEAPWa6v19NXuZivFFcdO06PaV9s87ILA
   2ldtryFf739H1NzF5c2vNUMO3QRPzFGlIjJP1b4TVLIiL8JhC8d+X9H15
   Ugz9I23v3U78oBr8IxOU3S3VS34HceiVnEixKEoldRObqg0IzvJ7SqEff
   Q==;
X-CSE-ConnectionGUID: +C75bkaaTjujNedWGLrSgA==
X-CSE-MsgGUID: SH9F/sASSNSwMwPQUVXiWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87185720"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87185720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:45:59 -0700
X-CSE-ConnectionGUID: qp1NU4msSIGQVMMW2mXwOg==
X-CSE-MsgGUID: 7jzTJ/ZDSYOx/yS+fB8skw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="229456758"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2026 10:45:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6BFr-00000000AXx-1hkm;
	Fri, 27 Mar 2026 17:45:55 +0000
Date: Sat, 28 Mar 2026 01:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next 57/59]
 drivers/gpio/gpio-tegra186.c:502:18: error: 'struct gpio_chip' has no member
 named 'of_gpio_n_cells'
Message-ID: <202603280145.tWkm6Erp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34293-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,nvidia.com:email]
X-Rspamd-Queue-Id: 346B43489A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   af475c16bc02a08ed6af6ca0c920f98a45611fe6
commit: 7803501e5754dc4b295ab22b20562e2b965358ba [57/59] gpio: drop unneeded Kconfig dependencies on OF_GPIO
config: sh-randconfig-r112-20260326 (https://download.01.org/0day-ci/archive/20260328/202603280145.tWkm6Erp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280145.tWkm6Erp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280145.tWkm6Erp-lkp@intel.com/

Note: the brgl/gpio/for-next HEAD af475c16bc02a08ed6af6ca0c920f98a45611fe6 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:8,
                    from drivers/gpio/gpio-tegra186.c:9:
   drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
>> drivers/gpio/gpio-tegra186.c:502:18: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     502 |  if (WARN_ON(chip->of_gpio_n_cells < 2))
         |                  ^~
   arch/sh/include/asm/bug.h:69:25: note: in definition of macro 'WARN_ON'
      69 |  int __ret_warn_on = !!(x);    \
         |                         ^
   drivers/gpio/gpio-tegra186.c:505:37: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     505 |  if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
         |                                     ^~
   arch/sh/include/asm/bug.h:69:25: note: in definition of macro 'WARN_ON'
      69 |  int __ret_warn_on = !!(x);    \
         |                         ^
   drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_irq_domain_translate':
   drivers/gpio/gpio-tegra186.c:709:24: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     709 |  if (WARN_ON(gpio->gpio.of_gpio_n_cells < 2))
         |                        ^
   arch/sh/include/asm/bug.h:69:25: note: in definition of macro 'WARN_ON'
      69 |  int __ret_warn_on = !!(x);    \
         |                         ^
   drivers/gpio/gpio-tegra186.c:712:46: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     712 |  if (WARN_ON(fwspec->param_count < gpio->gpio.of_gpio_n_cells))
         |                                              ^
   arch/sh/include/asm/bug.h:69:25: note: in definition of macro 'WARN_ON'
      69 |  int __ret_warn_on = !!(x);    \
         |                         ^
   At top level:
>> drivers/gpio/gpio-tegra186.c:495:12: warning: 'tegra186_gpio_of_xlate' defined but not used [-Wunused-function]
     495 | static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpio/gpio-brcmstb.c: In function 'brcmstb_gpio_of_xlate':
>> drivers/gpio/gpio-brcmstb.c:435:8: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     435 |  if (gc->of_gpio_n_cells != 2) {
         |        ^~
   In file included from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sh/include/asm/bitops.h:63,
                    from include/linux/bitops.h:67,
                    from drivers/gpio/gpio-brcmstb.c:4:
   drivers/gpio/gpio-brcmstb.c:440:39: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     440 |  if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
         |                                       ^~
   arch/sh/include/asm/bug.h:69:25: note: in definition of macro 'WARN_ON'
      69 |  int __ret_warn_on = !!(x);    \
         |                         ^
   drivers/gpio/gpio-brcmstb.c: In function 'brcmstb_gpio_probe':
   drivers/gpio/gpio-brcmstb.c:736:5: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     736 |   gc->of_gpio_n_cells = 2;
         |     ^~
>> drivers/gpio/gpio-brcmstb.c:737:5: error: 'struct gpio_chip' has no member named 'of_xlate'
     737 |   gc->of_xlate = brcmstb_gpio_of_xlate;
         |     ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])


vim +502 drivers/gpio/gpio-tegra186.c

b64d6c9a6a050d Thierry Reding 2020-03-19  494  
5b2b135a87fcfb Thierry Reding 2017-11-07 @495  static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
5b2b135a87fcfb Thierry Reding 2017-11-07  496  				  const struct of_phandle_args *spec,
5b2b135a87fcfb Thierry Reding 2017-11-07  497  				  u32 *flags)
5b2b135a87fcfb Thierry Reding 2017-11-07  498  {
5b2b135a87fcfb Thierry Reding 2017-11-07  499  	struct tegra_gpio *gpio = gpiochip_get_data(chip);
5b2b135a87fcfb Thierry Reding 2017-11-07  500  	unsigned int port, pin, i, offset = 0;
5b2b135a87fcfb Thierry Reding 2017-11-07  501  
5b2b135a87fcfb Thierry Reding 2017-11-07 @502  	if (WARN_ON(chip->of_gpio_n_cells < 2))
5b2b135a87fcfb Thierry Reding 2017-11-07  503  		return -EINVAL;
5b2b135a87fcfb Thierry Reding 2017-11-07  504  
5b2b135a87fcfb Thierry Reding 2017-11-07  505  	if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
5b2b135a87fcfb Thierry Reding 2017-11-07  506  		return -EINVAL;
5b2b135a87fcfb Thierry Reding 2017-11-07  507  
5b2b135a87fcfb Thierry Reding 2017-11-07  508  	port = spec->args[0] / 8;
5b2b135a87fcfb Thierry Reding 2017-11-07  509  	pin = spec->args[0] % 8;
5b2b135a87fcfb Thierry Reding 2017-11-07  510  
5b2b135a87fcfb Thierry Reding 2017-11-07  511  	if (port >= gpio->soc->num_ports) {
5b2b135a87fcfb Thierry Reding 2017-11-07  512  		dev_err(chip->parent, "invalid port number: %u\n", port);
5b2b135a87fcfb Thierry Reding 2017-11-07  513  		return -EINVAL;
5b2b135a87fcfb Thierry Reding 2017-11-07  514  	}
5b2b135a87fcfb Thierry Reding 2017-11-07  515  
5b2b135a87fcfb Thierry Reding 2017-11-07  516  	for (i = 0; i < port; i++)
5b2b135a87fcfb Thierry Reding 2017-11-07  517  		offset += gpio->soc->ports[i].pins;
5b2b135a87fcfb Thierry Reding 2017-11-07  518  
5b2b135a87fcfb Thierry Reding 2017-11-07  519  	if (flags)
5b2b135a87fcfb Thierry Reding 2017-11-07  520  		*flags = spec->args[1];
5b2b135a87fcfb Thierry Reding 2017-11-07  521  
5b2b135a87fcfb Thierry Reding 2017-11-07  522  	return offset + pin;
5b2b135a87fcfb Thierry Reding 2017-11-07  523  }
5b2b135a87fcfb Thierry Reding 2017-11-07  524  

:::::: The code at line 502 was first introduced by commit
:::::: 5b2b135a87fcfb2b27c3c192fd7c3b053f0c5fa2 gpio: Add Tegra186 support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

