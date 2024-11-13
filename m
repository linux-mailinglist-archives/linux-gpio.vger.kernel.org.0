Return-Path: <linux-gpio+bounces-12989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C799A9C79AA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 18:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587381F2411C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 17:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5D9200CBE;
	Wed, 13 Nov 2024 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOfLVeFE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6341746;
	Wed, 13 Nov 2024 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731517949; cv=none; b=HI7bpiiLA/+B7IcUMpeBK+oAGWlXiwxRjAMJ4jI8sVWbQ2YYjLNMuDUdRhYSbt8qOD00WTiGWfqvym7jJh0MrwVHQMTrEmKWEahNMwBdhJvRvchtZw3mTOtd//aZtszzmpqY84jEiHpqKltPKW44MVwnJ7TO0J56/ByADOYzLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731517949; c=relaxed/simple;
	bh=lqxV8ucLkQyxRISlFKUXJSoVKZZMF+Rrt2tkP4uALRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7qqEafawXAWUTtWfU9XXDhTkrS47daKS104Vt/+j4s/q8TjrjuVTEVzIFUi8geAmvm2meyD46zpnYNsqJgmjA6b97Cl6rXiw4ov1XLcO611kQh6sQUHIntRgGOtLUxd/SXNBcLgIJj3eI48wg6xe80Sw5bbyrW4Ck9ubfLkqXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOfLVeFE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731517948; x=1763053948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqxV8ucLkQyxRISlFKUXJSoVKZZMF+Rrt2tkP4uALRQ=;
  b=BOfLVeFE4BylZWwmKqLkMuVR+nrfQuk5n/PYY3VZUcqNjNngDQNh5FCn
   /2EdGex5Z5F6yoI9EEEEsb0kVHUbdOk/bWY4x4sYeyGYcE/fcgvCkzPYi
   PWVMFMlMVVnpc3N2uddrBpra3G/5tO7PejFX/EMhP3F6beY++UNW5vs6K
   4GoFPnL2u2JSV+pjgDPQodU1DycHmFGzyMd5KJGfhNS/O2qk3dm+lSS7Y
   CBUgSwzHiSBadEjHRgEyUb4EUgHtM2xh4x/RpMgQR0R+9DZ9WoDnS9spX
   X3rSByVCf2yP+1ZrOGVeLyLWrisVyswVacS6M8OK8MwoeNXrB+Ukg3/XT
   Q==;
X-CSE-ConnectionGUID: ySZLzq/zRMaad7rPc8A/Ug==
X-CSE-MsgGUID: baPUCZkXSnOj4MoSnxFuNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31305013"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="31305013"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 09:12:23 -0800
X-CSE-ConnectionGUID: xtrnvq7+R3qRu3KuxnqCYQ==
X-CSE-MsgGUID: uuL5TQQMQNmSCUzUWU/zXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88738202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 09:12:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DD691703; Wed, 13 Nov 2024 19:12:19 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
Date: Wed, 13 Nov 2024 19:12:19 +0200
Message-ID: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig under drivers/gpio has a specific comment

  put drivers in the right section, in alphabetical order

but in time some of the entries fell unordered there.
Put an order again.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig | 258 +++++++++++++++++++++----------------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28b19390c9b4..7ca5314ec51e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -113,10 +113,6 @@ config GPIO_SWNODE_UNDEFINED
 
 # put drivers in the right section, in alphabetical order
 
-# This symbol is selected by both I2C and SPI expanders
-config GPIO_MAX730X
-	tristate
-
 config GPIO_IDIO_16
 	tristate
 	select REGMAP_IRQ
@@ -162,6 +158,16 @@ config GPIO_AMDPT
 	  Driver for GPIO functionality on Promontory IOHub.
 	  Requires ACPI ASL code to enumerate as a platform device.
 
+config GPIO_AMD_FCH
+	tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
+	help
+	  This option enables driver for GPIO on AMD's Fusion Controller Hub,
+	  as found on G-series SOCs (e.g. GX-412TC).
+
+	  Note: This driver doesn't register itself automatically, as it
+	  needs to be provided with platform-specific configuration.
+	  (See e.g. CONFIG_PCENGINES_APU2.)
+
 config GPIO_ASPEED
 	tristate "Aspeed GPIO support"
 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
@@ -187,17 +193,6 @@ config GPIO_ATH79
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
 
-config GPIO_RASPBERRYPI_EXP
-	tristate "Raspberry Pi 3 GPIO Expander"
-	default RASPBERRYPI_FIRMWARE
-	depends on OF_GPIO
-	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
-	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
-	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
-	help
-	  Turn on GPIO support for the expander on Raspberry Pi 3 boards, using
-	  the firmware mailbox to communicate with VideoCore on BCM283x chips.
-
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
 	depends on ARCH_BCM_MOBILE || COMPILE_TEST
@@ -377,6 +372,18 @@ config GPIO_ICH
 
 	  If unsure, say N.
 
+config GPIO_IDT3243X
+	tristate "IDT 79RC3243X GPIO support"
+	depends on MIKROTIK_RB532 || COMPILE_TEST
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Select this option to enable GPIO driver for
+	  IDT 79RC3243X-based devices like Mikrotik RB532.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-idt3243x.
+
 config GPIO_IMX_SCU
        def_bool y
        depends on IMX_SCU
@@ -401,6 +408,13 @@ config GPIO_LOGICVC
 	  Say yes here to support GPIO functionality of the Xylon LogiCVC
 	  programmable logic block.
 
+config GPIO_LOONGSON1
+	tristate "Loongson1 GPIO support"
+	depends on MACH_LOONGSON32
+	select GPIO_GENERIC
+	help
+	  Say Y or M here to support GPIO on Loongson1 SoCs.
+
 config GPIO_LOONGSON
 	bool "Loongson-2/3 GPIO support"
 	depends on CPU_LOONGSON2EF || CPU_LOONGSON64
@@ -472,6 +486,16 @@ config GPIO_MPC8XXX
 	  Say Y here if you're going to use hardware that connects to the
 	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.
 
+config GPIO_MSC313
+	bool "MStar MSC313 GPIO support"
+	depends on ARCH_MSTARV7
+	default ARCH_MSTARV7
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Say Y here to support the main GPIO block on MStar/SigmaStar
+	  ARMv7-based SoCs.
+
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
@@ -556,6 +580,17 @@ config GPIO_PXA
 	help
 	  Say yes here to support the PXA GPIO device.
 
+config GPIO_RASPBERRYPI_EXP
+	tristate "Raspberry Pi 3 GPIO Expander"
+	default RASPBERRYPI_FIRMWARE
+	depends on OF_GPIO
+	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
+	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
+	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
+	help
+	  Turn on GPIO support for the expander on Raspberry Pi 3 boards, using
+	  the firmware mailbox to communicate with VideoCore on BCM283x chips.
+
 config GPIO_RCAR
 	tristate "Renesas R-Car and RZ/G GPIO support"
 	depends on ARCH_RENESAS || COMPILE_TEST
@@ -844,75 +879,11 @@ config GPIO_ZYNQMP_MODEPIN
 	  is 4-bits boot mode pins. It sets and gets the status of
 	  the ps-mode pin. Every pin can be configured as input/output.
 
-config GPIO_LOONGSON1
-	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
-	select GPIO_GENERIC
-	help
-	  Say Y or M here to support GPIO on Loongson1 SoCs.
-
-config GPIO_AMD_FCH
-	tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
-	help
-	  This option enables driver for GPIO on AMD's Fusion Controller Hub,
-	  as found on G-series SOCs (e.g. GX-412TC).
-
-	  Note: This driver doesn't register itself automatically, as it
-	  needs to be provided with platform-specific configuration.
-	  (See e.g. CONFIG_PCENGINES_APU2.)
-
-config GPIO_MSC313
-	bool "MStar MSC313 GPIO support"
-	depends on ARCH_MSTARV7
-	default ARCH_MSTARV7
-	select GPIOLIB_IRQCHIP
-	select IRQ_DOMAIN_HIERARCHY
-	help
-	  Say Y here to support the main GPIO block on MStar/SigmaStar
-	  ARMv7-based SoCs.
-
-config GPIO_IDT3243X
-	tristate "IDT 79RC3243X GPIO support"
-	depends on MIKROTIK_RB532 || COMPILE_TEST
-	select GPIO_GENERIC
-	select GPIOLIB_IRQCHIP
-	help
-	  Select this option to enable GPIO driver for
-	  IDT 79RC3243X-based devices like Mikrotik RB532.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called gpio-idt3243x.
-
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
 	depends on X86 && HAS_IOPORT # I/O space access
 
-config GPIO_VX855
-	tristate "VIA VX855/VX875 GPIO"
-	depends on PCI
-	select MFD_CORE
-	select MFD_VX855
-	help
-	  Support access to the VX855/VX875 GPIO lines through the GPIO library.
-
-	  This driver provides common support for accessing the device.
-	  Additional drivers must be enabled in order to use the
-	  functionality of the device.
-
-config GPIO_I8255
-	tristate
-	select GPIO_REGMAP
-	help
-	  Enables support for the i8255 interface library functions. The i8255
-	  interface library provides functions to facilitate communication with
-	  interfaces compatible with the venerable Intel 8255 Programmable
-	  Peripheral Interface (PPI). The Intel 8255 PPI chip was first released
-	  in the early 1970s but compatible interfaces are nowadays typically
-	  found embedded in larger VLSI processing chips and FPGA components.
-
-	  If built as a module its name will be gpio-i8255.
-
 config GPIO_104_DIO_48E
 	tristate "ACCES 104-DIO-48E GPIO support"
 	depends on PC104
@@ -982,6 +953,19 @@ config GPIO_GPIO_MM
 	  The base port addresses for the devices may be configured via the base
 	  array module parameter.
 
+config GPIO_I8255
+	tristate
+	select GPIO_REGMAP
+	help
+	  Enables support for the i8255 interface library functions. The i8255
+	  interface library provides functions to facilitate communication with
+	  interfaces compatible with the venerable Intel 8255 Programmable
+	  Peripheral Interface (PPI). The Intel 8255 PPI chip was first released
+	  in the early 1970s but compatible interfaces are nowadays typically
+	  found embedded in larger VLSI processing chips and FPGA components.
+
+	  If built as a module its name will be gpio-i8255.
+
 config GPIO_IT87
 	tristate "IT87xx GPIO support"
 	help
@@ -1039,6 +1023,18 @@ config GPIO_TS5500
 	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
 	  LCD port.
 
+config GPIO_VX855
+	tristate "VIA VX855/VX875 GPIO"
+	depends on PCI
+	select MFD_CORE
+	select MFD_VX855
+	help
+	  Support access to the VX855/VX875 GPIO lines through the GPIO library.
+
+	  This driver provides common support for accessing the device.
+	  Additional drivers must be enabled in order to use the
+	  functionality of the device.
+
 config GPIO_WINBOND
 	tristate "Winbond Super I/O GPIO support"
 	select ISA_BUS_API
@@ -1070,6 +1066,10 @@ config GPIO_WS16C48
 
 endmenu
 
+# This symbol is selected by both I2C and SPI expanders
+config GPIO_MAX730X
+	tristate
+
 menu "I2C GPIO expanders"
 	depends on I2C
 
@@ -1085,16 +1085,6 @@ config GPIO_ADNP
 	  enough to represent all pins, but the driver will assume a
 	  register layout for 64 pins (8 registers).
 
-config GPIO_FXL6408
-	tristate "FXL6408 I2C GPIO expander"
-	select GPIO_REGMAP
-	select REGMAP_I2C
-	help
-	  GPIO driver for Fairchild Semiconductor FXL6408 GPIO expander.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called gpio-fxl6408.
-
 config GPIO_DS4520
 	tristate "DS4520 I2C GPIO expander"
 	select REGMAP_I2C
@@ -1106,6 +1096,16 @@ config GPIO_DS4520
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio-ds4520.
 
+config GPIO_FXL6408
+	tristate "FXL6408 I2C GPIO expander"
+	select GPIO_REGMAP
+	select REGMAP_I2C
+	help
+	  GPIO driver for Fairchild Semiconductor FXL6408 GPIO expander.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-fxl6408.
+
 config GPIO_GW_PLD
 	tristate "Gateworks PLD GPIO Expander"
 	depends on OF_GPIO
@@ -1348,18 +1348,6 @@ config GPIO_DA9055
 
 	  If driver is built as a module it will be called gpio-da9055.
 
-config GPIO_DLN2
-	tristate "Diolan DLN2 GPIO support"
-	depends on MFD_DLN2
-	select GPIOLIB_IRQCHIP
-
-	help
-	  Select this option to enable GPIO driver for the Diolan DLN2
-	  board.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called gpio-dln2.
-
 config HTC_EGPIO
 	bool "HTC EGPIO support"
 	depends on ARM
@@ -1397,18 +1385,6 @@ config GPIO_KEMPLD
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-kempld.
 
-config GPIO_LJCA
-	tristate "INTEL La Jolla Cove Adapter GPIO support"
-	depends on USB_LJCA
-	select GPIOLIB_IRQCHIP
-	default USB_LJCA
-	help
-	  Select this option to enable GPIO driver for the INTEL
-	  La Jolla Cove Adapter (LJCA) board.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called gpio-ljca.
-
 config GPIO_LP3943
 	tristate "TI/National Semiconductor LP3943 GPIO expander"
 	depends on MFD_LP3943
@@ -1817,6 +1793,15 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
+config GPIO_MOXTET
+	tristate "Turris Mox Moxtet bus GPIO expander"
+	depends on MOXTET
+	help
+	  Say yes here if you are building for the Turris Mox router.
+	  This is the driver needed for configuring the GPIOs via the Moxtet
+	  bus. For example the Mox module with SFP cage needs this driver
+	  so that phylink can use corresponding GPIOs.
+
 config GPIO_PISOSR
 	tristate "Generic parallel-in/serial-out shift register"
 	help
@@ -1829,20 +1814,42 @@ config GPIO_XRA1403
 	help
 	  GPIO driver for EXAR XRA1403 16-bit SPI-based GPIO expander.
 
-config GPIO_MOXTET
-	tristate "Turris Mox Moxtet bus GPIO expander"
-	depends on MOXTET
-	help
-	  Say yes here if you are building for the Turris Mox router.
-	  This is the driver needed for configuring the GPIOs via the Moxtet
-	  bus. For example the Mox module with SFP cage needs this driver
-	  so that phylink can use corresponding GPIOs.
-
 endmenu
 
 menu "USB GPIO expanders"
 	depends on USB
 
+config GPIO_DLN2
+	tristate "Diolan DLN2 GPIO support"
+	depends on MFD_DLN2
+	select GPIOLIB_IRQCHIP
+
+	help
+	  Select this option to enable GPIO driver for the Diolan DLN2
+	  board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-dln2.
+
+config GPIO_LJCA
+	tristate "INTEL La Jolla Cove Adapter GPIO support"
+	depends on USB_LJCA
+	select GPIOLIB_IRQCHIP
+	default USB_LJCA
+	help
+	  Select this option to enable GPIO driver for the INTEL
+	  La Jolla Cove Adapter (LJCA) board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-ljca.
+
+config GPIO_MPSSE
+	tristate "FTDI MPSSE GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO driver for FTDI's MPSSE interface. These can do input and
+	  output. Each MPSSE provides 16 IO pins.
+
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
 	depends on MFD_VIPERBOARD
@@ -1854,13 +1861,6 @@ config GPIO_VIPERBOARD
 	  River Tech's viperboard.h for detailed meaning
 	  of the module parameters.
 
-config GPIO_MPSSE
-	tristate "FTDI MPSSE GPIO support"
-	select GPIOLIB_IRQCHIP
-	help
-	  GPIO driver for FTDI's MPSSE interface. These can do input and
-	  output. Each MPSSE provides 16 IO pins.
-
 endmenu
 
 menu "Virtual GPIO drivers"
-- 
2.43.0.rc1.1336.g36b5255a03ac


