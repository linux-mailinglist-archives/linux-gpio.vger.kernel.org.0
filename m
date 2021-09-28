Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D757F41BB77
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 01:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243438AbhI1X7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 19:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243523AbhI1X65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 19:58:57 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98DEC0613E5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:10 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id l3-20020a05620a28c300b0045db8137fa9so3140710qkp.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=h43D/RGXCRAHCvT6PHRIQgGhpZoIfzzJQ0XUHpA3FZ4=;
        b=Kfvq2JNsvB7vtKyUaDX4jqIiYB0c0k/ncTX72Jn0ep0oLkyNfDMqskUycmmcFaWh8W
         O9i9NTtxlP8xSvDnPYw2O1ADcJV5K3HzMPQ6Mi+aCvM+71xUx91y2CmDQCs630eNp2HG
         HiROZzIiqx9M/De8w6qGqbAmUaUghdeIb66EXZ2wRAeMlqa8A7AjmsvhosKVDtgRUS2O
         RmGKpXHLSfU1qQRwJ0Mv42csJyXE8zrUIdkaP3fpR+DwnMr8+FzDTVR5rbQAZjH9EzQ5
         Xudn/NmNdT0ynKeGG+LTW3m45tZNlVB1za72d1hyaAzNLeh5HQQztowObP91nWzaFCP1
         S9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=h43D/RGXCRAHCvT6PHRIQgGhpZoIfzzJQ0XUHpA3FZ4=;
        b=gsqV9wTCHuN2dgvhJAd/ELQENXCGAx7KumBD1v/OZdM0VO1YxgQsCcECrDI6HlJsD3
         H08y/ON0pFpvYDNFH8s+t6YR9GKLCjVFWbHmT2EcNt7AaIkNTrmBY1YWcaXstmUJ474P
         apDzabMKaiwlXtxX/s8yyK4iOmn9mRV4WkHqz520RuO/ROnJbWMd0XaYgvdogWeKLohQ
         XKt0bbOqKtA5cj/lKZgto92KzFekF8Ksy8pMB76cq2PduSW8PUxM3c7uBhz61PmsC3O9
         TWO9ev+t6DA8j5/Ulv61vHw2N/Tszo0G0l9JKrV7mZ3T1lpQQipKXXa0Khd2sHHHAqU/
         DxJA==
X-Gm-Message-State: AOAM533tXLbICwdesMk7uYr8huUMV+qA34VOGGkYE6mVIwToL72Hu3I0
        WPM/V/sGsFKmDbQ3A0ePfxAXhZMhTrUtdfLwq18=
X-Google-Smtp-Source: ABdhPJzIrF4RQxOepwiQDeOarh65fq//wgbM5LDo7bwOD+UWYA70CVSqPO8EBAL06DKxo/8AXVRCBMJP2rm3OGyWQm4=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:ad4:466a:: with SMTP id
 z10mr328044qvv.7.1632873429872; Tue, 28 Sep 2021 16:57:09 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:25 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-9-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 08/12] pinctrl: samsung: modularize the ARM and ARM64 pinctrls
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch modularizes the Samsung Exynos ARM and ARM64 pinctrl drivers.
It creates 2 kernel modules (pending Kconfig changes):

1) pinctrl-samsung.ko: common pinctrl driver for all the samsung pinctrl
   drivers.
2) pinctrl_exynos.ko: ARM and ARM64 pinctrl driver.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/pinctrl/samsung/Makefile              |  13 +--
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c  | 102 ++++++++++--------
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  73 +++++++------
 drivers/pinctrl/samsung/pinctrl-exynos.c      |  17 +--
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  11 +-
 5 files changed, 117 insertions(+), 99 deletions(-)

diff --git a/drivers/pinctrl/samsung/Makefile b/drivers/pinctrl/samsung/Makefile
index ed951df6a112..767ce3357a19 100644
--- a/drivers/pinctrl/samsung/Makefile
+++ b/drivers/pinctrl/samsung/Makefile
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # Samsung pin control drivers
 
-obj-$(CONFIG_PINCTRL_SAMSUNG)	+= pinctrl-samsung.o
-obj-$(CONFIG_PINCTRL_EXYNOS)	+= pinctrl-exynos.o
-obj-$(CONFIG_PINCTRL_EXYNOS_ARM)	+= pinctrl-exynos-arm.o
-obj-$(CONFIG_PINCTRL_EXYNOS_ARM64)	+= pinctrl-exynos-arm64.o
-obj-$(CONFIG_PINCTRL_S3C24XX)	+= pinctrl-s3c24xx.o
-obj-$(CONFIG_PINCTRL_S3C64XX)	+= pinctrl-s3c64xx.o
+obj-$(CONFIG_PINCTRL_SAMSUNG)			+= pinctrl-samsung.o
+obj-$(CONFIG_PINCTRL_EXYNOS)			+= pinctrl_exynos.o
+pinctrl_exynos-y				+= pinctrl-exynos.o
+pinctrl_exynos-$(CONFIG_PINCTRL_EXYNOS_ARM)	+= pinctrl-exynos-arm.o
+pinctrl_exynos-$(CONFIG_PINCTRL_EXYNOS_ARM64)	+= pinctrl-exynos-arm64.o
+obj-$(CONFIG_PINCTRL_S3C24XX)			+= pinctrl-s3c24xx.o
+obj-$(CONFIG_PINCTRL_S3C64XX)			+= pinctrl-s3c64xx.o
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 85ddf49a5188..f3bd8cf1bbb6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -83,12 +83,12 @@ s5pv210_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 	return ctrl;
 }
 
-static const struct samsung_retention_data s5pv210_retention_data __initconst = {
+static const struct samsung_retention_data s5pv210_retention_data = {
 	.init	 = s5pv210_retention_init,
 };
 
 /* pin banks of s5pv210 pin-controller */
-static const struct samsung_pin_bank_data s5pv210_pin_bank[] __initconst = {
+static const struct samsung_pin_bank_data s5pv210_pin_bank[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(4, 0x020, "gpa1", 0x04),
@@ -126,7 +126,7 @@ static const struct samsung_pin_bank_data s5pv210_pin_bank[] __initconst = {
 	EXYNOS_PIN_BANK_EINTW(8, 0xc60, "gph3", 0x0c),
 };
 
-static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= s5pv210_pin_bank,
@@ -139,16 +139,17 @@ static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data s5pv210_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data s5pv210_of_data = {
 	.ctrl		= s5pv210_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(s5pv210_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(s5pv210_of_data);
 
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
 /* pin banks of exynos3250 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos3250_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos3250_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -160,7 +161,7 @@ static const struct samsung_pin_bank_data exynos3250_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos3250 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos3250_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos3250_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTN(8, 0x120, "gpe0"),
 	EXYNOS_PIN_BANK_EINTN(8, 0x140, "gpe1"),
@@ -196,7 +197,7 @@ static const u32 exynos3250_retention_regs[] = {
 	S5P_PAD_RET_SPI_OPTION,
 };
 
-static const struct samsung_retention_data exynos3250_retention_data __initconst = {
+static const struct samsung_retention_data exynos3250_retention_data = {
 	.regs	 = exynos3250_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos3250_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -208,7 +209,7 @@ static const struct samsung_retention_data exynos3250_retention_data __initconst
  * Samsung pinctrl driver data for Exynos3250 SoC. Exynos3250 SoC includes
  * two gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos3250_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos3250_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos3250_pin_banks0,
@@ -229,13 +230,14 @@ static const struct samsung_pin_ctrl exynos3250_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos3250_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos3250_of_data = {
 	.ctrl		= exynos3250_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos3250_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos3250_of_data);
 
 /* pin banks of exynos4210 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos4210_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos4210_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -256,7 +258,7 @@ static const struct samsung_pin_bank_data exynos4210_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos4210 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos4210_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos4210_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpj1", 0x04),
@@ -281,7 +283,7 @@ static const struct samsung_pin_bank_data exynos4210_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos4210 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos4210_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos4210_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTN(7, 0x000, "gpz"),
 };
@@ -296,7 +298,7 @@ static const u32 exynos4_retention_regs[] = {
 	S5P_PAD_RET_EBIB_OPTION,
 };
 
-static const struct samsung_retention_data exynos4_retention_data __initconst = {
+static const struct samsung_retention_data exynos4_retention_data = {
 	.regs	 = exynos4_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos4_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -309,7 +311,7 @@ static const u32 exynos4_audio_retention_regs[] = {
 	S5P_PAD_RET_MAUDIO_OPTION,
 };
 
-static const struct samsung_retention_data exynos4_audio_retention_data __initconst = {
+static const struct samsung_retention_data exynos4_audio_retention_data = {
 	.regs	 = exynos4_audio_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos4_audio_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -320,7 +322,7 @@ static const struct samsung_retention_data exynos4_audio_retention_data __initco
  * Samsung pinctrl driver data for Exynos4210 SoC. Exynos4210 SoC includes
  * three gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos4210_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos4210_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos4210_pin_banks0,
@@ -346,13 +348,14 @@ static const struct samsung_pin_ctrl exynos4210_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos4210_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos4210_of_data = {
 	.ctrl		= exynos4210_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos4210_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos4210_of_data);
 
 /* pin banks of exynos4x12 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos4x12_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos4x12_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -370,7 +373,7 @@ static const struct samsung_pin_bank_data exynos4x12_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos4x12 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos4x12_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos4x12_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x040, "gpk0", 0x08),
 	EXYNOS_PIN_BANK_EINTG(7, 0x060, "gpk1", 0x0c),
@@ -398,13 +401,13 @@ static const struct samsung_pin_bank_data exynos4x12_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos4x12 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos4x12_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos4x12_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
 };
 
 /* pin banks of exynos4x12 pin-controller 3 */
-static const struct samsung_pin_bank_data exynos4x12_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos4x12_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpv0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpv1", 0x04),
@@ -417,7 +420,7 @@ static const struct samsung_pin_bank_data exynos4x12_pin_banks3[] __initconst =
  * Samsung pinctrl driver data for Exynos4x12 SoC. Exynos4x12 SoC includes
  * four gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos4x12_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos4x12_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos4x12_pin_banks0,
@@ -453,13 +456,14 @@ static const struct samsung_pin_ctrl exynos4x12_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos4x12_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos4x12_of_data = {
 	.ctrl		= exynos4x12_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos4x12_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos4x12_of_data);
 
 /* pin banks of exynos5250 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos5250_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos5250_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -489,7 +493,7 @@ static const struct samsung_pin_bank_data exynos5250_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos5250 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos5250_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos5250_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(2, 0x020, "gpe1", 0x04),
@@ -503,7 +507,7 @@ static const struct samsung_pin_bank_data exynos5250_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos5250 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos5250_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos5250_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpv0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpv1", 0x04),
@@ -513,7 +517,7 @@ static const struct samsung_pin_bank_data exynos5250_pin_banks2[] __initconst =
 };
 
 /* pin banks of exynos5250 pin-controller 3 */
-static const struct samsung_pin_bank_data exynos5250_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos5250_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
 };
@@ -522,7 +526,7 @@ static const struct samsung_pin_bank_data exynos5250_pin_banks3[] __initconst =
  * Samsung pinctrl driver data for Exynos5250 SoC. Exynos5250 SoC includes
  * four gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos5250_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos5250_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos5250_pin_banks0,
@@ -558,13 +562,14 @@ static const struct samsung_pin_ctrl exynos5250_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos5250_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos5250_of_data = {
 	.ctrl		= exynos5250_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5250_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos5250_of_data);
 
 /* pin banks of exynos5260 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos5260_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos5260_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(4, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpa1", 0x04),
@@ -590,7 +595,7 @@ static const struct samsung_pin_bank_data exynos5260_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos5260 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos5260_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos5260_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpc0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpc1", 0x04),
@@ -600,7 +605,7 @@ static const struct samsung_pin_bank_data exynos5260_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos5260 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos5260_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos5260_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(4, 0x020, "gpz1", 0x04),
@@ -610,7 +615,7 @@ static const struct samsung_pin_bank_data exynos5260_pin_banks2[] __initconst =
  * Samsung pinctrl driver data for Exynos5260 SoC. Exynos5260 SoC includes
  * three gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos5260_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos5260_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos5260_pin_banks0,
@@ -636,13 +641,14 @@ static const struct samsung_pin_ctrl exynos5260_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos5260_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos5260_of_data = {
 	.ctrl		= exynos5260_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5260_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos5260_of_data);
 
 /* pin banks of exynos5410 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos5410_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos5410_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -682,7 +688,7 @@ static const struct samsung_pin_bank_data exynos5410_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos5410 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos5410_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos5410_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpj0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpj1", 0x04),
@@ -696,7 +702,7 @@ static const struct samsung_pin_bank_data exynos5410_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos5410 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos5410_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos5410_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpv0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpv1", 0x04),
@@ -706,7 +712,7 @@ static const struct samsung_pin_bank_data exynos5410_pin_banks2[] __initconst =
 };
 
 /* pin banks of exynos5410 pin-controller 3 */
-static const struct samsung_pin_bank_data exynos5410_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos5410_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
 };
@@ -715,7 +721,7 @@ static const struct samsung_pin_bank_data exynos5410_pin_banks3[] __initconst =
  * Samsung pinctrl driver data for Exynos5410 SoC. Exynos5410 SoC includes
  * four gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos5410_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos5410_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos5410_pin_banks0,
@@ -748,13 +754,14 @@ static const struct samsung_pin_ctrl exynos5410_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos5410_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos5410_of_data = {
 	.ctrl		= exynos5410_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5410_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos5410_of_data);
 
 /* pin banks of exynos5420 pin-controller 0 */
-static const struct samsung_pin_bank_data exynos5420_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos5420_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpy7", 0x00),
 	EXYNOS_PIN_BANK_EINTW(8, 0xC00, "gpx0", 0x00),
@@ -764,7 +771,7 @@ static const struct samsung_pin_bank_data exynos5420_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos5420 pin-controller 1 */
-static const struct samsung_pin_bank_data exynos5420_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos5420_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpc0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpc1", 0x04),
@@ -782,7 +789,7 @@ static const struct samsung_pin_bank_data exynos5420_pin_banks1[] __initconst =
 };
 
 /* pin banks of exynos5420 pin-controller 2 */
-static const struct samsung_pin_bank_data exynos5420_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos5420_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(2, 0x020, "gpe1", 0x04),
@@ -795,7 +802,7 @@ static const struct samsung_pin_bank_data exynos5420_pin_banks2[] __initconst =
 };
 
 /* pin banks of exynos5420 pin-controller 3 */
-static const struct samsung_pin_bank_data exynos5420_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos5420_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
@@ -809,7 +816,7 @@ static const struct samsung_pin_bank_data exynos5420_pin_banks3[] __initconst =
 };
 
 /* pin banks of exynos5420 pin-controller 4 */
-static const struct samsung_pin_bank_data exynos5420_pin_banks4[] __initconst = {
+static const struct samsung_pin_bank_data exynos5420_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
 };
@@ -830,7 +837,7 @@ static const u32 exynos5420_retention_regs[] = {
 	EXYNOS5420_PAD_RET_DRAM_COREBLK_OPTION,
 };
 
-static const struct samsung_retention_data exynos5420_retention_data __initconst = {
+static const struct samsung_retention_data exynos5420_retention_data = {
 	.regs	 = exynos5420_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos5420_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -842,7 +849,7 @@ static const struct samsung_retention_data exynos5420_retention_data __initconst
  * Samsung pinctrl driver data for Exynos5420 SoC. Exynos5420 SoC includes
  * four gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos5420_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos5420_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos5420_pin_banks0,
@@ -887,7 +894,8 @@ static const struct samsung_pin_ctrl exynos5420_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos5420_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos5420_of_data = {
 	.ctrl		= exynos5420_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5420_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos5420_of_data);
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index fe5f6046fbd5..9fb658c65b96 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -62,7 +62,7 @@ static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
 static atomic_t exynos_shared_retention_refcnt;
 
 /* pin banks of exynos5433 pin-controller - ALIVE */
-static const struct samsung_pin_bank_data exynos5433_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
 	EXYNOS5433_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
@@ -76,32 +76,32 @@ static const struct samsung_pin_bank_data exynos5433_pin_banks0[] __initconst =
 };
 
 /* pin banks of exynos5433 pin-controller - AUD */
-static const struct samsung_pin_bank_data exynos5433_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(7, 0x000, "gpz0", 0x00),
 	EXYNOS5433_PIN_BANK_EINTG(4, 0x020, "gpz1", 0x04),
 };
 
 /* pin banks of exynos5433 pin-controller - CPIF */
-static const struct samsung_pin_bank_data exynos5433_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(2, 0x000, "gpv6", 0x00),
 };
 
 /* pin banks of exynos5433 pin-controller - eSE */
-static const struct samsung_pin_bank_data exynos5433_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, "gpj2", 0x00),
 };
 
 /* pin banks of exynos5433 pin-controller - FINGER */
-static const struct samsung_pin_bank_data exynos5433_pin_banks4[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(4, 0x000, "gpd5", 0x00),
 };
 
 /* pin banks of exynos5433 pin-controller - FSYS */
-static const struct samsung_pin_bank_data exynos5433_pin_banks5[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks5[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(6, 0x000, "gph1", 0x00),
 	EXYNOS5433_PIN_BANK_EINTG(7, 0x020, "gpr4", 0x04),
@@ -112,19 +112,19 @@ static const struct samsung_pin_bank_data exynos5433_pin_banks5[] __initconst =
 };
 
 /* pin banks of exynos5433 pin-controller - IMEM */
-static const struct samsung_pin_bank_data exynos5433_pin_banks6[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks6[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(8, 0x000, "gpf0", 0x00),
 };
 
 /* pin banks of exynos5433 pin-controller - NFC */
-static const struct samsung_pin_bank_data exynos5433_pin_banks7[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks7[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, "gpj0", 0x00),
 };
 
 /* pin banks of exynos5433 pin-controller - PERIC */
-static const struct samsung_pin_bank_data exynos5433_pin_banks8[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks8[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(6, 0x000, "gpv7", 0x00),
 	EXYNOS5433_PIN_BANK_EINTG(5, 0x020, "gpb0", 0x04),
@@ -146,7 +146,7 @@ static const struct samsung_pin_bank_data exynos5433_pin_banks8[] __initconst =
 };
 
 /* pin banks of exynos5433 pin-controller - TOUCH */
-static const struct samsung_pin_bank_data exynos5433_pin_banks9[] __initconst = {
+static const struct samsung_pin_bank_data exynos5433_pin_banks9[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, "gpj1", 0x00),
 };
@@ -165,7 +165,7 @@ static const u32 exynos5433_retention_regs[] = {
 	EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION,
 };
 
-static const struct samsung_retention_data exynos5433_retention_data __initconst = {
+static const struct samsung_retention_data exynos5433_retention_data = {
 	.regs	 = exynos5433_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos5433_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -178,7 +178,7 @@ static const u32 exynos5433_audio_retention_regs[] = {
 	EXYNOS5433_PAD_RETENTION_AUD_OPTION,
 };
 
-static const struct samsung_retention_data exynos5433_audio_retention_data __initconst = {
+static const struct samsung_retention_data exynos5433_audio_retention_data = {
 	.regs	 = exynos5433_audio_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos5433_audio_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -192,7 +192,7 @@ static const u32 exynos5433_fsys_retention_regs[] = {
 	EXYNOS5433_PAD_RETENTION_MMC2_OPTION,
 };
 
-static const struct samsung_retention_data exynos5433_fsys_retention_data __initconst = {
+static const struct samsung_retention_data exynos5433_fsys_retention_data = {
 	.regs	 = exynos5433_fsys_retention_regs,
 	.nr_regs = ARRAY_SIZE(exynos5433_fsys_retention_regs),
 	.value	 = EXYNOS_WAKEUP_FROM_LOWPWR,
@@ -203,7 +203,7 @@ static const struct samsung_retention_data exynos5433_fsys_retention_data __init
  * Samsung pinctrl driver data for Exynos5433 SoC. Exynos5433 SoC includes
  * ten gpio/pin-mux/pinconfig controllers.
  */
-static const struct samsung_pin_ctrl exynos5433_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos5433_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 data */
 		.pin_banks	= exynos5433_pin_banks0,
@@ -288,13 +288,14 @@ static const struct samsung_pin_ctrl exynos5433_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos5433_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos5433_of_data = {
 	.ctrl		= exynos5433_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5433_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos5433_of_data);
 
 /* pin banks of exynos7 pin-controller - ALIVE */
-static const struct samsung_pin_bank_data exynos7_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
 	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
@@ -303,7 +304,7 @@ static const struct samsung_pin_bank_data exynos7_pin_banks0[] __initconst = {
 };
 
 /* pin banks of exynos7 pin-controller - BUS0 */
-static const struct samsung_pin_bank_data exynos7_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpc0", 0x04),
@@ -323,37 +324,37 @@ static const struct samsung_pin_bank_data exynos7_pin_banks1[] __initconst = {
 };
 
 /* pin banks of exynos7 pin-controller - NFC */
-static const struct samsung_pin_bank_data exynos7_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpj0", 0x00),
 };
 
 /* pin banks of exynos7 pin-controller - TOUCH */
-static const struct samsung_pin_bank_data exynos7_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpj1", 0x00),
 };
 
 /* pin banks of exynos7 pin-controller - FF */
-static const struct samsung_pin_bank_data exynos7_pin_banks4[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(4, 0x000, "gpg4", 0x00),
 };
 
 /* pin banks of exynos7 pin-controller - ESE */
-static const struct samsung_pin_bank_data exynos7_pin_banks5[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks5[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpv7", 0x00),
 };
 
 /* pin banks of exynos7 pin-controller - FSYS0 */
-static const struct samsung_pin_bank_data exynos7_pin_banks6[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks6[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpr4", 0x00),
 };
 
 /* pin banks of exynos7 pin-controller - FSYS1 */
-static const struct samsung_pin_bank_data exynos7_pin_banks7[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks7[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(4, 0x000, "gpr0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
@@ -362,7 +363,7 @@ static const struct samsung_pin_bank_data exynos7_pin_banks7[] __initconst = {
 };
 
 /* pin banks of exynos7 pin-controller - BUS1 */
-static const struct samsung_pin_bank_data exynos7_pin_banks8[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks8[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpf0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpf1", 0x04),
@@ -376,13 +377,13 @@ static const struct samsung_pin_bank_data exynos7_pin_banks8[] __initconst = {
 	EXYNOS_PIN_BANK_EINTG(3, 0x140, "gpv6", 0x24),
 };
 
-static const struct samsung_pin_bank_data exynos7_pin_banks9[] __initconst = {
+static const struct samsung_pin_bank_data exynos7_pin_banks9[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz0", 0x00),
 	EXYNOS_PIN_BANK_EINTG(4, 0x020, "gpz1", 0x04),
 };
 
-static const struct samsung_pin_ctrl exynos7_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos7_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 Alive data */
 		.pin_banks	= exynos7_pin_banks0,
@@ -436,13 +437,14 @@ static const struct samsung_pin_ctrl exynos7_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos7_of_data = {
 	.ctrl		= exynos7_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos7_of_data);
 
 /* pin banks of exynos850 pin-controller 0 (ALIVE) */
-static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
 	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
@@ -453,7 +455,7 @@ static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
 };
 
 /* pin banks of exynos850 pin-controller 1 (CMGP) */
-static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks1[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
 	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
@@ -466,27 +468,27 @@ static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
 };
 
 /* pin banks of exynos850 pin-controller 2 (AUD) */
-static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks2[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
 	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
 };
 
 /* pin banks of exynos850 pin-controller 3 (HSI) */
-static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks3[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
 };
 
 /* pin banks of exynos850 pin-controller 4 (CORE) */
-static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks4[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
 	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
 };
 
 /* pin banks of exynos850 pin-controller 5 (PERI) */
-static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
+static const struct samsung_pin_bank_data exynos850_pin_banks5[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
 	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
 	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
@@ -499,7 +501,7 @@ static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
 	EXYNOS850_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
 };
 
-static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
+static const struct samsung_pin_ctrl exynos850_pin_ctrl[] = {
 	{
 		/* pin-controller instance 0 ALIVE data */
 		.pin_banks	= exynos850_pin_banks0,
@@ -534,7 +536,8 @@ static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
 	},
 };
 
-const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
+const struct samsung_pinctrl_of_match_data exynos850_of_data = {
 	.ctrl		= exynos850_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
+EXPORT_SYMBOL_GPL(exynos850_of_data);
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0489c899b401..628c6e94d08c 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -20,6 +20,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/regmap.h>
@@ -207,7 +208,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 /*
  * irq_chip for gpio interrupts.
  */
-static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
+static const struct exynos_irq_chip exynos_gpio_irq_chip = {
 	.chip = {
 		.name = "exynos_gpio_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -275,7 +276,7 @@ struct exynos_eint_gpio_save {
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-__init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
+int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct samsung_pin_bank *bank;
 	struct device *dev = d->dev;
@@ -399,7 +400,7 @@ static u32 eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED;
 /*
  * irq_chip for wakeup interrupts
  */
-static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
+static const struct exynos_irq_chip s5pv210_wkup_irq_chip = {
 	.chip = {
 		.name = "s5pv210_wkup_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -419,7 +420,7 @@ static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
 	.set_eint_wakeup_mask = s5pv210_pinctrl_set_eint_wakeup_mask,
 };
 
-static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
+static const struct exynos_irq_chip exynos4210_wkup_irq_chip = {
 	.chip = {
 		.name = "exynos4210_wkup_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -438,7 +439,7 @@ static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
 
-static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
+static const struct exynos_irq_chip exynos7_wkup_irq_chip = {
 	.chip = {
 		.name = "exynos7_wkup_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -521,7 +522,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
  * exynos_eint_wkup_init() - setup handling of external wakeup interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-__init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
+int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
 	struct device_node *wkup_np = NULL;
@@ -760,3 +761,7 @@ exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
 
 	return ctrl;
 }
+
+MODULE_DESCRIPTION("Pinctrl common driver for Exynos, S3C24XX, and S3C64XX SoCs");
+MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 2a0fc63516f1..7a5f1363d0d1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
@@ -1299,8 +1300,8 @@ static struct platform_driver samsung_pinctrl_driver = {
 	},
 };
 
-static int __init samsung_pinctrl_drv_register(void)
-{
-	return platform_driver_register(&samsung_pinctrl_driver);
-}
-postcore_initcall(samsung_pinctrl_drv_register);
+module_platform_driver(samsung_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl common driver for Exynos, S3C24XX, and S3C64XX SoCs");
+MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0.685.g46640cef36-goog

