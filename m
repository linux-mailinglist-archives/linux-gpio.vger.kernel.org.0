Return-Path: <linux-gpio+bounces-29722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB2CC998B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 22:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 182323044293
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 21:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656C730F947;
	Wed, 17 Dec 2025 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrYtqQfC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5730F53F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766006599; cv=none; b=EvozOsloPEWtdbfRWuz1TWoOwiog4MpogHXE9/IzLJEZYCf1Z+Exc29TM1NdKXpqryFpvXhOpzJzq6Y65UhbuYOmOfEohzCV2eK5ic8n5FPN882VhFOuTinNawlW4QICniJVnXeN+YBXo2HofZzcF6VaUTg8Q5pvQix1uMSGJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766006599; c=relaxed/simple;
	bh=sHfxWgN6J1iKIa1mVTbsPjrw/f4RodsQje3FlDnb/w4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTnzMNUY8VBAI2ohBfnegbY1EBv7K0800P5kcxvY3q/eTammYYJO1fctozaI7yJxhHz/ZAYcbEJu7e3Y0B3k7trKougZAiwnzYn91K9eBCS6S7uSyuWtO/adVm0NQPliIfGjDqZ7JZvOKzoYDgBTMcGLL9vTlMtKY4+H4uL3rhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrYtqQfC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766006597; x=1797542597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHfxWgN6J1iKIa1mVTbsPjrw/f4RodsQje3FlDnb/w4=;
  b=hrYtqQfChDOApfIzND4I83ClUSblzLAK+oEKI/NXYvZO6BfJdgB8vjnm
   N3rSnaGvHepdYDvvuNZgBAbrdGdiroQUdesdUUKfiPRxzA7TnW5Wkxy4E
   WmTdTvJ7n6KUXhVDuTgIqySNRZZCNI4OXxAckeHttUekzkYa3uStvRFg4
   cMniIne9mb/1lwY3CouNTjMH4AWY/73NW+3zw3GIgg9wdiqALODzHgvhB
   4Z7GJLVXr3n7xMhsPyIBLAiCH6ykiaOgM2vheLeGvYbdiXitZaNTFeJol
   Lf090Ip7NMuJXFGf6JNfHOOfW9tLIwI6dJ2NB7VcjtDofHL2+DFU7Evzo
   g==;
X-CSE-ConnectionGUID: B+tpbZq/SJaNHdt4o8vAzg==
X-CSE-MsgGUID: 6fgNTHtIR72mz6nCkH6UfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79077766"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="79077766"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 13:23:15 -0800
X-CSE-ConnectionGUID: kcP9FRGqTUCym5mNABmVxw==
X-CSE-MsgGUID: 5LNJV1vbTwq1CEPA6X6SDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="235825243"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 13:23:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVyzH-000000001G1-1Gf3;
	Wed, 17 Dec 2025 21:23:11 +0000
Date: Thu, 18 Dec 2025 05:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [brgl:gpio/for-next 4/4] drivers/gpio/gpio-realtek-otto.c:375:14:
 warning: cast to smaller integer type 'unsigned int' from 'const void *'
Message-ID: <202512180532.2ykNwYAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   3203d8f573af87d8c967d36e8d5016ef306ff078
commit: 3203d8f573af87d8c967d36e8d5016ef306ff078 [4/4] gpio: realtek-otto: add COMPILE_TEST
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251218/202512180532.2ykNwYAm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180532.2ykNwYAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180532.2ykNwYAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-realtek-otto.c:375:14: warning: cast to smaller integer type 'unsigned int' from 'const void *' [-Wvoid-pointer-to-int-cast]
     375 |         dev_flags = (unsigned int) device_get_match_data(dev);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +375 drivers/gpio/gpio-realtek-otto.c

0d82fb1127fb7cc Sander Vanheule     2021-03-30  357  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  358  static int realtek_gpio_probe(struct platform_device *pdev)
0d82fb1127fb7cc Sander Vanheule     2021-03-30  359  {
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  360  	struct gpio_generic_chip_config config;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  361  	struct device *dev = &pdev->dev;
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  362  	unsigned long gen_gc_flags;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  363  	unsigned int dev_flags;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  364  	struct gpio_irq_chip *girq;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  365  	struct realtek_gpio_ctrl *ctrl;
95fa6dbe58f286a Sander Vanheule     2022-04-09  366  	struct resource *res;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  367  	u32 ngpios;
95fa6dbe58f286a Sander Vanheule     2022-04-09  368  	unsigned int nr_cpus;
95fa6dbe58f286a Sander Vanheule     2022-04-09  369  	int cpu, err, irq;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  370  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  371  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  372  	if (!ctrl)
0d82fb1127fb7cc Sander Vanheule     2021-03-30  373  		return -ENOMEM;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  374  
0d82fb1127fb7cc Sander Vanheule     2021-03-30 @375  	dev_flags = (unsigned int) device_get_match_data(dev);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  376  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  377  	ngpios = REALTEK_GPIO_MAX;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  378  	device_property_read_u32(dev, "ngpios", &ngpios);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  379  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  380  	if (ngpios > REALTEK_GPIO_MAX) {
0d82fb1127fb7cc Sander Vanheule     2021-03-30  381  		dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
0d82fb1127fb7cc Sander Vanheule     2021-03-30  382  			REALTEK_GPIO_MAX);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  383  		return -EINVAL;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  384  	}
0d82fb1127fb7cc Sander Vanheule     2021-03-30  385  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  386  	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  387  	if (IS_ERR(ctrl->base))
0d82fb1127fb7cc Sander Vanheule     2021-03-30  388  		return PTR_ERR(ctrl->base);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  389  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  390  	raw_spin_lock_init(&ctrl->lock);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  391  
512c5be35223d9b Sander Vanheule     2022-04-09  392  	if (dev_flags & GPIO_PORTS_REVERSED) {
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  393  		gen_gc_flags = 0;
ee0175b3b44288c Sander Vanheule     2022-08-07  394  		ctrl->bank_read = realtek_gpio_bank_read;
ee0175b3b44288c Sander Vanheule     2022-08-07  395  		ctrl->bank_write = realtek_gpio_bank_write;
ee0175b3b44288c Sander Vanheule     2022-08-07  396  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
512c5be35223d9b Sander Vanheule     2022-04-09  397  	} else {
64f89f6e1f2b7f8 Bartosz Golaszewski 2025-09-17  398  		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
ee0175b3b44288c Sander Vanheule     2022-08-07  399  		ctrl->bank_read = realtek_gpio_bank_read_swapped;
ee0175b3b44288c Sander Vanheule     2022-08-07  400  		ctrl->bank_write = realtek_gpio_bank_write_swapped;
ee0175b3b44288c Sander Vanheule     2022-08-07  401  		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
512c5be35223d9b Sander Vanheule     2022-04-09  402  	}
512c5be35223d9b Sander Vanheule     2022-04-09  403  
7eee64e8be51f9f Bartosz Golaszewski 2025-09-10  404  	config = (struct gpio_generic_chip_config) {
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  405  		.dev = dev,
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  406  		.sz = 4,
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  407  		.dat = ctrl->base + REALTEK_GPIO_REG_DATA,
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  408  		.dirout = ctrl->base + REALTEK_GPIO_REG_DIR,
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  409  		.flags = gen_gc_flags,
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  410  	};
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  411  
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  412  	err = gpio_generic_chip_init(&ctrl->chip, &config);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  413  	if (err) {
0d82fb1127fb7cc Sander Vanheule     2021-03-30  414  		dev_err(dev, "unable to init generic GPIO");
0d82fb1127fb7cc Sander Vanheule     2021-03-30  415  		return err;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  416  	}
0d82fb1127fb7cc Sander Vanheule     2021-03-30  417  
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  418  	ctrl->chip.gc.ngpio = ngpios;
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  419  	ctrl->chip.gc.owner = THIS_MODULE;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  420  
0d82fb1127fb7cc Sander Vanheule     2021-03-30  421  	irq = platform_get_irq_optional(pdev, 0);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  422  	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  423  		girq = &ctrl->chip.gc.irq;
a01a40e334996b0 Sander Vanheule     2022-06-12  424  		gpio_irq_chip_set_chip(girq, &realtek_gpio_irq_chip);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  425  		girq->default_type = IRQ_TYPE_NONE;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  426  		girq->handler = handle_bad_irq;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  427  		girq->parent_handler = realtek_gpio_irq_handler;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  428  		girq->num_parents = 1;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  429  		girq->parents = devm_kcalloc(dev, girq->num_parents,
0d82fb1127fb7cc Sander Vanheule     2021-03-30  430  					sizeof(*girq->parents),	GFP_KERNEL);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  431  		if (!girq->parents)
0d82fb1127fb7cc Sander Vanheule     2021-03-30  432  			return -ENOMEM;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  433  		girq->parents[0] = irq;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  434  		girq->init_hw = realtek_gpio_irq_init;
0d82fb1127fb7cc Sander Vanheule     2021-03-30  435  	}
0d82fb1127fb7cc Sander Vanheule     2021-03-30  436  
95fa6dbe58f286a Sander Vanheule     2022-04-09  437  	cpumask_clear(&ctrl->cpu_irq_maskable);
95fa6dbe58f286a Sander Vanheule     2022-04-09  438  
95fa6dbe58f286a Sander Vanheule     2022-04-09  439  	if ((dev_flags & GPIO_INTERRUPTS_PER_CPU) && irq > 0) {
95fa6dbe58f286a Sander Vanheule     2022-04-09  440  		ctrl->cpumask_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
95fa6dbe58f286a Sander Vanheule     2022-04-09  441  		if (IS_ERR(ctrl->cpumask_base))
95fa6dbe58f286a Sander Vanheule     2022-04-09  442  			return dev_err_probe(dev, PTR_ERR(ctrl->cpumask_base),
95fa6dbe58f286a Sander Vanheule     2022-04-09  443  				"missing CPU IRQ mask registers");
95fa6dbe58f286a Sander Vanheule     2022-04-09  444  
95fa6dbe58f286a Sander Vanheule     2022-04-09  445  		nr_cpus = resource_size(res) / REALTEK_GPIO_PORTS_PER_BANK;
95fa6dbe58f286a Sander Vanheule     2022-04-09  446  		nr_cpus = min(nr_cpus, num_present_cpus());
95fa6dbe58f286a Sander Vanheule     2022-04-09  447  
95fa6dbe58f286a Sander Vanheule     2022-04-09  448  		for (cpu = 0; cpu < nr_cpus; cpu++)
95fa6dbe58f286a Sander Vanheule     2022-04-09  449  			cpumask_set_cpu(cpu, &ctrl->cpu_irq_maskable);
95fa6dbe58f286a Sander Vanheule     2022-04-09  450  	}
95fa6dbe58f286a Sander Vanheule     2022-04-09  451  
b9dac8251e7e6aa Bartosz Golaszewski 2025-08-26  452  	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
0d82fb1127fb7cc Sander Vanheule     2021-03-30  453  }
0d82fb1127fb7cc Sander Vanheule     2021-03-30  454  

:::::: The code at line 375 was first introduced by commit
:::::: 0d82fb1127fb7cc8287614eb0992acb0583bc323 gpio: Add Realtek Otto GPIO support

:::::: TO: Sander Vanheule <sander@svanheule.net>
:::::: CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

