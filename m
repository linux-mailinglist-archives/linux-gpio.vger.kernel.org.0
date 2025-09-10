Return-Path: <linux-gpio+bounces-25881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25662B5141C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 12:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D021F3A9837
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB5A261B62;
	Wed, 10 Sep 2025 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aq0pMcyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67531D385;
	Wed, 10 Sep 2025 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500454; cv=none; b=CR+KFnQJnGr26G64XlJTuwLBJ+NYfug0qvAbZrDxAO1bUblhDjPiHWknpd+6bVeXUlQHGerSCGu0wsjYUx3ZD/rLjJ+jkCxdo4w6IyR+fOPzvRSScPedS5T4W7JJNjmNp3H6mcy2nB+NnwRj9+dI7cc+OPLx2eKtEeLJog6pQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500454; c=relaxed/simple;
	bh=5M/o4RAP7wZoeD9O+0DDpwoy5rI2RuVMEJcQ4FyWfw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrXcnMY3OHxEF95E3djYQDosHC61yuGpC4aoFbeP5PEBE3LlOZE+qaMiUF1lfdnSne+ZLNm/b//rdu90g3XQROqwRTjfItlR8wZiE//cAVT76Bqn/dfZYk0beBHhBHvnMVnxdw/HjQflow7Qnyx7ofBdQ/N/Qo6+uI/Pj9o4X/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aq0pMcyn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757500451; x=1789036451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5M/o4RAP7wZoeD9O+0DDpwoy5rI2RuVMEJcQ4FyWfw0=;
  b=Aq0pMcyn4KhJvoecHXp7kl7pN2n2bXkjTvg0DimXbgCmWzEsPhTvYapE
   0wSVpmax323D+T0xKIEA/xoOmkpdLbnFOsWtZ71xjLLDqJWHNMmdckp2S
   xj/Gt7eJfGV38mspwq3TV0yxmRaTKtzw7Oq96cN2rW6cxA3XZzZg5zAQE
   12UASyLPSGD8Qmz4T6p7IlQ2/zr+fBwbO+RwJDivdVyeUlghL4Jil3RMh
   MANXJShJF9BfPvXtY//TCIAnFCpliUmORkM6PXh1Ga/pTqhKgO3K57n/l
   EyBwXbHJsfbrQ2As+U5UWstuncik0qOuSNveTVoOjSHfzWW4XwIBvttka
   g==;
X-CSE-ConnectionGUID: ShJbV73hSxaHeIwMT9B3uw==
X-CSE-MsgGUID: ESg8Nf6OTs6GgJlqLffgmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82395591"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82395591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:34:10 -0700
X-CSE-ConnectionGUID: 6KdLSLK4TJi5yFx+sU20zQ==
X-CSE-MsgGUID: J3SUYXR6QHWX/yA50MukLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173808692"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Sep 2025 03:34:03 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwI9I-0005pr-1f;
	Wed, 10 Sep 2025 10:34:00 +0000
Date: Wed, 10 Sep 2025 18:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/8] of/irq: Introduce for_each_of_imap_item
Message-ID: <202509110852.9fhL9uHp-lkp@intel.com>
References: <20250909120041.154459-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909120041.154459-4-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on tip/irq/core linus/master v6.17-rc5]
[cannot apply to geert-renesas-devel/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-Schneider-Electric/ARM-dts-r9a06g032-Add-GPIO-controllers/20250909-200642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250909120041.154459-4-herve.codina%40bootlin.com
patch subject: [PATCH v2 3/8] of/irq: Introduce for_each_of_imap_item
config: x86_64-buildonly-randconfig-005-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110852.9fhL9uHp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110852.9fhL9uHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110852.9fhL9uHp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/hci_bcm.c:16:
>> include/linux/of_irq.h:123:29: warning: no previous prototype for 'of_imap_parser_one' [-Wmissing-prototypes]
     123 | extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
         |                             ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/spi/spi-pic32.c:20:
>> include/linux/of_irq.h:123:29: warning: no previous prototype for 'of_imap_parser_one' [-Wmissing-prototypes]
     123 | extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-pic32.c:850:34: warning: 'pic32_spi_of_match' defined but not used [-Wunused-const-variable=]
     850 | static const struct of_device_id pic32_spi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
--
   ld: drivers/irqchip/irq-renesas-rzv2h.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-ingenic-tcu.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-stm32mp-exti.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-meson-gpio.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-starfive-jh8100-intc.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-imx-irqsteer.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-imx-intmux.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-lan966x-oic.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-ti-sci-intr.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-mst-intc.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-mchp-eic.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/irqchip/irq-sp7021-intc.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/gpio/gpio-msc313.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/gpio/gpio-rockchip.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/gpio/gpio-rtd.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/soc/mediatek/mtk-devapc.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/regulator/qcom-labibb-regulator.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/tty/serial/8250/8250_mtk.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/tty/serial/arc_uart.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/tty/serial/omap-serial.o: in function `of_imap_parser_one':
>> include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/iommu/mtk_iommu.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/iommu/mtk_iommu_v1.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/gpu/drm/bridge/analogix/analogix-anx78xx.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/base/platform.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/mfd/wcd934x.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/nfc/nfcmrvl/i2c.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/nfc/nfcmrvl/spi.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/nfc/s3fwrn5/i2c.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/ata/sata_fsl.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/mtd/nand/raw/atmel/nand-controller.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/mtd/nand/raw/atmel/pmecc.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/spi/spi.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/spi/spi-bcm2835.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/spi/spi-cadence.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/spi/spi-microchip-core-qspi.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/spi/spi-pic32.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/usb/mtu3/mtu3_plat.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/usb/mtu3/mtu3_core.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/usb/gadget/udc/max3420_udc.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/input/keyboard/gpio_keys.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/i2c/busses/i2c-stm32f4.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/i2c/busses/i2c-viai2c-wmt.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/i2c/busses/i2c-viai2c-common.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/power/reset/brcmstb-reboot.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/hwmon/npcm750-pwm-fan.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/thermal/rockchip_thermal.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/thermal/ti-soc-thermal/ti-bandgap.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/watchdog/at91sam9_wdt.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/watchdog/rzn1_wdt.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/bluetooth/hci_bcm.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/bluetooth/btusb.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/firmware/qcom/qcom_scm.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-of.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-atmel-st.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-davinci.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-digicolor.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-econet-en751221.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-fttmr010.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-ixp4xx.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/bcm2835_timer.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-meson6.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-zevio.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-stm32-lp.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-fsl-ftm.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-owl.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-integrator-ap.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-msc313e.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-ralink.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/clocksource/timer-nxp-stm.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here
   ld: drivers/bcma/main.o: in function `of_imap_parser_one':
   include/linux/of_irq.h:125: multiple definition of `of_imap_parser_one'; kernel/irq/irqdomain.o:include/linux/of_irq.h:125: first defined here


vim +125 include/linux/of_irq.h

    58	
    59	extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq);
    60	extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
    61	extern int of_irq_to_resource(struct device_node *dev, int index,
    62				      struct resource *r);
    63	
    64	#ifdef CONFIG_OF_IRQ
    65	extern void of_irq_init(const struct of_device_id *matches);
    66	extern int of_irq_parse_one(struct device_node *device, int index,
    67				  struct of_phandle_args *out_irq);
    68	extern int of_irq_count(struct device_node *dev);
    69	extern int of_irq_get(struct device_node *dev, int index);
    70	extern int of_irq_get_byname(struct device_node *dev, const char *name);
    71	extern int of_irq_to_resource_table(struct device_node *dev,
    72			struct resource *res, int nr_irqs);
    73	extern struct device_node *of_irq_find_parent(struct device_node *child);
    74	extern int of_imap_parser_init(struct of_imap_parser *parser,
    75				       struct device_node *node,
    76				       struct of_imap_item *item);
    77	extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
    78						       struct of_imap_item *item);
    79	extern struct irq_domain *of_msi_get_domain(struct device *dev,
    80						    const struct device_node *np,
    81						    enum irq_domain_bus_token token);
    82	extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
    83								u32 id,
    84								u32 bus_token);
    85	extern void of_msi_configure(struct device *dev, const struct device_node *np);
    86	extern u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in);
    87	#else
    88	static inline void of_irq_init(const struct of_device_id *matches)
    89	{
    90	}
    91	static inline int of_irq_parse_one(struct device_node *device, int index,
    92					   struct of_phandle_args *out_irq)
    93	{
    94		return -EINVAL;
    95	}
    96	static inline int of_irq_count(struct device_node *dev)
    97	{
    98		return 0;
    99	}
   100	static inline int of_irq_get(struct device_node *dev, int index)
   101	{
   102		return 0;
   103	}
   104	static inline int of_irq_get_byname(struct device_node *dev, const char *name)
   105	{
   106		return 0;
   107	}
   108	static inline int of_irq_to_resource_table(struct device_node *dev,
   109						   struct resource *res, int nr_irqs)
   110	{
   111		return 0;
   112	}
   113	static inline void *of_irq_find_parent(struct device_node *child)
   114	{
   115		return NULL;
   116	}
   117	static inline int of_imap_parser_init(struct of_imap_parser *parser,
   118					      struct device_node *node,
   119					      struct of_imap_item *item)
   120	{
   121		return -ENOSYS;
   122	}
 > 123	extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
   124						       struct of_imap_item *item)
 > 125	{
   126		return NULL;
   127	}
   128	static inline struct irq_domain *of_msi_get_domain(struct device *dev,
   129							   struct device_node *np,
   130							   enum irq_domain_bus_token token)
   131	{
   132		return NULL;
   133	}
   134	static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
   135							u32 id, u32 bus_token)
   136	{
   137		return NULL;
   138	}
   139	static inline void of_msi_configure(struct device *dev, struct device_node *np)
   140	{
   141	}
   142	static inline u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
   143	{
   144		return id_in;
   145	}
   146	#endif
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

