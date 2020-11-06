Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8512A933F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgKFJrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:47:47 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46918 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgKFJrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:47:42 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 1CB2D3AC59C
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 09:31:53 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 73A22C0068;
        Fri,  6 Nov 2020 09:31:28 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 3/4] pinctrl: ocelot: Add support for Luton platforms
Date:   Fri,  6 Nov 2020 10:31:17 +0100
Message-Id: <20201106093118.965152-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106093118.965152-1-gregory.clement@bootlin.com>
References: <20201106093118.965152-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lars Povlsen <lars.povlsen@microchip.com>

This patch adds support for Luton pinctrl, using the ocelot driver as
basis. It adds pinconfig support as well, as supported by the
platform.

gclement: Split from a larger patch adding support all platforms in
the same time.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index a4a1b00f7f0d..ab74c79d7cca 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -158,6 +158,88 @@ struct ocelot_pinctrl {
 	u8 stride;
 };
 
+#define LUTON_P(p, f0, f1)						\
+static struct ocelot_pin_caps luton_pin_##p = {				\
+	.pin = p,							\
+	.functions = {							\
+			FUNC_GPIO, FUNC_##f0, FUNC_##f1, FUNC_NONE,	\
+	},								\
+}
+
+LUTON_P(0,  SG0,       NONE);
+LUTON_P(1,  SG0,       NONE);
+LUTON_P(2,  SG0,       NONE);
+LUTON_P(3,  SG0,       NONE);
+LUTON_P(4,  TACHO,     NONE);
+LUTON_P(5,  TWI,       PHY_LED);
+LUTON_P(6,  TWI,       PHY_LED);
+LUTON_P(7,  NONE,      PHY_LED);
+LUTON_P(8,  EXT_IRQ,   PHY_LED);
+LUTON_P(9,  EXT_IRQ,   PHY_LED);
+LUTON_P(10, SFP,       PHY_LED);
+LUTON_P(11, SFP,       PHY_LED);
+LUTON_P(12, SFP,       PHY_LED);
+LUTON_P(13, SFP,       PHY_LED);
+LUTON_P(14, SI,        PHY_LED);
+LUTON_P(15, SI,        PHY_LED);
+LUTON_P(16, SI,        PHY_LED);
+LUTON_P(17, SFP,       PHY_LED);
+LUTON_P(18, SFP,       PHY_LED);
+LUTON_P(19, SFP,       PHY_LED);
+LUTON_P(20, SFP,       PHY_LED);
+LUTON_P(21, SFP,       PHY_LED);
+LUTON_P(22, SFP,       PHY_LED);
+LUTON_P(23, SFP,       PHY_LED);
+LUTON_P(24, SFP,       PHY_LED);
+LUTON_P(25, SFP,       PHY_LED);
+LUTON_P(26, SFP,       PHY_LED);
+LUTON_P(27, SFP,       PHY_LED);
+LUTON_P(28, SFP,       PHY_LED);
+LUTON_P(29, PWM,       NONE);
+LUTON_P(30, UART,      NONE);
+LUTON_P(31, UART,      NONE);
+
+#define LUTON_PIN(n) {						\
+	.number = n,						\
+	.name = "GPIO_"#n,					\
+	.drv_data = &luton_pin_##n				\
+}
+
+static const struct pinctrl_pin_desc luton_pins[] = {
+	LUTON_PIN(0),
+	LUTON_PIN(1),
+	LUTON_PIN(2),
+	LUTON_PIN(3),
+	LUTON_PIN(4),
+	LUTON_PIN(5),
+	LUTON_PIN(6),
+	LUTON_PIN(7),
+	LUTON_PIN(8),
+	LUTON_PIN(9),
+	LUTON_PIN(10),
+	LUTON_PIN(11),
+	LUTON_PIN(12),
+	LUTON_PIN(13),
+	LUTON_PIN(14),
+	LUTON_PIN(15),
+	LUTON_PIN(16),
+	LUTON_PIN(17),
+	LUTON_PIN(18),
+	LUTON_PIN(19),
+	LUTON_PIN(20),
+	LUTON_PIN(21),
+	LUTON_PIN(22),
+	LUTON_PIN(23),
+	LUTON_PIN(24),
+	LUTON_PIN(25),
+	LUTON_PIN(26),
+	LUTON_PIN(27),
+	LUTON_PIN(28),
+	LUTON_PIN(29),
+	LUTON_PIN(30),
+	LUTON_PIN(31),
+};
+
 #define OCELOT_P(p, f0, f1, f2)						\
 static struct ocelot_pin_caps ocelot_pin_##p = {			\
 	.pin = p,							\
@@ -868,6 +950,15 @@ static const struct pinctrl_ops ocelot_pctl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
+static struct pinctrl_desc luton_desc = {
+	.name = "luton-pinctrl",
+	.pins = luton_pins,
+	.npins = ARRAY_SIZE(luton_pins),
+	.pctlops = &ocelot_pctl_ops,
+	.pmxops = &ocelot_pmx_ops,
+	.owner = THIS_MODULE,
+};
+
 static struct pinctrl_desc ocelot_desc = {
 	.name = "ocelot-pinctrl",
 	.pins = ocelot_pins,
@@ -1151,6 +1242,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 }
 
 static const struct of_device_id ocelot_pinctrl_of_match[] = {
+	{ .compatible = "mscc,luton-pinctrl", .data = &luton_desc },
 	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
 	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
 	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
-- 
2.28.0

