Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEBA47E4A9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhLWOmS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348871AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF8CC06175B
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by michel.telenet-ops.be with bizsmtp
        id ZqiD260071rdBcm06qiDag; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a91-ON; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIJ-003rZ7-WE; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/60] pinctrl: renesas: emev2: Share CF pin group data
Date:   Thu, 23 Dec 2021 15:41:18 +0100
Message-Id: <370d823be136cc9ead7051915a1454252a57efc4.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group cf_data8 is a subset of cf_data16.

This reduces kernel size by 64 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-emev2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index 6c66fc335d2f7f2d..30d08a4405e397e1 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -749,23 +749,14 @@ static const unsigned int cf_ctrl_mux[] = {
 	CF_CDB2_MARK,
 };
 
-static const unsigned int cf_data8_pins[] = {
-	/* CF_D[0:7] */
-	77, 78, 79, 80,
-	81, 82, 83, 84,
-};
-static const unsigned int cf_data8_mux[] = {
-	CF_D00_MARK, CF_D01_MARK, CF_D02_MARK, CF_D03_MARK,
-	CF_D04_MARK, CF_D05_MARK, CF_D06_MARK, CF_D07_MARK,
-};
-static const unsigned int cf_data16_pins[] = {
+static const unsigned int cf_data_pins[] = {
 	/* CF_D[0:15] */
 	77, 78, 79, 80,
 	81, 82, 83, 84,
 	85, 86, 87, 88,
 	89, 90, 91, 92,
 };
-static const unsigned int cf_data16_mux[] = {
+static const unsigned int cf_data_mux[] = {
 	CF_D00_MARK, CF_D01_MARK, CF_D02_MARK, CF_D03_MARK,
 	CF_D04_MARK, CF_D05_MARK, CF_D06_MARK, CF_D07_MARK,
 	CF_D08_MARK, CF_D09_MARK, CF_D10_MARK, CF_D11_MARK,
@@ -1131,8 +1122,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(cam),
 
 	SH_PFC_PIN_GROUP(cf_ctrl),
-	SH_PFC_PIN_GROUP(cf_data8),
-	SH_PFC_PIN_GROUP(cf_data16),
+	BUS_DATA_PIN_GROUP(cf_data, 8),
+	BUS_DATA_PIN_GROUP(cf_data, 16),
 
 	SH_PFC_PIN_GROUP(dtv_a),
 	SH_PFC_PIN_GROUP(dtv_b),
-- 
2.25.1

