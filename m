Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79C7603812
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 04:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiJSC1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 22:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiJSC06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 22:26:58 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC73E3193;
        Tue, 18 Oct 2022 19:26:38 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h12so15824644pjk.0;
        Tue, 18 Oct 2022 19:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QDs6KH7p/8f7E8cfJuq3xzTPz572fI8pHH70sq/FjtA=;
        b=C5Obn1q2lqq9ftcRcBG5ns4m29XkLfZWlq1NkDxYAp0EVsUT6yljgHVE63U5G47I1b
         KiGj8L6ecJyTeokQj2IorjvPeYMH2mVwGCnx04omQoN0FH+1tMFnPqnux0Si2o6BSvY9
         ts6kGzEDEV/9jJuo8+o9PJ/oRuDe4qytwSL3ancIa9UQQv1/Ynuvq3/bQl0h4ebnetGL
         A5EUreuIpgtX9409b/5VvyabG8DFF0T5brEtt3LP/t3nLQjtoUjTjhekNnklDHXBFXB+
         35Zek1R0tbz2CM03H2msokBHKY/fiep070ZxDFpCao/3CIRnQs9xIgczEFyQNo7QTDM5
         gH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDs6KH7p/8f7E8cfJuq3xzTPz572fI8pHH70sq/FjtA=;
        b=ptYFZCHY3X9+vKQz3gPufLDunqI1XQ9glEBCWQxKZ1//9NblEXQMAHsmcGVp5r0ztl
         d5aPpHu6v7P4ag1SHZ3pOkFoCnFklb/BiibGLqphqzVfyF7GcyML4XUi9ekcUopRDBPB
         zCRu+1cIrwWaGX7/JQGHPKAIoLRHnS7gT0Py8Sr397rw63iRbFmmZw7jpM16mQVQ7gCf
         pc7gkNU5BKks7tj5hsxGvkjjRLNrKNiPNm/JYd0TqtTCsH5/JycnQa9RL8G7h6KoQZG9
         qt+TdQC/XsspbgQXQmmgz34dJ8GIwXKFQQqpCHNhXvj4i80lig9bIvRCpjculsOMZI4i
         KXNg==
X-Gm-Message-State: ACrzQf1m/TeeVz1Nl2OI6miacNFckiDB/9IQi293cXcwu3grOcFxi/Ot
        hn7m7b0BRkQo0Lbtk3HUOw==
X-Google-Smtp-Source: AMsMyM7W08iyFTbWidtlEwleD7Ws/usVC7mlC3V/OzO+n96YpZyly2QWGBBZhJ/NaKjHJ5ShHbKG8A==
X-Received: by 2002:a17:902:f684:b0:17f:95cc:af8 with SMTP id l4-20020a170902f68400b0017f95cc0af8mr6061221plg.91.1666146398357;
        Tue, 18 Oct 2022 19:26:38 -0700 (PDT)
Received: from localhost.localdomain ([106.104.115.142])
        by smtp.gmail.com with ESMTPSA id x185-20020a6263c2000000b00562a526cd2esm9855880pfb.55.2022.10.18.19.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 19:26:38 -0700 (PDT)
From:   chengwei <foxfly.lai.tw@gmail.com>
X-Google-Original-From: chengwei <larry.lai@yunjingtech.com>
To:     lee@kernel.org, broonie@kernel.org, rafael@kernel.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, GaryWang@aaeon.com.tw,
        musa.lin@yunjingtech.com, jack.chang@yunjingtech.com,
        chengwei <larry.lai@yunjingtech.com>,
        Javier Arteaga <javier@emutex.com>,
        Nicola Lunghi <nicola.lunghi@emutex.com>
Subject: [PATCH 5/5] pinctrl: Add support pin control for UP board CPLD/FPGA
Date:   Wed, 19 Oct 2022 10:24:50 +0800
Message-Id: <20221019022450.16851-6-larry.lai@yunjingtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019022450.16851-1-larry.lai@yunjingtech.com>
References: <20221019022450.16851-1-larry.lai@yunjingtech.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The UP Squared board <http://www.upboard.com> implements certain
features (pin control) through an on-board FPGA.

Signed-off-by: Javier Arteaga <javier@emutex.com>
[merge various fixes]
Signed-off-by: Nicola Lunghi <nicola.lunghi@emutex.com>
Signed-off-by: chengwei <larry.lai@yunjingtech.com>
---
 drivers/pinctrl/Kconfig           |   15 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-upboard.c | 1003 +++++++++++++++++++++++++++++
 3 files changed, 1019 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-upboard.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1cf74b0c42e5..5d719eadecdb 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -483,6 +483,21 @@ config PINCTRL_THUNDERBAY
 	  rate control and direction control. This module will be
 	  called as pinctrl-thunderbay.
 
+config PINCTRL_UPBOARD
+	tristate "UP board FPGA pin controller"
+	depends on ACPI
+	depends on MFD_UPBOARD_FPGA
+	depends on X86
+	select GENERIC_PINCONF
+	select PINMUX
+	select PINCONF
+	help
+	  Pin controller for the FPGA GPIO lines on UP boards. Due to the
+	  hardware layout, these are meant to be controlled in tandem with their
+	  corresponding Intel SoC GPIOs.
+	  To compile this driver as a module, choose M here: the module
+	  will be called pinctrl-upboard.
+
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
 	depends on ARCH_ZYNQ
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e76f5cdc64b0..c366706d36e7 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_THUNDERBAY) += pinctrl-thunderbay.o
+obj-$(CONFIG_PINCTRL_UPBOARD)	+= pinctrl-upboard.o
 obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
new file mode 100644
index 000000000000..39cd45357f6b
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -0,0 +1,1003 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UP Board FPGA-based pin controller driver
+ *
+ * Copyright (c) 2017, Emutex Ltd. All rights reserved.
+ *
+ * Authors: Javier Arteaga <javier@emutex.com>
+ *          Dan O'Donovan <dan@emutex.com>
+ *          Nicola Lunghi <nicolal@emutex.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/mfd/upboard-fpga.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#include "core.h"
+
+struct upboard_pin {
+	struct regmap_field *funcbit;
+	struct regmap_field *enbit;
+	struct regmap_field *dirbit;
+};
+
+struct upboard_bios {
+	const struct reg_sequence *patches;
+	size_t npatches;
+};
+
+struct upboard_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctldev;
+	struct regmap *regmap;
+	struct gpio_chip chip;
+	const unsigned int *rpi_mapping;
+};
+
+enum upboard_func0_fpgabit {
+	UPFPGA_I2C0_EN = 8,
+	UPFPGA_I2C1_EN = 9,
+	UPFPGA_CEC0_EN = 12,
+	UPFPGA_ADC0_EN = 14,
+};
+
+static const struct reg_field upboard_i2c0_reg =
+	REG_FIELD(UPFPGA_REG_FUNC_EN0, UPFPGA_I2C0_EN, UPFPGA_I2C0_EN);
+
+static const struct reg_field upboard_i2c1_reg =
+	REG_FIELD(UPFPGA_REG_FUNC_EN0, UPFPGA_I2C1_EN, UPFPGA_I2C1_EN);
+
+static const struct reg_field upboard_adc0_reg =
+	REG_FIELD(UPFPGA_REG_FUNC_EN0, UPFPGA_ADC0_EN, UPFPGA_ADC0_EN);
+
+#define UPBOARD_BIT_TO_PIN(r, bit) \
+	((r) * UPFPGA_REGISTER_SIZE + (bit))
+
+/*
+ * UP board data
+ */
+
+#define UPBOARD_UP_BIT_TO_PIN(r, id) (UPBOARD_BIT_TO_PIN(r, UPFPGA_UP_##id))
+
+#define UPBOARD_UP_PIN_ANON(r, bit)					\
+	{								\
+		.number = UPBOARD_BIT_TO_PIN(r, bit),			\
+	}
+
+#define UPBOARD_UP_PIN_NAME(r, id)					\
+	{								\
+		.number = UPBOARD_UP_BIT_TO_PIN(r, id),			\
+		.name = #id,						\
+	}
+
+#define UPBOARD_UP_PIN_FUNC(r, id, data)				\
+	{								\
+		.number = UPBOARD_UP_BIT_TO_PIN(r, id),			\
+		.name = #id,						\
+		.drv_data = (void *)(data),				\
+	}
+
+enum upboard_up_reg1_fpgabit {
+	UPFPGA_UP_I2C1_SDA,
+	UPFPGA_UP_I2C1_SCL,
+	UPFPGA_UP_ADC0,
+	UPFPGA_UP_GPIO17,
+	UPFPGA_UP_GPIO27,
+	UPFPGA_UP_GPIO22,
+	UPFPGA_UP_SPI_MOSI,
+	UPFPGA_UP_SPI_MISO,
+	UPFPGA_UP_SPI_CLK,
+	UPFPGA_UP_I2C0_SDA,
+	UPFPGA_UP_GPIO5,
+	UPFPGA_UP_GPIO6,
+	UPFPGA_UP_PWM1,
+	UPFPGA_UP_I2S_FRM,
+	UPFPGA_UP_GPIO26,
+	UPFPGA_UP_UART1_TX,
+};
+
+enum upboard_up_reg2_fpgabit {
+	UPFPGA_UP_UART1_RX,
+	UPFPGA_UP_I2S_CLK,
+	UPFPGA_UP_GPIO23,
+	UPFPGA_UP_GPIO24,
+	UPFPGA_UP_GPIO25,
+	UPFPGA_UP_SPI_CS0,
+	UPFPGA_UP_SPI_CS1,
+	UPFPGA_UP_I2C0_SCL,
+	UPFPGA_UP_PWM0,
+	UPFPGA_UP_GPIO16,
+	UPFPGA_UP_I2S_DIN,
+	UPFPGA_UP_I2S_DOUT,
+};
+
+static struct pinctrl_pin_desc upboard_up_pins[] = {
+	UPBOARD_UP_PIN_FUNC(0, I2C1_SDA, &upboard_i2c1_reg),
+	UPBOARD_UP_PIN_FUNC(0, I2C1_SCL, &upboard_i2c1_reg),
+	UPBOARD_UP_PIN_FUNC(0, ADC0, &upboard_adc0_reg),
+	UPBOARD_UP_PIN_NAME(0, GPIO17),
+	UPBOARD_UP_PIN_NAME(0, GPIO27),
+	UPBOARD_UP_PIN_NAME(0, GPIO22),
+	UPBOARD_UP_PIN_NAME(0, SPI_MOSI),
+	UPBOARD_UP_PIN_NAME(0, SPI_MISO),
+	UPBOARD_UP_PIN_NAME(0, SPI_CLK),
+	UPBOARD_UP_PIN_FUNC(0, I2C0_SDA, &upboard_i2c0_reg),
+	UPBOARD_UP_PIN_NAME(0, GPIO5),
+	UPBOARD_UP_PIN_NAME(0, GPIO6),
+	UPBOARD_UP_PIN_NAME(0, PWM1),
+	UPBOARD_UP_PIN_NAME(0, I2S_FRM),
+	UPBOARD_UP_PIN_NAME(0, GPIO26),
+	UPBOARD_UP_PIN_NAME(0, UART1_TX),
+	/* register 1 */
+	UPBOARD_UP_PIN_NAME(1, UART1_RX),
+	UPBOARD_UP_PIN_NAME(1, I2S_CLK),
+	UPBOARD_UP_PIN_NAME(1, GPIO23),
+	UPBOARD_UP_PIN_NAME(1, GPIO24),
+	UPBOARD_UP_PIN_NAME(1, GPIO25),
+	UPBOARD_UP_PIN_NAME(1, SPI_CS0),
+	UPBOARD_UP_PIN_NAME(1, SPI_CS1),
+	UPBOARD_UP_PIN_FUNC(1, I2C0_SCL, &upboard_i2c0_reg),
+	UPBOARD_UP_PIN_NAME(1, PWM0),
+	UPBOARD_UP_PIN_NAME(1, GPIO16),
+	UPBOARD_UP_PIN_NAME(1, I2S_DIN),
+	UPBOARD_UP_PIN_NAME(1, I2S_DOUT),
+};
+
+static const unsigned int upboard_up_rpi_mapping[] = {
+	UPBOARD_UP_BIT_TO_PIN(0, I2C0_SDA),
+	UPBOARD_UP_BIT_TO_PIN(1, I2C0_SCL),
+	UPBOARD_UP_BIT_TO_PIN(0, I2C1_SDA),
+	UPBOARD_UP_BIT_TO_PIN(0, I2C1_SCL),
+	UPBOARD_UP_BIT_TO_PIN(0, ADC0),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO5),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO6),
+	UPBOARD_UP_BIT_TO_PIN(1, SPI_CS1),
+	UPBOARD_UP_BIT_TO_PIN(1, SPI_CS0),
+	UPBOARD_UP_BIT_TO_PIN(0, SPI_MISO),
+	UPBOARD_UP_BIT_TO_PIN(0, SPI_MOSI),
+	UPBOARD_UP_BIT_TO_PIN(0, SPI_CLK),
+	UPBOARD_UP_BIT_TO_PIN(1, PWM0),
+	UPBOARD_UP_BIT_TO_PIN(0, PWM1),
+	UPBOARD_UP_BIT_TO_PIN(0, UART1_TX),
+	UPBOARD_UP_BIT_TO_PIN(1, UART1_RX),
+	UPBOARD_UP_BIT_TO_PIN(1, GPIO16),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO17),
+	UPBOARD_UP_BIT_TO_PIN(1, I2S_CLK),
+	UPBOARD_UP_BIT_TO_PIN(0, I2S_FRM),
+	UPBOARD_UP_BIT_TO_PIN(1, I2S_DIN),
+	UPBOARD_UP_BIT_TO_PIN(1, I2S_DOUT),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO22),
+	UPBOARD_UP_BIT_TO_PIN(1, GPIO23),
+	UPBOARD_UP_BIT_TO_PIN(1, GPIO24),
+	UPBOARD_UP_BIT_TO_PIN(1, GPIO25),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO26),
+	UPBOARD_UP_BIT_TO_PIN(0, GPIO27),
+};
+
+/*
+ * Init patches applied to the registers until the BIOS sets proper defaults
+ */
+static const struct reg_sequence upboard_up_reg_patches[] __initconst = {
+	{ UPFPGA_REG_FUNC_EN0,
+		// enable I2C voltage-level shifters
+		BIT(UPFPGA_I2C0_EN) |
+		BIT(UPFPGA_I2C1_EN) |
+		// enable adc
+		BIT(UPFPGA_ADC0_EN)
+	},
+	/* HAT function pins initially set as inputs */
+	{ UPFPGA_REG_GPIO_DIR0,
+		BIT(UPFPGA_UP_I2C1_SDA)	    |
+		BIT(UPFPGA_UP_I2C1_SCL)	    |
+		BIT(UPFPGA_UP_ADC0)	    |
+		BIT(UPFPGA_UP_GPIO27)	    |
+		BIT(UPFPGA_UP_GPIO22)	    |
+		BIT(UPFPGA_UP_SPI_MISO)	    |
+		BIT(UPFPGA_UP_I2C0_SDA)	    |
+		BIT(UPFPGA_UP_GPIO5)	    |
+		BIT(UPFPGA_UP_GPIO6)	    |
+		BIT(UPFPGA_UP_GPIO26)
+	},
+	{ UPFPGA_REG_GPIO_DIR1,
+		BIT(UPFPGA_UP_UART1_RX)	|
+		BIT(UPFPGA_UP_GPIO23)	|
+		BIT(UPFPGA_UP_GPIO24)	|
+		BIT(UPFPGA_UP_GPIO25)	|
+		BIT(UPFPGA_UP_I2C0_SCL)	|
+		BIT(UPFPGA_UP_GPIO16)	|
+		BIT(UPFPGA_UP_I2S_DIN)
+	},
+};
+
+static const struct upboard_bios upboard_up_bios_info_dvt __initconst = {
+	.patches = upboard_up_reg_patches,
+	.npatches = ARRAY_SIZE(upboard_up_reg_patches),
+};
+
+/*
+ * UP^2 board data
+ */
+
+#define UPBOARD_UP2_BIT_TO_PIN(r, id) (UPBOARD_BIT_TO_PIN(r, UPFPGA_UP2_##id))
+
+#define UPBOARD_UP2_PIN_ANON(r, bit)					\
+	{								\
+		.number = UPBOARD_BIT_TO_PIN(r, bit),			\
+	}
+
+#define UPBOARD_UP2_PIN_NAME(r, id)					\
+	{								\
+		.number = UPBOARD_UP2_BIT_TO_PIN(r, id),		\
+		.name = #id,						\
+	}
+
+#define UPBOARD_UP2_PIN_FUNC(r, id, data)				\
+	{								\
+		.number = UPBOARD_UP2_BIT_TO_PIN(r, id),		\
+		.name = #id,						\
+		.drv_data = (void *)(data),				\
+	}
+
+enum upboard_up2_reg0_fpgabit {
+	UPFPGA_UP2_UART1_TXD,
+	UPFPGA_UP2_UART1_RXD,
+	UPFPGA_UP2_UART1_RTS,
+	UPFPGA_UP2_UART1_CTS,
+	UPFPGA_UP2_GPIO3,
+	UPFPGA_UP2_GPIO5,
+	UPFPGA_UP2_GPIO6,
+	UPFPGA_UP2_GPIO11,
+	UPFPGA_UP2_EXHAT_LVDS1n,
+	UPFPGA_UP2_EXHAT_LVDS1p,
+	UPFPGA_UP2_SPI2_TXD,
+	UPFPGA_UP2_SPI2_RXD,
+	UPFPGA_UP2_SPI2_FS1,
+	UPFPGA_UP2_SPI2_FS0,
+	UPFPGA_UP2_SPI2_CLK,
+	UPFPGA_UP2_SPI1_TXD,
+};
+
+enum upboard_up2_reg1_fpgabit {
+	UPFPGA_UP2_SPI1_RXD,
+	UPFPGA_UP2_SPI1_FS1,
+	UPFPGA_UP2_SPI1_FS0,
+	UPFPGA_UP2_SPI1_CLK,
+	UPFPGA_UP2_BIT20,
+	UPFPGA_UP2_BIT21,
+	UPFPGA_UP2_BIT22,
+	UPFPGA_UP2_BIT23,
+	UPFPGA_UP2_PWM1,
+	UPFPGA_UP2_PWM0,
+	UPFPGA_UP2_EXHAT_LVDS0n,
+	UPFPGA_UP2_EXHAT_LVDS0p,
+	UPFPGA_UP2_I2C0_SCL,
+	UPFPGA_UP2_I2C0_SDA,
+	UPFPGA_UP2_I2C1_SCL,
+	UPFPGA_UP2_I2C1_SDA,
+};
+
+enum upboard_up2_reg2_fpgabit {
+	UPFPGA_UP2_EXHAT_LVDS3n,
+	UPFPGA_UP2_EXHAT_LVDS3p,
+	UPFPGA_UP2_EXHAT_LVDS4n,
+	UPFPGA_UP2_EXHAT_LVDS4p,
+	UPFPGA_UP2_EXHAT_LVDS5n,
+	UPFPGA_UP2_EXHAT_LVDS5p,
+	UPFPGA_UP2_I2S_SDO,
+	UPFPGA_UP2_I2S_SDI,
+	UPFPGA_UP2_I2S_WS_SYNC,
+	UPFPGA_UP2_I2S_BCLK,
+	UPFPGA_UP2_EXHAT_LVDS6n,
+	UPFPGA_UP2_EXHAT_LVDS6p,
+	UPFPGA_UP2_EXHAT_LVDS7n,
+	UPFPGA_UP2_EXHAT_LVDS7p,
+	UPFPGA_UP2_EXHAT_LVDS2n,
+	UPFPGA_UP2_EXHAT_LVDS2p,
+};
+
+static struct pinctrl_pin_desc upboard_up2_pins[] = {
+	UPBOARD_UP2_PIN_NAME(0, UART1_TXD),
+	UPBOARD_UP2_PIN_NAME(0, UART1_RXD),
+	UPBOARD_UP2_PIN_NAME(0, UART1_RTS),
+	UPBOARD_UP2_PIN_NAME(0, UART1_CTS),
+	UPBOARD_UP2_PIN_NAME(0, GPIO3),
+	UPBOARD_UP2_PIN_NAME(0, GPIO5),
+	UPBOARD_UP2_PIN_NAME(0, GPIO6),
+	UPBOARD_UP2_PIN_NAME(0, GPIO11),
+	UPBOARD_UP2_PIN_NAME(0, EXHAT_LVDS1n),
+	UPBOARD_UP2_PIN_NAME(0, EXHAT_LVDS1p),
+	UPBOARD_UP2_PIN_NAME(0, SPI2_TXD),
+	UPBOARD_UP2_PIN_NAME(0, SPI2_RXD),
+	UPBOARD_UP2_PIN_NAME(0, SPI2_FS1),
+	UPBOARD_UP2_PIN_NAME(0, SPI2_FS0),
+	UPBOARD_UP2_PIN_NAME(0, SPI2_CLK),
+	UPBOARD_UP2_PIN_NAME(0, SPI1_TXD),
+	UPBOARD_UP2_PIN_NAME(1, SPI1_RXD),
+	UPBOARD_UP2_PIN_NAME(1, SPI1_FS1),
+	UPBOARD_UP2_PIN_NAME(1, SPI1_FS0),
+	UPBOARD_UP2_PIN_NAME(1, SPI1_CLK),
+	UPBOARD_UP2_PIN_ANON(1, 4),
+	UPBOARD_UP2_PIN_ANON(1, 5),
+	UPBOARD_UP2_PIN_ANON(1, 6),
+	UPBOARD_UP2_PIN_ANON(1, 7),
+	UPBOARD_UP2_PIN_NAME(1, PWM1),
+	UPBOARD_UP2_PIN_NAME(1, PWM0),
+	UPBOARD_UP2_PIN_NAME(1, EXHAT_LVDS0n),
+	UPBOARD_UP2_PIN_NAME(1, EXHAT_LVDS0p),
+	UPBOARD_UP2_PIN_FUNC(1, I2C0_SCL, &upboard_i2c0_reg),
+	UPBOARD_UP2_PIN_FUNC(1, I2C0_SDA, &upboard_i2c0_reg),
+	UPBOARD_UP2_PIN_FUNC(1, I2C1_SCL, &upboard_i2c1_reg),
+	UPBOARD_UP2_PIN_FUNC(1, I2C1_SDA, &upboard_i2c1_reg),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS3n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS3p),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS4n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS4p),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS5n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS5p),
+	UPBOARD_UP2_PIN_NAME(2, I2S_SDO),
+	UPBOARD_UP2_PIN_NAME(2, I2S_SDI),
+	UPBOARD_UP2_PIN_NAME(2, I2S_WS_SYNC),
+	UPBOARD_UP2_PIN_NAME(2, I2S_BCLK),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS6n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS6p),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS7n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS7p),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS2n),
+	UPBOARD_UP2_PIN_NAME(2, EXHAT_LVDS2p),
+};
+
+static const unsigned int upboard_up2_rpi_mapping[] = {
+	UPBOARD_UP2_BIT_TO_PIN(1, I2C0_SDA),
+	UPBOARD_UP2_BIT_TO_PIN(1, I2C0_SCL),
+	UPBOARD_UP2_BIT_TO_PIN(1, I2C1_SDA),
+	UPBOARD_UP2_BIT_TO_PIN(1, I2C1_SCL),
+	UPBOARD_UP2_BIT_TO_PIN(0, GPIO3),
+	UPBOARD_UP2_BIT_TO_PIN(0, GPIO11),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI2_CLK),
+	UPBOARD_UP2_BIT_TO_PIN(1, SPI1_FS1),
+	UPBOARD_UP2_BIT_TO_PIN(1, SPI1_FS0),
+	UPBOARD_UP2_BIT_TO_PIN(1, SPI1_RXD),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI1_TXD),
+	UPBOARD_UP2_BIT_TO_PIN(1, SPI1_CLK),
+	UPBOARD_UP2_BIT_TO_PIN(1, PWM0),
+	UPBOARD_UP2_BIT_TO_PIN(1, PWM1),
+	UPBOARD_UP2_BIT_TO_PIN(0, UART1_TXD),
+	UPBOARD_UP2_BIT_TO_PIN(0, UART1_RXD),
+	UPBOARD_UP2_BIT_TO_PIN(0, UART1_CTS),
+	UPBOARD_UP2_BIT_TO_PIN(0, UART1_RTS),
+	UPBOARD_UP2_BIT_TO_PIN(2, I2S_BCLK),
+	UPBOARD_UP2_BIT_TO_PIN(2, I2S_WS_SYNC),
+	UPBOARD_UP2_BIT_TO_PIN(2, I2S_SDI),
+	UPBOARD_UP2_BIT_TO_PIN(2, I2S_SDO),
+	UPBOARD_UP2_BIT_TO_PIN(0, GPIO6),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI2_FS1),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI2_RXD),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI2_TXD),
+	UPBOARD_UP2_BIT_TO_PIN(0, SPI2_FS0),
+	UPBOARD_UP2_BIT_TO_PIN(0, GPIO5),
+};
+
+/*
+ * Init patches applied to the registers until the BIOS sets proper defaults
+ */
+static const struct reg_sequence upboard_up2_reg_patches[] __initconst = {
+	// enable I2C voltage-level shifters
+	{ UPFPGA_REG_FUNC_EN0,
+		BIT(UPFPGA_I2C0_EN) |
+		BIT(UPFPGA_I2C1_EN)
+	},
+	// HAT function pins initially set as inputs
+	{ UPFPGA_REG_GPIO_DIR0,
+		BIT(UPFPGA_UP2_UART1_RXD) |
+		BIT(UPFPGA_UP2_UART1_CTS)
+	},
+	{ UPFPGA_REG_GPIO_DIR1,
+		BIT(UPFPGA_UP2_SPI1_RXD)
+	},
+	// HAT function pins initially enabled (i.e. not hi-Z)
+	{ UPFPGA_REG_GPIO_EN0,
+		BIT(UPFPGA_UP2_UART1_TXD) |
+		BIT(UPFPGA_UP2_UART1_RXD) |
+		BIT(UPFPGA_UP2_UART1_RTS) |
+		BIT(UPFPGA_UP2_UART1_CTS) |
+		BIT(UPFPGA_UP2_SPI1_TXD)
+	},
+	{ UPFPGA_REG_GPIO_EN1,
+		BIT(UPFPGA_UP2_SPI1_RXD) |
+		BIT(UPFPGA_UP2_SPI1_FS1) |
+		BIT(UPFPGA_UP2_SPI1_FS0) |
+		BIT(UPFPGA_UP2_SPI1_CLK) |
+		BIT(UPFPGA_UP2_PWM1) |
+		BIT(UPFPGA_UP2_PWM0)
+	},
+};
+
+static const struct upboard_bios upboard_up2_bios_info_v0_3 __initconst = {
+	.patches = upboard_up2_reg_patches,
+	.npatches = ARRAY_SIZE(upboard_up2_reg_patches),
+};
+
+/*
+ * UP Core board + CREX carrier board data
+ */
+
+#define UPBOARD_UPCORE_CREX_BIT_TO_PIN(r, id)				\
+	(UPBOARD_BIT_TO_PIN(r, UPFPGA_UPCORE_CREX_##id))
+
+#define UPBOARD_UPCORE_CREX_PIN_ANON(r, bit)				\
+	{								\
+		.number = UPBOARD_BIT_TO_PIN(r, bit),			\
+	}
+
+#define UPBOARD_UPCORE_CREX_PIN_NAME(r, id)				\
+	{								\
+		.number = UPBOARD_UPCORE_CREX_BIT_TO_PIN(r, id),	\
+		.name = #id,						\
+	}
+
+#define UPBOARD_UPCORE_CREX_PIN_FUNC(r, id, data)			\
+	{								\
+		.number = UPBOARD_UPCORE_CREX_BIT_TO_PIN(r, id),	\
+		.name = #id,						\
+		.drv_data = (void *)(data),				\
+	}
+
+enum upboard_upcore_crex_reg1_fpgabit {
+	UPFPGA_UPCORE_CREX_I2C0_SDA,
+	UPFPGA_UPCORE_CREX_I2C0_SCL,
+	UPFPGA_UPCORE_CREX_I2C1_SDA,
+	UPFPGA_UPCORE_CREX_I2C1_SCL,
+	UPFPGA_UPCORE_CREX_SPI2_CS0,
+	UPFPGA_UPCORE_CREX_SPI2_CS1,
+	UPFPGA_UPCORE_CREX_SPI2_MOSI,
+	UPFPGA_UPCORE_CREX_SPI2_MISO,
+	UPFPGA_UPCORE_CREX_SPI2_CLK,
+	UPFPGA_UPCORE_CREX_UART1_TXD,
+	UPFPGA_UPCORE_CREX_UART1_RXD,
+	UPFPGA_UPCORE_CREX_PWM0,
+	UPFPGA_UPCORE_CREX_PWM1,
+	UPFPGA_UPCORE_CREX_I2S2_FRM,
+	UPFPGA_UPCORE_CREX_I2S2_CLK,
+	UPFPGA_UPCORE_CREX_I2S2_RX,
+};
+
+enum upboard_upcore_crex_reg2_fpgabit {
+	UPFPGA_UPCORE_CREX_I2S2_TX,
+	UPFPGA_UPCORE_CREX_GPIO0,
+	UPFPGA_UPCORE_CREX_GPIO2,
+	UPFPGA_UPCORE_CREX_GPIO3,
+	UPFPGA_UPCORE_CREX_GPIO4,
+	UPFPGA_UPCORE_CREX_GPIO9,
+};
+
+static struct pinctrl_pin_desc upboard_upcore_crex_pins[] = {
+	UPBOARD_UPCORE_CREX_PIN_FUNC(0, I2C0_SDA, &upboard_i2c0_reg),
+	UPBOARD_UPCORE_CREX_PIN_FUNC(0, I2C0_SCL, &upboard_i2c0_reg),
+	UPBOARD_UPCORE_CREX_PIN_FUNC(0, I2C1_SDA, &upboard_i2c1_reg),
+	UPBOARD_UPCORE_CREX_PIN_FUNC(0, I2C1_SCL, &upboard_i2c1_reg),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, SPI2_CS0),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, SPI2_CS1),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, SPI2_MOSI),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, SPI2_MISO),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, SPI2_CLK),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, UART1_TXD),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, UART1_RXD),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, PWM0),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, PWM1),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, I2S2_FRM),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, I2S2_CLK),
+	UPBOARD_UPCORE_CREX_PIN_NAME(0, I2S2_RX),
+	/* register 1 */
+	UPBOARD_UPCORE_CREX_PIN_NAME(1, I2S2_TX),
+	UPBOARD_UPCORE_CREX_PIN_NAME(1, GPIO0),
+	UPBOARD_UPCORE_CREX_PIN_FUNC(1, GPIO2, &upboard_adc0_reg),
+	UPBOARD_UPCORE_CREX_PIN_NAME(1, GPIO3),
+	UPBOARD_UPCORE_CREX_PIN_NAME(1, GPIO4),
+	UPBOARD_UPCORE_CREX_PIN_NAME(1, GPIO9),
+};
+
+static unsigned int upboard_upcore_crex_rpi_mapping[] = {
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2C0_SDA),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2C0_SCL),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2C1_SDA),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2C1_SCL),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, GPIO0),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, GPIO2),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, GPIO3),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, SPI2_CS1),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, SPI2_CS0),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, SPI2_MISO),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, SPI2_MOSI),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, SPI2_CLK),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, PWM0),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, PWM1),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, UART1_TXD),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, UART1_RXD),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, GPIO9),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, GPIO4),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2S2_CLK),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2S2_FRM),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(0, I2S2_RX),
+	UPBOARD_UPCORE_CREX_BIT_TO_PIN(1, I2S2_TX),
+};
+
+/*
+ * Init patches applied to the registers until the BIOS sets proper defaults
+ */
+static const struct reg_sequence upboard_upcore_crex_reg_patches[] __initconst = {
+	// enable I2C voltage-level shifters
+	{ UPFPGA_REG_FUNC_EN0,
+		BIT(UPFPGA_I2C0_EN) |
+		BIT(UPFPGA_I2C1_EN)
+	},
+	// HAT function pins initially set as inputs
+	{ UPFPGA_REG_GPIO_DIR0,
+		BIT(UPFPGA_UPCORE_CREX_SPI2_MISO) |
+		BIT(UPFPGA_UPCORE_CREX_UART1_RXD) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_FRM) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_CLK) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_RX)
+	},
+};
+
+static const struct upboard_bios upboard_upcore_crex_bios_info __initconst = {
+	.patches = upboard_upcore_crex_reg_patches,
+	.npatches = ARRAY_SIZE(upboard_upcore_crex_reg_patches),
+};
+
+/*
+ * UP Core board + CRST02 carrier board data
+ */
+
+#define upboard_upcore_crst02_pins        upboard_upcore_crex_pins
+#define upboard_upcore_crst02_rpi_mapping upboard_upcore_crex_rpi_mapping
+
+/*
+ * Init patches applied to the registers until the BIOS sets proper defaults
+ */
+static const struct reg_sequence upboard_upcore_crst02_reg_patches[] __initconst = {
+	// enable I2C voltage-level shifters
+	{ UPFPGA_REG_FUNC_EN0,
+		BIT(UPFPGA_I2C0_EN) |
+		BIT(UPFPGA_I2C1_EN)
+	},
+	// HAT function pins initially set as inputs
+	{ UPFPGA_REG_GPIO_DIR0,
+		BIT(UPFPGA_UPCORE_CREX_SPI2_MISO) |
+		BIT(UPFPGA_UPCORE_CREX_UART1_RXD) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_FRM) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_CLK) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_RX)
+	},
+	// HAT function pins initially enabled (i.e. not hi-Z)
+	{ UPFPGA_REG_GPIO_EN0,
+		BIT(UPFPGA_UPCORE_CREX_SPI2_CS0) |
+		BIT(UPFPGA_UPCORE_CREX_SPI2_MOSI) |
+		BIT(UPFPGA_UPCORE_CREX_SPI2_MISO) |
+		BIT(UPFPGA_UPCORE_CREX_SPI2_CLK) |
+		BIT(UPFPGA_UPCORE_CREX_UART1_TXD) |
+		BIT(UPFPGA_UPCORE_CREX_UART1_RXD) |
+		BIT(UPFPGA_UPCORE_CREX_PWM0) |
+		BIT(UPFPGA_UPCORE_CREX_PWM1) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_FRM) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_CLK) |
+		BIT(UPFPGA_UPCORE_CREX_I2S2_RX)
+	},
+	{ UPFPGA_REG_GPIO_EN1,
+		BIT(UPFPGA_UPCORE_CREX_I2S2_TX)
+	},
+};
+
+static const struct upboard_bios upboard_upcore_crst02_bios_info __initconst = {
+	.patches = upboard_upcore_crst02_reg_patches,
+	.npatches = ARRAY_SIZE(upboard_upcore_crst02_reg_patches),
+};
+
+static int upboard_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			   unsigned int group)
+{
+	return 0;
+};
+
+static int upboard_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned int pin)
+{
+	const struct pin_desc * const pd = pin_desc_get(pctldev, pin);
+	const struct upboard_pin *p;
+	int ret;
+
+	if (!pd)
+		return -EINVAL;
+	p = pd->drv_data;
+
+	if (p->funcbit) {
+		ret = regmap_field_write(p->funcbit, 0);
+		if (ret)
+			return ret;
+	}
+
+	if (p->enbit) {
+		ret = regmap_field_write(p->enbit, 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+};
+
+static int upboard_gpio_set_direction(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int pin, bool input)
+{
+	const struct pin_desc * const pd = pin_desc_get(pctldev, pin);
+	const struct upboard_pin *p;
+
+	if (!pd)
+		return -EINVAL;
+	p = pd->drv_data;
+
+	return regmap_field_write(p->dirbit, input);
+};
+
+static int upboard_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return 0;
+}
+
+static const char *upboard_get_function_name(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	return NULL;
+}
+
+static int upboard_get_function_groups(struct pinctrl_dev *pctldev,
+			       unsigned int selector,
+			       const char * const **groups,
+			       unsigned int *num_groups)
+{
+	*groups = NULL;
+	*num_groups = 0;
+	return 0;
+}
+
+static const struct pinmux_ops upboard_pinmux_ops = {
+	.get_functions_count = upboard_get_functions_count,
+	.get_function_groups = upboard_get_function_groups,
+	.get_function_name = upboard_get_function_name,
+	.set_mux = upboard_set_mux,
+	.gpio_request_enable = upboard_gpio_request_enable,
+	.gpio_set_direction = upboard_gpio_set_direction,
+};
+
+static int upboard_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return 0;
+}
+
+static const char *upboard_get_group_name(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
+{
+	return NULL;
+}
+
+static const struct pinctrl_ops upboard_pinctrl_ops = {
+	.get_groups_count = upboard_get_groups_count,
+	.get_group_name = upboard_get_group_name,
+};
+
+static struct pinctrl_desc upboard_up_pinctrl_desc = {
+	.pins = upboard_up_pins,
+	.npins = ARRAY_SIZE(upboard_up_pins),
+	.pctlops = &upboard_pinctrl_ops,
+	.pmxops = &upboard_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct pinctrl_desc upboard_up2_pinctrl_desc = {
+	.pins = upboard_up2_pins,
+	.npins = ARRAY_SIZE(upboard_up2_pins),
+	.pctlops = &upboard_pinctrl_ops,
+	.pmxops = &upboard_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct pinctrl_desc upboard_upcore_crex_pinctrl_desc = {
+	.pins = upboard_upcore_crex_pins,
+	.npins = ARRAY_SIZE(upboard_upcore_crex_pins),
+	.pctlops = &upboard_pinctrl_ops,
+	.pmxops = &upboard_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct pinctrl_desc upboard_upcore_crst02_pinctrl_desc = {
+	.pins = upboard_upcore_crst02_pins,
+	.npins = ARRAY_SIZE(upboard_upcore_crst02_pins),
+	.pctlops = &upboard_pinctrl_ops,
+	.pmxops = &upboard_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+
+static int upboard_rpi_to_native_gpio(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct upboard_pinctrl *pctrl =
+		container_of(gc, struct upboard_pinctrl, chip);
+	unsigned int pin = pctrl->rpi_mapping[gpio];
+	struct pinctrl_gpio_range *range =
+		pinctrl_find_gpio_range_from_pin(pctrl->pctldev, pin);
+
+	if (!range)
+		return -ENODEV;
+
+	return range->base;
+}
+
+static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return gpio;
+
+	return gpio_request(gpio, module_name(THIS_MODULE));
+}
+
+static void upboard_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return;
+
+	gpio_free(gpio);
+}
+
+static int upboard_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return gpio;
+
+	return gpio_get_value(gpio);
+}
+
+static void upboard_gpio_set(struct gpio_chip *gc, unsigned int offset, int
+			     value)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return;
+
+	gpio_set_value(gpio, value);
+}
+
+static int upboard_gpio_direction_input(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return gpio;
+
+	return gpio_direction_input(gpio);
+}
+
+static int upboard_gpio_direction_output(struct gpio_chip *gc,
+					 unsigned int offset, int value)
+{
+	int gpio = upboard_rpi_to_native_gpio(gc, offset);
+
+	if (gpio < 0)
+		return gpio;
+
+	return gpio_direction_output(gpio, value);
+}
+
+static struct gpio_chip upboard_gpio_chip = {
+	.label = "Raspberry Pi compatible UP GPIO",
+	.base = 0,
+	.request = upboard_gpio_request,
+	.free = upboard_gpio_free,
+	.get = upboard_gpio_get,
+	.set = upboard_gpio_set,
+	.direction_input = upboard_gpio_direction_input,
+	.direction_output = upboard_gpio_direction_output,
+	.owner = THIS_MODULE,
+};
+
+/* DMI Matches for older bios without fpga initialization */
+static const struct dmi_system_id upboard_dmi_table[] __initconst = {
+	{
+		.matches = { /* UP */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-CHT01"),
+			DMI_EXACT_MATCH(DMI_BOARD_VERSION, "V0.4"),
+		},
+		.driver_data = (void *)&upboard_up_bios_info_dvt,
+	},
+	{
+		.matches = { /* UP2 */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-APL01"),
+			DMI_EXACT_MATCH(DMI_BOARD_VERSION, "V0.3"),
+		},
+		.driver_data = (void *)&upboard_up2_bios_info_v0_3,
+	},
+	{ },
+};
+
+static int __init upboard_pinctrl_probe(struct platform_device *pdev)
+{
+	struct upboard_fpga * const fpga = dev_get_drvdata(pdev->dev.parent);
+	struct acpi_device * const adev = ACPI_COMPANION(&pdev->dev);
+	struct pinctrl_desc *pctldesc;
+	const struct upboard_bios *bios_info = NULL;
+	struct upboard_pinctrl *pctrl;
+	struct upboard_pin *pins;
+	const struct dmi_system_id *system_id;
+	const char *hid;
+	const unsigned int *rpi_mapping;
+	unsigned int ngpio;
+	int ret;
+	int i;
+
+	if (!fpga)
+		return -EINVAL;
+
+	if (!adev)
+		return -ENODEV;
+
+	hid = acpi_device_hid(adev);
+	if (!strcmp(hid, "AANT0F00") || !strcmp(hid, "AANT0F04")) {
+		pctldesc = &upboard_up_pinctrl_desc;
+		rpi_mapping = upboard_up_rpi_mapping;
+		ngpio  = ARRAY_SIZE(upboard_up_rpi_mapping);
+	} else if (!strcmp(hid, "AANT0F01")) {
+		pctldesc = &upboard_up2_pinctrl_desc;
+		rpi_mapping = upboard_up2_rpi_mapping;
+		ngpio  = ARRAY_SIZE(upboard_up2_rpi_mapping);
+	} else if (!strcmp(hid, "AANT0F02")) {
+		pctldesc = &upboard_upcore_crex_pinctrl_desc;
+		rpi_mapping = upboard_upcore_crex_rpi_mapping;
+		ngpio  = ARRAY_SIZE(upboard_upcore_crex_rpi_mapping);
+		bios_info = &upboard_upcore_crex_bios_info;
+	} else if (!strcmp(hid, "AANT0F03")) {
+		pctldesc = &upboard_upcore_crst02_pinctrl_desc;
+		rpi_mapping = upboard_upcore_crst02_rpi_mapping;
+		ngpio  = ARRAY_SIZE(upboard_upcore_crst02_rpi_mapping);
+		bios_info = &upboard_upcore_crst02_bios_info;
+	} else
+		return -ENODEV;
+
+	pctldesc->name = dev_name(&pdev->dev);
+
+	pins = devm_kzalloc(&pdev->dev,
+			    sizeof(*pins) * pctldesc->npins,
+			    GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	/* initialise pins */
+	for (i = 0; i < pctldesc->npins; i++) {
+		struct upboard_pin *pin = &pins[i];
+		struct pinctrl_pin_desc *pd = (struct pinctrl_pin_desc *)
+			&pctldesc->pins[i];
+		struct reg_field fldconf = {0};
+		unsigned int regoff = (pd->number / UPFPGA_REGISTER_SIZE);
+		unsigned int lsb = pd->number % UPFPGA_REGISTER_SIZE;
+
+		pin->funcbit = NULL;
+		if (pd->drv_data) {
+			fldconf = *(struct reg_field *)pd->drv_data;
+			if (!regmap_writeable(fpga->regmap, fldconf.reg))
+				return -EINVAL;
+
+			pin->funcbit = devm_regmap_field_alloc(&pdev->dev,
+							       fpga->regmap,
+							       fldconf);
+			if (IS_ERR(pin->funcbit))
+				return PTR_ERR(pin->funcbit);
+		}
+
+		pin->enbit = NULL;
+		fldconf.reg = UPFPGA_REG_GPIO_EN0 + regoff;
+		fldconf.lsb = lsb;
+		fldconf.msb = lsb;
+
+		/* some platform don't have enable bit, ignore if not present */
+		if (regmap_writeable(fpga->regmap, fldconf.reg)) {
+			pin->enbit = devm_regmap_field_alloc(&pdev->dev,
+							     fpga->regmap,
+							     fldconf);
+			if (IS_ERR(pin->enbit))
+				return PTR_ERR(pin->enbit);
+		}
+
+		fldconf.reg = UPFPGA_REG_GPIO_DIR0 + regoff;
+		fldconf.lsb = lsb;
+		fldconf.msb = lsb;
+
+		if (!regmap_writeable(fpga->regmap, fldconf.reg))
+			return -EINVAL;
+
+		pin->dirbit = devm_regmap_field_alloc(&pdev->dev,
+						      fpga->regmap,
+						      fldconf);
+		if (IS_ERR(pin->dirbit))
+			return PTR_ERR(pin->dirbit);
+
+		pd->drv_data = pin;
+	}
+
+	/* create a new pinctrl device and register it */
+	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->regmap = fpga->regmap;
+	pctrl->rpi_mapping = rpi_mapping;
+	pctrl->chip = upboard_gpio_chip;
+	pctrl->chip.parent = &pdev->dev;
+	pctrl->chip.ngpio = ngpio;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &pctrl->chip, &pctrl->chip);
+	if (ret)
+		return ret;
+
+	pctrl->pctldev = devm_pinctrl_register(&pdev->dev, pctldesc, pctrl);
+	if (IS_ERR(pctrl->pctldev))
+		return PTR_ERR(pctrl->pctldev);
+
+	/* add acpi pin mapping according to external-gpios key */
+	ret = acpi_node_add_pin_mapping(acpi_fwnode_handle(adev),
+					"external-gpios",
+					dev_name(&pdev->dev),
+					0, UINT_MAX);
+	if (ret)
+		return ret;
+
+	if (!bios_info) {
+		/* check for special board versions that require register patches */
+		system_id = dmi_first_match(upboard_dmi_table);
+		if (system_id)
+			bios_info = system_id->driver_data;
+	}
+
+	if (bios_info && bios_info->patches) {
+		ret = regmap_register_patch(pctrl->regmap,
+					    bios_info->patches,
+					    bios_info->npatches);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver upboard_pinctrl_driver = {
+	.driver = {
+		.name = "upboard-pinctrl",
+	},
+};
+
+module_platform_driver_probe(upboard_pinctrl_driver, upboard_pinctrl_probe);
+
+MODULE_AUTHOR("Javier Arteaga <javier@emutex.com>");
+MODULE_AUTHOR("Dan O'Donovan <dan@emutex.com>");
+MODULE_AUTHOR("Nicola Lunghi <nicolal@emutex.com>");
+MODULE_DESCRIPTION("UP Board HAT pin controller driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:upboard-pinctrl");
-- 
2.17.1

