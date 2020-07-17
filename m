Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018F622413D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 19:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgGQRAf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 13:00:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:46867 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727926AbgGQRAf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 13:00:35 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52419826"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jul 2020 02:00:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0CC8B40061A0;
        Sat, 18 Jul 2020 02:00:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and xHCI
Date:   Fri, 17 Jul 2020 18:00:25 +0100
Message-Id: <1595005225-11519-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1595005225-11519-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable support for HSUSB, USB2.0 and xHCI on iWave RZ/G1H carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index e90aaf1c94f0..f4910e709b87 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -131,6 +131,30 @@
 	};
 };
 
+&hsusb {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pci0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	/* Disable hsusb to enable USB2.0 host mode support on J2 */
+	/* status = "okay"; */
+};
+
+&pci1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pci2 {
+	/* Disable xhci to enable USB2.0 host mode support on J23 bottom port */
+	/* status = "okay"; */
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii";
@@ -168,6 +192,16 @@
 		groups = "ssi34_ctrl", "ssi3_data", "ssi4_data";
 		function = "ssi";
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		groups = "usb1_pwen";
+		function = "usb1";
+	};
 };
 
 &rcar_sound {
@@ -222,3 +256,11 @@
 &ssi4 {
 	shared-pin;
 };
+
+&usbphy {
+	status = "okay";
+};
+
+&xhci {
+	status = "okay";
+};
-- 
2.17.1

