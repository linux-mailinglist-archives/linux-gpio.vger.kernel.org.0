Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BF83D16F3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 21:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbhGUSfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 14:35:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8146 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239580AbhGUSfm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 14:35:42 -0400
X-IronPort-AV: E=Sophos;i="5.84,258,1620658800"; 
   d="scan'208";a="88348864"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jul 2021 04:16:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 750A4400D0FA;
        Thu, 22 Jul 2021 04:16:15 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a07g044: Add pinctrl node
Date:   Wed, 21 Jul 2021 20:15:57 +0100
Message-Id: <20210721191558.22484-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO/pinctrl node to R9A07G044 (RZ/G2L) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 01482d227506..17afb4bb6261 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -111,6 +111,19 @@
 			status = "disabled";
 		};
 
+		pinctrl: pin-controller@11030000 {
+			compatible = "renesas,r9a07g044-pinctrl";
+			reg = <0 0x11030000 0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 392>;
+			clocks = <&cpg CPG_MOD R9A07G044_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_GPIO_RSTN>,
+				 <&cpg R9A07G044_GPIO_PORT_RESETN>,
+				 <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

