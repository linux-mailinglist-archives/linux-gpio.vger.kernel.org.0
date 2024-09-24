Return-Path: <linux-gpio+bounces-10396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A42983B59
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 04:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5F51C22643
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 02:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B9011CBD;
	Tue, 24 Sep 2024 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDt1oin7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D01802B;
	Tue, 24 Sep 2024 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727146441; cv=none; b=mI7/Tzhz31Z4gZ+q0XKJ2K+G5JkLiqGyWwVAP5mgJwdaV8xCvHyqxv5q/5RqtMk5fgR2VNANb8m4esL4PrwulTUYO/ZM9WcawCgbNZ/aw+DEKpAgxwFyHsfzSg9PbN2T18jrx4XzyGYVc6yTOAXKYHc1oYBSXbUhllLp1hYmZAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727146441; c=relaxed/simple;
	bh=apgwYaa+hCopS3ypAdBFEVBOYmqMwtamZ5UePFaeU0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZCfz0lNpfloWen/MULmHy6KG5zme95xpvTrJhmKmuGLhpBcXyjKnng0mxheJB1sI9zWXl+xwmFbqry7p2mzjQludU3/d9ur/vGpr6ubNwovWpcd8K3EHiFjC/NeqwOZIJ2Sk4erc34QldMlHg3Iuqd5XZimfo8gFvL9mg41OPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDt1oin7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727146440; x=1758682440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=apgwYaa+hCopS3ypAdBFEVBOYmqMwtamZ5UePFaeU0k=;
  b=WDt1oin7AAPD44kp5JnitPeyoDpFjDAoVISoxLzlvI5QcBye76BNRsBR
   5XECce1+xg/aY/INQykjOe8XG+iSptaQ+JRqlvJi+GqLn2a5RJki0wWvY
   3izHX2JjCL8NsqIoUMh0qnRWVQ6Yu0ULRqRapp3FWoaSD+Nzx3FBRCM1K
   dlStpCVaOv9HV2IyIHCbglYB5hwqWrladUgsNHeH0yRhcmN82+y96D0Ur
   lMlR5mKm2H/1TeWWJX2EiF7915GydCaINMtcmUSvG7JeHx7XBJME7TFfK
   tU0rbMNdGIaKajhK1nC7XsMLY3pk0KuVC5jvmR40M3JuOn73IYiq6GwHS
   w==;
X-CSE-ConnectionGUID: tpe38bxVRWeulT+xy1kHYg==
X-CSE-MsgGUID: mGVAeUPKR3KQukJyL88bow==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25944431"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25944431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:53:59 -0700
X-CSE-ConnectionGUID: 1sjRCsuuS9+8cGhY+cNfwQ==
X-CSE-MsgGUID: GbyP1ughQqWsQAEca6+Atg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76041234"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 19:53:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvgW-000Hq1-26;
	Tue, 24 Sep 2024 02:53:52 +0000
Date: Tue, 24 Sep 2024 10:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com, Jay_Zhang@wiwynn.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202409241029.XEkME4VI-lkp@intel.com>
References: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240923-180936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240923100611.1597113-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware access
config: alpha-randconfig-r131-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241029.XEkME4VI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241029.XEkME4VI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241029.XEkME4VI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aspeed.c:1208:54: sparse: sparse: Using plain integer as NULL pointer

vim +1208 drivers/gpio/gpio-aspeed.c

  1183	
  1184	static int __init aspeed_gpio_probe(struct platform_device *pdev)
  1185	{
  1186		const struct of_device_id *gpio_id;
  1187		struct gpio_irq_chip *girq;
  1188		struct aspeed_gpio *gpio;
  1189		int rc, irq, i, banks, err;
  1190		u32 ngpio;
  1191	
  1192		gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
  1193		if (!gpio)
  1194			return -ENOMEM;
  1195	
  1196		gpio->base = devm_platform_ioremap_resource(pdev, 0);
  1197		if (IS_ERR(gpio->base))
  1198			return PTR_ERR(gpio->base);
  1199	
  1200		gpio->dev = &pdev->dev;
  1201	
  1202		raw_spin_lock_init(&gpio->lock);
  1203	
  1204		gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
  1205		if (!gpio_id)
  1206			return -EINVAL;
  1207	
> 1208		gpio->clk = devm_clk_get_enabled(&pdev->dev, 0);
  1209		if (IS_ERR(gpio->clk)) {
  1210			dev_warn(&pdev->dev,
  1211					"Failed to get clock from devicetree, debouncing disabled\n");
  1212			gpio->clk = NULL;
  1213		}
  1214	
  1215		gpio->config = gpio_id->data;
  1216	
  1217		if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->reg_bit_get ||
  1218		    !gpio->config->llops->reg_bank_get)
  1219			return -EINVAL;
  1220	
  1221		gpio->chip.parent = &pdev->dev;
  1222		err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
  1223		gpio->chip.ngpio = (u16) ngpio;
  1224		if (err)
  1225			gpio->chip.ngpio = gpio->config->nr_gpios;
  1226		gpio->chip.direction_input = aspeed_gpio_dir_in;
  1227		gpio->chip.direction_output = aspeed_gpio_dir_out;
  1228		gpio->chip.get_direction = aspeed_gpio_get_direction;
  1229		gpio->chip.request = aspeed_gpio_request;
  1230		gpio->chip.free = aspeed_gpio_free;
  1231		gpio->chip.get = aspeed_gpio_get;
  1232		gpio->chip.set = aspeed_gpio_set;
  1233		gpio->chip.set_config = aspeed_gpio_set_config;
  1234		gpio->chip.label = dev_name(&pdev->dev);
  1235		gpio->chip.base = -1;
  1236	
  1237		if (gpio->config->require_dcache) {
  1238			/* Allocate a cache of the output registers */
  1239			banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
  1240			gpio->dcache = devm_kcalloc(&pdev->dev, banks, sizeof(u32), GFP_KERNEL);
  1241			if (!gpio->dcache)
  1242				return -ENOMEM;
  1243			/*
  1244			 * Populate it with initial values read from the HW
  1245			 */
  1246			for (i = 0; i < banks; i++)
  1247				gpio->dcache[i] =
  1248					gpio->config->llops->reg_bank_get(gpio, (i << 5), reg_rdata);
  1249		}
  1250	
  1251		if (gpio->config->llops->privilege_init)
  1252			gpio->config->llops->privilege_init(gpio);
  1253	
  1254		/* Set up an irqchip */
  1255		irq = platform_get_irq(pdev, 0);
  1256		if (irq < 0)
  1257			return irq;
  1258		gpio->irq = irq;
  1259		girq = &gpio->chip.irq;
  1260		gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
  1261	
  1262		girq->parent_handler = aspeed_gpio_irq_handler;
  1263		girq->num_parents = 1;
  1264		girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
  1265		if (!girq->parents)
  1266			return -ENOMEM;
  1267		girq->parents[0] = gpio->irq;
  1268		girq->default_type = IRQ_TYPE_NONE;
  1269		girq->handler = handle_bad_irq;
  1270		girq->init_valid_mask = aspeed_init_irq_valid_mask;
  1271	
  1272		gpio->offset_timer =
  1273			devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
  1274		if (!gpio->offset_timer)
  1275			return -ENOMEM;
  1276	
  1277		rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
  1278		if (rc < 0)
  1279			return rc;
  1280	
  1281		return 0;
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

