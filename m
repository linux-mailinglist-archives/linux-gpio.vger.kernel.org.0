Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C290A2D4462
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732847AbgLIO3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:29:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13758 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730096AbgLIO3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607524191; x=1639060191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mS54WkIx0/Otie3EKGgQJvF/hN9NwPNndxKOsMXjpRI=;
  b=SuVGH+rwXjwvZRMedz1UR1FkSlOuji68KPu9zD/GPdL1DrwX2KSJ18+3
   4waun2Id5luQ6x7pWdsloYy7duwZVLqyMo14w/esf3SLHg3VyPKI/N0n+
   /XUx+Xmqmdr+UuLWwNrEppmmQYfPGkBwvIqphL9H9iSOD3y205S09og/j
   h7uX5LuncNBWjEf7Fih0iEtHgIlfYHHGjUSi4IWLTdsNH78FvkmcfJTpc
   eDFle8meoh83EvTSeLEkiTia/t0Ab97nIQlU8bmEWp8baBHUubsc/OtTA
   Wbtyt0vgnoscr/8Gw5X5zDEHrpNUgxHrNC46+zooCZ8bim51V8MDLQrfa
   g==;
IronPort-SDR: POpRHDGbTGiQBzzOtUaSd/N4rYawl+pre6aYmBSoYhsA/vYp5d4/1Qnm5wuxp4rFIJzgLl+BM/
 xCttMzV+G0nh0wu1xobUF5Tvb0MmalWN8Ockm4BEoZeDNUSDJdZy9tYj0IEDbPmigxSDAsUQGb
 IJsLPG6oEsqzCNiRQL6frfae3fBJLOEkV/JwNkDJIG+pKfeYRrdN/bAZUerysJnBLAzle+evFR
 eBkIDroYOJgRDewuoHxKVw/QGW7Q/FfBmOT99KlnyMdfx2BwRsCARZqAbbDfu0o7X9piRQeQC6
 K/Q=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="101529705"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2020 07:28:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 07:28:34 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 07:28:32 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH -next 3/3] arm64: dts: sparx5: Add SGPIO irq support
Date:   Wed, 9 Dec 2020 15:27:53 +0100
Message-ID: <20201209142753.683208-4-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209142753.683208-1-lars.povlsen@microchip.com>
References: <20201209142753.683208-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This enables irq support for the SGPIO input banks, allowing SGPIO
control signals to generate interrupts based on the signal state.

This f.ex. allows the SFP driver to avoid polling of module detect, tx
fault, loss of signal etc. control signals that may be connected via
the SGPIO controller.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 3bb4755e9f87..044063a9beae 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -277,13 +277,16 @@ sgpio0: gpio@61101036c {
 			clocks = <&sys_clk>;
 			pinctrl-0 = <&sgpio0_pins>;
 			pinctrl-names = "default";
-			reg = <0x6 0x1101036c 0x100>;
+			reg = <0x6 0x1101036c 0x118>;
 			sgpio_in0: gpio@0 {
 				compatible = "microchip,sparx5-sgpio-bank";
 				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <3>;
 				ngpios = <96>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
 			};
 			sgpio_out0: gpio@1 {
 				compatible = "microchip,sparx5-sgpio-bank";
@@ -309,6 +312,9 @@ sgpio_in1: gpio@0 {
 				gpio-controller;
 				#gpio-cells = <3>;
 				ngpios = <96>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
 			};
 			sgpio_out1: gpio@1 {
 				compatible = "microchip,sparx5-sgpio-bank";
@@ -334,6 +340,9 @@ sgpio_in2: gpio@0 {
 				gpio-controller;
 				#gpio-cells = <3>;
 				ngpios = <96>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
 			};
 			sgpio_out2: gpio@1 {
 				compatible = "microchip,sparx5-sgpio-bank";
-- 
2.25.1

