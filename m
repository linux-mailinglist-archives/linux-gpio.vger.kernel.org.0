Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68787BA40F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbjJEQEz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237380AbjJEQEB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:04:01 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5E23C1D
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4065f29e933so11088345e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521464; x=1697126264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KF98XD2N9enITCzp5x0m+s3oAxJ9dcA8l+jff/+gtg=;
        b=pxCxXVuXMUB/vhZZ5SPljwyiphja5PBJTotySuR0udVt66Oi3XR9ZwrwC6jNAfmXMR
         L8sY39idmDtGPvuZIJNGQqTWCNfwof5D4Z1s58zcny5xK51DueBNdJWTNPXHsdwe5IG/
         4p0+8sBSakRRzOSran+totV2bBkOR/isbUjMHRF2F0g5ZTNIEUwM7hTS6ix8406e4coR
         tzCvB/cmyfoqrKwClROP74zEiuhSuP4XCmH1qS8Vi557W6LX4JjUvZnC5gonvno0Xz5f
         6OG8PAArOEHWdZ8fkw8YqxZ4fd1ulodi4n1K4OfMNSWH3JOD5O3m6BSIdSUpvthBzhsZ
         uBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521464; x=1697126264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KF98XD2N9enITCzp5x0m+s3oAxJ9dcA8l+jff/+gtg=;
        b=MEdKWoW8cRznBGTHL0A/qQsfKNkRHUvTXV3k580RE/f4kRJdVQlqzSt2wyMuD+E6Ze
         buMVEvjrEC9OvqaO1gHSdGUzEhve3TYZZ7DY7XI2XzJmVmdcUmEtLLa44jzlUL1IhpI5
         TvLBmFZfZJDjdGoIujVoKppfVThSZ6HTTvO68iV7C8D+iQ+XZqA7g34/lbeFpgvXU7P8
         41mKLtmBsbMu8T8lRMNOcv3orsU5rBMBaDI5QLT9Tfnte/Zk+MqQ2SAF9TiDSop3sQ5o
         2UGhCrOmS25uG54nNq9KV3+qcPoW8a3xo1cQNeYK8RY8g1mgT6sJWwODIK2kapQipx7k
         iLRg==
X-Gm-Message-State: AOJu0Yw6/U0USaHGTwiXSU36JnKlM4trPQBznxv1VfByIVJBb6ucRFpf
        0YBfh0vFPc785e0/p/8wMs8xCA==
X-Google-Smtp-Source: AGHT+IGn6q7XXxApydj1aa2AP1Qgc3n8I6IHk/iISwBufdoGA71YoVYo1kUbtOeZkQ5c5RqL1wwt1w==
X-Received: by 2002:a05:6000:1148:b0:314:1f1e:3a85 with SMTP id d8-20020a056000114800b003141f1e3a85mr4634832wrx.61.1696521463624;
        Thu, 05 Oct 2023 08:57:43 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:43 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 16/21] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date:   Thu,  5 Oct 2023 16:56:13 +0100
Message-ID: <20231005155618.700312-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the pin-controller found on the gs101
SoC used in Pixel 6 phones.

The alive blocks on this SoC also have a filter selection
register. Add support for this so the digital or delay filter
can be selected. If the filter selection is not available
then the default filter (digital) is applied.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |  68 +++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  44 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  24 +++
 5 files changed, 302 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..ae681725db26 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 	.ctrl		= fsd_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
 };
+
+/*
+ * bank type for non-alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ * (CONPDN bit field: 2, PUDPDN bit field: 4)
+ */
+static struct samsung_pin_bank_type bank_type_6  = {
+	.fld_width = { 4, 1, 4, 4, 2, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+/*
+ * bank type for alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ */
+static const struct samsung_pin_bank_type bank_type_7 = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
+/* pin banks of gs101 pin-controller (ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa0", 0x00, 0x00, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0x20, "gpa1", 0x04, 0x08, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 5, 0x40, "gpa2", 0x08, 0x10, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x60, "gpa3", 0x0c, 0x18, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x80, "gpa4", 0x10, 0x1c, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0xa0, "gpa5", 0x14, 0x20, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0xc0, "gpa9", 0x18, 0x28, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0xe0, "gpa10", 0x1c, 0x30, FLT_SELECTABLE),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa6", 0x00, 0x00, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x20, "gpa7", 0x04, 0x08, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x40, "gpa8", 0x08, 0x0c, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0x60, "gpa11", 0x0c, 0x14, FLT_SELECTABLE),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x0, "gps0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x20, "gps1", 0x04, 0x04, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 3, 0x40, "gps2", 0x08, 0x0c, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS9_PIN_BANK_EINTW(bank_type_7, 6, 0x0, "gps3", 0x00, 0x00, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0x0, "gpp0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp1", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x40, "gpp2", 0x08, 0x0c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x60, "gpp3", 0x0c, 0x10, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp4", 0x10, 0x14, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xa0, "gpp5", 0x14, 0x18, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xc0, "gpp6", 0x18, 0x1c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xe0, "gpp7", 0x1c, 0x20, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x100, "gpp8", 0x20, 0x24, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x120, "gpp9", 0x24, 0x28, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x140, "gpp10", 0x28, 0x2c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x160, "gpp11", 0x2c, 0x30, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x180, "gpp12", 0x30, 0x34, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1a0, "gpp13", 0x34, 0x38, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x1c0, "gpp14", 0x38, 0x3c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1e0, "gpp15", 0x3c, 0x40, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x200, "gpp16", 0x40, 0x44, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x220, "gpp17", 0x44, 0x48, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x240, "gpp18", 0x48, 0x4c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x260, "gpp19", 0x4c, 0x50, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x0, "gpp20", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp21", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x40, "gpp22", 0x08, 0x0c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x60, "gpp23", 0x0c, 0x10, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp24", 0x10, 0x18, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xa0, "gpp25", 0x14, 0x1c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0xc0, "gpp26", 0x18, 0x20, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xe0, "gpp27", 0x1c, 0x28, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 7, 0x20, "gph1", 0x04, 0x08, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph2", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x20, "gph3", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x40, "gph4", 0x08, 0x0c, FLT_DEFAULT),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC0) */
+		.pin_banks	= gs101_pin_peric0,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC1) */
+		.pin_banks	= gs101_pin_peric1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume	= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI1) */
+		.pin_banks	= gs101_pin_hsi1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI2) */
+		.pin_banks	= gs101_pin_hsi2,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
+	.ctrl		= gs101_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index a8212fc126bf..0c6c3312abb7 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -269,6 +269,50 @@ struct exynos_eint_gpio_save {
 	u32 eint_mask;
 };
 
+static void exynos_eint_flt_config(int sel, int width,
+				   struct samsung_pinctrl_drv_data *d,
+				   struct samsung_pin_bank *bank)
+{
+	unsigned int flt_reg, flt_con = 0;
+	unsigned int val, shift;
+	int i;
+	int loop_cnt;
+
+	flt_con |= EXYNOS_FLTCON_EN;
+
+	if (sel)
+		flt_con |= EXYNOS_FLTCON_SEL_DIGITAL;
+
+	flt_con |= EXYNOS_FLTCON_WIDTH(width);
+
+	flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
+
+	if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
+		/*
+		 * if nr_pins > 4, we should set FLTCON0 register fully.
+		 * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
+		 */
+		loop_cnt = 4;
+	else
+		loop_cnt = bank->nr_pins;
+
+	val = readl(d->virt_base + flt_reg);
+
+	for (i = 0; i < loop_cnt; i++) {
+		shift = i * EXYNOS_FLTCON_LEN;
+		val &= ~(EXYNOS_FLTCON_MASK << shift);
+		val |= (flt_con << shift);
+	}
+
+	writel(val, d->virt_base + flt_reg);
+
+	/* if nr_pins > 4, we should also set FLTCON1 register like FLTCON0.
+	 * (pin4 ~ )
+	 */
+	if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
+		writel(val, d->virt_base + flt_reg + 0x4);
+}
+
 /*
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
@@ -321,6 +365,10 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			goto err_domains;
 		}
 
+		/* Set Delay Analog Filter */
+		if (bank->fltcon_type != FLT_DEFAULT)
+			exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
+					       0, d, bank);
 	}
 
 	return 0;
@@ -555,6 +603,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (bank->eint_type != EINT_TYPE_WKUP)
 			continue;
 
+		/* Set Digital Filter */
+		if (bank->fltcon_type != FLT_DEFAULT)
+			exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
+					       0, d, bank);
+
 		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
 					      GFP_KERNEL);
 		if (!bank->irq_chip) {
@@ -658,6 +711,7 @@ static void exynos_pinctrl_suspend_bank(
 void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 {
 	struct samsung_pin_bank *bank = drvdata->pin_banks;
+	struct samsung_pinctrl_drv_data *d = bank->drvdata;
 	struct exynos_irq_chip *irq_chip = NULL;
 	int i;
 
@@ -665,6 +719,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 		if (bank->eint_type == EINT_TYPE_GPIO)
 			exynos_pinctrl_suspend_bank(drvdata, bank);
 		else if (bank->eint_type == EINT_TYPE_WKUP) {
+			/* Setting Delay (Analog) Filter */
+			if (bank->fltcon_type != FLT_DEFAULT)
+				exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
+						       0, d, bank);
 			if (!irq_chip) {
 				irq_chip = bank->irq_chip;
 				irq_chip->set_eint_wakeup_mask(drvdata,
@@ -707,11 +765,19 @@ static void exynos_pinctrl_resume_bank(
 void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
 {
 	struct samsung_pin_bank *bank = drvdata->pin_banks;
+	struct samsung_pinctrl_drv_data *d = bank->drvdata;
 	int i;
 
 	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
-		if (bank->eint_type == EINT_TYPE_GPIO)
+		if (bank->eint_type == EINT_TYPE_GPIO) {
 			exynos_pinctrl_resume_bank(drvdata, bank);
+		} else if (bank->eint_type == EINT_TYPE_WKUP ||
+			bank->eint_type == EINT_TYPE_WKUP_MUX) {
+			/* Set Digital Filter */
+			if (bank->fltcon_type != FLT_DEFAULT)
+				exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
+						       0, d, bank);
+		}
 }
 
 static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7bd6d82c9f36..aafd8f9f52f8 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -16,6 +16,8 @@
 #ifndef __PINCTRL_SAMSUNG_EXYNOS_H
 #define __PINCTRL_SAMSUNG_EXYNOS_H
 
+#include <linux/bitfield.h>
+
 /* Values for the pin CON register */
 #define EXYNOS_PIN_CON_FUNC_EINT	0xf
 
@@ -50,6 +52,14 @@
 
 #define EXYNOS_EINT_MAX_PER_BANK	8
 #define EXYNOS_EINT_NR_WKUP_EINT
+/* EINT filter configuration */
+#define EXYNOS_FLTCON_EN		BIT(7)
+#define EXYNOS_FLTCON_SEL_DIGITAL	BIT(6)
+#define EXYNOS_FLTCON_SEL_DELAY		0
+#define EXYNOS_FLTCON_WIDTH(x)		((x) & 0x3f)
+#define EXYNOS_FLTCON_MASK		0xFF
+#define EXYNOS_FLTCON_LEN		8
+#define EXYNOS_FLTCON_NR_PIN		4
 
 #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
 	{						\
@@ -140,6 +150,40 @@
 		.name		= id				\
 	}
 
+#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)	\
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_NONE,	\
+		.fltcon_type	= FLT_DEFAULT		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_GPIO,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = fltcontype,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_WKUP,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = fltcontype,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index e54847040b4a..12176f98440d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1104,6 +1104,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_func = bdata->eint_func;
 		bank->eint_type = bdata->eint_type;
 		bank->eint_mask = bdata->eint_mask;
+		bank->fltcon_type = bdata->fltcon_type;
+		bank->fltcon_offset = bdata->fltcon_offset;
 		bank->eint_offset = bdata->eint_offset;
 		bank->name = bdata->name;
 
@@ -1319,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynosautov9_of_data },
 	{ .compatible = "tesla,fsd-pinctrl",
 		.data = &fsd_of_data },
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 9af93e3d8d9f..e62e909fb10d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -82,6 +82,21 @@ enum eint_type {
 	EINT_TYPE_WKUP_MUX,
 };
 
+/**
+ * enum fltcon_type - filter selection
+ * @FLT_DEFAULT: filter not selectable, default digital filter
+ * @FLT_SELECT: filter selectable (digital or delay)
+ *
+ * Some banks on some SoCs (gs101 and possibly others) have a selectable
+ * filter on alive banks of 'delay/analog' or 'digital'. If the filter
+ * selection is not available then the default filter is used (digital).
+ */
+
+enum fltcon_type {
+	FLT_DEFAULT,
+	FLT_SELECTABLE,
+};
+
 /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
 #define PIN_NAME_LENGTH	10
 
@@ -122,6 +137,8 @@ struct samsung_pin_bank_type {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @fltcon_type: whether the filter (delay/digital) is selectable
+ * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -133,6 +150,8 @@ struct samsung_pin_bank_data {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	enum fltcon_type fltcon_type;
+	u32		fltcon_offset;
 	const char	*name;
 };
 
@@ -147,6 +166,8 @@ struct samsung_pin_bank_data {
  * @eint_type: type of the external interrupt supported by the bank.
  * @eint_mask: bit mask of pins which support EINT function.
  * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
+ * @fltcon_type: whether the filter (delay/digital) is selectable
+ * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
  * @name: name to be prefixed for each pin in this pin bank.
  * @pin_base: starting pin number of the bank.
  * @soc_priv: per-bank private data for SoC-specific code.
@@ -169,6 +190,8 @@ struct samsung_pin_bank {
 	enum eint_type	eint_type;
 	u32		eint_mask;
 	u32		eint_offset;
+	enum fltcon_type fltcon_type;
+	u32		fltcon_offset;
 	const char	*name;
 
 	u32		pin_base;
@@ -351,6 +374,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.42.0.582.g8ccd20d70d-goog

