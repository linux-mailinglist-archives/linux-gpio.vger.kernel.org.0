Return-Path: <linux-gpio+bounces-24090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7EB1EBD3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D5F1898426
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DB0286D40;
	Fri,  8 Aug 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6MVeCi2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA6285417;
	Fri,  8 Aug 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666550; cv=none; b=jzkf2KpiCyRWYPHnW7QF45BHqePmKioI9AGYZf4F+WvDh+CFOd+dnmMzp35KtgZ0tbjqcERjs/N4ZinQLAwFDz2ICPYWcuN9jRZGXkSsV8orsJ9hd6KxRdLfoXD8GAN83kWhs/Fse07h7ljMyf+ECclpDKjKnT4vkhX+l/OPptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666550; c=relaxed/simple;
	bh=76MpyQgmZefPDK6A+dtSLh6pRCK3T1QGcQVGiHd0WN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ab5auPOwjrOvmrMyP6045eqUPJ6L0mwuR9EJFxcjjynBDI0hd/u8IUuJvt+vlypOmgrO7jv96IdBkILaE+4jaaK+BTPLlXDsL4O2q2e8si/mhQCAhXqjV5GPvqcZmp1tjeAANpZwdUL72Tdj79COC0nWqGSXgdxWwiAKiVdTPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6MVeCi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA8CC4CEF4;
	Fri,  8 Aug 2025 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666550;
	bh=76MpyQgmZefPDK6A+dtSLh6pRCK3T1QGcQVGiHd0WN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6MVeCi2p+89sktC3Hd+gd36a4WmsiSoctBr7nropIwhx3JsxONcVsUb27Twlj2ad
	 6513Z6xGJT7mmKhOfnlhcw78otf/eSI9YUq5J4wKQ7ZSxHaiVB7n5ZgQ4Laz0XhdXe
	 OvSddarraZ76jsZjjVS7NA7i247P5MlbzUl1wavs//p/IapWxWCO4eSdlygopN5/U7
	 IJRbgretxjSIAQGKCOHE1LNYldK++10EkVV5cMadQOc2aemMm/O1cdveMGVFkna2yJ
	 NkKVD/VCjTYelzD/qBkHuzhjY6hORA1Hy33sYDfMYEJ2L5juYpuMJq4hZXUuhkFfDN
	 xD1qMCj0XebnA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/21] media: em28xx: add special case for legacy gpiolib interface
Date: Fri,  8 Aug 2025 17:17:55 +0200
Message-Id: <20250808151822.536879-12-arnd@kernel.org>
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

The em28xx driver uses the old-style gpio_request_one() inteface to
switch the lna on the PCTV 290E card.

This interface is becoming optional and should no longer be called by
portable drivers. As I could not figure out an obvious replacement,
select the new GPIOLIB_LEGACY symbol as a workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/usb/em28xx/Kconfig      | 1 +
 drivers/media/usb/em28xx/em28xx-dvb.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/Kconfig b/drivers/media/usb/em28xx/Kconfig
index cb61fd6cc6c6..3122d4bdfc59 100644
--- a/drivers/media/usb/em28xx/Kconfig
+++ b/drivers/media/usb/em28xx/Kconfig
@@ -68,6 +68,7 @@ config VIDEO_EM28XX_DVB
 	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MXL692 if MEDIA_SUBDRV_AUTOSELECT
+	select GPIOLIB_LEGACY if GPIOLIB && DVB_CXD2820R
 	help
 	  This adds support for DVB cards based on the
 	  Empiatech em28xx chips.
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 9fce59979e3b..b94f5c70ab75 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -727,7 +727,7 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
 	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
 	struct em28xx *dev = i2c_bus->dev;
-#ifdef CONFIG_GPIOLIB
+#ifdef CONFIG_GPIOLIB_LEGACY
 	struct em28xx_dvb *dvb = dev->dvb;
 	int ret;
 	unsigned long flags;
@@ -1705,7 +1705,7 @@ static int em28xx_dvb_init(struct em28xx *dev)
 				goto out_free;
 			}
 
-#ifdef CONFIG_GPIOLIB
+#ifdef CONFIG_GPIOLIB_LEGACY
 			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
 			result = gpio_request_one(dvb->lna_gpio,
 						  GPIOF_OUT_INIT_LOW, NULL);
-- 
2.39.5


