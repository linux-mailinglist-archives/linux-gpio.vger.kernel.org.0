Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50614FFC56
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbiDMR0s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237274AbiDMR0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:43 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976ECB09
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQF2700H2t8Arn01HQFX7; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-000Tq6-N5; Wed, 13 Apr 2022 19:24:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfRo-0K; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/50] pinctrl: renesas: Add shorthand for reserved register fields
Date:   Wed, 13 Apr 2022 19:23:24 +0200
Message-Id: <cad7c92ef039d9a4d039807efc15886a7aa862be.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, reserved register fields must be fully described using dummy
enum IDs (zeroes), one for each possible state (2^bits states).

Add support for describing reserved fields using negative field width
values as shorthands, thus removing the need for dummy values.  Apart
from the obvious size reduction due to the removal of the dummy values,
this will also enable merging adjacent reserved fields into a single
field, reducing the number of fields to describe, and thus kernel size.

Update the checker accordingly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c   | 34 ++++++++++++++++++++------------
 drivers/pinctrl/renesas/sh_pfc.h | 13 ++++++------
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index dae2201a62dc8f8b..356325df9c18f2ea 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -13,10 +13,11 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
-#include <linux/init.h>
+#include <linux/math.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/machine.h>
@@ -214,7 +215,7 @@ static void sh_pfc_config_reg_helper(struct sh_pfc *pfc,
 		*maskp = (1 << crp->var_field_width[in_pos]) - 1;
 		*posp = crp->reg_width;
 		for (k = 0; k <= in_pos; k++)
-			*posp -= crp->var_field_width[k];
+			*posp -= abs(crp->var_field_width[k]);
 	}
 }
 
@@ -262,14 +263,17 @@ static int sh_pfc_get_config_reg(struct sh_pfc *pfc, u16 enum_id,
 		if (!r_width)
 			break;
 
-		for (bit_pos = 0; bit_pos < r_width; bit_pos += curr_width) {
+		for (bit_pos = 0; bit_pos < r_width; bit_pos += curr_width, m++) {
 			u32 ncomb;
 			u32 n;
 
-			if (f_width)
+			if (f_width) {
 				curr_width = f_width;
-			else
-				curr_width = config_reg->var_field_width[m];
+			} else {
+				curr_width = abs(config_reg->var_field_width[m]);
+				if (config_reg->var_field_width[m] < 0)
+					continue;
+			}
 
 			ncomb = 1 << curr_width;
 			for (n = 0; n < ncomb; n++) {
@@ -281,7 +285,6 @@ static int sh_pfc_get_config_reg(struct sh_pfc *pfc, u16 enum_id,
 				}
 			}
 			pos += ncomb;
-			m++;
 		}
 		k++;
 	}
@@ -875,7 +878,8 @@ static const struct sh_pfc_pin __init *sh_pfc_find_pin(
 static void __init sh_pfc_check_cfg_reg(const char *drvname,
 					const struct pinmux_cfg_reg *cfg_reg)
 {
-	unsigned int i, n, rw, fw;
+	unsigned int i, n, rw;
+	int fw;
 
 	sh_pfc_check_reg(drvname, cfg_reg->reg,
 			 GENMASK(cfg_reg->reg_width - 1, 0));
@@ -888,11 +892,15 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 	}
 
 	for (i = 0, n = 0, rw = 0; (fw = cfg_reg->var_field_width[i]); i++) {
-		if (fw > 3 && is0s(&cfg_reg->enum_ids[n], 1 << fw))
-			sh_pfc_warn("reg 0x%x: reserved field [%u:%u] can be split to reduce table size\n",
-				    cfg_reg->reg, rw, rw + fw - 1);
-		n += 1 << fw;
-		rw += fw;
+		if (fw < 0) {
+			rw += -fw;
+		} else {
+			if (is0s(&cfg_reg->enum_ids[n], 1 << fw))
+				sh_pfc_warn("reg 0x%x: field [%u:%u] can be described as reserved\n",
+					    cfg_reg->reg, rw, rw + fw - 1);
+			n += 1 << fw;
+			rw += fw;
+		}
 	}
 
 	if (rw != cfg_reg->reg_width)
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index f33e9f5e83a464e0..64e3dde997347ad5 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -112,7 +112,7 @@ struct pinmux_cfg_reg {
 #define SET_NR_ENUM_IDS(n)
 #endif
 	const u16 *enum_ids;
-	const u8 *var_field_width;
+	const s8 *var_field_width;
 };
 
 #define GROUP(...)	__VA_ARGS__
@@ -142,14 +142,15 @@ struct pinmux_cfg_reg {
  *   - r_width: Width of the register (in bits)
  *   - f_widths: List of widths of the register fields (in bits), from left
  *               to right (i.e. MSB to LSB), wrapped using the GROUP() macro.
- *   - ids: For each register field (from left to right, i.e. MSB to LSB),
- *          2^f_widths[i] enum IDs must be specified, one for each possible
- *          combination of the register field bit values, all wrapped using
- *          the GROUP() macro.
+ *               Reserved fields are indicated by negating the field width.
+ *   - ids: For each non-reserved register field (from left to right, i.e. MSB
+ *          to LSB), 2^f_widths[i] enum IDs must be specified, one for each
+ *          possible combination of the register field bit values, all wrapped
+ *          using the GROUP() macro.
  */
 #define PINMUX_CFG_REG_VAR(name, r, r_width, f_widths, ids)		\
 	.reg = r, .reg_width = r_width,					\
-	.var_field_width = (const u8 []) { f_widths, 0 },		\
+	.var_field_width = (const s8 []) { f_widths, 0 },		\
 	SET_NR_ENUM_IDS(sizeof((const u16 []) { ids }) / sizeof(u16))	\
 	.enum_ids = (const u16 []) { ids }
 
-- 
2.25.1

