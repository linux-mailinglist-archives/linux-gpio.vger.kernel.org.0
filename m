Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56B066199BE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 15:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbiKDO0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 10:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiKDO0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 10:26:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C0D3207D;
        Fri,  4 Nov 2022 07:23:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a13so7912868edj.0;
        Fri, 04 Nov 2022 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5leHAvAMKgnC2+BgnrD82f6NLmoxRTFJjB6icpFXwjg=;
        b=BYdn3+WgaavpZYuSVUISWdaAHBpkMihTFqo5GIIIesF7Ze9900ZlM4dv3TGrWoRtJW
         Sf2oFlFTUaQqNIJrtf1tDGv2lG5RbLMzlF9P1ZDw4ugtrUAQvDIstg34w63EQ7CbHWaV
         44f++LlOdgi/5zpkspWVF++Ai5YkMCUittXU7o5USm651YcSqLEVy+n1pWcbr5cR8sTP
         G7Hwkd35vVYQZXoAXatgzRBR5YpXkPCjYPYfWSLnADH5Wvdy9I+Kyr/jX6FN290+H+6j
         oyj2TyYVt9XDyQ6Yfa95q9AIhZpn79wV2yBZ9cO+lYPrH1QkptTE7xRpxTImppNd3Vr5
         SnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5leHAvAMKgnC2+BgnrD82f6NLmoxRTFJjB6icpFXwjg=;
        b=Q3ZXW48aRiL7JpgIC6DA5EA6sjqAnWlI7jc8iqbQhtqAq9peYvNvT91/YJXwr4d3UM
         WmGBcWlYBFpIVYT3B94O/bXePMteiHg3ff3sag3YlpocQy7NN4hPkJdaHVD6iMMZzxMx
         DvwYNFGe0FDUR6vsUkzUgRnqxIG+1EhlSq21uEF0/HkSik0Mm3woxFlZXFB3A17wtpgC
         bymSMohLhQiGBGnhOS5TjKOPkpfjbZuEn4R/1InkiG3t1d0gLgbjJ1sbS2ny/a25zgvV
         B04fbXQbDMGhpwaZkSoYxL2b12muAQT1n0oOiyl/dt3eevqbdNIbqK7aDHy4FjlaYPZ8
         NbYA==
X-Gm-Message-State: ACrzQf1EuwOlxU8rnvzFsjvRazTs0bcIJjTMGy5USSSAOyECI1gJEDkp
        c7U7xfy4nXmVtd7CbDhlqHd/gIu1L8I=
X-Google-Smtp-Source: AMsMyM4NZSxymotzE1IVQeKGOgPKRKG/zon6iAsRpptcNOILeY1IaI6Bc0ilxsvTbeCrdiiZofHlpw==
X-Received: by 2002:a50:ee87:0:b0:461:a09b:aae5 with SMTP id f7-20020a50ee87000000b00461a09baae5mr36832575edr.24.1667571835126;
        Fri, 04 Nov 2022 07:23:55 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i6-20020a1709063c4600b0078df3b4464fsm1895740ejg.19.2022.11.04.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:23:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/4] pinctrl: tegra: Separate Tegra194 instances
Date:   Fri,  4 Nov 2022 15:23:44 +0100
Message-Id: <20221104142345.1562750-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142345.1562750-1-thierry.reding@gmail.com>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has two separate instances of the pin controller, one called
AON (in the always-on domain) and another called "main". Instead of
treating them as a single pin controller, split them up into two
separate controllers. Doing so allows the mapping between the pinmux
and GPIO controllers to be trivial identity mappings and more cleanly
separates the AON from the main IP blocks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    |  33 ++-
 drivers/pinctrl/tegra/pinctrl-tegra.h    |   2 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 286 +++++++++++++----------
 3 files changed, 173 insertions(+), 148 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 834a2d50f89b..1729b7ddfa94 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -670,19 +670,6 @@ static const struct pinconf_ops tegra_pinconf_ops = {
 #endif
 };
 
-static struct pinctrl_gpio_range tegra_pinctrl_gpio_range = {
-	.name = "Tegra GPIOs",
-	.id = 0,
-	.base = 0,
-};
-
-static struct pinctrl_desc tegra_pinctrl_desc = {
-	.pctlops = &tegra_pinctrl_ops,
-	.pmxops = &tegra_pinmux_ops,
-	.confops = &tegra_pinconf_ops,
-	.owner = THIS_MODULE,
-};
-
 static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 {
 	int i = 0;
@@ -833,10 +820,18 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		}
 	}
 
-	tegra_pinctrl_gpio_range.npins = pmx->soc->ngpios;
-	tegra_pinctrl_desc.name = dev_name(&pdev->dev);
-	tegra_pinctrl_desc.pins = pmx->soc->pins;
-	tegra_pinctrl_desc.npins = pmx->soc->npins;
+	pmx->gpio_range.name = "Tegra GPIOs";
+	pmx->gpio_range.id = 0;
+	pmx->gpio_range.base = 0;
+	pmx->gpio_range.npins = pmx->soc->ngpios;
+
+	pmx->desc.pctlops = &tegra_pinctrl_ops;
+	pmx->desc.pmxops = &tegra_pinmux_ops;
+	pmx->desc.confops = &tegra_pinconf_ops;
+	pmx->desc.owner = THIS_MODULE;
+	pmx->desc.name = dev_name(&pdev->dev);
+	pmx->desc.pins = pmx->soc->pins;
+	pmx->desc.npins = pmx->soc->npins;
 
 	for (i = 0; ; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
@@ -862,7 +857,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 			return PTR_ERR(pmx->regs[i]);
 	}
 
-	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pmx);
+	pmx->pctl = devm_pinctrl_register(&pdev->dev, &pmx->desc, pmx);
 	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		return PTR_ERR(pmx->pctl);
@@ -871,7 +866,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	tegra_pinctrl_clear_parked_bits(pmx);
 
 	if (pmx->soc->ngpios > 0 && !tegra_pinctrl_gpio_node_has_range(pmx))
-		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
+		pinctrl_add_gpio_range(pmx->pctl, &pmx->gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index f8269858eb78..6130cba7cce5 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -15,6 +15,8 @@ struct tegra_pmx {
 	const struct tegra_pinctrl_soc_data *soc;
 	const char **group_pins;
 
+	struct pinctrl_gpio_range gpio_range;
+	struct pinctrl_desc desc;
 	int nbanks;
 	void __iomem **regs;
 	u32 *backup_regs;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index f6c5d5e6dbb6..277973c88434 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -16,6 +16,7 @@
 
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -23,7 +24,7 @@
 #include "pinctrl-tegra.h"
 
 /* Define unique ID for each pins */
-enum pin_id {
+enum {
 	TEGRA_PIN_DAP6_SCLK_PA0,
 	TEGRA_PIN_DAP6_DOUT_PA1,
 	TEGRA_PIN_DAP6_DIN_PA2,
@@ -189,6 +190,31 @@ enum pin_id {
 	TEGRA_PIN_SPI1_MOSI_PZ5,
 	TEGRA_PIN_SPI1_CS0_PZ6,
 	TEGRA_PIN_SPI1_CS1_PZ7,
+	TEGRA_PIN_UFS0_REF_CLK_PFF0,
+	TEGRA_PIN_UFS0_RST_PFF1,
+	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
+	TEGRA_PIN_PEX_L5_RST_N_PGG1,
+	TEGRA_PIN_DIRECTDC_COMP,
+	TEGRA_PIN_SDMMC4_CLK,
+	TEGRA_PIN_SDMMC4_CMD,
+	TEGRA_PIN_SDMMC4_DQS,
+	TEGRA_PIN_SDMMC4_DAT7,
+	TEGRA_PIN_SDMMC4_DAT6,
+	TEGRA_PIN_SDMMC4_DAT5,
+	TEGRA_PIN_SDMMC4_DAT4,
+	TEGRA_PIN_SDMMC4_DAT3,
+	TEGRA_PIN_SDMMC4_DAT2,
+	TEGRA_PIN_SDMMC4_DAT1,
+	TEGRA_PIN_SDMMC4_DAT0,
+	TEGRA_PIN_SDMMC1_COMP,
+	TEGRA_PIN_SDMMC1_HV_TRIM,
+	TEGRA_PIN_SDMMC3_COMP,
+	TEGRA_PIN_SDMMC3_HV_TRIM,
+	TEGRA_PIN_EQOS_COMP,
+	TEGRA_PIN_QSPI_COMP,
+};
+
+enum {
 	TEGRA_PIN_CAN1_DOUT_PAA0,
 	TEGRA_PIN_CAN1_DIN_PAA1,
 	TEGRA_PIN_CAN0_DOUT_PAA2,
@@ -219,28 +245,6 @@ enum pin_id {
 	TEGRA_PIN_POWER_ON_PEE4,
 	TEGRA_PIN_PWR_I2C_SCL_PEE5,
 	TEGRA_PIN_PWR_I2C_SDA_PEE6,
-	TEGRA_PIN_UFS0_REF_CLK_PFF0,
-	TEGRA_PIN_UFS0_RST_PFF1,
-	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
-	TEGRA_PIN_PEX_L5_RST_N_PGG1,
-	TEGRA_PIN_DIRECTDC_COMP,
-	TEGRA_PIN_SDMMC4_CLK,
-	TEGRA_PIN_SDMMC4_CMD,
-	TEGRA_PIN_SDMMC4_DQS,
-	TEGRA_PIN_SDMMC4_DAT7,
-	TEGRA_PIN_SDMMC4_DAT6,
-	TEGRA_PIN_SDMMC4_DAT5,
-	TEGRA_PIN_SDMMC4_DAT4,
-	TEGRA_PIN_SDMMC4_DAT3,
-	TEGRA_PIN_SDMMC4_DAT2,
-	TEGRA_PIN_SDMMC4_DAT1,
-	TEGRA_PIN_SDMMC4_DAT0,
-	TEGRA_PIN_SDMMC1_COMP,
-	TEGRA_PIN_SDMMC1_HV_TRIM,
-	TEGRA_PIN_SDMMC3_COMP,
-	TEGRA_PIN_SDMMC3_HV_TRIM,
-	TEGRA_PIN_EQOS_COMP,
-	TEGRA_PIN_QSPI_COMP,
 	TEGRA_PIN_SYS_RESET_N,
 	TEGRA_PIN_SHUTDOWN_N,
 	TEGRA_PIN_PMU_INT_N,
@@ -415,36 +419,6 @@ static const struct pinctrl_pin_desc tegra194_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_SPI1_MOSI_PZ5, "SPI1_MOSI_PZ5"),
 	PINCTRL_PIN(TEGRA_PIN_SPI1_CS0_PZ6, "SPI1_CS0_PZ6"),
 	PINCTRL_PIN(TEGRA_PIN_SPI1_CS1_PZ7, "SPI1_CS1_PZ7"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_DOUT_PAA0, "CAN1_DOUT_PAA0"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_DIN_PAA1, "CAN1_DIN_PAA1"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_DOUT_PAA2, "CAN0_DOUT_PAA2"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_DIN_PAA3, "CAN0_DIN_PAA3"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_STB_PAA4, "CAN0_STB_PAA4"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_EN_PAA5, "CAN0_EN_PAA5"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_WAKE_PAA6, "CAN0_WAKE_PAA6"),
-	PINCTRL_PIN(TEGRA_PIN_CAN0_ERR_PAA7, "CAN0_ERR_PAA7"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_STB_PBB0, "CAN1_STB_PBB0"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_EN_PBB1, "CAN1_EN_PBB1"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_WAKE_PBB2, "CAN1_WAKE_PBB2"),
-	PINCTRL_PIN(TEGRA_PIN_CAN1_ERR_PBB3, "CAN1_ERR_PBB3"),
-	PINCTRL_PIN(TEGRA_PIN_SPI2_SCK_PCC0, "SPI2_SCK_PCC0"),
-	PINCTRL_PIN(TEGRA_PIN_SPI2_MISO_PCC1, "SPI2_MISO_PCC1"),
-	PINCTRL_PIN(TEGRA_PIN_SPI2_MOSI_PCC2, "SPI2_MOSI_PCC2"),
-	PINCTRL_PIN(TEGRA_PIN_SPI2_CS0_PCC3, "SPI2_CS0_PCC3"),
-	PINCTRL_PIN(TEGRA_PIN_TOUCH_CLK_PCC4, "TOUCH_CLK_PCC4"),
-	PINCTRL_PIN(TEGRA_PIN_UART3_TX_PCC5, "UART3_TX_PCC5"),
-	PINCTRL_PIN(TEGRA_PIN_UART3_RX_PCC6, "UART3_RX_PCC6"),
-	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SCL_PCC7, "GEN2_I2C_SCL_PCC7"),
-	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SDA_PDD0, "GEN2_I2C_SDA_PDD0"),
-	PINCTRL_PIN(TEGRA_PIN_GEN8_I2C_SCL_PDD1, "GEN8_I2C_SCL_PDD1"),
-	PINCTRL_PIN(TEGRA_PIN_GEN8_I2C_SDA_PDD2, "GEN8_I2C_SDA_PDD2"),
-	PINCTRL_PIN(TEGRA_PIN_SAFE_STATE_PEE0, "SAFE_STATE_PEE0"),
-	PINCTRL_PIN(TEGRA_PIN_VCOMP_ALERT_PEE1, "VCOMP_ALERT_PEE1"),
-	PINCTRL_PIN(TEGRA_PIN_AO_RETENTION_N_PEE2, "AO_RETENTION_N_PEE2"),
-	PINCTRL_PIN(TEGRA_PIN_BATT_OC_PEE3, "BATT_OC_PEE3"),
-	PINCTRL_PIN(TEGRA_PIN_POWER_ON_PEE4, "POWER_ON_PEE4"),
-	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SCL_PEE5, "PWR_I2C_SCL_PEE5"),
-	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SDA_PEE6, "PWR_I2C_SDA_PEE6"),
 	PINCTRL_PIN(TEGRA_PIN_UFS0_REF_CLK_PFF0, "UFS0_REF_CLK_PFF0"),
 	PINCTRL_PIN(TEGRA_PIN_UFS0_RST_PFF1, "UFS0_RST_PFF1"),
 	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0, "PEX_L5_CLKREQ_N_PGG0"),
@@ -467,11 +441,6 @@ static const struct pinctrl_pin_desc tegra194_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_SDMMC3_HV_TRIM, "SDMMC3_HV_TRIM"),
 	PINCTRL_PIN(TEGRA_PIN_EQOS_COMP, "EQOS_COMP"),
 	PINCTRL_PIN(TEGRA_PIN_QSPI_COMP, "QSPI_COMP"),
-	PINCTRL_PIN(TEGRA_PIN_SYS_RESET_N, "SYS_RESET_N"),
-	PINCTRL_PIN(TEGRA_PIN_SHUTDOWN_N, "SHUTDOWN_N"),
-	PINCTRL_PIN(TEGRA_PIN_PMU_INT_N, "PMU_INT_N"),
-	PINCTRL_PIN(TEGRA_PIN_SOC_PWR_REQ, "SOC_PWR_REQ"),
-	PINCTRL_PIN(TEGRA_PIN_CLK_32K_IN, "CLK_32K_IN"),
 };
 
 static const unsigned int dap6_sclk_pa0_pins[] = {
@@ -1379,29 +1348,7 @@ static struct tegra_function tegra194_functions[] = {
 		.drvtype_bit = 13,				\
 		.lpdr_bit = e_lpdr,				\
 
-#define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart3_rx_pcc6             DRV_PINGROUP_ENTRY_Y(0x200c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_uart3_tx_pcc5             DRV_PINGROUP_ENTRY_Y(0x2014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen8_i2c_sda_pdd2         DRV_PINGROUP_ENTRY_Y(0x201c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen8_i2c_scl_pdd1         DRV_PINGROUP_ENTRY_Y(0x2024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_mosi_pcc2            DRV_PINGROUP_ENTRY_Y(0x202c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen2_i2c_scl_pcc7         DRV_PINGROUP_ENTRY_Y(0x2034,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_cs0_pcc3             DRV_PINGROUP_ENTRY_Y(0x203c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_gen2_i2c_sda_pdd0         DRV_PINGROUP_ENTRY_Y(0x2044,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_sck_pcc0             DRV_PINGROUP_ENTRY_Y(0x204c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_spi2_miso_pcc1            DRV_PINGROUP_ENTRY_Y(0x2054,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_dout_paa0            DRV_PINGROUP_ENTRY_Y(0x3004,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_din_paa1             DRV_PINGROUP_ENTRY_Y(0x300c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_dout_paa2            DRV_PINGROUP_ENTRY_Y(0x3014,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_din_paa3             DRV_PINGROUP_ENTRY_Y(0x301c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_stb_paa4             DRV_PINGROUP_ENTRY_Y(0x3024,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_en_paa5              DRV_PINGROUP_ENTRY_Y(0x302c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_wake_paa6            DRV_PINGROUP_ENTRY_Y(0x3034,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can0_err_paa7             DRV_PINGROUP_ENTRY_Y(0x303c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_stb_pbb0             DRV_PINGROUP_ENTRY_Y(0x3044,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_en_pbb1              DRV_PINGROUP_ENTRY_Y(0x304c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_wake_pbb2            DRV_PINGROUP_ENTRY_Y(0x3054,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
-#define drive_can1_err_pbb3             DRV_PINGROUP_ENTRY_Y(0x305c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	1)
+/* main drive pin groups */
 #define drive_soc_gpio33_pt0            DRV_PINGROUP_ENTRY_Y(0x1004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
 #define drive_soc_gpio32_ps7            DRV_PINGROUP_ENTRY_Y(0x100c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
 #define drive_soc_gpio31_ps6            DRV_PINGROUP_ENTRY_Y(0x1014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
@@ -1509,17 +1456,6 @@ static struct tegra_function tegra194_functions[] = {
 #define drive_sdmmc3_dat0_po2           DRV_PINGROUP_ENTRY_Y(0xa01c,	-1,	-1,	-1,	-1,	28,	2,	30,	2,	0)
 #define drive_sdmmc3_cmd_po1            DRV_PINGROUP_ENTRY_Y(0xa02c,	-1,	-1,	-1,	-1,	28,	2,	30,	2,	0)
 #define drive_sdmmc3_clk_po0            DRV_PINGROUP_ENTRY_Y(0xa034,	-1,	-1,	-1,	-1,	28,	2,	30,	2,	0)
-#define drive_shutdown_n                DRV_PINGROUP_ENTRY_Y(0x1004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pmu_int_n                 DRV_PINGROUP_ENTRY_Y(0x100c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_safe_state_pee0           DRV_PINGROUP_ENTRY_Y(0x1014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_vcomp_alert_pee1          DRV_PINGROUP_ENTRY_Y(0x101c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_soc_pwr_req               DRV_PINGROUP_ENTRY_Y(0x1024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_batt_oc_pee3              DRV_PINGROUP_ENTRY_Y(0x102c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_clk_32k_in                DRV_PINGROUP_ENTRY_Y(0x1034,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_power_on_pee4             DRV_PINGROUP_ENTRY_Y(0x103c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwr_i2c_scl_pee5          DRV_PINGROUP_ENTRY_Y(0x1044,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_pwr_i2c_sda_pee6          DRV_PINGROUP_ENTRY_Y(0x104c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-#define drive_ao_retention_n_pee2       DRV_PINGROUP_ENTRY_Y(0x1064,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
 #define drive_gpu_pwr_req_px0           DRV_PINGROUP_ENTRY_Y(0xD004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
 #define drive_spi3_miso_py1             DRV_PINGROUP_ENTRY_Y(0xD00c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
 #define drive_spi1_cs0_pz6              DRV_PINGROUP_ENTRY_Y(0xD014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
@@ -1600,6 +1536,42 @@ static struct tegra_function tegra194_functions[] = {
 #define drive_directdc1_in_pv1          DRV_PINGROUP_ENTRY_N(no_entry)
 #define drive_directdc1_clk_pv0         DRV_PINGROUP_ENTRY_N(no_entry)
 
+/* AON drive pin groups */
+#define drive_shutdown_n                DRV_PINGROUP_ENTRY_Y(0x1004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pmu_int_n                 DRV_PINGROUP_ENTRY_Y(0x100c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_safe_state_pee0           DRV_PINGROUP_ENTRY_Y(0x1014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_vcomp_alert_pee1          DRV_PINGROUP_ENTRY_Y(0x101c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_soc_pwr_req               DRV_PINGROUP_ENTRY_Y(0x1024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_batt_oc_pee3              DRV_PINGROUP_ENTRY_Y(0x102c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_clk_32k_in                DRV_PINGROUP_ENTRY_Y(0x1034,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_power_on_pee4             DRV_PINGROUP_ENTRY_Y(0x103c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwr_i2c_scl_pee5          DRV_PINGROUP_ENTRY_Y(0x1044,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_pwr_i2c_sda_pee6          DRV_PINGROUP_ENTRY_Y(0x104c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_ao_retention_n_pee2       DRV_PINGROUP_ENTRY_Y(0x1064,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart3_rx_pcc6             DRV_PINGROUP_ENTRY_Y(0x200c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_uart3_tx_pcc5             DRV_PINGROUP_ENTRY_Y(0x2014,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen8_i2c_sda_pdd2         DRV_PINGROUP_ENTRY_Y(0x201c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen8_i2c_scl_pdd1         DRV_PINGROUP_ENTRY_Y(0x2024,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_mosi_pcc2            DRV_PINGROUP_ENTRY_Y(0x202c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen2_i2c_scl_pcc7         DRV_PINGROUP_ENTRY_Y(0x2034,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_cs0_pcc3             DRV_PINGROUP_ENTRY_Y(0x203c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_gen2_i2c_sda_pdd0         DRV_PINGROUP_ENTRY_Y(0x2044,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_sck_pcc0             DRV_PINGROUP_ENTRY_Y(0x204c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_spi2_miso_pcc1            DRV_PINGROUP_ENTRY_Y(0x2054,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_dout_paa0            DRV_PINGROUP_ENTRY_Y(0x3004,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_din_paa1             DRV_PINGROUP_ENTRY_Y(0x300c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_dout_paa2            DRV_PINGROUP_ENTRY_Y(0x3014,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_din_paa3             DRV_PINGROUP_ENTRY_Y(0x301c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_stb_paa4             DRV_PINGROUP_ENTRY_Y(0x3024,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_en_paa5              DRV_PINGROUP_ENTRY_Y(0x302c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_wake_paa6            DRV_PINGROUP_ENTRY_Y(0x3034,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can0_err_paa7             DRV_PINGROUP_ENTRY_Y(0x303c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_stb_pbb0             DRV_PINGROUP_ENTRY_Y(0x3044,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_en_pbb1              DRV_PINGROUP_ENTRY_Y(0x304c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_wake_pbb2            DRV_PINGROUP_ENTRY_Y(0x3054,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+#define drive_can1_err_pbb3             DRV_PINGROUP_ENTRY_Y(0x305c,	28,	2,	30,	2,	-1,	-1,	-1,	-1,	0)
+
 #define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_io_hv, e_lpbk, e_input, e_lpdr, e_pbias_buf, \
 			gpio_sfio_sel, e_od, schmitt_b, drvtype, epreemp, io_reset, rfu_in, io_rail)	\
 	{							\
@@ -1622,30 +1594,6 @@ static struct tegra_function tegra194_functions[] = {
 	}
 
 static const struct tegra_pingroup tegra194_groups[] = {
-
-	PINGROUP(touch_clk_pcc4,	GP,		TOUCH,		RSVD2,		RSVD3,		0x2000,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(uart3_rx_pcc6,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2008,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(uart3_tx_pcc5,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2010,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(gen8_i2c_sda_pdd2,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2018,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(gen8_i2c_scl_pdd1,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2020,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(spi2_mosi_pcc2,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2028,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(gen2_i2c_scl_pcc7,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2030,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(spi2_cs0_pcc3,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2038,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(gen2_i2c_sda_pdd0,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2040,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(spi2_sck_pcc0,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2048,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(spi2_miso_pcc1,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2050,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
-	PINGROUP(can1_dout_paa0,	CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3000,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can1_din_paa1,		CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3008,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_dout_paa2,	CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3010,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_din_paa3,		CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3018,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_stb_paa4,		RSVD0,		WDT,		RSVD2,		RSVD3,		0x3020,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_en_paa5,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3028,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_wake_paa6,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3030,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can0_err_paa7,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3038,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can1_stb_pbb0,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3040,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can1_en_pbb1,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3048,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can1_wake_pbb2,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3050,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
-	PINGROUP(can1_err_pbb3,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3058,		1,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
 	PINGROUP(soc_gpio33_pt0,	RSVD0,		SPDIF,		RSVD2,		RSVD3,		0x1000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
 	PINGROUP(soc_gpio32_ps7,	RSVD0,		SPDIF,		RSVD2,		RSVD3,		0x1008,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
 	PINGROUP(soc_gpio31_ps6,	RSVD0,		SDMMC1,		RSVD2,		RSVD3,		0x1010,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_audio"),
@@ -1805,17 +1753,6 @@ static const struct tegra_pingroup tegra194_groups[] = {
 	PINGROUP(sdmmc4_dat2,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6048,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
 	PINGROUP(sdmmc4_dat1,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6050,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
 	PINGROUP(sdmmc4_dat0,		SDMMC4,		RSVD1,		RSVD2,		RSVD3,		0x6058,		0,	Y,	-1,	-1,	6,	-1,	-1,	-1,	-1,	-1,	Y,	-1,	-1,	N,	"vddio_sdmmc4"),
-	PINGROUP(shutdown_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1000,		1,	Y,	5,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(pmu_int_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1008,		1,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(safe_state_pee0,	SCE,		RSVD1,		RSVD2,		RSVD3,		0x1010,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(vcomp_alert_pee1,	SOC,		RSVD1,		RSVD2,		RSVD3,		0x1018,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(soc_pwr_req,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1020,		1,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(batt_oc_pee3,		SOC,		RSVD1,		RSVD2,		RSVD3,		0x1028,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(clk_32k_in,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1030,		1,	Y,	-1,	-1,	-1,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(power_on_pee4,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1038,		1,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(pwr_i2c_scl_pee5,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1040,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(pwr_i2c_sda_pee6,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1048,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
-	PINGROUP(ao_retention_n_pee2,	GPIO,		RSVD1,		RSVD2,		RSVD3,		0x1060,		1,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
 	PINGROUP(gpu_pwr_req_px0,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0xD000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
 	PINGROUP(spi3_miso_py1,		SPI3,		RSVD1,		RSVD2,		RSVD3,		0xD008,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
 	PINGROUP(spi1_cs0_pz6,		SPI1,		RSVD1,		RSVD2,		RSVD3,		0xD010,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_uart"),
@@ -1857,13 +1794,104 @@ static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
 	.sfsel_in_mux = true,
 };
 
+static const struct pinctrl_pin_desc tegra194_aon_pins[] = {
+	PINCTRL_PIN(TEGRA_PIN_CAN1_DOUT_PAA0, "CAN1_DOUT_PAA0"),
+	PINCTRL_PIN(TEGRA_PIN_CAN1_DIN_PAA1, "CAN1_DIN_PAA1"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_DOUT_PAA2, "CAN0_DOUT_PAA2"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_DIN_PAA3, "CAN0_DIN_PAA3"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_STB_PAA4, "CAN0_STB_PAA4"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_EN_PAA5, "CAN0_EN_PAA5"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_WAKE_PAA6, "CAN0_WAKE_PAA6"),
+	PINCTRL_PIN(TEGRA_PIN_CAN0_ERR_PAA7, "CAN0_ERR_PAA7"),
+	PINCTRL_PIN(TEGRA_PIN_CAN1_STB_PBB0, "CAN1_STB_PBB0"),
+	PINCTRL_PIN(TEGRA_PIN_CAN1_EN_PBB1, "CAN1_EN_PBB1"),
+	PINCTRL_PIN(TEGRA_PIN_CAN1_WAKE_PBB2, "CAN1_WAKE_PBB2"),
+	PINCTRL_PIN(TEGRA_PIN_CAN1_ERR_PBB3, "CAN1_ERR_PBB3"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_SCK_PCC0, "SPI2_SCK_PCC0"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_MISO_PCC1, "SPI2_MISO_PCC1"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_MOSI_PCC2, "SPI2_MOSI_PCC2"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_CS0_PCC3, "SPI2_CS0_PCC3"),
+	PINCTRL_PIN(TEGRA_PIN_TOUCH_CLK_PCC4, "TOUCH_CLK_PCC4"),
+	PINCTRL_PIN(TEGRA_PIN_UART3_TX_PCC5, "UART3_TX_PCC5"),
+	PINCTRL_PIN(TEGRA_PIN_UART3_RX_PCC6, "UART3_RX_PCC6"),
+	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SCL_PCC7, "GEN2_I2C_SCL_PCC7"),
+	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SDA_PDD0, "GEN2_I2C_SDA_PDD0"),
+	PINCTRL_PIN(TEGRA_PIN_GEN8_I2C_SCL_PDD1, "GEN8_I2C_SCL_PDD1"),
+	PINCTRL_PIN(TEGRA_PIN_GEN8_I2C_SDA_PDD2, "GEN8_I2C_SDA_PDD2"),
+	PINCTRL_PIN(TEGRA_PIN_SAFE_STATE_PEE0, "SAFE_STATE_PEE0"),
+	PINCTRL_PIN(TEGRA_PIN_VCOMP_ALERT_PEE1, "VCOMP_ALERT_PEE1"),
+	PINCTRL_PIN(TEGRA_PIN_AO_RETENTION_N_PEE2, "AO_RETENTION_N_PEE2"),
+	PINCTRL_PIN(TEGRA_PIN_BATT_OC_PEE3, "BATT_OC_PEE3"),
+	PINCTRL_PIN(TEGRA_PIN_POWER_ON_PEE4, "POWER_ON_PEE4"),
+	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SCL_PEE5, "PWR_I2C_SCL_PEE5"),
+	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SDA_PEE6, "PWR_I2C_SDA_PEE6"),
+	PINCTRL_PIN(TEGRA_PIN_SYS_RESET_N, "SYS_RESET_N"),
+	PINCTRL_PIN(TEGRA_PIN_SHUTDOWN_N, "SHUTDOWN_N"),
+	PINCTRL_PIN(TEGRA_PIN_PMU_INT_N, "PMU_INT_N"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_PWR_REQ, "SOC_PWR_REQ"),
+	PINCTRL_PIN(TEGRA_PIN_CLK_32K_IN, "CLK_32K_IN"),
+};
+
+static const struct tegra_pingroup tegra194_aon_groups[] = {
+	PINGROUP(shutdown_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1000,		0,	Y,	5,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(pmu_int_n,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1008,		0,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(safe_state_pee0,	SCE,		RSVD1,		RSVD2,		RSVD3,		0x1010,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(vcomp_alert_pee1,	SOC,		RSVD1,		RSVD2,		RSVD3,		0x1018,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(soc_pwr_req,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1020,		0,	Y,	-1,	-1,	6,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(batt_oc_pee3,		SOC,		RSVD1,		RSVD2,		RSVD3,		0x1028,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(clk_32k_in,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1030,		0,	Y,	-1,	-1,	-1,	8,	-1,	-1,	-1,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(power_on_pee4,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x1038,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(pwr_i2c_scl_pee5,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1040,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(pwr_i2c_sda_pee6,	I2C5,		RSVD1,		RSVD2,		RSVD3,		0x1048,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(ao_retention_n_pee2,	GPIO,		RSVD1,		RSVD2,		RSVD3,		0x1060,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_sys"),
+	PINGROUP(touch_clk_pcc4,	GP,		TOUCH,		RSVD2,		RSVD3,		0x2000,		0,	Y,	-1,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(uart3_rx_pcc6,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2008,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(uart3_tx_pcc5,		UARTC,		RSVD1,		RSVD2,		RSVD3,		0x2010,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(gen8_i2c_sda_pdd2,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2018,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(gen8_i2c_scl_pdd1,	I2C8,		RSVD1,		RSVD2,		RSVD3,		0x2020,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(spi2_mosi_pcc2,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2028,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(gen2_i2c_scl_pcc7,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2030,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(spi2_cs0_pcc3,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2038,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(gen2_i2c_sda_pdd0,	I2C2,		RSVD1,		RSVD2,		RSVD3,		0x2040,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(spi2_sck_pcc0,		SPI2,		UARTG,		RSVD2,		RSVD3,		0x2048,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(spi2_miso_pcc1,	SPI2,		UARTG,		RSVD2,		RSVD3,		0x2050,		0,	Y,	5,	-1,	6,	8,	-1,	10,	11,	12,	N,	-1,	-1,	N,	"vddio_ao"),
+	PINGROUP(can1_dout_paa0,	CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3000,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can1_din_paa1,		CAN1,		RSVD1,		RSVD2,		RSVD3,		0x3008,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_dout_paa2,	CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3010,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_din_paa3,		CAN0,		RSVD1,		RSVD2,		RSVD3,		0x3018,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_stb_paa4,		RSVD0,		WDT,		RSVD2,		RSVD3,		0x3020,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_en_paa5,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3028,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_wake_paa6,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3030,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can0_err_paa7,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3038,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can1_stb_pbb0,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3040,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can1_en_pbb1,		RSVD0,		DMIC3,		DMIC5,		RSVD3,		0x3048,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can1_wake_pbb2,	RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3050,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+	PINGROUP(can1_err_pbb3,		RSVD0,		RSVD1,		RSVD2,		RSVD3,		0x3058,		0,	Y,	-1,	-1,	6,	-1,	9,	10,	-1,	12,	Y,	-1,	-1,	Y,	"vddio_ao_hv"),
+};
+
+static const struct tegra_pinctrl_soc_data tegra194_pinctrl_aon = {
+	.pins = tegra194_aon_pins,
+	.npins = ARRAY_SIZE(tegra194_aon_pins),
+	.functions = tegra194_functions,
+	.nfunctions = ARRAY_SIZE(tegra194_functions),
+	.groups = tegra194_aon_groups,
+	.ngroups = ARRAY_SIZE(tegra194_aon_groups),
+	.hsm_in_mux = true,
+	.schmitt_in_mux = true,
+	.drvtype_in_mux = true,
+	.sfsel_in_mux = true,
+};
+
 static int tegra194_pinctrl_probe(struct platform_device *pdev)
 {
-	return tegra_pinctrl_probe(pdev, &tegra194_pinctrl);
+	const struct tegra_pinctrl_soc_data *soc = of_device_get_match_data(&pdev->dev);
+
+	return tegra_pinctrl_probe(pdev, soc);
 }
 
 static const struct of_device_id tegra194_pinctrl_of_match[] = {
-	{ .compatible = "nvidia,tegra194-pinmux", },
+	{ .compatible = "nvidia,tegra194-pinmux", .data = &tegra194_pinctrl },
+	{ .compatible = "nvidia,tegra194-pinmux-aon", .data = &tegra194_pinctrl_aon },
 	{ },
 };
 
-- 
2.38.1

