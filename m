Return-Path: <linux-gpio+bounces-27607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE3C096A1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 18:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 082784F1485
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 16:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747C13043CA;
	Sat, 25 Oct 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1QSACSE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6DF304963;
	Sat, 25 Oct 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408894; cv=none; b=MHeWf5WiM8J7C01j0sd3x0VpADbotA0byNAk+fn2LttiUpz2qBi0m8R6Xol5+vOGzOO6/jRczWWjSPzdhnuzPAG8YwVGoASP368KAx/RGbOAM4EuoxMyOonTLeDpckCjDyUjP+ovLnO1378sqX2bOjuT/Im0bJroBlFlKRMLyGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408894; c=relaxed/simple;
	bh=Q14Kb12jbMwWRLMErDN4yu+E8BEZvnucMPRiscpAUjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AD8SiELFgeheLlY6AYRZWN8i8ijikI8Uxd38c/I+I1b54QZwYHnuUheA8KMAG3psVoBF5dz4Vwy1InjvohgLirEd5cvTj8VJRO1G/pEl/PH43B6Svvx0KSFjYUttikscW63VNyj6QCt00xbG7pUO+Vm49gM5yR3fJg41ytSZNFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1QSACSE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6A6C4CEFB;
	Sat, 25 Oct 2025 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408894;
	bh=Q14Kb12jbMwWRLMErDN4yu+E8BEZvnucMPRiscpAUjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1QSACSEh/M90p4Y50YEQNZAmLJtJmye7D3UnP99rTIdGkw/6L1QJDfDxM6La057Y
	 eNRSomVmZt483w0uOGRLQNE8mfyXX4QhFSJRf+yXK4xZQygoN5FLG4wZSSdpPNFPgf
	 0CkUQRqefKUQ35Fo7jHjIV7iewXy5yRGgS4X98LWO146kOjG7vDEGZpgkNC7nC7piE
	 R1HbyWecqPXJ9Ifr/hPEKUUFlbikrh5TtQ0H3UxGNF9R5nbjvXDU3te9KFfxRA6w6e
	 b3MxrV5L9CtkmBFQy6qjRCP3CMmz7cuVsfoCKd4w6k20AnJY3u3THpoL8plMh29WxV
	 IILWGrp6p+MVA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] media: em28xx: add special case for legacy gpiolib interface
Date: Sat, 25 Oct 2025 11:55:49 -0400
Message-ID: <20251025160905.3857885-118-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit d5d299e7e7f6b4ead31383d4abffca34e4296df0 ]

The em28xx driver uses the old-style gpio_request_one() interface to
switch the lna on the PCTV 290E card.

This interface is becoming optional and should no longer be called by
portable drivers. As I could not figure out an obvious replacement,
select the new GPIOLIB_LEGACY symbol as a workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: Prevents build breakage when `GPIOLIB=y` but the legacy
  GPIO consumer API is disabled. `gpio_request_one()` is only declared
  when `CONFIG_GPIOLIB_LEGACY` is enabled (see
  `include/linux/gpio.h:88`), so compiling code guarded only by
  `CONFIG_GPIOLIB` fails if legacy support is off.

- Code changes (small and contained):
  - Guards updated to match the actual availability of
    `gpio_request_one()`:
    - `drivers/media/usb/em28xx/em28xx-dvb.c:730` switches `#ifdef
      CONFIG_GPIOLIB` to `#ifdef CONFIG_GPIOLIB_LEGACY` in
      `em28xx_pctv_290e_set_lna()`, so the legacy-only API is used only
      when the legacy interface is present.
    - `drivers/media/usb/em28xx/em28xx-dvb.c:1708` does the same in
      `em28xx_dvb_init()` where the LNA is enabled on init for the PCTV
      290E.
  - Kconfig ensures the legacy API is pulled in when this driver
    configuration requires it:
    - `drivers/media/usb/em28xx/Kconfig:71` adds `select GPIOLIB_LEGACY
      if GPIOLIB && DVB_CXD2820R`.

- Behavior and scope:
  - If `GPIOLIB_LEGACY` is available, functionality is unchanged: the
    driver still toggles the LNA via `gpio_request_one()` and frees it.
  - If `GPIOLIB=y` but `GPIOLIB_LEGACY=n`, the code now cleanly compiles
    and falls back to a warning and no-op in
    `em28xx_pctv_290e_set_lna()` (see `drivers/media/usb/em28xx/em28xx-
    dvb.c:750`), avoiding a build error.
  - The Kconfig `select` line actively keeps legacy enabled for this
    combo, preserving LNA control where it mattered before.

- Risk assessment:
  - No architectural changes; purely Kconfig and preprocessor guards.
  - Touches only the em28xx media USB driver and its Kconfig.
  - Aligns with the tree-wide pattern where `gpio_request_one()` and
    friends are guarded by `CONFIG_GPIOLIB_LEGACY` (e.g.,
    `include/linux/gpio.h:88`, multiple existing users throughout the
    tree).
  - Minimal regression risk; at worst, adds the tiny legacy gpiolib-
    legacy code when selected by Kconfig.

- Stable criteria fit:
  - Fixes a real user-facing problem (build failure in valid configs).
  - Small, targeted, and low risk.
  - No new features; purely compatibility/build fix.

Note: Backport is relevant for stable series where
`CONFIG_GPIOLIB_LEGACY` exists and can be disabled. Older stable series
lacking this symbol won’t need (or may not accept) the Kconfig/guard
changes.

 drivers/media/usb/em28xx/Kconfig      | 1 +
 drivers/media/usb/em28xx/em28xx-dvb.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/Kconfig b/drivers/media/usb/em28xx/Kconfig
index cb61fd6cc6c61..3122d4bdfc596 100644
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
index 9fce59979e3bd..b94f5c70ab750 100644
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
2.51.0


