Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4976F2231AB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 05:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgGQD1v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 23:27:51 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:59480 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgGQD1v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 23:27:51 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 7AACFEC7BF;
        Fri, 17 Jul 2020 11:27:40 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P4704T139888507881216S1594956458591781_;
        Fri, 17 Jul 2020 11:27:39 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d5d5c28e874b98d496f38e8f03b74f6c>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 13/13] pinctrl: rockchip: do codingstyle by adding mux route definitions
Date:   Fri, 17 Jul 2020 11:27:37 +0800
Message-Id: <20200717032737.18489-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717032411.17654-1-jay.xu@rock-chips.com>
References: <20200717032411.17654-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add MR_SAME/MR_GRF/MR_PMU definitions, and update data in mux route
structures.

This patch do nothing change, only do some codingstyle.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 674 +++++------------------------
 1 file changed, 104 insertions(+), 570 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 71a367896297..50558ffcc05c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -78,6 +78,9 @@ enum rockchip_pinctrl_type {
 #define ROCKCHIP_DRV_3BITS_PER_PIN	(3)
 #define ROCKCHIP_DRV_BITS_PER_PIN	(2)
 
+#define RK_GENMASK_VAL(h, l, v) \
+	(GENMASK(((h) + 16), ((l) + 16)) | (((v) << (l)) & GENMASK((h), (l))))
+
 /**
  * @type: iomux variant using IOMUX_* constants
  * @offset: if initialized to -1 it will be autocalculated, by specifying
@@ -290,6 +293,25 @@ struct rockchip_pin_bank {
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG)		\
+	{								\
+		.bank_num	= ID,					\
+		.pin		= PIN,					\
+		.func		= FUNC,					\
+		.route_offset	= REG,					\
+		.route_val	= VAL,					\
+		.route_location	= FLAG,					\
+	}
+
+#define MR_SAME(ID, PIN, FUNC, REG, VAL) \
+	PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_SAME)
+
+#define MR_GRF(ID, PIN, FUNC, REG, VAL)	\
+	PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_GRF)
+
+#define MR_PMU(ID, PIN, FUNC, REG, VAL)	\
+	PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_PMU)
+
 /**
  * struct rockchip_mux_recalced_data: represent a pin iomux data.
  * @num: bank number.
@@ -804,597 +826,109 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 }
 
 static struct rockchip_mux_route_data px30_mux_route_data[] = {
-	{
-		/* cif-d2m0 */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 1,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 7),
-	}, {
-		/* cif-d2m1 */
-		.bank_num = 3,
-		.pin = 3,
-		.func = 3,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 7) | BIT(7),
-	}, {
-		/* pdm-m0 */
-		.bank_num = 3,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 8),
-	}, {
-		/* pdm-m1 */
-		.bank_num = 2,
-		.pin = 22,
-		.func = 1,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 8) | BIT(8),
-	}, {
-		/* uart2-rxm0 */
-		.bank_num = 1,
-		.pin = 27,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 10),
-	}, {
-		/* uart2-rxm1 */
-		.bank_num = 2,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 10) | BIT(10),
-	}, {
-		/* uart3-rxm0 */
-		.bank_num = 0,
-		.pin = 17,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 9),
-	}, {
-		/* uart3-rxm1 */
-		.bank_num = 1,
-		.pin = 15,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 9) | BIT(9),
-	},
+	MR_SAME(2, 0, 1, 0x184, RK_GENMASK_VAL(7, 7, 0)), /* cif-d2m0 */
+	MR_SAME(3, 3, 3, 0x184, RK_GENMASK_VAL(7, 7, 1)), /* cif-d2m1 */
+	MR_SAME(3, 22, 2, 0x184, RK_GENMASK_VAL(8, 8, 0)), /* pdm-m0 */
+	MR_SAME(2, 22, 1, 0x184, RK_GENMASK_VAL(8, 8, 1)), /* pdm-m1 */
+	MR_SAME(0, 17, 2, 0x184, RK_GENMASK_VAL(9, 9, 0)), /* uart3-rxm0 */
+	MR_SAME(1, 15, 2, 0x184, RK_GENMASK_VAL(9, 9, 1)), /* uart3-rxm1 */
+	MR_SAME(1, 27, 2, 0x184, RK_GENMASK_VAL(10, 10, 0)), /* uart2-rxm0 */
+	MR_SAME(2, 14, 2, 0x184, RK_GENMASK_VAL(10, 10, 1)), /* uart2-rxm1 */
 };
 
 static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
-	{
-		/* spi-0 */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4),
-	}, {
-		/* spi-1 */
-		.bank_num = 1,
-		.pin = 27,
-		.func = 3,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(3),
-	}, {
-		/* spi-2 */
-		.bank_num = 0,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(4),
-	}, {
-		/* i2s-0 */
-		.bank_num = 1,
-		.pin = 5,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 5),
-	}, {
-		/* i2s-1 */
-		.bank_num = 0,
-		.pin = 14,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 5) | BIT(5),
-	}, {
-		/* emmc-0 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 6),
-	}, {
-		/* emmc-1 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 6) | BIT(6),
-	},
+	MR_SAME(1, 10, 1, 0x144, RK_GENMASK_VAL(4, 3, 0)), /* spi-0 */
+	MR_SAME(1, 27, 3, 0x144, RK_GENMASK_VAL(4, 3, 1)), /* spi-1 */
+	MR_SAME(0, 13, 2, 0x144, RK_GENMASK_VAL(4, 3, 2)), /* spi-2 */
+	MR_SAME(1, 5, 1, 0x144, RK_GENMASK_VAL(5, 5, 0)), /* i2s-0 */
+	MR_SAME(1, 14, 1, 0x144, RK_GENMASK_VAL(5, 5, 1)), /* i2s-1 */
+	MR_SAME(1, 22, 2, 0x144, RK_GENMASK_VAL(6, 6, 0)), /* emmc-0 */
+	MR_SAME(2, 4, 2, 0x144, RK_GENMASK_VAL(6, 6, 1)), /* emmc-1 */
 };
 
 static struct rockchip_mux_route_data rk3188_mux_route_data[] = {
-	{
-		/* non-iomuxed emmc/flash pins on flash-dqs */
-		.bank_num = 0,
-		.pin = 24,
-		.func = 1,
-		.route_location = ROCKCHIP_ROUTE_GRF,
-		.route_offset = 0xa0,
-		.route_val = BIT(16 + 11),
-	}, {
-		/* non-iomuxed emmc/flash pins on emmc-clk */
-		.bank_num = 0,
-		.pin = 24,
-		.func = 2,
-		.route_location = ROCKCHIP_ROUTE_GRF,
-		.route_offset = 0xa0,
-		.route_val = BIT(16 + 11) | BIT(11),
-	},
+	/* non-iomuxed emmc/flash pins on flash-dqs */
+	MR_GRF(0, 24, 1, 0xa0, RK_GENMASK_VAL(11, 11, 0)),
+	/* non-iomuxed emmc/flash pins on emmc-clk */
+	MR_GRF(0, 24, 2, 0xa0, RK_GENMASK_VAL(11, 11, 1)),
 };
 
 static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
-	{
-		/* pwm0-0 */
-		.bank_num = 0,
-		.pin = 26,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16),
-	}, {
-		/* pwm0-1 */
-		.bank_num = 3,
-		.pin = 21,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(0),
-	}, {
-		/* pwm1-0 */
-		.bank_num = 0,
-		.pin = 27,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 1),
-	}, {
-		/* pwm1-1 */
-		.bank_num = 0,
-		.pin = 30,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 1) | BIT(1),
-	}, {
-		/* pwm2-0 */
-		.bank_num = 0,
-		.pin = 28,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2),
-	}, {
-		/* pwm2-1 */
-		.bank_num = 1,
-		.pin = 12,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* pwm3-0 */
-		.bank_num = 3,
-		.pin = 26,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* pwm3-1 */
-		.bank_num = 1,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* sdio-0_d0 */
-		.bank_num = 1,
-		.pin = 1,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 4),
-	}, {
-		/* sdio-1_d0 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 4) | BIT(4),
-	}, {
-		/* spi-0_rx */
-		.bank_num = 0,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 5),
-	}, {
-		/* spi-1_rx */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 5) | BIT(5),
-	}, {
-		/* emmc-0_cmd */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 7),
-	}, {
-		/* emmc-1_cmd */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 7) | BIT(7),
-	}, {
-		/* uart2-0_rx */
-		.bank_num = 1,
-		.pin = 19,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 8),
-	}, {
-		/* uart2-1_rx */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 8) | BIT(8),
-	}, {
-		/* uart1-0_rx */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 11),
-	}, {
-		/* uart1-1_rx */
-		.bank_num = 3,
-		.pin = 13,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 11) | BIT(11),
-	},
+	MR_SAME(0, 26, 1, 0x50, RK_GENMASK_VAL(0, 0, 0)), /* pwm0-0 */
+	MR_SAME(3, 21, 1, 0x50, RK_GENMASK_VAL(0, 0, 1)), /* pwm0-1 */
+	MR_SAME(0, 27, 1, 0x50, RK_GENMASK_VAL(1, 1, 0)), /* pwm1-0 */
+	MR_SAME(0, 30, 2, 0x50, RK_GENMASK_VAL(1, 1, 1)), /* pwm1-1 */
+	MR_SAME(0, 28, 1, 0x50, RK_GENMASK_VAL(2, 2, 0)), /* pwm2-0 */
+	MR_SAME(1, 12, 2, 0x50, RK_GENMASK_VAL(2, 2, 1)), /* pwm2-1 */
+	MR_SAME(3, 26, 1, 0x50, RK_GENMASK_VAL(3, 3, 0)), /* pwm3-0 */
+	MR_SAME(1, 11, 2, 0x50, RK_GENMASK_VAL(3, 3, 1)), /* pwm3-1 */
+	MR_SAME(1, 1, 1, 0x50, RK_GENMASK_VAL(4, 4, 0)), /* sdio-0_d0 */
+	MR_SAME(3, 2, 1, 0x50, RK_GENMASK_VAL(4, 4, 1)), /* sdio-1_d0 */
+	MR_SAME(0, 13, 2, 0x50, RK_GENMASK_VAL(5, 5, 0)), /* spi-0_rx */
+	MR_SAME(2, 0, 2, 0x50, RK_GENMASK_VAL(5, 5, 1)), /* spi-1_rx */
+	MR_SAME(1, 22, 2, 0x50, RK_GENMASK_VAL(7, 7, 0)), /* emmc-0_cmd */
+	MR_SAME(2, 4, 2, 0x50, RK_GENMASK_VAL(7, 7, 1)), /* emmc-1_cmd */
+	MR_SAME(1, 19, 2, 0x50, RK_GENMASK_VAL(8, 8, 0)), /* uart2-0_rx */
+	MR_SAME(1, 10, 2, 0x50, RK_GENMASK_VAL(8, 8, 1)), /* uart2-1_rx */
+	MR_SAME(1, 10, 1, 0x50, RK_GENMASK_VAL(11, 11, 0)), /* uart1-0_rx */
+	MR_SAME(3, 13, 1, 0x50, RK_GENMASK_VAL(11, 11, 1)), /* uart1-1_rx */
 };
 
 static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
-	{
-		/* edphdmi_cecinoutt1 */
-		.bank_num = 7,
-		.pin = 16,
-		.func = 2,
-		.route_offset = 0x264,
-		.route_val = BIT(16 + 12) | BIT(12),
-	}, {
-		/* edphdmi_cecinout */
-		.bank_num = 7,
-		.pin = 23,
-		.func = 4,
-		.route_offset = 0x264,
-		.route_val = BIT(16 + 12),
-	},
+	MR_SAME(7, 16, 2, 0x264, RK_GENMASK_VAL(12, 12, 1)), /* edphdmi_cecinoutt1 */
+	MR_SAME(7, 23, 4, 0x264, RK_GENMASK_VAL(12, 12, 0)), /* edphdmi_cecinout */
 };
 
 static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
-	{
-		/* rtc_clk */
-		.bank_num = 0,
-		.pin = 19,
-		.func = 1,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 0) | BIT(0),
-	}, {
-		/* uart2_rxm0 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 2) | BIT(16 + 3),
-	}, {
-		/* uart2_rxm1 */
-		.bank_num = 4,
-		.pin = 26,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 2) | BIT(16 + 3) | BIT(2),
-	}, {
-		/* i2c3_sdam0 */
-		.bank_num = 0,
-		.pin = 15,
-		.func = 2,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9),
-	}, {
-		/* i2c3_sdam1 */
-		.bank_num = 3,
-		.pin = 12,
-		.func = 2,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(8),
-	}, {
-		/* i2c3_sdam2 */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 3,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(9),
-	}, {
-		/* i2s-8ch-1-sclktxm0 */
-		.bank_num = 1,
-		.pin = 3,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* i2s-8ch-1-sclkrxm0 */
-		.bank_num = 1,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* i2s-8ch-1-sclktxm1 */
-		.bank_num = 1,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* i2s-8ch-1-sclkrxm1 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* pdm-clkm0 */
-		.bank_num = 1,
-		.pin = 4,
-		.func = 3,
-		.route_offset = 0x308,
-		.route_val =  BIT(16 + 12) | BIT(16 + 13),
-	}, {
-		/* pdm-clkm1 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 4,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
-	}, {
-		/* pdm-clkm2 */
-		.bank_num = 2,
-		.pin = 6,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
-	}, {
-		/* pdm-clkm-m2 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 3,
-		.route_offset = 0x600,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* spi1_miso */
-		.bank_num = 3,
-		.pin = 10,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 9),
-	}, {
-		/* spi1_miso_m1 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 9) | BIT(9),
-	}, {
-		/* owire_m0 */
-		.bank_num = 0,
-		.pin = 11,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11),
-	}, {
-		/* owire_m1 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 7,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
-	}, {
-		/* owire_m2 */
-		.bank_num = 2,
-		.pin = 2,
-		.func = 5,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
-	}, {
-		/* can_rxd_m0 */
-		.bank_num = 0,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13),
-	}, {
-		/* can_rxd_m1 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 5,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
-	}, {
-		/* can_rxd_m2 */
-		.bank_num = 2,
-		.pin = 2,
-		.func = 4,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
-	}, {
-		/* mac_rxd0_m0 */
-		.bank_num = 1,
-		.pin = 20,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 14),
-	}, {
-		/* mac_rxd0_m1 */
-		.bank_num = 4,
-		.pin = 2,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 14) | BIT(14),
-	}, {
-		/* uart3_rx */
-		.bank_num = 3,
-		.pin = 12,
-		.func = 4,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 15),
-	}, {
-		/* uart3_rx_m1 */
-		.bank_num = 0,
-		.pin = 17,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 15) | BIT(15),
-	},
+	MR_SAME(0, 19, 1, 0x314, RK_GENMASK_VAL(0, 0, 1)), /* rtc_clk */
+	MR_SAME(1, 22, 2, 0x314, RK_GENMASK_VAL(3, 2, 0)), /* uart2_rxm0 */
+	MR_SAME(4, 26, 2, 0x314, RK_GENMASK_VAL(3, 2, 1)), /* uart2_rxm1 */
+	MR_SAME(0, 15, 2, 0x608, RK_GENMASK_VAL(9, 8, 0)), /* i2c3_sdam0 */
+	MR_SAME(3, 12, 2, 0x608, RK_GENMASK_VAL(9, 8, 1)), /* i2c3_sdam1 */
+	MR_SAME(2, 0, 3, 0x608, RK_GENMASK_VAL(9, 8, 2)), /* i2c3_sdam2 */
+	MR_SAME(1, 3, 2, 0x308, RK_GENMASK_VAL(3, 3, 0)), /* i2s-8ch-1-sclktxm0 */
+	MR_SAME(1, 4, 2, 0x308, RK_GENMASK_VAL(3, 3, 0)), /* i2s-8ch-1-sclkrxm0 */
+	MR_SAME(1, 13, 2, 0x308, RK_GENMASK_VAL(3, 3, 1)), /* i2s-8ch-1-sclktxm1 */
+	MR_SAME(1, 14, 2, 0x308, RK_GENMASK_VAL(3, 3, 1)), /* i2s-8ch-1-sclkrxm1 */
+	MR_SAME(1, 4, 3, 0x308, RK_GENMASK_VAL(13, 12, 0)), /* pdm-clkm0 */
+	MR_SAME(1, 14, 4, 0x308, RK_GENMASK_VAL(13, 12, 1)), /* pdm-clkm1 */
+	MR_SAME(2, 6, 2, 0x308, RK_GENMASK_VAL(13, 12, 2)), /* pdm-clkm2 */
+	MR_SAME(2, 4, 3, 0x600, RK_GENMASK_VAL(2, 2, 1)), /* pdm-clkm-m2 */
+	MR_SAME(3, 10, 3, 0x314, RK_GENMASK_VAL(9, 9, 0)), /* spi1_miso */
+	MR_SAME(2, 4, 2, 0x314, RK_GENMASK_VAL(9, 9, 1)), /* spi1_miso_m1 */
+	MR_SAME(0, 11, 3, 0x314, RK_GENMASK_VAL(11, 10, 0)), /* owire_m0 */
+	MR_SAME(1, 22, 7, 0x314, RK_GENMASK_VAL(11, 10, 1)), /* owire_m1 */
+	MR_SAME(2, 2, 5, 0x314, RK_GENMASK_VAL(11, 10, 2)), /* owire_m2 */
+	MR_SAME(0, 11, 2, 0x314, RK_GENMASK_VAL(13, 12, 0)), /* can_rxd_m0 */
+	MR_SAME(1, 22, 5, 0x314, RK_GENMASK_VAL(13, 12, 1)), /* can_rxd_m1 */
+	MR_SAME(2, 2, 4, 0x314, RK_GENMASK_VAL(13, 12, 2)), /* can_rxd_m2 */
+	MR_SAME(1, 20, 3, 0x314, RK_GENMASK_VAL(14, 14, 0)), /* mac_rxd0_m0 */
+	MR_SAME(4, 2, 2, 0x314, RK_GENMASK_VAL(14, 14, 1)), /* mac_rxd0_m1 */
+	MR_SAME(3, 12, 4, 0x314, RK_GENMASK_VAL(15, 15, 0)), /* uart3_rx */
+	MR_SAME(0, 17, 3, 0x314, RK_GENMASK_VAL(15, 15, 1)), /* uart3_rx_m1 */
 };
 
 static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
-	{
-		/* uart2dbg_rxm0 */
-		.bank_num = 1,
-		.pin = 1,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(16 + 1),
-	}, {
-		/* uart2dbg_rxm1 */
-		.bank_num = 2,
-		.pin = 1,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
-	}, {
-		/* gmac-m1_rxd0 */
-		.bank_num = 1,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* gmac-m1-optimized_rxd3 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 10) | BIT(10),
-	}, {
-		/* pdm_sdi0m0 */
-		.bank_num = 2,
-		.pin = 19,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* pdm_sdi0m1 */
-		.bank_num = 1,
-		.pin = 23,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 3) | BIT(3),
-	}, {
-		/* spi_rxdm2 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 4,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
-	}, {
-		/* i2s2_sdim0 */
-		.bank_num = 1,
-		.pin = 24,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 6),
-	}, {
-		/* i2s2_sdim1 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 6,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 6) | BIT(6),
-	}, {
-		/* card_iom1 */
-		.bank_num = 2,
-		.pin = 22,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 7) | BIT(7),
-	}, {
-		/* tsp_d5m1 */
-		.bank_num = 2,
-		.pin = 16,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 8) | BIT(8),
-	}, {
-		/* cif_data5m1 */
-		.bank_num = 2,
-		.pin = 16,
-		.func = 4,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 9) | BIT(9),
-	},
+	MR_SAME(1, 1, 2, 0x50, RK_GENMASK_VAL(1, 0, 0)), /* uart2dbg_rxm0 */
+	MR_SAME(2, 1, 1, 0x50, RK_GENMASK_VAL(1, 0, 1)), /* uart2dbg_rxm1 */
+	MR_SAME(1, 11, 2, 0x50, RK_GENMASK_VAL(2, 2, 1)), /* gmac-m1_rxd0 */
+	MR_SAME(1, 14, 2, 0x50, RK_GENMASK_VAL(10, 10, 1)), /* gmac-m1-optimized_rxd3 */
+	MR_SAME(2, 19, 2, 0x50, RK_GENMASK_VAL(3, 3, 0)), /* pdm_sdi0m0 */
+	MR_SAME(1, 23, 3, 0x50, RK_GENMASK_VAL(3, 3, 1)), /* pdm_sdi0m1 */
+	MR_SAME(3, 2, 4, 0x50, RK_GENMASK_VAL(5, 4, 2)), /* spi_rxdm2 */
+	MR_SAME(1, 24, 1, 0x50, RK_GENMASK_VAL(6, 6, 0)), /* i2s2_sdim0 */
+	MR_SAME(3, 2, 6, 0x50, RK_GENMASK_VAL(6, 6, 1)), /* i2s2_sdim1 */
+	MR_SAME(2, 22, 3, 0x50, RK_GENMASK_VAL(7, 7, 1)), /* card_iom1 */
+	MR_SAME(2, 16, 3, 0x50, RK_GENMASK_VAL(8, 8, 1)), /* tsp_d5m1 */
+	MR_SAME(2, 16, 4, 0x50, RK_GENMASK_VAL(9, 9, 1)), /* cif_data5m1 */
 };
 
 static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
-	{
-		/* uart2dbga_rx */
-		.bank_num = 4,
-		.pin = 8,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11),
-	}, {
-		/* uart2dbgb_rx */
-		.bank_num = 4,
-		.pin = 16,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
-	}, {
-		/* uart2dbgc_rx */
-		.bank_num = 4,
-		.pin = 19,
-		.func = 1,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
-	}, {
-		/* pcie_clkreqn */
-		.bank_num = 2,
-		.pin = 26,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 14),
-	}, {
-		/* pcie_clkreqnb */
-		.bank_num = 4,
-		.pin = 24,
-		.func = 1,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 14) | BIT(14),
-	},
+	MR_SAME(4, 8, 2, 0xe21c, RK_GENMASK_VAL(11, 10, 0)), /* uart2dbga_rx */
+	MR_SAME(4, 16, 2, 0xe21c, RK_GENMASK_VAL(11, 10, 1)), /* uart2dbgb_rx */
+	MR_SAME(4, 19, 1, 0xe21c, RK_GENMASK_VAL(11, 10, 2)), /* uart2dbgc_rx */
+	MR_SAME(2, 26, 2, 0xe21c, RK_GENMASK_VAL(14, 14, 0)), /* pcie_clkreqn */
+	MR_SAME(4, 24, 1, 0xe21c, RK_GENMASK_VAL(14, 14, 1)), /* pcie_clkreqnb */
 };
 
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
-- 
2.17.1



