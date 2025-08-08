Return-Path: <linux-gpio+bounces-24080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25058B1EB80
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B995A18862B3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AF12836A0;
	Fri,  8 Aug 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZDkKsGx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F3283145;
	Fri,  8 Aug 2025 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666373; cv=none; b=VSOG6tGgcamWcIAEo1LSwmXiWa31Lpo3Xfr4qFCzORltSjAEcJ2YbCa1jXyoqtTKzt1LYLuxZ3qei52noKGqaKjrH69ruJ9ubX1kZxDxg325TPHGPXU0zd9245KJB2/AsZodoCTGGxKcf6ausRQy+AgtsFTOhlQ08WmOyirRA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666373; c=relaxed/simple;
	bh=Ju9ikKO/kXioH3zFMYDsXK5SYo/GY0u9aYwCAwLDTHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o5HBt/eilrDOzivOYnMwrLq0RFyDlo+MFl/glr8S5VtmJv4FFJOvT5jv84RFw01TwNhmKIOO6HKYM1vNl7qoktdA3aCYffDIFWPyYm+PbEQIiGxiKVz9f/m0LSzGOMGNcA8yzHvBgJgEyci2h/sm3c/BrirsmIu72L+8HTqPEX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZDkKsGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D830C4CEED;
	Fri,  8 Aug 2025 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666373;
	bh=Ju9ikKO/kXioH3zFMYDsXK5SYo/GY0u9aYwCAwLDTHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZDkKsGxlo+CoIVF5PBg1RRdrrokNpeq5e8oXCRGfjsa+Me+uZZjrBUefoLz7hUoI
	 cryi7PzlJmQtcEUjFyYcqtxjHCc7nN3EERuy9ejFB8kGqcANuSoTFaDCo8MpbF0orh
	 RpmR9uCBUrNuWRSMuILFdcB7LhWNUQ3s50gYbH6zj2w5W0Y8Z3GAarKNVXxrAapY28
	 x9z17JO+qeVCVkvkeSvGcgi+QhOQNkUpaiQtrAmkuseBXPjNsB4fua6oADqCKxdnZm
	 bZK3MWRz1kPyqB4hus5+KrVE5e/oElqN005mFeTwcwURBmktCR9TpVEnuHS8VzNxJB
	 iciki0XtEglLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 01/21] ARM: select legacy gpiolib interfaces where used
Date: Fri,  8 Aug 2025 17:17:45 +0200
Message-Id: <20250808151822.536879-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mv78xx0/Kconfig     | 1 +
 arch/arm/mach-orion5x/Kconfig     | 1 +
 arch/arm/mach-pxa/Kconfig         | 1 +
 arch/arm/mach-s3c/Kconfig.s3c64xx | 1 +
 arch/arm/mach-sa1100/Kconfig      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
index 9de3bbc09c3a..670e6587827e 100644
--- a/arch/arm/mach-mv78xx0/Kconfig
+++ b/arch/arm/mach-mv78xx0/Kconfig
@@ -6,6 +6,7 @@ menuconfig ARCH_MV78XX0
 	depends on ATAGS
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PLAT_ORION_LEGACY
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index ee449ca032d2..cef19bea6164 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_ORION5X
 	depends on CPU_LITTLE_ENDIAN
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PCI_QUIRKS
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 10e472f4fa43..66e26990e2c8 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -10,6 +10,7 @@ menuconfig ARCH_PXA
 	select CPU_XSCALE if !CPU_XSC3
 	select GPIO_PXA
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select PLAT_PXA
 	help
 	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 8f40af063ad6..3f97fba8e4f5 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -101,6 +101,7 @@ config MACH_WLF_CRAGG_6410
 	depends on ATAGS
 	depends on I2C=y
 	select CPU_S3C6410
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index 0fb4c24cfad5..e23700e0d6c8 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -13,6 +13,7 @@ menuconfig ARCH_SA1100
 	select CPU_FREQ
 	select CPU_SA1100
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select IRQ_DOMAIN
 	select ISA
 	select NEED_MACH_MEMORY_H
-- 
2.39.5


