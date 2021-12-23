Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADF847E4E4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348922AbhLWOma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348929AbhLWOmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBB5C061375
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:17 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by andre.telenet-ops.be with bizsmtp
        id ZqiF2600B1rdBcm01qiFQB; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9K-LO; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003riL-IZ; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 54/60] pinctrl: renesas: emev2: Share SDI pin group data
Date:   Thu, 23 Dec 2021 15:42:04 +0100
Message-Id: <0f35f01666748217b93c2debc0098f9442061a1a.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups sdi0_data[14] are subsets of sdi0_data8.
Pin groups sdi[12]_data1 are subsets of sdi[12]_data4.

This reduces kernel size by 56 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-emev2.c | 54 +++++++----------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index 30d08a4405e397e1..2326d348447d4123 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -886,26 +886,12 @@ static const unsigned int sdi0_ctrl_mux[] = {
 	SDI0_CKO_MARK, SDI0_CKI_MARK, SDI0_CMD_MARK,
 };
 
-static const unsigned int sdi0_data1_pins[] = {
-	/* SDI0_DATA[0] */
-	53,
-};
-static const unsigned int sdi0_data1_mux[] = {
-	SDI0_DATA0_MARK,
-};
-static const unsigned int sdi0_data4_pins[] = {
-	/* SDI0_DATA[0:3] */
-	53, 54, 55, 56,
-};
-static const unsigned int sdi0_data4_mux[] = {
-	SDI0_DATA0_MARK, SDI0_DATA1_MARK, SDI0_DATA2_MARK, SDI0_DATA3_MARK,
-};
-static const unsigned int sdi0_data8_pins[] = {
+static const unsigned int sdi0_data_pins[] = {
 	/* SDI0_DATA[0:7] */
 	53, 54, 55, 56,
 	57, 58, 59, 60
 };
-static const unsigned int sdi0_data8_mux[] = {
+static const unsigned int sdi0_data_mux[] = {
 	SDI0_DATA0_MARK, SDI0_DATA1_MARK, SDI0_DATA2_MARK, SDI0_DATA3_MARK,
 	SDI0_DATA4_MARK, SDI0_DATA5_MARK, SDI0_DATA6_MARK, SDI0_DATA7_MARK,
 };
@@ -919,18 +905,11 @@ static const unsigned int sdi1_ctrl_mux[] = {
 	SDI1_CKO_MARK, SDI1_CKI_MARK, SDI1_CMD_MARK,
 };
 
-static const unsigned int sdi1_data1_pins[] = {
-	/* SDI1_DATA[0] */
-	64,
-};
-static const unsigned int sdi1_data1_mux[] = {
-	SDI1_DATA0_MARK,
-};
-static const unsigned int sdi1_data4_pins[] = {
+static const unsigned int sdi1_data_pins[] = {
 	/* SDI1_DATA[0:3] */
 	64, 65, 66, 67,
 };
-static const unsigned int sdi1_data4_mux[] = {
+static const unsigned int sdi1_data_mux[] = {
 	SDI1_DATA0_MARK, SDI1_DATA1_MARK, SDI1_DATA2_MARK, SDI1_DATA3_MARK,
 };
 
@@ -943,18 +922,11 @@ static const unsigned int sdi2_ctrl_mux[] = {
 	SDI2_CKO_MARK, SDI2_CKI_MARK, SDI2_CMD_MARK,
 };
 
-static const unsigned int sdi2_data1_pins[] = {
-	/* SDI2_DATA[0] */
-	89,
-};
-static const unsigned int sdi2_data1_mux[] = {
-	SDI2_DATA0_MARK,
-};
-static const unsigned int sdi2_data4_pins[] = {
+static const unsigned int sdi2_data_pins[] = {
 	/* SDI2_DATA[0:3] */
 	89, 90, 91, 92,
 };
-static const unsigned int sdi2_data4_mux[] = {
+static const unsigned int sdi2_data_mux[] = {
 	SDI2_DATA0_MARK, SDI2_DATA1_MARK, SDI2_DATA2_MARK, SDI2_DATA3_MARK,
 };
 
@@ -1152,17 +1124,17 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(sd_cki),
 
 	SH_PFC_PIN_GROUP(sdi0_ctrl),
-	SH_PFC_PIN_GROUP(sdi0_data1),
-	SH_PFC_PIN_GROUP(sdi0_data4),
-	SH_PFC_PIN_GROUP(sdi0_data8),
+	BUS_DATA_PIN_GROUP(sdi0_data, 1),
+	BUS_DATA_PIN_GROUP(sdi0_data, 4),
+	BUS_DATA_PIN_GROUP(sdi0_data, 8),
 
 	SH_PFC_PIN_GROUP(sdi1_ctrl),
-	SH_PFC_PIN_GROUP(sdi1_data1),
-	SH_PFC_PIN_GROUP(sdi1_data4),
+	BUS_DATA_PIN_GROUP(sdi1_data, 1),
+	BUS_DATA_PIN_GROUP(sdi1_data, 4),
 
 	SH_PFC_PIN_GROUP(sdi2_ctrl),
-	SH_PFC_PIN_GROUP(sdi2_data1),
-	SH_PFC_PIN_GROUP(sdi2_data4),
+	BUS_DATA_PIN_GROUP(sdi2_data, 1),
+	BUS_DATA_PIN_GROUP(sdi2_data, 4),
 
 	SH_PFC_PIN_GROUP(tp33),
 
-- 
2.25.1

