Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EBA47E508
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236856AbhLWOmj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348942AbhLWOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:20 -0500
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85243C06175C
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:19 -0800 (PST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4JKXw72kVCzMqbJ8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 15:42:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiF2600F1rdBcm01qiFN9; Thu, 23 Dec 2021 15:42:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIM-006aCk-GY; Thu, 23 Dec 2021 15:42:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-003rio-Jb; Thu, 23 Dec 2021 15:42:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 55/60] pinctrl: renesas: r8a7790: Share USB1 pin group data
Date:   Thu, 23 Dec 2021 15:42:05 +0100
Message-Id: <b9f37cf00064293b4b6f9068bda8c1ab819090f5.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin group usb0_ovc_vbus is a subset of usb0.
Pin group usb1_pwen is a subset of usb1.

This reduces kernel size by 16 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7790.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7790.c b/drivers/pinctrl/renesas/pfc-r8a7790.c
index d8f99f0843d6a301..26a696b5335c184d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7790.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7790.c
@@ -3609,18 +3609,11 @@ static const unsigned int tpu0_to3_mux[] = {
 };
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
-	/* PWEN, OVC/VBUS */
-	RCAR_GP_PIN(5, 18), RCAR_GP_PIN(5, 19),
+	/* OVC/VBUS, PWEN */
+	RCAR_GP_PIN(5, 19), RCAR_GP_PIN(5, 18),
 };
 static const unsigned int usb0_mux[] = {
-	USB0_PWEN_MARK, USB0_OVC_VBUS_MARK,
-};
-static const unsigned int usb0_ovc_vbus_pins[] = {
-	/* OVC/VBUS */
-	RCAR_GP_PIN(5, 19),
-};
-static const unsigned int usb0_ovc_vbus_mux[] = {
-	USB0_OVC_VBUS_MARK,
+	USB0_OVC_VBUS_MARK, USB0_PWEN_MARK,
 };
 /* - USB1 ------------------------------------------------------------------- */
 static const unsigned int usb1_pins[] = {
@@ -3630,13 +3623,6 @@ static const unsigned int usb1_pins[] = {
 static const unsigned int usb1_mux[] = {
 	USB1_PWEN_MARK, USB1_OVC_MARK,
 };
-static const unsigned int usb1_pwen_pins[] = {
-	/* PWEN */
-	RCAR_GP_PIN(5, 20),
-};
-static const unsigned int usb1_pwen_mux[] = {
-	USB1_PWEN_MARK,
-};
 /* - USB2 ------------------------------------------------------------------- */
 static const unsigned int usb2_pins[] = {
 	/* PWEN, OVC */
@@ -4315,9 +4301,9 @@ static const struct {
 		SH_PFC_PIN_GROUP(tpu0_to2),
 		SH_PFC_PIN_GROUP(tpu0_to3),
 		SH_PFC_PIN_GROUP(usb0),
-		SH_PFC_PIN_GROUP(usb0_ovc_vbus),
+		SH_PFC_PIN_GROUP_SUBSET(usb0_ovc_vbus, usb0, 0, 1),
 		SH_PFC_PIN_GROUP(usb1),
-		SH_PFC_PIN_GROUP(usb1_pwen),
+		SH_PFC_PIN_GROUP_SUBSET(usb1_pwen, usb1, 0, 1),
 		SH_PFC_PIN_GROUP(usb2),
 		BUS_DATA_PIN_GROUP(vin0_data, 24),
 		BUS_DATA_PIN_GROUP(vin0_data, 20),
-- 
2.25.1

