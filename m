Return-Path: <linux-gpio+bounces-27380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D361CBF6B7B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB958189B5C6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 13:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9FA3370F4;
	Tue, 21 Oct 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjbeW+D0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA7212546
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052633; cv=none; b=jqO8VoLOP2u6OIhD6uIf2iehJCamF+W4xJWJrP6nX0bRj3e7RyFhHXewyPO93WFquFYT0R8HKv4WpFh1aXPG0fqlWJU69j0KCe7Gtf4K2qtfVDKsosQmvgg2NsvQrDD+sQyz4IJf4Y/bPAONkjodMqlLmISA2nzycYYgEMnPAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052633; c=relaxed/simple;
	bh=3+gpan3nuVopivzHoJbwotqWryKs3Ox90zEHwsHJUeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6PuPw9Gi4bi95j3bfHtDOiJp9znjaFXwouEpw5iGm7fmmMX7HNFapbZU3btcYR/mErBVPC7cos//B0wzeupycrxvlw3/wfQr/CJT08BWjVedBYMyGN0GjjPxAD++20R20txdvRjPLIJr4o5UMW38DQfhMYfkGnHx6PM6c1bNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjbeW+D0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761052632; x=1792588632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+gpan3nuVopivzHoJbwotqWryKs3Ox90zEHwsHJUeo=;
  b=FjbeW+D0JPQezCEbCPEPyuXgJjKDLKpvq2iYSD9a7PO6nF0c7FrdI62g
   o4YN2u6bTU3x00YEEqpl/SKa0grvoFPXA5KFS7QpehCVBNEbZj6XoAMZm
   NsphK/JTekyY9vx0O8R46buQVtw9GPIFhec4xi3YarPpnvsn/lQs1WVHC
   D31O9ILem5JEUKQ5gpBsTegO5GjbDh+H1KtJkWfOhgEKerLVqQt28W+if
   X9DfHzHcizNoIaEfHjJ6g90Y36kpfdA0Tv6auYal5Lr2+XaHnaFKodICt
   Yetin3B1ZB2/0vTnBuJ8bl/DU2qNEcmo1F1nJ3trg2oolj//otlRqqw4G
   A==;
X-CSE-ConnectionGUID: pcegvJ3cRqCaqlY6p59JZg==
X-CSE-MsgGUID: NDJm2uEOSNmsIsiqjP3oRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65793156"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="65793156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:17:12 -0700
X-CSE-ConnectionGUID: T4sMhyXFS7KlrI9TbbRdTQ==
X-CSE-MsgGUID: S1GlhuXyRXuAH5k172E7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187994810"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 06:17:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBCEd-000Aqf-2M;
	Tue, 21 Oct 2025 13:17:07 +0000
Date: Tue, 21 Oct 2025 21:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-current 3/3] drivers/gpio/gpio-idio-16.c:170:20:
 error: 'struct gpio_regmap_config' has no member named
 'fixed_direction_output'
Message-ID: <202510212126.mVDMC2iC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   0d3f95740ced3acb6171cdec8c5bef336b0cabdb
commit: 0d3f95740ced3acb6171cdec8c5bef336b0cabdb [3/3] gpio: idio-16: Define fixed direction of the GPIO lines
config: x86_64-buildonly-randconfig-005-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212126.mVDMC2iC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212126.mVDMC2iC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-idio-16.c: In function 'devm_idio_16_regmap_register':
>> drivers/gpio/gpio-idio-16.c:170:20: error: 'struct gpio_regmap_config' has no member named 'fixed_direction_output'
     170 |         gpio_config.fixed_direction_output = fixed_direction_output;
         |                    ^


vim +170 drivers/gpio/gpio-idio-16.c

    95	
    96	/**
    97	 * devm_idio_16_regmap_register - Register an IDIO-16 GPIO device
    98	 * @dev:	device that is registering this IDIO-16 GPIO device
    99	 * @config:	configuration for idio_16_regmap_config
   100	 *
   101	 * Registers an IDIO-16 GPIO device. Returns 0 on success and negative error number on failure.
   102	 */
   103	int devm_idio_16_regmap_register(struct device *const dev,
   104					 const struct idio_16_regmap_config *const config)
   105	{
   106		struct gpio_regmap_config gpio_config = {};
   107		int err;
   108		struct idio_16_data *data;
   109		struct regmap_irq_chip *chip;
   110		struct regmap_irq_chip_data *chip_data;
   111		DECLARE_BITMAP(fixed_direction_output, IDIO_16_NGPIO);
   112	
   113		if (!config->parent)
   114			return -EINVAL;
   115	
   116		if (!config->map)
   117			return -EINVAL;
   118	
   119		if (!config->regmap_irqs)
   120			return -EINVAL;
   121	
   122		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   123		if (!data)
   124			return -ENOMEM;
   125		data->map = config->map;
   126	
   127		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
   128		if (!chip)
   129			return -ENOMEM;
   130	
   131		chip->name = dev_name(dev);
   132		chip->status_base = IDIO_16_INTERRUPT_STATUS;
   133		chip->mask_base = IDIO_16_ENABLE_IRQ;
   134		chip->ack_base = IDIO_16_CLEAR_INTERRUPT;
   135		chip->no_status = config->no_status;
   136		chip->num_regs = 1;
   137		chip->irqs = config->regmap_irqs;
   138		chip->num_irqs = config->num_regmap_irqs;
   139		chip->handle_mask_sync = idio_16_handle_mask_sync;
   140		chip->irq_drv_data = data;
   141	
   142		/* Disable IRQ to prevent spurious interrupts before we're ready */
   143		err = regmap_write(data->map, IDIO_16_DISABLE_IRQ, 0x00);
   144		if (err)
   145			return err;
   146	
   147		err = devm_regmap_add_irq_chip(dev, data->map, config->irq, 0, 0, chip, &chip_data);
   148		if (err)
   149			return dev_err_probe(dev, err, "IRQ registration failed\n");
   150	
   151		if (config->filters) {
   152			/* Deactivate input filters */
   153			err = regmap_write(data->map, IDIO_16_DEACTIVATE_INPUT_FILTERS, 0x00);
   154			if (err)
   155				return err;
   156		}
   157	
   158		gpio_config.parent = config->parent;
   159		gpio_config.regmap = data->map;
   160		gpio_config.ngpio = IDIO_16_NGPIO;
   161		gpio_config.names = idio_16_names;
   162		gpio_config.reg_dat_base = GPIO_REGMAP_ADDR(IDIO_16_DAT_BASE);
   163		gpio_config.reg_set_base = GPIO_REGMAP_ADDR(IDIO_16_DAT_BASE);
   164		gpio_config.ngpio_per_reg = IDIO_16_NGPIO_PER_REG;
   165		gpio_config.reg_stride = IDIO_16_REG_STRIDE;
   166		gpio_config.irq_domain = regmap_irq_get_domain(chip_data);
   167		gpio_config.reg_mask_xlate = idio_16_reg_mask_xlate;
   168	
   169		bitmap_from_u64(fixed_direction_output, GENMASK_U64(15, 0));
 > 170		gpio_config.fixed_direction_output = fixed_direction_output;
   171	
   172		return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
   173	}
   174	EXPORT_SYMBOL_GPL(devm_idio_16_regmap_register);
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

