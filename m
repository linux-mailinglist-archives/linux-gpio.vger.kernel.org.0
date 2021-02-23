Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2869B322662
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 08:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhBWH1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 02:27:01 -0500
Received: from lucky1.263xmail.com ([211.157.147.130]:36642 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhBWH07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 02:26:59 -0500
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 644CECFF28;
        Tue, 23 Feb 2021 15:24:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P32471T140678143133440S1614065061836518_;
        Tue, 23 Feb 2021 15:24:23 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <64484def76daf7e9fced008065009749>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: add support for rk3568
Date:   Tue, 23 Feb 2021 15:24:19 +0800
Message-Id: <20210223072419.123308-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RK3568 SoCs have 5 gpio controllers, each gpio has 32 pins. GPIO supports
set iomux, pull, drive strength, schmitt and slew rate.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 311 ++++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index aa1a1c850d05..b781e34bc0b7 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -61,8 +61,12 @@ enum rockchip_pinctrl_type {
 	RK3308,
 	RK3368,
 	RK3399,
+	RK3568,
 };
 
+#define _GENMASK(h, l, v) \
+	(GENMASK(((h) + 16), ((l) + 16)) | (((v) << (l)) & GENMASK((h), (l))))
+
 /*
  * Encode variants of iomux registers into a type variable
  */
@@ -290,6 +294,25 @@ struct rockchip_pin_bank {
 		.pull_type[3] = pull3,					\
 	}
 
+#define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG)		\
+	{								\
+		.bank_num	= ID,					\
+		.pin		= PIN,					\
+		.func		= FUNC,					\
+		.route_offset	= REG,					\
+		.route_val	= VAL,					\
+		.route_type	= FLAG,					\
+	}
+
+#define MR_SAME(ID, PIN, FUNC, REG, VAL)	\
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
@@ -1394,6 +1417,102 @@ static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
 	},
 };
 
+static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
+	MR_GRF(0, RK_PB7, 1, 0x0110, _GENMASK(1, 0, 0)), /* PWM0 IO mux M0 */
+	MR_GRF(0, RK_PC7, 2, 0x0110, _GENMASK(1, 0, 1)), /* PWM0 IO mux M1 */
+	MR_GRF(0, RK_PC0, 1, 0x0110, _GENMASK(3, 2, 0)), /* PWM1 IO mux M0 */
+	MR_GRF(0, RK_PB5, 4, 0x0110, _GENMASK(3, 2, 1)), /* PWM1 IO mux M1 */
+	MR_GRF(0, RK_PC1, 1, 0x0110, _GENMASK(5, 4, 0)), /* PWM2 IO mux M0 */
+	MR_GRF(0, RK_PB6, 4, 0x0110, _GENMASK(5, 4, 1)), /* PWM2 IO mux M1 */
+	MR_GRF(0, RK_PB3, 2, 0x0300, _GENMASK(0, 0, 0)), /* CAN0 IO mux M0 */
+	MR_GRF(2, RK_PA1, 4, 0x0300, _GENMASK(0, 0, 1)), /* CAN0 IO mux M1 */
+	MR_GRF(1, RK_PA1, 3, 0x0300, _GENMASK(2, 2, 0)), /* CAN1 IO mux M0 */
+	MR_GRF(4, RK_PC3, 3, 0x0300, _GENMASK(2, 2, 1)), /* CAN1 IO mux M1 */
+	MR_GRF(4, RK_PB5, 3, 0x0300, _GENMASK(4, 4, 0)), /* CAN2 IO mux M0 */
+	MR_GRF(2, RK_PB2, 4, 0x0300, _GENMASK(4, 4, 1)), /* CAN2 IO mux M1 */
+	MR_GRF(4, RK_PC4, 1, 0x0300, _GENMASK(6, 6, 0)), /* HPDIN IO mux M0 */
+	MR_GRF(0, RK_PC2, 2, 0x0300, _GENMASK(6, 6, 1)), /* HPDIN IO mux M1 */
+	MR_GRF(3, RK_PB1, 3, 0x0300, _GENMASK(8, 8, 0)), /* GMAC1 IO mux M0 */
+	MR_GRF(4, RK_PA7, 3, 0x0300, _GENMASK(8, 8, 1)), /* GMAC1 IO mux M1 */
+	MR_GRF(4, RK_PD1, 1, 0x0300, _GENMASK(10, 10, 0)), /* HDMITX IO mux M0 */
+	MR_GRF(0, RK_PC7, 1, 0x0300, _GENMASK(10, 10, 1)), /* HDMITX IO mux M1 */
+	MR_GRF(0, RK_PB6, 1, 0x0300, _GENMASK(14, 14, 0)), /* I2C2 IO mux M0 */
+	MR_GRF(4, RK_PB4, 1, 0x0300, _GENMASK(14, 14, 1)), /* I2C2 IO mux M1 */
+	MR_GRF(1, RK_PA0, 1, 0x0304, _GENMASK(0, 0, 0)), /* I2C3 IO mux M0 */
+	MR_GRF(3, RK_PB6, 4, 0x0304, _GENMASK(0, 0, 1)), /* I2C3 IO mux M1 */
+	MR_GRF(4, RK_PB2, 1, 0x0304, _GENMASK(2, 2, 0)), /* I2C4 IO mux M0 */
+	MR_GRF(2, RK_PB1, 2, 0x0304, _GENMASK(2, 2, 1)), /* I2C4 IO mux M1 */
+	MR_GRF(3, RK_PB4, 4, 0x0304, _GENMASK(4, 4, 0)), /* I2C5 IO mux M0 */
+	MR_GRF(4, RK_PD0, 2, 0x0304, _GENMASK(4, 4, 1)), /* I2C5 IO mux M1 */
+	MR_GRF(3, RK_PB1, 5, 0x0304, _GENMASK(14, 14, 0)), /* PWM8 IO mux M0 */
+	MR_GRF(1, RK_PD5, 4, 0x0304, _GENMASK(14, 14, 1)), /* PWM8 IO mux M1 */
+	MR_GRF(3, RK_PB2, 5, 0x0308, _GENMASK(0, 0, 0)), /* PWM9 IO mux M0 */
+	MR_GRF(1, RK_PD6, 4, 0x0308, _GENMASK(0, 0, 1)), /* PWM9 IO mux M1 */
+	MR_GRF(3, RK_PB5, 5, 0x0308, _GENMASK(2, 2, 0)), /* PWM10 IO mux M0 */
+	MR_GRF(2, RK_PA1, 2, 0x0308, _GENMASK(2, 2, 1)), /* PWM10 IO mux M1 */
+	MR_GRF(3, RK_PB6, 5, 0x0308, _GENMASK(4, 4, 0)), /* PWM11 IO mux M0 */
+	MR_GRF(4, RK_PC0, 3, 0x0308, _GENMASK(4, 4, 1)), /* PWM11 IO mux M1 */
+	MR_GRF(3, RK_PB7, 2, 0x0308, _GENMASK(6, 6, 0)), /* PWM12 IO mux M0 */
+	MR_GRF(4, RK_PC5, 1, 0x0308, _GENMASK(6, 6, 1)), /* PWM12 IO mux M1 */
+	MR_GRF(3, RK_PC0, 2, 0x0308, _GENMASK(8, 8, 0)), /* PWM13 IO mux M0 */
+	MR_GRF(4, RK_PC6, 1, 0x0308, _GENMASK(8, 8, 1)), /* PWM13 IO mux M1 */
+	MR_GRF(3, RK_PC4, 1, 0x0308, _GENMASK(10, 10, 0)), /* PWM14 IO mux M0 */
+	MR_GRF(4, RK_PC2, 1, 0x0308, _GENMASK(10, 10, 1)), /* PWM14 IO mux M1 */
+	MR_GRF(3, RK_PC5, 1, 0x0308, _GENMASK(12, 12, 0)), /* PWM15 IO mux M0 */
+	MR_GRF(4, RK_PC3, 1, 0x0308, _GENMASK(12, 12, 1)), /* PWM15 IO mux M1 */
+	MR_GRF(3, RK_PD2, 3, 0x0308, _GENMASK(14, 14, 0)), /* SDMMC2 IO mux M0 */
+	MR_GRF(3, RK_PA5, 5, 0x0308, _GENMASK(14, 14, 1)), /* SDMMC2 IO mux M1 */
+	MR_GRF(0, RK_PB5, 2, 0x030c, _GENMASK(0, 0, 0)), /* SPI0 IO mux M0 */
+	MR_GRF(2, RK_PD3, 3, 0x030c, _GENMASK(0, 0, 1)), /* SPI0 IO mux M1 */
+	MR_GRF(2, RK_PB5, 3, 0x030c, _GENMASK(2, 2, 0)), /* SPI1 IO mux M0 */
+	MR_GRF(3, RK_PC3, 3, 0x030c, _GENMASK(2, 2, 1)), /* SPI1 IO mux M1 */
+	MR_GRF(2, RK_PC1, 4, 0x030c, _GENMASK(4, 4, 0)), /* SPI2 IO mux M0 */
+	MR_GRF(3, RK_PA0, 3, 0x030c, _GENMASK(4, 4, 1)), /* SPI2 IO mux M1 */
+	MR_GRF(4, RK_PB3, 4, 0x030c, _GENMASK(6, 6, 0)), /* SPI3 IO mux M0 */
+	MR_GRF(4, RK_PC2, 2, 0x030c, _GENMASK(6, 6, 1)), /* SPI3 IO mux M1 */
+	MR_GRF(2, RK_PB4, 2, 0x030c, _GENMASK(8, 8, 0)), /* UART1 IO mux M0 */
+	MR_GRF(0, RK_PD1, 1, 0x030c, _GENMASK(8, 8, 1)), /* UART1 IO mux M1 */
+	MR_GRF(0, RK_PD1, 1, 0x030c, _GENMASK(10, 10, 0)), /* UART2 IO mux M0 */
+	MR_GRF(1, RK_PD5, 2, 0x030c, _GENMASK(10, 10, 1)), /* UART2 IO mux M1 */
+	MR_GRF(1, RK_PA1, 2, 0x030c, _GENMASK(12, 12, 0)), /* UART3 IO mux M0 */
+	MR_GRF(3, RK_PB7, 4, 0x030c, _GENMASK(12, 12, 1)), /* UART3 IO mux M1 */
+	MR_GRF(1, RK_PA6, 2, 0x030c, _GENMASK(14, 14, 0)), /* UART4 IO mux M0 */
+	MR_GRF(3, RK_PB2, 4, 0x030c, _GENMASK(14, 14, 1)), /* UART4 IO mux M1 */
+	MR_GRF(2, RK_PA2, 3, 0x0310, _GENMASK(0, 0, 0)), /* UART5 IO mux M0 */
+	MR_GRF(3, RK_PC2, 4, 0x0310, _GENMASK(0, 0, 1)), /* UART5 IO mux M1 */
+	MR_GRF(2, RK_PA4, 3, 0x0310, _GENMASK(2, 2, 0)), /* UART6 IO mux M0 */
+	MR_GRF(1, RK_PD5, 3, 0x0310, _GENMASK(2, 2, 1)), /* UART6 IO mux M1 */
+	MR_GRF(2, RK_PA6, 3, 0x0310, _GENMASK(5, 4, 0)), /* UART7 IO mux M0 */
+	MR_GRF(3, RK_PC4, 4, 0x0310, _GENMASK(5, 4, 1)), /* UART7 IO mux M1 */
+	MR_GRF(4, RK_PA2, 4, 0x0310, _GENMASK(5, 4, 2)), /* UART7 IO mux M2 */
+	MR_GRF(2, RK_PC5, 3, 0x0310, _GENMASK(6, 6, 0)), /* UART8 IO mux M0 */
+	MR_GRF(2, RK_PD7, 4, 0x0310, _GENMASK(6, 6, 1)), /* UART8 IO mux M1 */
+	MR_GRF(2, RK_PB0, 3, 0x0310, _GENMASK(9, 8, 0)), /* UART9 IO mux M0 */
+	MR_GRF(4, RK_PC5, 4, 0x0310, _GENMASK(9, 8, 1)), /* UART9 IO mux M1 */
+	MR_GRF(4, RK_PA4, 4, 0x0310, _GENMASK(9, 8, 2)), /* UART9 IO mux M2 */
+	MR_GRF(1, RK_PA2, 1, 0x0310, _GENMASK(11, 10, 0)), /* I2S1 IO mux M0 */
+	MR_GRF(3, RK_PC6, 4, 0x0310, _GENMASK(11, 10, 1)), /* I2S1 IO mux M1 */
+	MR_GRF(2, RK_PD0, 5, 0x0310, _GENMASK(11, 10, 2)), /* I2S1 IO mux M2 */
+	MR_GRF(2, RK_PC1, 1, 0x0310, _GENMASK(12, 12, 0)), /* I2S2 IO mux M0 */
+	MR_GRF(4, RK_PB6, 5, 0x0310, _GENMASK(12, 12, 1)), /* I2S2 IO mux M1 */
+	MR_GRF(3, RK_PA2, 4, 0x0310, _GENMASK(14, 14, 0)), /* I2S3 IO mux M0 */
+	MR_GRF(4, RK_PC2, 5, 0x0310, _GENMASK(14, 14, 1)), /* I2S3 IO mux M1 */
+	MR_GRF(1, RK_PA4, 3, 0x0314, _GENMASK(1, 0, 0)), /* PDM IO mux M0 */
+	MR_GRF(1, RK_PA6, 3, 0x0314, _GENMASK(1, 0, 0)), /* PDM IO mux M0 */
+	MR_GRF(3, RK_PD6, 5, 0x0314, _GENMASK(1, 0, 1)), /* PDM IO mux M1 */
+	MR_GRF(4, RK_PA0, 4, 0x0314, _GENMASK(1, 0, 1)), /* PDM IO mux M1 */
+	MR_GRF(3, RK_PC4, 5, 0x0314, _GENMASK(1, 0, 2)), /* PDM IO mux M2 */
+	MR_GRF(0, RK_PA5, 3, 0x0314, _GENMASK(3, 2, 0)), /* PCIE20 IO mux M0 */
+	MR_GRF(2, RK_PD0, 4, 0x0314, _GENMASK(3, 2, 1)), /* PCIE20 IO mux M1 */
+	MR_GRF(1, RK_PB0, 4, 0x0314, _GENMASK(3, 2, 2)), /* PCIE20 IO mux M2 */
+	MR_GRF(0, RK_PA4, 3, 0x0314, _GENMASK(5, 4, 0)), /* PCIE30X1 IO mux M0 */
+	MR_GRF(2, RK_PD2, 4, 0x0314, _GENMASK(5, 4, 1)), /* PCIE30X1 IO mux M1 */
+	MR_GRF(1, RK_PA5, 4, 0x0314, _GENMASK(5, 4, 2)), /* PCIE30X1 IO mux M2 */
+	MR_GRF(0, RK_PA6, 2, 0x0314, _GENMASK(7, 6, 0)), /* PCIE30X2 IO mux M0 */
+	MR_GRF(2, RK_PD4, 4, 0x0314, _GENMASK(7, 6, 1)), /* PCIE30X2 IO mux M1 */
+	MR_GRF(4, RK_PC2, 4, 0x0314, _GENMASK(7, 6, 2)), /* PCIE30X2 IO mux M2 */
+};
+
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *loc, u32 *reg, u32 *value)
 {
@@ -2102,6 +2221,94 @@ static void rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		*bit = (pin_num % 8) * 2;
 }
 
+#define RK3568_SR_PMU_OFFSET		0x60
+#define RK3568_SR_GRF_OFFSET		0x0180
+#define RK3568_SR_BANK_STRIDE		0x10
+#define RK3568_SR_PINS_PER_REG		16
+
+static int rk3568_calc_slew_rate_reg_and_bit(struct rockchip_pin_bank *bank,
+					     int pin_num,
+					     struct regmap **regmap,
+					     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3568_SR_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3568_SR_GRF_OFFSET;
+		*reg += (bank->bank_num  - 1) * RK3568_SR_BANK_STRIDE;
+	}
+	*reg += ((pin_num / RK3568_SR_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3568_SR_PINS_PER_REG;
+
+	return 0;
+}
+
+#define RK3568_PULL_PMU_OFFSET		0x20
+#define RK3568_PULL_GRF_OFFSET		0x80
+#define RK3568_PULL_BITS_PER_PIN	2
+#define RK3568_PULL_PINS_PER_REG	8
+#define RK3568_PULL_BANK_STRIDE		0x10
+
+static void rk3568_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					 int pin_num, struct regmap **regmap,
+					 int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3568_PULL_PMU_OFFSET;
+		*reg += bank->bank_num * RK3568_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3568_PULL_PINS_PER_REG) * 4);
+
+		*bit = pin_num % RK3568_PULL_PINS_PER_REG;
+		*bit *= RK3568_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3568_PULL_GRF_OFFSET;
+		*reg += (bank->bank_num - 1) * RK3568_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3568_PULL_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3568_PULL_PINS_PER_REG);
+		*bit *= RK3568_PULL_BITS_PER_PIN;
+	}
+}
+
+#define RK3568_DRV_PMU_OFFSET		0x70
+#define RK3568_DRV_GRF_OFFSET		0x200
+#define RK3568_DRV_BITS_PER_PIN		8
+#define RK3568_DRV_PINS_PER_REG		2
+#define RK3568_DRV_BANK_STRIDE		0x40
+
+static void rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 32 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3568_DRV_PMU_OFFSET;
+		*reg += ((pin_num / RK3568_DRV_PINS_PER_REG) * 4);
+
+		*bit = pin_num % RK3568_DRV_PINS_PER_REG;
+		*bit *= RK3568_DRV_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3568_DRV_GRF_OFFSET;
+		*reg += (bank->bank_num - 1) * RK3568_DRV_BANK_STRIDE;
+		*reg += ((pin_num / RK3568_DRV_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3568_DRV_PINS_PER_REG);
+		*bit *= RK3568_DRV_BITS_PER_PIN;
+	}
+}
+
 static int rockchip_perpin_drv_list[DRV_TYPE_MAX][8] = {
 	{ 2, 4, 8, 12, -1, -1, -1, -1 },
 	{ 3, 6, 9, 12, -1, -1, -1, -1 },
@@ -2202,6 +2409,11 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		bank->bank_num, pin_num, strength);
 
 	ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
+	if (ctrl->type == RK3568) {
+		rmask_bits = RK3568_DRV_BITS_PER_PIN;
+		ret = (1 << (strength + 1)) - 1;
+		goto config;
+	}
 
 	ret = -EINVAL;
 	for (i = 0; i < ARRAY_SIZE(rockchip_perpin_drv_list[drv_type]); i++) {
@@ -2271,6 +2483,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		return -EINVAL;
 	}
 
+config:
 	/* enable the write to the equivalent lower bits */
 	data = ((1 << rmask_bits) - 1) << (bit + 16);
 	rmask = data | (data >> 16);
@@ -2373,6 +2586,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3308:
 	case RK3368:
 	case RK3399:
+	case RK3568:
 		pull_type = bank->pull_type[pin_num / 8];
 		ret = -EINVAL;
 		for (i = 0; i < ARRAY_SIZE(rockchip_pull_list[pull_type]);
@@ -2383,6 +2597,11 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 			}
 		}
 
+		if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
+			if (ret == 1)
+				ret = 3;
+		}
+
 		if (ret < 0) {
 			dev_err(info->dev, "unsupported pull setting %d\n",
 				pull);
@@ -2426,6 +2645,35 @@ static int rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3568_SCHMITT_BITS_PER_PIN		2
+#define RK3568_SCHMITT_PINS_PER_REG		8
+#define RK3568_SCHMITT_BANK_STRIDE		0x10
+#define RK3568_SCHMITT_GRF_OFFSET		0xc0
+#define RK3568_SCHMITT_PMUGRF_OFFSET		0x30
+
+static int rk3568_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3568_SCHMITT_PMUGRF_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3568_SCHMITT_GRF_OFFSET;
+		*reg += (bank->bank_num - 1) * RK3568_SCHMITT_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RK3568_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3568_SCHMITT_PINS_PER_REG;
+	*bit *= RK3568_SCHMITT_BITS_PER_PIN;
+
+	return 0;
+}
+
 static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -2444,6 +2692,13 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 		return ret;
 
 	data >>= bit;
+	switch (ctrl->type) {
+	case RK3568:
+		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
+	default:
+		break;
+	}
+
 	return data & 0x1;
 }
 
@@ -2465,8 +2720,17 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 		return ret;
 
 	/* enable the write to the equivalent lower bits */
-	data = BIT(bit + 16) | (enable << bit);
-	rmask = BIT(bit + 16) | BIT(bit);
+	switch (ctrl->type) {
+	case RK3568:
+		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
+		rmask = data | (data >> 16);
+		data |= ((enable ? 0x2 : 0x1) << bit);
+		break;
+	default:
+		data = BIT(bit + 16) | (enable << bit);
+		rmask = BIT(bit + 16) | BIT(bit);
+		break;
+	}
 
 	return regmap_update_bits(regmap, reg, rmask, data);
 }
@@ -2640,6 +2904,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3308:
 	case RK3368:
 	case RK3399:
+	case RK3568:
 		return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
 	}
 
@@ -4210,6 +4475,46 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3568_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
+					     IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
+					     IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
+					     IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT),
+};
+
+static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
+	.pin_banks		= rk3568_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3568_pin_banks),
+	.label			= "RK3568-GPIO",
+	.type			= RK3568,
+	.grf_mux_offset		= 0x0,
+	.pmu_mux_offset		= 0x0,
+	.grf_drv_offset		= 0x0200,
+	.pmu_drv_offset		= 0x0070,
+	.iomux_routes		= rk3568_mux_route_data,
+	.niomux_routes		= ARRAY_SIZE(rk3568_mux_route_data),
+	.pull_calc_reg		= rk3568_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3568_calc_drv_reg_and_bit,
+	.slew_rate_calc_reg	= rk3568_calc_slew_rate_reg_and_bit,
+	.schmitt_calc_reg	= rk3568_calc_schmitt_reg_and_bit,
+};
+
 static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 	{ .compatible = "rockchip,px30-pinctrl",
 		.data = &px30_pin_ctrl },
@@ -4239,6 +4544,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
 		.data = &rk3399_pin_ctrl },
+	{ .compatible = "rockchip,rk3568-pinctrl",
+		.data = &rk3568_pin_ctrl },
 	{},
 };
 
-- 
2.25.1



