Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955C06C1B83
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 17:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbjCTQ0g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 12:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCTQZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 12:25:44 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0C3FF17
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 09:19:02 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id agK0290051C8whw06gK0Ke; Mon, 20 Mar 2023 17:19:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIDD-00E2nC-6n;
        Mon, 20 Mar 2023 17:19:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIDs-007SJ9-1B;
        Mon, 20 Mar 2023 17:19:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a7779: Add PWM pins, groups, and functions
Date:   Mon, 20 Mar 2023 17:18:58 +0100
Message-Id: <cea9723e9c3df4b1408750caa38886aac1fab5f7.1679329090.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins, groups, and functions for the PWM Timers on the Renesas R-Car
H1 (R8A7779) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v6.4.

 drivers/pinctrl/renesas/pfc-r8a7779.c | 109 ++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index 64a96aca69edd693..6a402b676ac88224 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -2034,6 +2034,67 @@ static const unsigned int mmc1_ctrl_pins[] = {
 static const unsigned int mmc1_ctrl_mux[] = {
 	MMC1_CMD_MARK, MMC1_CLK_MARK,
 };
+/* - PWM -------------------------------------------------------------------- */
+static const unsigned int pwm0_pins[] = {
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+static const unsigned int pwm0_b_pins[] = {
+	RCAR_GP_PIN(0, 12),
+};
+static const unsigned int pwm0_b_mux[] = {
+	PWM0_B_MARK,
+};
+static const unsigned int pwm0_c_pins[] = {
+	RCAR_GP_PIN(4, 5),
+};
+static const unsigned int pwm0_c_mux[] = {
+	PWM0_C_MARK,
+};
+static const unsigned int pwm0_d_pins[] = {
+	RCAR_GP_PIN(4, 18),
+};
+static const unsigned int pwm0_d_mux[] = {
+	PWM0_D_MARK,
+};
+static const unsigned int pwm1_pins[] = {
+	RCAR_GP_PIN(4, 28),
+};
+static const unsigned int pwm1_mux[] = {
+	PWM1_MARK,
+};
+static const unsigned int pwm2_pins[] = {
+	RCAR_GP_PIN(3, 25),
+};
+static const unsigned int pwm2_mux[] = {
+	PWM2_MARK,
+};
+static const unsigned int pwm3_pins[] = {
+	RCAR_GP_PIN(3, 26),
+};
+static const unsigned int pwm3_mux[] = {
+	PWM3_MARK,
+};
+static const unsigned int pwm4_pins[] = {
+	RCAR_GP_PIN(3, 27),
+};
+static const unsigned int pwm4_mux[] = {
+	PWM4_MARK,
+};
+static const unsigned int pwm5_pins[] = {
+	RCAR_GP_PIN(4, 17),
+};
+static const unsigned int pwm5_mux[] = {
+	PWM5_MARK,
+};
+static const unsigned int pwm6_pins[] = {
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int pwm6_mux[] = {
+	PWM6_MARK,
+};
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RXD, TXD */
@@ -2771,6 +2832,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	BUS_DATA_PIN_GROUP(mmc1_data, 4),
 	BUS_DATA_PIN_GROUP(mmc1_data, 8),
 	SH_PFC_PIN_GROUP(mmc1_ctrl),
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm0_b),
+	SH_PFC_PIN_GROUP(pwm0_c),
+	SH_PFC_PIN_GROUP(pwm0_d),
+	SH_PFC_PIN_GROUP(pwm1),
+	SH_PFC_PIN_GROUP(pwm2),
+	SH_PFC_PIN_GROUP(pwm3),
+	SH_PFC_PIN_GROUP(pwm4),
+	SH_PFC_PIN_GROUP(pwm5),
+	SH_PFC_PIN_GROUP(pwm6),
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2984,6 +3055,37 @@ static const char * const mmc1_groups[] = {
 	"mmc1_ctrl",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0",
+	"pwm0_b",
+	"pwm0_c",
+	"pwm0_d",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4",
+};
+
+static const char * const pwm5_groups[] = {
+	"pwm5",
+};
+
+static const char * const pwm6_groups[] = {
+	"pwm6",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -3147,6 +3249,13 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(lbsc),
 	SH_PFC_FUNCTION(mmc0),
 	SH_PFC_FUNCTION(mmc1),
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+	SH_PFC_FUNCTION(pwm5),
+	SH_PFC_FUNCTION(pwm6),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
2.34.1

