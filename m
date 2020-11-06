Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A512A9340
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgKFJrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:47:47 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46932 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgKFJrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:47:42 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BC7B73AF635
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 09:31:54 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8DB42FF804;
        Fri,  6 Nov 2020 09:31:29 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 4/4] pinctrl: ocelot: Add support for Serval platforms
Date:   Fri,  6 Nov 2020 10:31:18 +0100
Message-Id: <20201106093118.965152-5-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106093118.965152-1-gregory.clement@bootlin.com>
References: <20201106093118.965152-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lars Povlsen <lars.povlsen@microchip.com>

This patch adds support for Serval pinctrl, using the ocelot driver as
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
index ab74c79d7cca..18336950fd95 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -240,6 +240,88 @@ static const struct pinctrl_pin_desc luton_pins[] = {
 	LUTON_PIN(31),
 };
 
+#define SERVAL_P(p, f0, f1, f2)						\
+static struct ocelot_pin_caps serval_pin_##p = {			\
+	.pin = p,							\
+	.functions = {							\
+			FUNC_GPIO, FUNC_##f0, FUNC_##f1, FUNC_##f2,	\
+	},								\
+}
+
+SERVAL_P(0,  SG0,       NONE,      NONE);
+SERVAL_P(1,  SG0,       NONE,      NONE);
+SERVAL_P(2,  SG0,       NONE,      NONE);
+SERVAL_P(3,  SG0,       NONE,      NONE);
+SERVAL_P(4,  TACHO,     NONE,      NONE);
+SERVAL_P(5,  PWM,       NONE,      NONE);
+SERVAL_P(6,  TWI,       NONE,      NONE);
+SERVAL_P(7,  TWI,       NONE,      NONE);
+SERVAL_P(8,  SI,        NONE,      NONE);
+SERVAL_P(9,  SI,        MD,        NONE);
+SERVAL_P(10, SI,        MD,        NONE);
+SERVAL_P(11, SFP,       MD,        TWI_SCL_M);
+SERVAL_P(12, SFP,       MD,        TWI_SCL_M);
+SERVAL_P(13, SFP,       UART2,     TWI_SCL_M);
+SERVAL_P(14, SFP,       UART2,     TWI_SCL_M);
+SERVAL_P(15, SFP,       PTP0,      TWI_SCL_M);
+SERVAL_P(16, SFP,       PTP0,      TWI_SCL_M);
+SERVAL_P(17, SFP,       PCI_WAKE,  TWI_SCL_M);
+SERVAL_P(18, SFP,       NONE,      TWI_SCL_M);
+SERVAL_P(19, SFP,       NONE,      TWI_SCL_M);
+SERVAL_P(20, SFP,       NONE,      TWI_SCL_M);
+SERVAL_P(21, SFP,       NONE,      TWI_SCL_M);
+SERVAL_P(22, NONE,      NONE,      NONE);
+SERVAL_P(23, NONE,      NONE,      NONE);
+SERVAL_P(24, NONE,      NONE,      NONE);
+SERVAL_P(25, NONE,      NONE,      NONE);
+SERVAL_P(26, UART,      NONE,      NONE);
+SERVAL_P(27, UART,      NONE,      NONE);
+SERVAL_P(28, IRQ0,      NONE,      NONE);
+SERVAL_P(29, IRQ1,      NONE,      NONE);
+SERVAL_P(30, PTP0,      NONE,      NONE);
+SERVAL_P(31, PTP0,      NONE,      NONE);
+
+#define SERVAL_PIN(n) {						\
+	.number = n,						\
+	.name = "GPIO_"#n,					\
+	.drv_data = &serval_pin_##n				\
+}
+
+static const struct pinctrl_pin_desc serval_pins[] = {
+	SERVAL_PIN(0),
+	SERVAL_PIN(1),
+	SERVAL_PIN(2),
+	SERVAL_PIN(3),
+	SERVAL_PIN(4),
+	SERVAL_PIN(5),
+	SERVAL_PIN(6),
+	SERVAL_PIN(7),
+	SERVAL_PIN(8),
+	SERVAL_PIN(9),
+	SERVAL_PIN(10),
+	SERVAL_PIN(11),
+	SERVAL_PIN(12),
+	SERVAL_PIN(13),
+	SERVAL_PIN(14),
+	SERVAL_PIN(15),
+	SERVAL_PIN(16),
+	SERVAL_PIN(17),
+	SERVAL_PIN(18),
+	SERVAL_PIN(19),
+	SERVAL_PIN(20),
+	SERVAL_PIN(21),
+	SERVAL_PIN(22),
+	SERVAL_PIN(23),
+	SERVAL_PIN(24),
+	SERVAL_PIN(25),
+	SERVAL_PIN(26),
+	SERVAL_PIN(27),
+	SERVAL_PIN(28),
+	SERVAL_PIN(29),
+	SERVAL_PIN(30),
+	SERVAL_PIN(31),
+};
+
 #define OCELOT_P(p, f0, f1, f2)						\
 static struct ocelot_pin_caps ocelot_pin_##p = {			\
 	.pin = p,							\
@@ -959,6 +1041,15 @@ static struct pinctrl_desc luton_desc = {
 	.owner = THIS_MODULE,
 };
 
+static struct pinctrl_desc serval_desc = {
+	.name = "serval-pinctrl",
+	.pins = serval_pins,
+	.npins = ARRAY_SIZE(serval_pins),
+	.pctlops = &ocelot_pctl_ops,
+	.pmxops = &ocelot_pmx_ops,
+	.owner = THIS_MODULE,
+};
+
 static struct pinctrl_desc ocelot_desc = {
 	.name = "ocelot-pinctrl",
 	.pins = ocelot_pins,
@@ -1243,6 +1334,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 
 static const struct of_device_id ocelot_pinctrl_of_match[] = {
 	{ .compatible = "mscc,luton-pinctrl", .data = &luton_desc },
+	{ .compatible = "mscc,serval-pinctrl", .data = &serval_desc },
 	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
 	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
 	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
-- 
2.28.0

