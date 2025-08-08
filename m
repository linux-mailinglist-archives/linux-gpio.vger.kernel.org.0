Return-Path: <linux-gpio+bounces-24084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A88B1EB82
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09F9F4E48AD
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3242D283CA2;
	Fri,  8 Aug 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWsIAYmP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74D236A73;
	Fri,  8 Aug 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666435; cv=none; b=Ti54lXAjFP+6Q7BeAQNjzNEiBrozk67w2aslfqz6M924quNXhpcrFIM8T5PGj7+YkDQDjJiONBnM42x33Gt+Go5atDwRbBAkpUcsV2JHA11dp5NblRrwp4rCpPmsr8+3Y20hEJcg0DmFBvDSDjePk6/TUzgyrumow5AsTix6/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666435; c=relaxed/simple;
	bh=vwCFqwUL01DNTrnN+v0UHsEkzjzYJynmCUZDf9U+qXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXf8ns4vFwjvdXGklMg91CiGfJLPARKlW12OxE7K6ajVirrj59I/+d32ePprC0/hrmIuwVyASg3gJjxBOIVgH9Gpz5BlriY9Jfd3hr/VwflqHI6OAoc+YP6pn4YvdW64RAQMKX1VIcwibi5mDhj872EQJIzuNYXkfxgBkEs/rgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWsIAYmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19096C4CEF4;
	Fri,  8 Aug 2025 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666434;
	bh=vwCFqwUL01DNTrnN+v0UHsEkzjzYJynmCUZDf9U+qXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWsIAYmPgoX9KoJprcyqYPkZJzJ4NLmZYeLDW9qUqdoXnr7+hMt79yMQWmshi9dBU
	 A6sxrbsXKH2jBtzwlcMN8UfNHTartAjNde06WnCAfIyaWLH6IujzoPV9trVL3wNr62
	 5RtFAVnf75Tpy3knWYF0anaro4MF1YiANqmma/7LgJQm3xVXFSNzGA/AUvAPgeQU6z
	 P1D808bIJG+WyE4Flyn7Mo3fxyLvN5UapStY/U3l8ctPU/mzRJDlKcXSnHQ7DkTPxp
	 wDDftM/eBeIETvt9ARsjJLkuN1XqTSC0Q1eay4exXTgUTTn1BlG1GGEkTIObHzD0pk
	 rUg6kVFDdzOXQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 05/21] x86/platform: select legacy gpiolib interfaces where used
Date: Fri,  8 Aug 2025 17:17:49 +0200
Message-Id: <20250808151822.536879-6-arnd@kernel.org>
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
 drivers/input/misc/Kconfig                       | 3 +++
 drivers/platform/x86/Kconfig                     | 3 +++
 drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 0fb21c99a5e3..681d4123ef2b 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -860,6 +860,9 @@ config INPUT_IDEAPAD_SLIDEBAR
 config INPUT_SOC_BUTTON_ARRAY
 	tristate "Windows-compatible SoC Button Array"
 	depends on KEYBOARD_GPIO && ACPI
+	depends on X86
+	depends on GPIOLIB
+	select GPIOLIB_LEGACY
 	help
 	  Say Y here if you have a SoC-based tablet that originally runs
 	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 6d238e120dce..979a2fce8fc1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -309,6 +309,7 @@ config MERAKI_MX100
 	depends on GPIOLIB
 	depends on GPIO_ICH
 	depends on LEDS_CLASS
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO
 	help
 	  This driver provides support for the front button and LEDs on
@@ -564,6 +565,7 @@ config PCENGINES_APU2
 	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
 	depends on LEDS_CLASS
 	select GPIO_AMD_FCH
+	select GPIOLIB_LEGACY
 	select KEYBOARD_GPIO_POLLED
 	select LEDS_GPIO
 	help
@@ -591,6 +593,7 @@ config PORTWELL_EC
 config BARCO_P50_GPIO
 	tristate "Barco P50 GPIO driver for identify LED/button"
 	depends on GPIOLIB
+	select GPIOLIB_LEGACY
 	help
 	  This driver provides access to the GPIOs for the identify button
 	  and led present on Barco P50 board.
diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 193da15ee01c..54fa6112c9ea 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
 	depends on I2C && SPI && SERIAL_DEV_BUS
 	depends on GPIOLIB && PMIC_OPREGION
 	depends on ACPI && EFI && PCI
+	select GPIOLIB_LEGACY
 	select NEW_LEDS
 	select LEDS_CLASS
 	select POWER_SUPPLY
-- 
2.39.5


