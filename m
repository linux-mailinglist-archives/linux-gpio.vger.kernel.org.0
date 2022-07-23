Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C7357F165
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jul 2022 22:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234901AbiGWUo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 16:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGWUo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 16:44:28 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5B61B7BF
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:44:26 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id p8so7200632plq.13
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CyJ2cU9PNWnFuKDIeCali3LPAoq/e8eOn4S1d/zk/Pc=;
        b=6LKsm1L3CGsFKB65pTwi6hQPhOMsOsqwkzj6oPoRrRP+VqoaQv2e9No+Ij2ePevbqv
         rw2U/XSzCQGj+Im+vyP3pxsBX8xCvZTWfzG0K93mBopRt1JK9ECjuPXC1ywxwqstWzZo
         sw/k1LYNQwQH38ld/TOLyRGm/pYDyavMF5eFDgDUb7C29h5tbVQpTX4uBAvT+xd772+U
         QOcde1FE1RxAVb8HFgHDUDt6XQFdM5nlNs7J3MJS4vXjO5stdd1xpFAblBHt/0AgZU/8
         LGFvOXh/vmYK1SU5kIKDF/ftAXjCT+6UTAdxMHSPFbI+sB/YE2acfQ03JodZpQcvNq/t
         dl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CyJ2cU9PNWnFuKDIeCali3LPAoq/e8eOn4S1d/zk/Pc=;
        b=kLaTrIjjZ8O6QlZX/8Qo+zrLn2NYRf6oXfPnc2uK99fsSEl9+8Fnvqj+JjOP5yqLvo
         DwdYMJiBwWI9HiqK3DjFR9XUNxpB2oulX9yTIcl2QDt20g69jgyGZf8gLaYhWEYl4E+e
         9kYdrcvnxuaELZ+/mQpz43lMBrFmrmUKorpqRAz/oDBF+nOo/sewQhY8CMrVQWWxsd6m
         sjm7N8KS93R5OBL3g2rxm+0Oa/J+rPbGxdzceYetlhL2olyC4bnntzBh9jAOnNemfab+
         tqJe7YjW7XNDLP2JHFNNgkW+2pwMPlwx/CXM4NVmMU7rdUJIJK7hovPAhkhPLczLjJ/x
         JxWg==
X-Gm-Message-State: AJIora/HUAe1qBG0D0XJKMwVFGmSpMtBvdN4wSSdSt/R+/7Pi3RueRR6
        gK+eDVhyBlQzR5i/Ohk89Q/wPQ==
X-Google-Smtp-Source: AGRyM1s2/d25zOCzoEpxrfSgef0h3KH8mqXhef/moMTQ2QsPXzRNF5fDyEhhIvK1gOwFEQpjwlKpCA==
X-Received: by 2002:a17:903:2302:b0:16d:3e89:2152 with SMTP id d2-20020a170903230200b0016d3e892152mr5770348plh.46.1658609065911;
        Sat, 23 Jul 2022 13:44:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:a406:cc30:f4ec:f10a])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b0016a6caacaefsm6187950plg.103.2022.07.23.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 13:44:25 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: [PATCH 07/22] pinctrl: rockchip: Add RV1126 pinctrl support
Date:   Sun, 24 Jul 2022 02:13:20 +0530
Message-Id: <20220723204335.750095-8-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723204335.750095-1-jagan@edgeble.ai>
References: <20220723204335.750095-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RV1126 has five GPIOs groups - GPIO0 in PD_MMU and GPIO1-4
in PD_BUS.

In GPIO0, up to Lower C group GPIO0_C[3:0] is part of PMU
but rest of the groups from there are part of GRF.

Added pinctrl support for RV1126 and the pull, drv and schmitt
calculations are inferred from [1] authored by Jianqun Xu.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/pinctrl/pinctrl-rockchip.c

Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 drivers/pinctrl/pinctrl-rockchip.c | 333 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 327 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 32e41395fc76..a91061f9c2ac 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -57,6 +57,7 @@
 #define IOMUX_UNROUTED		BIT(3)
 #define IOMUX_WIDTH_3BIT	BIT(4)
 #define IOMUX_WIDTH_2BIT	BIT(5)
+#define IOMUX_L_SOURCE_PMU	BIT(6)
 
 #define PIN_BANK(id, pins, label)			\
 	{						\
@@ -147,6 +148,21 @@
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_IOMUX_FLAGS_OFFSET(id, pins, label, iom0, iom1, iom2,	\
+				    iom3, offset0, offset1, offset2,	\
+				    offset3)				\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = offset0 },		\
+			{ .type = iom1, .offset = offset1 },		\
+			{ .type = iom2, .offset = offset2 },		\
+			{ .type = iom3, .offset = offset3 },		\
+		},							\
+	}
+
 #define PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(id, pins, label, iom0, iom1,	\
 					iom2, iom3, drv0, drv1, drv2,	\
 					drv3, offset0, offset1,		\
@@ -443,6 +459,37 @@ static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	},
 };
 
+static struct rockchip_mux_recalced_data rv1126_mux_recalced_data[] = {
+	{
+		.num = 0,
+		.pin = 20,
+		.reg = 0x10000,
+		.bit = 0,
+		.mask = 0xf
+	},
+	{
+		.num = 0,
+		.pin = 21,
+		.reg = 0x10000,
+		.bit = 4,
+		.mask = 0xf
+	},
+	{
+		.num = 0,
+		.pin = 22,
+		.reg = 0x10000,
+		.bit = 8,
+		.mask = 0xf
+	},
+	{
+		.num = 0,
+		.pin = 23,
+		.reg = 0x10000,
+		.bit = 12,
+		.mask = 0xf
+	},
+};
+
 static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
 	{
 		.num = 2,
@@ -642,6 +689,103 @@ static struct rockchip_mux_route_data px30_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB7, 2, 0x184, BIT(16 + 9) | BIT(9)), /* uart3-rxm1 */
 };
 
+static struct rockchip_mux_route_data rv1126_mux_route_data[] = {
+	RK_MUXROUTE_GRF(3, RK_PD2, 1, 0x10260, WRITE_MASK_VAL(0, 0, 0)), /* I2S0_MCLK_M0 */
+	RK_MUXROUTE_GRF(3, RK_PB0, 3, 0x10260, WRITE_MASK_VAL(0, 0, 1)), /* I2S0_MCLK_M1 */
+
+	RK_MUXROUTE_GRF(0, RK_PD4, 4, 0x10260, WRITE_MASK_VAL(3, 2, 0)), /* I2S1_MCLK_M0 */
+	RK_MUXROUTE_GRF(1, RK_PD5, 2, 0x10260, WRITE_MASK_VAL(3, 2, 1)), /* I2S1_MCLK_M1 */
+	RK_MUXROUTE_GRF(2, RK_PC7, 6, 0x10260, WRITE_MASK_VAL(3, 2, 2)), /* I2S1_MCLK_M2 */
+
+	RK_MUXROUTE_GRF(1, RK_PD0, 1, 0x10260, WRITE_MASK_VAL(4, 4, 0)), /* I2S2_MCLK_M0 */
+	RK_MUXROUTE_GRF(2, RK_PB3, 2, 0x10260, WRITE_MASK_VAL(4, 4, 1)), /* I2S2_MCLK_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PD4, 2, 0x10260, WRITE_MASK_VAL(12, 12, 0)), /* PDM_CLK0_M0 */
+	RK_MUXROUTE_GRF(3, RK_PC0, 3, 0x10260, WRITE_MASK_VAL(12, 12, 1)), /* PDM_CLK0_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PC6, 1, 0x10264, WRITE_MASK_VAL(0, 0, 0)), /* CIF_CLKOUT_M0 */
+	RK_MUXROUTE_GRF(2, RK_PD1, 3, 0x10264, WRITE_MASK_VAL(0, 0, 1)), /* CIF_CLKOUT_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA4, 5, 0x10264, WRITE_MASK_VAL(5, 4, 0)), /* I2C3_SCL_M0 */
+	RK_MUXROUTE_GRF(2, RK_PD4, 7, 0x10264, WRITE_MASK_VAL(5, 4, 1)), /* I2C3_SCL_M1 */
+	RK_MUXROUTE_GRF(1, RK_PD6, 3, 0x10264, WRITE_MASK_VAL(5, 4, 2)), /* I2C3_SCL_M2 */
+
+	RK_MUXROUTE_GRF(3, RK_PA0, 7, 0x10264, WRITE_MASK_VAL(6, 6, 0)), /* I2C4_SCL_M0 */
+	RK_MUXROUTE_GRF(4, RK_PA0, 4, 0x10264, WRITE_MASK_VAL(6, 6, 1)), /* I2C4_SCL_M1 */
+
+	RK_MUXROUTE_GRF(2, RK_PA5, 7, 0x10264, WRITE_MASK_VAL(9, 8, 0)), /* I2C5_SCL_M0 */
+	RK_MUXROUTE_GRF(3, RK_PB0, 5, 0x10264, WRITE_MASK_VAL(9, 8, 1)), /* I2C5_SCL_M1 */
+	RK_MUXROUTE_GRF(1, RK_PD0, 4, 0x10264, WRITE_MASK_VAL(9, 8, 2)), /* I2C5_SCL_M2 */
+
+	RK_MUXROUTE_GRF(3, RK_PC0, 5, 0x10264, WRITE_MASK_VAL(11, 10, 0)), /* SPI1_CLK_M0 */
+	RK_MUXROUTE_GRF(1, RK_PC6, 3, 0x10264, WRITE_MASK_VAL(11, 10, 1)), /* SPI1_CLK_M1 */
+	RK_MUXROUTE_GRF(2, RK_PD5, 6, 0x10264, WRITE_MASK_VAL(11, 10, 2)), /* SPI1_CLK_M2 */
+
+	RK_MUXROUTE_GRF(3, RK_PC0, 2, 0x10264, WRITE_MASK_VAL(12, 12, 0)), /* RGMII_CLK_M0 */
+	RK_MUXROUTE_GRF(2, RK_PB7, 2, 0x10264, WRITE_MASK_VAL(12, 12, 1)), /* RGMII_CLK_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA1, 3, 0x10264, WRITE_MASK_VAL(13, 13, 0)), /* CAN_TXD_M0 */
+	RK_MUXROUTE_GRF(3, RK_PA7, 5, 0x10264, WRITE_MASK_VAL(13, 13, 1)), /* CAN_TXD_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA4, 6, 0x10268, WRITE_MASK_VAL(0, 0, 0)), /* PWM8_M0 */
+	RK_MUXROUTE_GRF(2, RK_PD7, 5, 0x10268, WRITE_MASK_VAL(0, 0, 1)), /* PWM8_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA5, 6, 0x10268, WRITE_MASK_VAL(2, 2, 0)), /* PWM9_M0 */
+	RK_MUXROUTE_GRF(2, RK_PD6, 5, 0x10268, WRITE_MASK_VAL(2, 2, 1)), /* PWM9_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA6, 6, 0x10268, WRITE_MASK_VAL(4, 4, 0)), /* PWM10_M0 */
+	RK_MUXROUTE_GRF(2, RK_PD5, 5, 0x10268, WRITE_MASK_VAL(4, 4, 1)), /* PWM10_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PA7, 6, 0x10268, WRITE_MASK_VAL(6, 6, 0)), /* PWM11_IR_M0 */
+	RK_MUXROUTE_GRF(3, RK_PA1, 5, 0x10268, WRITE_MASK_VAL(6, 6, 1)), /* PWM11_IR_M1 */
+
+	RK_MUXROUTE_GRF(1, RK_PA5, 3, 0x10268, WRITE_MASK_VAL(8, 8, 0)), /* UART2_TX_M0 */
+	RK_MUXROUTE_GRF(3, RK_PA2, 1, 0x10268, WRITE_MASK_VAL(8, 8, 1)), /* UART2_TX_M1 */
+
+	RK_MUXROUTE_GRF(3, RK_PC6, 3, 0x10268, WRITE_MASK_VAL(11, 10, 0)), /* UART3_TX_M0 */
+	RK_MUXROUTE_GRF(1, RK_PA7, 2, 0x10268, WRITE_MASK_VAL(11, 10, 1)), /* UART3_TX_M1 */
+	RK_MUXROUTE_GRF(3, RK_PA0, 4, 0x10268, WRITE_MASK_VAL(11, 10, 2)), /* UART3_TX_M2 */
+
+	RK_MUXROUTE_GRF(3, RK_PA4, 4, 0x10268, WRITE_MASK_VAL(13, 12, 0)), /* UART4_TX_M0 */
+	RK_MUXROUTE_GRF(2, RK_PA6, 4, 0x10268, WRITE_MASK_VAL(13, 12, 1)), /* UART4_TX_M1 */
+	RK_MUXROUTE_GRF(1, RK_PD5, 3, 0x10268, WRITE_MASK_VAL(13, 12, 2)), /* UART4_TX_M2 */
+
+	RK_MUXROUTE_GRF(3, RK_PA6, 4, 0x10268, WRITE_MASK_VAL(15, 14, 0)), /* UART5_TX_M0 */
+	RK_MUXROUTE_GRF(2, RK_PB0, 4, 0x10268, WRITE_MASK_VAL(15, 14, 1)), /* UART5_TX_M1 */
+	RK_MUXROUTE_GRF(2, RK_PA0, 3, 0x10268, WRITE_MASK_VAL(15, 14, 2)), /* UART5_TX_M2 */
+
+	RK_MUXROUTE_PMU(0, RK_PB6, 3, 0x0114, WRITE_MASK_VAL(0, 0, 0)), /* PWM0_M0 */
+	RK_MUXROUTE_PMU(2, RK_PB3, 5, 0x0114, WRITE_MASK_VAL(0, 0, 1)), /* PWM0_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PB7, 3, 0x0114, WRITE_MASK_VAL(2, 2, 0)), /* PWM1_M0 */
+	RK_MUXROUTE_PMU(2, RK_PB2, 5, 0x0114, WRITE_MASK_VAL(2, 2, 1)), /* PWM1_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PC0, 3, 0x0114, WRITE_MASK_VAL(4, 4, 0)), /* PWM2_M0 */
+	RK_MUXROUTE_PMU(2, RK_PB1, 5, 0x0114, WRITE_MASK_VAL(4, 4, 1)), /* PWM2_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PC1, 3, 0x0114, WRITE_MASK_VAL(6, 6, 0)), /* PWM3_IR_M0 */
+	RK_MUXROUTE_PMU(2, RK_PB0, 5, 0x0114, WRITE_MASK_VAL(6, 6, 1)), /* PWM3_IR_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PC2, 3, 0x0114, WRITE_MASK_VAL(8, 8, 0)), /* PWM4_M0 */
+	RK_MUXROUTE_PMU(2, RK_PA7, 5, 0x0114, WRITE_MASK_VAL(8, 8, 1)), /* PWM4_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PC3, 3, 0x0114, WRITE_MASK_VAL(10, 10, 0)), /* PWM5_M0 */
+	RK_MUXROUTE_PMU(2, RK_PA6, 5, 0x0114, WRITE_MASK_VAL(10, 10, 1)), /* PWM5_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PB2, 3, 0x0114, WRITE_MASK_VAL(12, 12, 0)), /* PWM6_M0 */
+	RK_MUXROUTE_PMU(2, RK_PD4, 5, 0x0114, WRITE_MASK_VAL(12, 12, 1)), /* PWM6_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PB1, 3, 0x0114, WRITE_MASK_VAL(14, 14, 0)), /* PWM7_IR_M0 */
+	RK_MUXROUTE_PMU(3, RK_PA0, 5, 0x0114, WRITE_MASK_VAL(14, 14, 1)), /* PWM7_IR_M1 */
+
+	RK_MUXROUTE_PMU(0, RK_PB0, 1, 0x0118, WRITE_MASK_VAL(1, 0, 0)), /* SPI0_CLK_M0 */
+	RK_MUXROUTE_PMU(2, RK_PA1, 1, 0x0118, WRITE_MASK_VAL(1, 0, 1)), /* SPI0_CLK_M1 */
+	RK_MUXROUTE_PMU(2, RK_PB2, 6, 0x0118, WRITE_MASK_VAL(1, 0, 2)), /* SPI0_CLK_M2 */
+
+	RK_MUXROUTE_PMU(0, RK_PB6, 2, 0x0118, WRITE_MASK_VAL(2, 2, 0)), /* UART1_TX_M0 */
+	RK_MUXROUTE_PMU(1, RK_PD0, 5, 0x0118, WRITE_MASK_VAL(2, 2, 1)), /* UART1_TX_M1 */
+};
+
 static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB2, 1, 0x144, BIT(16 + 3) | BIT(16 + 4)), /* spi-0 */
 	RK_MUXROUTE_SAME(1, RK_PD3, 3, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(3)), /* spi-1 */
@@ -877,8 +1021,12 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY)
 		return RK_FUNC_GPIO;
 
-	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
-				? info->regmap_pmu : info->regmap_base;
+	if (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
+		regmap = info->regmap_pmu;
+	else if (bank->iomux[iomux_num].type & IOMUX_L_SOURCE_PMU)
+		regmap = (pin % 8 < 4) ? info->regmap_pmu : info->regmap_base;
+	else
+		regmap = info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -987,8 +1135,12 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 
 	dev_dbg(dev, "setting mux of GPIO%d-%d to %d\n", bank->bank_num, pin, mux);
 
-	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
-				? info->regmap_pmu : info->regmap_base;
+	if (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
+		regmap = info->regmap_pmu;
+	else if (bank->iomux[iomux_num].type & IOMUX_L_SOURCE_PMU)
+		regmap = (pin % 8 < 4) ? info->regmap_pmu : info->regmap_base;
+	else
+		regmap = info->regmap_base;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -1268,6 +1420,119 @@ static int rv1108_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1126_PULL_PMU_OFFSET		0x40
+#define RV1126_PULL_GRF_GPIO1A0_OFFSET	0x10108
+#define RV1126_PULL_PINS_PER_REG	8
+#define RV1126_PULL_BITS_PER_PIN	2
+#define RV1126_PULL_BANK_STRIDE		16
+#define RV1126_GPIO_C4_D7(p)		(p >= 20 && p <= 31) /* GPIO0_C4 ~ GPIO0_D7 */
+
+static int rv1126_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		if (RV1126_GPIO_C4_D7(pin_num)) {
+			*regmap = info->regmap_base;
+			*reg = RV1126_PULL_GRF_GPIO1A0_OFFSET;
+			*reg -= (((31 - pin_num) / RV1126_PULL_PINS_PER_REG + 1) * 4);
+			*bit = pin_num % RV1126_PULL_PINS_PER_REG;
+			*bit *= RV1126_PULL_BITS_PER_PIN;
+			return 0;
+		}
+		*regmap = info->regmap_pmu;
+		*reg = RV1126_PULL_PMU_OFFSET;
+	} else {
+		*reg = RV1126_PULL_GRF_GPIO1A0_OFFSET;
+		*regmap = info->regmap_base;
+		*reg += (bank->bank_num - 1) * RV1126_PULL_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RV1126_PULL_PINS_PER_REG) * 4);
+	*bit = (pin_num % RV1126_PULL_PINS_PER_REG);
+	*bit *= RV1126_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126_DRV_PMU_OFFSET		0x20
+#define RV1126_DRV_GRF_GPIO1A0_OFFSET	0x10090
+#define RV1126_DRV_BITS_PER_PIN		4
+#define RV1126_DRV_PINS_PER_REG		4
+#define RV1126_DRV_BANK_STRIDE		32
+
+static int rv1126_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		if (RV1126_GPIO_C4_D7(pin_num)) {
+			*regmap = info->regmap_base;
+			*reg = RV1126_DRV_GRF_GPIO1A0_OFFSET;
+			*reg -= (((31 - pin_num) / RV1126_DRV_PINS_PER_REG + 1) * 4);
+			*reg -= 0x4;
+			*bit = pin_num % RV1126_DRV_PINS_PER_REG;
+			*bit *= RV1126_DRV_BITS_PER_PIN;
+			return 0;
+		}
+		*regmap = info->regmap_pmu;
+		*reg = RV1126_DRV_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RV1126_DRV_GRF_GPIO1A0_OFFSET;
+		*reg += (bank->bank_num - 1) * RV1126_DRV_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RV1126_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126_DRV_PINS_PER_REG;
+	*bit *= RV1126_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126_SCHMITT_PMU_OFFSET		0x60
+#define RV1126_SCHMITT_GRF_GPIO1A0_OFFSET	0x10188
+#define RV1126_SCHMITT_BANK_STRIDE		16
+#define RV1126_SCHMITT_PINS_PER_GRF_REG		8
+#define RV1126_SCHMITT_PINS_PER_PMU_REG		8
+
+static int rv1126_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int pins_per_reg;
+
+	if (bank->bank_num == 0) {
+		if (RV1126_GPIO_C4_D7(pin_num)) {
+			*regmap = info->regmap_base;
+			*reg = RV1126_SCHMITT_GRF_GPIO1A0_OFFSET;
+			*reg -= (((31 - pin_num) / RV1126_SCHMITT_PINS_PER_GRF_REG + 1) * 4);
+			*bit = pin_num % RV1126_SCHMITT_PINS_PER_GRF_REG;
+			return 0;
+		}
+		*regmap = info->regmap_pmu;
+		*reg = RV1126_SCHMITT_PMU_OFFSET;
+		pins_per_reg = RV1126_SCHMITT_PINS_PER_PMU_REG;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RV1126_SCHMITT_GRF_GPIO1A0_OFFSET;
+		pins_per_reg = RV1126_SCHMITT_PINS_PER_GRF_REG;
+		*reg += (bank->bank_num - 1) * RV1126_SCHMITT_BANK_STRIDE;
+	}
+	*reg += ((pin_num / pins_per_reg) * 4);
+	*bit = pin_num % pins_per_reg;
+
+	return 0;
+}
+
 #define RK3308_SCHMITT_PINS_PER_REG		8
 #define RK3308_SCHMITT_BANK_STRIDE		16
 #define RK3308_SCHMITT_GRF_OFFSET		0x1a0
@@ -1998,6 +2263,12 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		goto config;
 	}
 
+	if (ctrl->type == RV1126) {
+		rmask_bits = RV1126_DRV_BITS_PER_PIN;
+		ret = strength;
+		goto config;
+	}
+
 	ret = -EINVAL;
 	for (i = 0; i < ARRAY_SIZE(rockchip_perpin_drv_list[drv_type]); i++) {
 		if (rockchip_perpin_drv_list[drv_type][i] == strength) {
@@ -2168,6 +2439,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1108:
+	case RV1126:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -2416,6 +2688,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1108:
+	case RV1126:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -2889,12 +3162,14 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			/* preset iomux offset value, set new start value */
 			if (iom->offset >= 0) {
-				if (iom->type & IOMUX_SOURCE_PMU)
+				if ((iom->type & IOMUX_SOURCE_PMU) ||
+				    (iom->type & IOMUX_L_SOURCE_PMU))
 					pmu_offs = iom->offset;
 				else
 					grf_offs = iom->offset;
 			} else { /* set current iomux offset */
-				iom->offset = (iom->type & IOMUX_SOURCE_PMU) ?
+				iom->offset = ((iom->type & IOMUX_SOURCE_PMU) ||
+					       (iom->type & IOMUX_L_SOURCE_PMU)) ?
 							pmu_offs : grf_offs;
 			}
 
@@ -2919,7 +3194,7 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			inc = (iom->type & (IOMUX_WIDTH_4BIT |
 					    IOMUX_WIDTH_3BIT |
 					    IOMUX_WIDTH_2BIT)) ? 8 : 4;
-			if (iom->type & IOMUX_SOURCE_PMU)
+			if ((iom->type & IOMUX_SOURCE_PMU) || (iom->type & IOMUX_L_SOURCE_PMU))
 				pmu_offs += inc;
 			else
 				grf_offs += inc;
@@ -3178,6 +3453,48 @@ static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
 	.schmitt_calc_reg	= rv1108_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1126_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_L_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x10010, 0x10018, 0x10020, 0x10028),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 2, "gpio4",
+			     IOMUX_WIDTH_4BIT, 0, 0, 0),
+};
+
+static struct rockchip_pin_ctrl rv1126_pin_ctrl = {
+	.pin_banks		= rv1126_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1126_pin_banks),
+	.label			= "RV1126-GPIO",
+	.type			= RV1126,
+	.grf_mux_offset		= 0x10004, /* mux offset from GPIO0_D0 */
+	.pmu_mux_offset		= 0x0,
+	.iomux_routes		= rv1126_mux_route_data,
+	.niomux_routes		= ARRAY_SIZE(rv1126_mux_route_data),
+	.iomux_recalced		= rv1126_mux_recalced_data,
+	.niomux_recalced	= ARRAY_SIZE(rv1126_mux_recalced_data),
+	.pull_calc_reg		= rv1126_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1126_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1126_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk2928_pin_banks[] = {
 	PIN_BANK(0, 32, "gpio0"),
 	PIN_BANK(1, 32, "gpio1"),
@@ -3568,6 +3885,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
+	{ .compatible = "rockchip,rv1126-pinctrl",
+		.data = &rv1126_pin_ctrl },
 	{ .compatible = "rockchip,rk2928-pinctrl",
 		.data = &rk2928_pin_ctrl },
 	{ .compatible = "rockchip,rk3036-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index ec46f8815ac9..4759f336941e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -186,6 +186,7 @@
 enum rockchip_pinctrl_type {
 	PX30,
 	RV1108,
+	RV1126,
 	RK2928,
 	RK3066B,
 	RK3128,
-- 
2.25.1

