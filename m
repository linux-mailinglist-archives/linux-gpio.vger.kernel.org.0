Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB25147E50D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348951AbhLWOmk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:40 -0500
Received: from leibniz.telenet-ops.be ([195.130.137.77]:45188 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348936AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4JKXw726b8zMqp2g
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiF2600C1rdBcm01qiFQE; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a93-NZ; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rZL-18; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/60] pinctrl: renesas: sh73a0: Share KEYIN pin group data
Date:   Thu, 23 Dec 2021 15:41:20 +0100
Message-Id: <6d11be0accdaf4a42ce2a64e64201ab0670d65db.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups keysc_in[567] are subsets of keysc_in8.

This reduces kernel size by 144 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-sh73a0.c | 36 +++++-----------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index ed6db809e80de3b7..3d03854b9833a093 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -1777,35 +1777,11 @@ static const unsigned int irda_1_mux[] = {
 	PORT49_IRDA_OUT_MARK, PORT53_IRDA_IN_MARK, PORT54_IRDA_FIRSEL_MARK,
 };
 /* - KEYSC ------------------------------------------------------------------ */
-static const unsigned int keysc_in5_pins[] = {
-	/* KEYIN[0:4] */
-	66, 67, 68, 69, 70,
-};
-static const unsigned int keysc_in5_mux[] = {
-	KEYIN0_MARK, KEYIN1_MARK, KEYIN2_MARK, KEYIN3_MARK,
-	KEYIN4_MARK,
-};
-static const unsigned int keysc_in6_pins[] = {
-	/* KEYIN[0:5] */
-	66, 67, 68, 69, 70, 71,
-};
-static const unsigned int keysc_in6_mux[] = {
-	KEYIN0_MARK, KEYIN1_MARK, KEYIN2_MARK, KEYIN3_MARK,
-	KEYIN4_MARK, KEYIN5_MARK,
-};
-static const unsigned int keysc_in7_pins[] = {
-	/* KEYIN[0:6] */
-	66, 67, 68, 69, 70, 71, 72,
-};
-static const unsigned int keysc_in7_mux[] = {
-	KEYIN0_MARK, KEYIN1_MARK, KEYIN2_MARK, KEYIN3_MARK,
-	KEYIN4_MARK, KEYIN5_MARK, KEYIN6_MARK,
-};
-static const unsigned int keysc_in8_pins[] = {
+static const unsigned int keysc_in_pins[] = {
 	/* KEYIN[0:7] */
 	66, 67, 68, 69, 70, 71, 72, 73,
 };
-static const unsigned int keysc_in8_mux[] = {
+static const unsigned int keysc_in_mux[] = {
 	KEYIN0_MARK, KEYIN1_MARK, KEYIN2_MARK, KEYIN3_MARK,
 	KEYIN4_MARK, KEYIN5_MARK, KEYIN6_MARK, KEYIN7_MARK,
 };
@@ -3138,10 +3114,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c3_2),
 	SH_PFC_PIN_GROUP(irda_0),
 	SH_PFC_PIN_GROUP(irda_1),
-	SH_PFC_PIN_GROUP(keysc_in5),
-	SH_PFC_PIN_GROUP(keysc_in6),
-	SH_PFC_PIN_GROUP(keysc_in7),
-	SH_PFC_PIN_GROUP(keysc_in8),
+	BUS_DATA_PIN_GROUP(keysc_in, 5),
+	BUS_DATA_PIN_GROUP(keysc_in, 6),
+	BUS_DATA_PIN_GROUP(keysc_in, 7),
+	BUS_DATA_PIN_GROUP(keysc_in, 8),
 	SH_PFC_PIN_GROUP(keysc_out04),
 	SH_PFC_PIN_GROUP(keysc_out5),
 	SH_PFC_PIN_GROUP(keysc_out6_0),
-- 
2.25.1

