Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1173C63F4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 21:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbhGLTrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 15:47:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53010 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236437AbhGLTrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jul 2021 15:47:40 -0400
X-IronPort-AV: E=Sophos;i="5.84,234,1620658800"; 
   d="scan'208";a="87419173"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jul 2021 04:44:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88CE440E0116;
        Tue, 13 Jul 2021 04:44:47 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
Date:   Mon, 12 Jul 2021 20:44:22 +0100
Message-Id: <20210712194422.12405-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add scif0 pins in pinctrl node and update the scif0 node
to include pinctrl property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index adcd4f50519e..0987163f25ee 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 / {
 	aliases {
@@ -22,6 +23,15 @@
 	clock-frequency = <24000000>;
 };
 
+&pinctrl {
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
+	};
+};
+
 &scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.17.1

