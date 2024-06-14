Return-Path: <linux-gpio+bounces-7458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13657908EC0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 17:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C3C1C20FC4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 15:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85F215E5B8;
	Fri, 14 Jun 2024 15:29:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADC15A844
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378976; cv=none; b=WJpbwLHrltMZ2kfptAbO1h/+XiglekuJIIP+xFfv1olCbv7wzamDASwQPcgEALlD9n37axWilQ0nGBGcQwvgLqs4hgFjaeVueZ/QoYiW0oy/fJmgFH6v6O0gMg9LhRYsb/YpWmiDk4rqclk1wr/ZSm4/skeq78a6Lr/fUMGOXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378976; c=relaxed/simple;
	bh=gWCCrvKuxoszMCXzCLtwyw8rRamAfhAP3anZSCs7rVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ognM7pZVtjAqJnaSX8MM/4jNZpnYRE4P16uyRCYdr1qMDul4xDMwgnEGApyCh8smG4JSGqjrmsTAH7YIHSgdzVeQyfUP8QCakkfXUaoeKGmsI6ljV/Zj0cKVakJEaRC++yTYpZrJuNJrhvpL5emjSQeLWfuFAIapRSQHOOfnWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bTVX2C0043w30qz01TVX1a; Fri, 14 Jun 2024 17:29:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8qm-00CeE6-Do;
	Fri, 14 Jun 2024 17:29:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8rq-00FqMQ-WD;
	Fri, 14 Jun 2024 17:29:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779g0: Add INTC-EX pins, groups, and function
Date: Fri, 14 Jun 2024 17:29:29 +0200
Message-Id: <9c33c36d13a5e38d79fa53085339b14631888b50.1718378943.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pins, groups, and function for the Interrupt Controller for External
Devices (INTC-EX) on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH 5/8] pinctrl: renesas: r8a779g0: Fix IRQ
suffixes"
(https://lore.kernel.org/all/8ce9baf0a0f9346544a3ac801fd962c7c12fd247.1717754960.git.geert+renesas@glider.be)

v2:
  - Adopt R-Car V4M pin naming.
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 112 +++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 49b44bdb12505bf2..cae3e65534997d3b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -1764,6 +1764,90 @@ static const unsigned int i2c5_mux[] = {
 	SDA5_MARK, SCL5_MARK,
 };
 
+/* - INTC-EX ---------------------------------------------------------------- */
+static const unsigned int intc_ex_irq0_a_pins[] = {
+	/* IRQ0_A */
+	RCAR_GP_PIN(0, 6),
+};
+static const unsigned int intc_ex_irq0_a_mux[] = {
+	IRQ0_A_MARK,
+};
+static const unsigned int intc_ex_irq0_b_pins[] = {
+	/* IRQ0_B */
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int intc_ex_irq0_b_mux[] = {
+	IRQ0_B_MARK,
+};
+
+static const unsigned int intc_ex_irq1_a_pins[] = {
+	/* IRQ1_A */
+	RCAR_GP_PIN(0, 5),
+};
+static const unsigned int intc_ex_irq1_a_mux[] = {
+	IRQ1_A_MARK,
+};
+static const unsigned int intc_ex_irq1_b_pins[] = {
+	/* IRQ1_B */
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int intc_ex_irq1_b_mux[] = {
+	IRQ1_B_MARK,
+};
+
+static const unsigned int intc_ex_irq2_a_pins[] = {
+	/* IRQ2_A */
+	RCAR_GP_PIN(0, 4),
+};
+static const unsigned int intc_ex_irq2_a_mux[] = {
+	IRQ2_A_MARK,
+};
+static const unsigned int intc_ex_irq2_b_pins[] = {
+	/* IRQ2_B */
+	RCAR_GP_PIN(0, 13),
+};
+static const unsigned int intc_ex_irq2_b_mux[] = {
+	IRQ2_B_MARK,
+};
+
+static const unsigned int intc_ex_irq3_a_pins[] = {
+	/* IRQ3_A */
+	RCAR_GP_PIN(0, 3),
+};
+static const unsigned int intc_ex_irq3_a_mux[] = {
+	IRQ3_A_MARK,
+};
+static const unsigned int intc_ex_irq3_b_pins[] = {
+	/* IRQ3_B */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int intc_ex_irq3_b_mux[] = {
+	IRQ3_B_MARK,
+};
+
+static const unsigned int intc_ex_irq4_a_pins[] = {
+	/* IRQ4_A */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int intc_ex_irq4_a_mux[] = {
+	IRQ4_A_MARK,
+};
+static const unsigned int intc_ex_irq4_b_pins[] = {
+	/* IRQ4_B */
+	RCAR_GP_PIN(2, 3),
+};
+static const unsigned int intc_ex_irq4_b_mux[] = {
+	IRQ4_B_MARK,
+};
+
+static const unsigned int intc_ex_irq5_pins[] = {
+	/* IRQ5 */
+	RCAR_GP_PIN(2, 2),
+};
+static const unsigned int intc_ex_irq5_mux[] = {
+	IRQ5_MARK,
+};
+
 /* - MMC -------------------------------------------------------------------- */
 static const unsigned int mmc_data_pins[] = {
 	/* MMC_SD_D[0:3], MMC_D[4:7] */
@@ -2602,6 +2686,18 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c4),
 	SH_PFC_PIN_GROUP(i2c5),
 
+	SH_PFC_PIN_GROUP(intc_ex_irq0_a),
+	SH_PFC_PIN_GROUP(intc_ex_irq0_b),
+	SH_PFC_PIN_GROUP(intc_ex_irq1_a),
+	SH_PFC_PIN_GROUP(intc_ex_irq1_b),
+	SH_PFC_PIN_GROUP(intc_ex_irq2_a),
+	SH_PFC_PIN_GROUP(intc_ex_irq2_b),
+	SH_PFC_PIN_GROUP(intc_ex_irq3_a),
+	SH_PFC_PIN_GROUP(intc_ex_irq3_b),
+	SH_PFC_PIN_GROUP(intc_ex_irq4_a),
+	SH_PFC_PIN_GROUP(intc_ex_irq4_b),
+	SH_PFC_PIN_GROUP(intc_ex_irq5),
+
 	BUS_DATA_PIN_GROUP(mmc_data, 1),
 	BUS_DATA_PIN_GROUP(mmc_data, 4),
 	BUS_DATA_PIN_GROUP(mmc_data, 8),
@@ -2850,6 +2946,20 @@ static const char * const i2c5_groups[] = {
 	"i2c5",
 };
 
+static const char * const intc_ex_groups[] = {
+	"intc_ex_irq0_a",
+	"intc_ex_irq0_b",
+	"intc_ex_irq1_a",
+	"intc_ex_irq1_b",
+	"intc_ex_irq2_a",
+	"intc_ex_irq2_b",
+	"intc_ex_irq3_a",
+	"intc_ex_irq3_b",
+	"intc_ex_irq4_a",
+	"intc_ex_irq4_b",
+	"intc_ex_irq5",
+};
+
 static const char * const mmc_groups[] = {
 	"mmc_data1",
 	"mmc_data4",
@@ -3067,6 +3177,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c4),
 	SH_PFC_FUNCTION(i2c5),
 
+	SH_PFC_FUNCTION(intc_ex),
+
 	SH_PFC_FUNCTION(mmc),
 
 	SH_PFC_FUNCTION(msiof0),
-- 
2.34.1


