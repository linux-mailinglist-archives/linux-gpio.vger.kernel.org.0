Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76EE224143
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 19:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgGQRAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 13:00:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21061 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726938AbgGQRAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 13:00:32 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52419821"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jul 2020 02:00:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9500D40061A0;
        Sat, 18 Jul 2020 02:00:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
Date:   Fri, 17 Jul 2020 18:00:24 +0100
Message-Id: <1595005225-11519-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add USB1 PWEN pin and group for USB1 interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index f524401fec5f..39ba1e7cc1c3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -3611,6 +3611,13 @@ static const unsigned int usb1_pins[] = {
 static const unsigned int usb1_mux[] = {
 	USB1_PWEN_MARK, USB1_OVC_MARK,
 };
+static const unsigned int usb1_pwen_pins[] = {
+	/* PWEN */
+	RCAR_GP_PIN(5, 20),
+};
+static const unsigned int usb1_pwen_mux[] = {
+	USB1_PWEN_MARK,
+};
 /* - USB2 ------------------------------------------------------------------- */
 static const unsigned int usb2_pins[] = {
 	/* PWEN, OVC */
@@ -3939,7 +3946,7 @@ static const unsigned int vin3_clk_mux[] = {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[289];
+	struct sh_pfc_pin_group common[290];
 	struct sh_pfc_pin_group automotive[1];
 } pinmux_groups = {
 	.common = {
@@ -4193,6 +4200,7 @@ static const struct {
 		SH_PFC_PIN_GROUP(usb0),
 		SH_PFC_PIN_GROUP(usb0_ovc_vbus),
 		SH_PFC_PIN_GROUP(usb1),
+		SH_PFC_PIN_GROUP(usb1_pwen),
 		SH_PFC_PIN_GROUP(usb2),
 		VIN_DATA_PIN_GROUP(vin0_data, 24),
 		VIN_DATA_PIN_GROUP(vin0_data, 20),
@@ -4640,6 +4648,7 @@ static const char * const usb0_groups[] = {
 
 static const char * const usb1_groups[] = {
 	"usb1",
+	"usb1_pwen",
 };
 
 static const char * const usb2_groups[] = {
-- 
2.17.1

