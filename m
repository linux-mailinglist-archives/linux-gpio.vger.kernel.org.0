Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581A44E18C4
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Mar 2022 22:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244274AbiCSV6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Mar 2022 17:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244269AbiCSV6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Mar 2022 17:58:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DBB260C77
        for <linux-gpio@vger.kernel.org>; Sat, 19 Mar 2022 14:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ku5KNiHCiV1R0p
        A7y/89CTCEj4KZhXTivGuAFWgThF0=; b=JU1DD4dE9bnjIgIH/6iguuy4CHVkMv
        GDR/tEo2gU8H9/yx5kK3K+ZA7W/+ThN8YMmPHuk8wGFprWa0GAd7oy561tHry125
        eynbMoCp+PwZteGJ0bCZFSgiVAK2y1V/fqYFxh9WDgFNUYAufduz8rjPeBZ6f/yo
        EeP2r0FWQjj68=
Received: (qmail 244854 invoked from network); 19 Mar 2022 22:57:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2022 22:57:17 +0100
X-UD-Smtp-Session: l3s3148p1@1aLBWJnapNwgAQnoAFEUAKkXZRZ8X9Wv
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: r8a77990: add drive-strength
Date:   Sat, 19 Mar 2022 22:57:06 +0100
Message-Id: <20220319215706.59519-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319215706.59519-1-wsa+renesas@sang-engineering.com>
References: <20220319215706.59519-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to HW documentation 2.20 onwards, drive-strength is introduced
to r8a77990. Add it to the pinctrl driver.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Original BSP commit: f479c5a4e5e5 ("pinctrl: renesas: r8a77990: Add driver-strength for R8A77990")

However, this was incomplete and missed 6 pins of table 6D.6 which were
on a separate page. Adding them simplifies PORT_GP updates a lot.
However, a preparational patch is needed then which is patch 1 of this
series.

 drivers/pinctrl/renesas/pfc-r8a77990.c | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index f44c7da3ec16..cc825100f2fe 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -22,12 +22,12 @@
 	PORT_GP_CFG_18(0, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_23(1, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_26(2, fn, sfx, CFG_FLAGS), \
-	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
+	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
 	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS), \
-	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
+	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE | SH_PFC_PIN_CFG_DRIVE_STRENGTH), \
 	PORT_GP_CFG_20(5, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_9(6, fn, sfx, CFG_FLAGS), \
 	PORT_GP_CFG_1(6, 9, fn, sfx, SH_PFC_PIN_CFG_PULL_UP), \
@@ -5104,6 +5104,39 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static const struct pinmux_drive_reg pinmux_drive_regs[] = {
+	{ PINMUX_DRIVE_REG("DRVCTRL8", 0xe6060320) {
+		{ RCAR_GP_PIN(3,  0), 18, 2 },	/* SD0_CLK */
+		{ RCAR_GP_PIN(3,  1), 15, 2 },	/* SD0_CMD */
+		{ RCAR_GP_PIN(3,  2), 12, 2 },	/* SD0_DAT0 */
+		{ RCAR_GP_PIN(3,  3),  9, 2 },	/* SD0_DAT1 */
+		{ RCAR_GP_PIN(3,  4),  6, 2 },	/* SD0_DAT2 */
+		{ RCAR_GP_PIN(3,  5),  3, 2 },	/* SD0_DAT3 */
+		{ RCAR_GP_PIN(3,  6),  0, 2 },	/* SD1_CLK */
+	} },
+	{ PINMUX_DRIVE_REG("DRVCTRL9", 0xe6060324) {
+		{ RCAR_GP_PIN(3,  7), 29, 2 },	/* SD1_CMD */
+		{ RCAR_GP_PIN(3,  8), 26, 2 },	/* SD1_DAT0 */
+		{ RCAR_GP_PIN(3,  9), 23, 2 },	/* SD1_DAT1 */
+		{ RCAR_GP_PIN(3, 10), 20, 2 },	/* SD1_DAT2 */
+		{ RCAR_GP_PIN(3, 11), 17, 2 },	/* SD1_DAT3 */
+		{ RCAR_GP_PIN(4,  0), 14, 2 },	/* SD3_CLK */
+		{ RCAR_GP_PIN(4,  1), 11, 2 },	/* SD3_CMD */
+		{ RCAR_GP_PIN(4,  2),  8, 2 },	/* SD3_DAT0 */
+		{ RCAR_GP_PIN(4,  3),  5, 2 },	/* SD3_DAT1 */
+		{ RCAR_GP_PIN(4,  4),  2, 2 },	/* SD3_DAT2 */
+	} },
+	{ PINMUX_DRIVE_REG("DRVCTRL10", 0xe6060328) {
+		{ RCAR_GP_PIN(4,  5), 29, 2 },	/* SD3_DAT3 */
+		{ RCAR_GP_PIN(4,  6), 26, 2 },	/* SD3_DAT4 */
+		{ RCAR_GP_PIN(4,  7), 23, 2 },	/* SD3_DAT5 */
+		{ RCAR_GP_PIN(4,  8), 20, 2 },	/* SD3_DAT6 */
+		{ RCAR_GP_PIN(4,  9), 17, 2 },	/* SD3_DAT7 */
+		{ RCAR_GP_PIN(4, 10), 14, 2 },	/* SD3_DS */
+	} },
+	{ },
+};
+
 enum ioctrl_regs {
 	POCCTRL0,
 	TDSELCTRL,
@@ -5387,6 +5420,7 @@ const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 		ARRAY_SIZE(pinmux_functions.automotive),
 
 	.cfg_regs = pinmux_config_regs,
+	.drive_regs = pinmux_drive_regs,
 	.bias_regs = pinmux_bias_regs,
 	.ioctrl_regs = pinmux_ioctrl_regs,
 
-- 
2.30.2

