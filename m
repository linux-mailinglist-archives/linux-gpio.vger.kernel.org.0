Return-Path: <linux-gpio+bounces-19564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED4AA7AEF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 22:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656EC4C6603
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 20:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DBB1FFC4B;
	Fri,  2 May 2025 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOVH7HFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4A1FAC48;
	Fri,  2 May 2025 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218155; cv=none; b=pCIXj2AbiMxJ+i9DSoPAlRqlbBra1SRbWcIbNKTvj/pNadJrDUI6D8qunoEOk37oHufjDPj1BIvDmn2OxMCyKHMH5d2SxkJFqL7G3kAR+YB7WCHth/jMByAkWIBhHe7wWq27Ips2oTSaWXnoYpFG97YdAu0D0KME6P/TqiV5OR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218155; c=relaxed/simple;
	bh=OOppDa2rWHuT3/mNFCrWvx/gMS4vFl2wkMmNU8XFVfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQt2TwoRLtE9N8oqBbYf8dfWQ3EfGbVgCDygsvTmJx5zfgSHwQDtIDeBRVn2Q1U4CPoRARP2gwlCK+Dwzn/MBdkQMUNjp+us0yHQqi9ej8rXWlNboG28vPNSMpRiZjrnAZ6mGJRseX3jUWOf++uhnw5FqO5tIaJEy6ACMy1ruf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOVH7HFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBACC4CEE4;
	Fri,  2 May 2025 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218155;
	bh=OOppDa2rWHuT3/mNFCrWvx/gMS4vFl2wkMmNU8XFVfU=;
	h=From:To:Cc:Subject:Date:From;
	b=EOVH7HFThBDK9vp/H27RTkGmKOelB8GA9JkYzV7E3yrqSW91A6ObbWdtmjMXwLlmY
	 E/dl6TEPy6VWGK5vhnY0RbEkbnMW0SGmDItFZyovc16hoeyKah1byni8Bep97taOCQ
	 AO1xxNB9ODCGA+YuVjXxhNOke1fLYngFETHspTK7YCZjvvXKHsLb9l9boOPwZw7EjJ
	 fD08tus++T4h4Bv+tGTBN1FumC4RpMi7zvr2tyQ8GllYIbnYEtmcFjpGtcqFH1xYpj
	 NWKw/QGcUDZ1SkP5uKpZt+Ui6aPKTyPamK9AYbCguuIPcgYLLeGa+P79OKkto3+m7v
	 sYeRrtTEGSH1w==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: at91: fix CONFIG_OF dependency
Date: Fri,  2 May 2025 22:35:35 +0200
Message-Id: <20250502203550.2053573-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting OF_GPIO is not allowed when CONFIG_OF is disabled:

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - PINCTRL_AT91 [=y] && PINCTRL [=y] && (OF [=n] && ARCH_AT91 || COMPILE_TEST [=y])

WARNING: unmet direct dependencies detected for MFD_STMFX
  Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
  Selected by [y]:
  - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

WARNING: unmet direct dependencies detected for GPIO_SYSCON
  Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
  Selected by [y]:
  - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

Add back the unconditional CONFIG_OF dependency, but leave COMPILE_TEST
as an option when that is enabled.

Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index db84d80b7e7d..5d368fb66115 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -103,7 +103,8 @@ config PINCTRL_AS3722
 
 config PINCTRL_AT91
 	bool "AT91 pinctrl driver"
-	depends on (OF && ARCH_AT91) || COMPILE_TEST
+	depends on ARCH_AT91 || COMPILE_TEST
+	depends on OF
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-- 
2.39.5


