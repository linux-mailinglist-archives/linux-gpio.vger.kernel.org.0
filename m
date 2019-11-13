Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E3FFAE51
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 11:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKMKQ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 05:16:57 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:35892 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfKMKQ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 05:16:56 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id RNGv2100Z5USYZQ06NGv9F; Wed, 13 Nov 2019 11:16:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUphn-0002MZ-IF; Wed, 13 Nov 2019 11:16:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUphn-0007PH-G7; Wed, 13 Nov 2019 11:16:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77965: Fix DU_DOTCLKIN3 drive/bias control
Date:   Wed, 13 Nov 2019 11:16:53 +0100
Message-Id: <20191113101653.28428-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

R-Car Gen3 Hardware Manual Errata for Rev. 2.00 of October 24, 2019
changed the configuration bits for drive and bias control for the
DU_DOTCLKIN3 pin on R-Car M3-N, to match the same pin on R-Car H3.
Update the driver to reflect this.

After this, the handling of drive and bias control for the various
DU_DOTCLKINx pins is consistent across all of the R-Car H3, M3-W,
M3-W+, and M3-N SoCs.

Fixes: 86c045c2e4201e94 ("pinctrl: sh-pfc: r8a77965: Replace DU_DOTCLKIN2 by DU_DOTCLKIN3")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.6.

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 8bdf33c807f6c7f4..6616f5210b9d96d4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -5998,7 +5998,7 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 		{ PIN_DU_DOTCLKIN1,    0, 2 },	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_DRIVE_REG("DRVCTRL12", 0xe6060330) {
-		{ PIN_DU_DOTCLKIN3,   28, 2 },	/* DU_DOTCLKIN3 */
+		{ PIN_DU_DOTCLKIN3,   24, 2 },	/* DU_DOTCLKIN3 */
 		{ PIN_FSCLKST,        20, 2 },	/* FSCLKST */
 		{ PIN_TMS,             4, 2 },	/* TMS */
 	} },
@@ -6254,8 +6254,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
 		[31] = PIN_DU_DOTCLKIN1,	/* DU_DOTCLKIN1 */
 	} },
 	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
-		[ 0] = PIN_DU_DOTCLKIN3,	/* DU_DOTCLKIN3 */
-		[ 1] = SH_PFC_PIN_NONE,
+		[ 0] = SH_PFC_PIN_NONE,
+		[ 1] = PIN_DU_DOTCLKIN3,	/* DU_DOTCLKIN3 */
 		[ 2] = PIN_FSCLKST,		/* FSCLKST */
 		[ 3] = PIN_EXTALR,		/* EXTALR*/
 		[ 4] = PIN_TRST_N,		/* TRST# */
-- 
2.17.1

