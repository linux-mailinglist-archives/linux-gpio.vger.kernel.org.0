Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F60247E52B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243937AbhLWO4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239926AbhLWO4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:31 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487E7C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqwU2600Y4C55Sk01qwUZ1; Thu, 23 Dec 2021 15:56:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-006aMB-Af; Thu, 23 Dec 2021 15:56:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW7-003rwW-V0; Thu, 23 Dec 2021 15:56:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/10] pinctrl: renesas: Remove unused pfc parameter from .pin_to_pocctrl()
Date:   Thu, 23 Dec 2021 15:56:17 +0100
Message-Id: <822133086f32618c7fc920123c6a96f5d4ea7ad6.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pfc parameter of the .pin_to_pocctrl() method was never used.
It is a relic of the old I/O voltage handling before commit
8775306dcf48092f ("pinctrl: sh-pfc: refactor voltage setting").

Remove the parameter, as it prevents the checker from calling this
function for validating consistency of the pin control tables.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77470.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a7794.c  | 2 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77951.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77965.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77970.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77980.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77990.c | 3 +--
 drivers/pinctrl/renesas/pfc-r8a77995.c | 2 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 3 +--
 drivers/pinctrl/renesas/pinctrl.c      | 4 ++--
 drivers/pinctrl/renesas/sh_pfc.h       | 2 +-
 15 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77470.c b/drivers/pinctrl/renesas/pfc-r8a77470.c
index 3a722e0da48b781b..ee6e8fabab246c2b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77470.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77470.c
@@ -3345,8 +3345,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a77470_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index 9c264dee03dfa906..0aa141069daf3389 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -5873,7 +5873,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a7790_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	if (pin < RCAR_GP_PIN(3, 0) || pin > RCAR_GP_PIN(3, 31))
 		return -EINVAL;
diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index e4a284ae7cfaf59e..076a8b7d71de04d2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -6602,7 +6602,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static int r8a7791_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a7791_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
 		return -EINVAL;
diff --git a/drivers/pinctrl/renesas/pfc-r8a7794.c b/drivers/pinctrl/renesas/pfc-r8a7794.c
index 3835c3956bd1f017..d1b0e651738249ca 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7794.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7794.c
@@ -5570,7 +5570,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a7794_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	if (pin < RCAR_GP_PIN(6, 0) || pin > RCAR_GP_PIN(6, 23))
 		return -EINVAL;
diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index ae3dd734c724bebf..63c9f6d6468b3869 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -5514,8 +5514,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77950_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a77950_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index bd6f83485e565210..9d6eef4e9d1885b9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -5962,8 +5962,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77951_pin_to_pocctrl(struct sh_pfc *pfc,
-				   unsigned int pin, u32 *pocctrl)
+static int r8a77951_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 6079f588a201430d..75ea36829a70e024 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -5913,8 +5913,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a7796_pin_to_pocctrl(struct sh_pfc *pfc,
-				  unsigned int pin, u32 *pocctrl)
+static int r8a7796_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 75e7b02337b2efea..6bb7f7543c37ca8d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -6154,8 +6154,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77965_pin_to_pocctrl(struct sh_pfc *pfc,
-				   unsigned int pin, u32 *pocctrl)
+static int r8a77965_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index bcbd5904451d2b79..94f90c13989eceb9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -2434,8 +2434,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77970_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a77970_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index df15d9a2007e4828..c229a5d8fa573816 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -2878,8 +2878,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77980_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a77980_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 68e82d4bc06ec663..228896529545c441 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -5023,8 +5023,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a77990_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a77990_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index c3106fd040d90ae4..e8c896f19f45e376 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -2822,7 +2822,7 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static int r8a77995_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+static int r8a77995_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = -EINVAL;
 
diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 463ebd6c6c70d931..155294d0dd5abfb4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -4011,8 +4011,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	{ /* sentinel */ },
 };
 
-static int r8a779a0_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
-				   u32 *pocctrl)
+static int r8a779a0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 {
 	int bit = pin & 0x1f;
 
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 96b9de974246ac23..a5862c67a6ecc22e 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -639,7 +639,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		if (!pfc->info->ops || !pfc->info->ops->pin_to_pocctrl)
 			return -ENOTSUPP;
 
-		bit = pfc->info->ops->pin_to_pocctrl(pfc, _pin, &pocctrl);
+		bit = pfc->info->ops->pin_to_pocctrl(_pin, &pocctrl);
 		if (WARN(bit < 0, "invalid pin %#x", _pin))
 			return bit;
 
@@ -711,7 +711,7 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 			if (!pfc->info->ops || !pfc->info->ops->pin_to_pocctrl)
 				return -ENOTSUPP;
 
-			bit = pfc->info->ops->pin_to_pocctrl(pfc, _pin, &pocctrl);
+			bit = pfc->info->ops->pin_to_pocctrl(_pin, &pocctrl);
 			if (WARN(bit < 0, "invalid pin %#x", _pin))
 				return bit;
 
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 4124e3b46c16c8de..d8a6bd0412e496d3 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -254,7 +254,7 @@ struct sh_pfc_soc_operations {
 	unsigned int (*get_bias)(struct sh_pfc *pfc, unsigned int pin);
 	void (*set_bias)(struct sh_pfc *pfc, unsigned int pin,
 			 unsigned int bias);
-	int (*pin_to_pocctrl)(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl);
+	int (*pin_to_pocctrl)(unsigned int pin, u32 *pocctrl);
 	void __iomem * (*pin_to_portcr)(struct sh_pfc *pfc, unsigned int pin);
 };
 
-- 
2.25.1

