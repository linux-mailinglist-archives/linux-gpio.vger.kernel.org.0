Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEAC47E4BE
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348876AbhLWOmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348890AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BE6C061784
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by michel.telenet-ops.be with bizsmtp
        id ZqiD260091rdBcm06qiDal; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a8v-P3; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rYR-Pe; Thu, 23 Dec 2021 15:42:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/60] pinctrl: renesas: Rename sh_pfc_soc_operations instances
Date:   Thu, 23 Dec 2021 15:41:12 +0100
Message-Id: <2ab33ad1d6a20a57d16922678b78810fa55b7fc0.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some instances of struct sh_pfc_soc_operations are called
"<soc>_pfc_ops", others are called "<soc>_pinmux_ops" or just
"pinmux_ops".  Settle on the first variant, to avoid confusion with
"struct pinmux_ops" in the pinctrl core, and to increase consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a7790.c  |  6 +++---
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 10 +++++-----
 drivers/pinctrl/renesas/pfc-r8a7792.c  |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a7794.c  |  6 +++---
 drivers/pinctrl/renesas/pfc-r8a77950.c |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a77951.c |  6 +++---
 drivers/pinctrl/renesas/pfc-r8a7796.c  |  8 ++++----
 drivers/pinctrl/renesas/pfc-r8a77965.c |  6 +++---
 drivers/pinctrl/renesas/pfc-r8a77970.c |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a77980.c |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a77990.c |  6 +++---
 drivers/pinctrl/renesas/pfc-r8a77995.c |  4 ++--
 drivers/pinctrl/renesas/pfc-r8a779a0.c |  4 ++--
 14 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index cf7153d06a953863..0d5b603b870fb079 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -3683,7 +3683,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
-static const struct sh_pfc_soc_operations r8a77470_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77470_pfc_ops = {
 	.pin_to_pocctrl = r8a77470_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -3692,7 +3692,7 @@ static const struct sh_pfc_soc_operations r8a77470_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77470
 const struct sh_pfc_soc_info r8a77470_pinmux_info = {
 	.name = "r8a77470_pfc",
-	.ops = &r8a77470_pinmux_ops,
+	.ops = &r8a77470_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 85b2ca9733214da1..936fec3d715bb1bf 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -6282,7 +6282,7 @@ static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
 	return 0;
 }
 
-static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a7790_pfc_ops = {
 	.init = r8a7790_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
@@ -6292,7 +6292,7 @@ static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7742
 const struct sh_pfc_soc_info r8a7742_pinmux_info = {
 	.name = "r8a77420_pfc",
-	.ops = &r8a7790_pinmux_ops,
+	.ops = &r8a7790_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -6315,7 +6315,7 @@ const struct sh_pfc_soc_info r8a7742_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7790
 const struct sh_pfc_soc_info r8a7790_pinmux_info = {
 	.name = "r8a77900_pfc",
-	.ops = &r8a7790_pinmux_ops,
+	.ops = &r8a7790_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index e3b886b95545cab3..e636e1b9bc79b341 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -6989,7 +6989,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a7791_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a7791_pfc_ops = {
 	.pin_to_pocctrl = r8a7791_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -6998,7 +6998,7 @@ static const struct sh_pfc_soc_operations r8a7791_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7743
 const struct sh_pfc_soc_info r8a7743_pinmux_info = {
 	.name = "r8a77430_pfc",
-	.ops = &r8a7791_pinmux_ops,
+	.ops = &r8a7791_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -7021,7 +7021,7 @@ const struct sh_pfc_soc_info r8a7743_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7744
 const struct sh_pfc_soc_info r8a7744_pinmux_info = {
 	.name = "r8a77440_pfc",
-	.ops = &r8a7791_pinmux_ops,
+	.ops = &r8a7791_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -7044,7 +7044,7 @@ const struct sh_pfc_soc_info r8a7744_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7791
 const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 	.name = "r8a77910_pfc",
-	.ops = &r8a7791_pinmux_ops,
+	.ops = &r8a7791_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -7069,7 +7069,7 @@ const struct sh_pfc_soc_info r8a7791_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7793
 const struct sh_pfc_soc_info r8a7793_pinmux_info = {
 	.name = "r8a77930_pfc",
-	.ops = &r8a7791_pinmux_ops,
+	.ops = &r8a7791_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index 3ab56dc768de76d4..bba34609b57f680c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -3281,14 +3281,14 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
-static const struct sh_pfc_soc_operations r8a7792_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a7792_pfc_ops = {
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
 };
 
 const struct sh_pfc_soc_info r8a7792_pinmux_info = {
 	.name = "r8a77920_pfc",
-	.ops = &r8a7792_pinmux_ops,
+	.ops = &r8a7792_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index 08a4269565e2e54a..d3c23e7f3132a27d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -5935,7 +5935,7 @@ static int r8a7794_pinmux_soc_init(struct sh_pfc *pfc)
 	return 0;
 }
 
-static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a7794_pfc_ops = {
 	.init = r8a7794_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
@@ -5945,7 +5945,7 @@ static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7745
 const struct sh_pfc_soc_info r8a7745_pinmux_info = {
 	.name = "r8a77450_pfc",
-	.ops = &r8a7794_pinmux_ops,
+	.ops = &r8a7794_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -5968,7 +5968,7 @@ const struct sh_pfc_soc_info r8a7745_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A7794
 const struct sh_pfc_soc_info r8a7794_pinmux_info = {
 	.name = "r8a77940_pfc",
-	.ops = &r8a7794_pinmux_ops,
+	.ops = &r8a7794_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index c86064900c6e2d01..ea10dfe8726ab4fe 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -5832,7 +5832,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a77950_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77950_pfc_ops = {
 	.pin_to_pocctrl = r8a77950_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -5840,7 +5840,7 @@ static const struct sh_pfc_soc_operations r8a77950_pinmux_ops = {
 
 const struct sh_pfc_soc_info r8a77950_pinmux_info = {
 	.name = "r8a77950_pfc",
-	.ops = &r8a77950_pinmux_ops,
+	.ops = &r8a77950_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index ee9ce5f8eb86da87..9408ac0108a97588 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -6316,7 +6316,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a77951_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77951_pfc_ops = {
 	.pin_to_pocctrl = r8a77951_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -6325,7 +6325,7 @@ static const struct sh_pfc_soc_operations r8a77951_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A774E1
 const struct sh_pfc_soc_info r8a774e1_pinmux_info = {
 	.name = "r8a774e1_pfc",
-	.ops = &r8a77951_pinmux_ops,
+	.ops = &r8a77951_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -6350,7 +6350,7 @@ const struct sh_pfc_soc_info r8a774e1_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77951
 const struct sh_pfc_soc_info r8a77951_pinmux_info = {
 	.name = "r8a77951_pfc",
-	.ops = &r8a77951_pinmux_ops,
+	.ops = &r8a77951_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index de3df502f971a92e..929a67e84f88b3b2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -6267,7 +6267,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a7796_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a7796_pfc_ops = {
 	.pin_to_pocctrl = r8a7796_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -6276,7 +6276,7 @@ static const struct sh_pfc_soc_operations r8a7796_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A774A1
 const struct sh_pfc_soc_info r8a774a1_pinmux_info = {
 	.name = "r8a774a1_pfc",
-	.ops = &r8a7796_pinmux_ops,
+	.ops = &r8a7796_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -6301,7 +6301,7 @@ const struct sh_pfc_soc_info r8a774a1_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77960
 const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 	.name = "r8a77960_pfc",
-	.ops = &r8a7796_pinmux_ops,
+	.ops = &r8a7796_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -6328,7 +6328,7 @@ const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77961
 const struct sh_pfc_soc_info r8a77961_pinmux_info = {
 	.name = "r8a77961_pfc",
-	.ops = &r8a7796_pinmux_ops,
+	.ops = &r8a7796_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 268129f82929f552..fbce972366a36af3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -6524,7 +6524,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a77965_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77965_pfc_ops = {
 	.pin_to_pocctrl = r8a77965_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -6533,7 +6533,7 @@ static const struct sh_pfc_soc_operations r8a77965_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A774B1
 const struct sh_pfc_soc_info r8a774b1_pinmux_info = {
 	.name = "r8a774b1_pfc",
-	.ops = &r8a77965_pinmux_ops,
+	.ops = &r8a77965_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -6558,7 +6558,7 @@ const struct sh_pfc_soc_info r8a774b1_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 const struct sh_pfc_soc_info r8a77965_pinmux_info = {
 	.name = "r8a77965_pfc",
-	.ops = &r8a77965_pinmux_ops,
+	.ops = &r8a77965_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index 45b0b235c5cc0138..bf24c39b3597d530 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -2656,7 +2656,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
-static const struct sh_pfc_soc_operations pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77970_pfc_ops = {
 	.pin_to_pocctrl = r8a77970_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -2664,7 +2664,7 @@ static const struct sh_pfc_soc_operations pinmux_ops = {
 
 const struct sh_pfc_soc_info r8a77970_pinmux_info = {
 	.name = "r8a77970_pfc",
-	.ops = &pinmux_ops,
+	.ops = &r8a77970_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index c4825b01449e9e3e..f80b327530b580d9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -3139,7 +3139,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ }
 };
 
-static const struct sh_pfc_soc_operations pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77980_pfc_ops = {
 	.pin_to_pocctrl = r8a77980_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -3147,7 +3147,7 @@ static const struct sh_pfc_soc_operations pinmux_ops = {
 
 const struct sh_pfc_soc_info r8a77980_pinmux_info = {
 	.name = "r8a77980_pfc",
-	.ops = &pinmux_ops,
+	.ops = &r8a77980_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index f44c7da3ec167de7..c7f0db09937ee489 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5339,7 +5339,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations r8a77990_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77990_pfc_ops = {
 	.pin_to_pocctrl = r8a77990_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -5348,7 +5348,7 @@ static const struct sh_pfc_soc_operations r8a77990_pinmux_ops = {
 #ifdef CONFIG_PINCTRL_PFC_R8A774C0
 const struct sh_pfc_soc_info r8a774c0_pinmux_info = {
 	.name = "r8a774c0_pfc",
-	.ops = &r8a77990_pinmux_ops,
+	.ops = &r8a77990_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -5372,7 +5372,7 @@ const struct sh_pfc_soc_info r8a774c0_pinmux_info = {
 #ifdef CONFIG_PINCTRL_PFC_R8A77990
 const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 	.name = "r8a77990_pfc",
-	.ops = &r8a77990_pinmux_ops,
+	.ops = &r8a77990_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index c56e1e4c13b39cf3..e522e15769b91299 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -3144,7 +3144,7 @@ static void r8a77995_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	sh_pfc_write(pfc, reg->puen, enable);
 }
 
-static const struct sh_pfc_soc_operations r8a77995_pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a77995_pfc_ops = {
 	.pin_to_pocctrl = r8a77995_pin_to_pocctrl,
 	.get_bias = r8a77995_pinmux_get_bias,
 	.set_bias = r8a77995_pinmux_set_bias,
@@ -3152,7 +3152,7 @@ static const struct sh_pfc_soc_operations r8a77995_pinmux_ops = {
 
 const struct sh_pfc_soc_info r8a77995_pinmux_info = {
 	.name = "r8a77995_pfc",
-	.ops = &r8a77995_pinmux_ops,
+	.ops = &r8a77995_pfc_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 83580385c3ca9b1c..81c0baea36f19ca1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -4429,7 +4429,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 	{ /* sentinel */ },
 };
 
-static const struct sh_pfc_soc_operations pinmux_ops = {
+static const struct sh_pfc_soc_operations r8a779a0_pfc_ops = {
 	.pin_to_pocctrl = r8a779a0_pin_to_pocctrl,
 	.get_bias = rcar_pinmux_get_bias,
 	.set_bias = rcar_pinmux_set_bias,
@@ -4437,7 +4437,7 @@ static const struct sh_pfc_soc_operations pinmux_ops = {
 
 const struct sh_pfc_soc_info r8a779a0_pinmux_info = {
 	.name = "r8a779a0_pfc",
-	.ops = &pinmux_ops,
+	.ops = &r8a779a0_pfc_ops,
 	.unlock_reg = 0x1ff,	/* PMMRn mask */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.25.1

