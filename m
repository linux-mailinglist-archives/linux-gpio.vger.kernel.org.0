Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED631F35DA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 10:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFIIIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 04:08:46 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35563 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgFIIIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 04:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591690119; x=1623226119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8mLLYk0uqZ0EEHZBr4fBGxsB72v7sutGB5vvE2ygR9s=;
  b=0ljB9oFEwZuMGjcgiQjwvJ2/ikiy7lnQBLgPCmL3sMmGD7PV0oWMeBPa
   3csptAdTZATpUeg6Z3RwTjWI1WD+5WlCvOQQyBYHF8r8Lhp4pCXP7opov
   iK6kbnkKVQgGC785+OGeK3UGfgCh+ntTfVZjOR6OEhgAbO3MvX8NjsOBc
   EreXMjOU1AasvMRkta2gJYnDywboRMkGlOUiuIzE6jtgkdSqaKTFSZgXE
   D+y/xAx/vemv9EmEJrgZLCiubt2TyKTMHea9VGaOrOX1Zgc17aWCGqmjU
   JBd4fWUpljRMIdMpO9HRv6UiWZb1sgqFxvfMNv13vbIrDdUxtcph/1JZ+
   w==;
IronPort-SDR: fip+a2Jl4EFpakUOYuo/couh6s4iVqnMDrBPzOuJ4eeE7pkSGcUxRnMCGQLHtIhqRHy3ex0gia
 pFxUqSqjJhSu/wMsWqQ+4PZkflSLFtKpomdGbPUYayvkRMsipj+pst8IFM5IaQjiL8W+X/zZBW
 A9uc2vuZ9Imm8Ae7lwdIt2r7Fc3EKw4RJjdzPG7GNsShBCUHIq/6truWBjvyJJUXnSOPMhAeuf
 vCwdTRGGfZdrNasVm2Vt+m4bxos8J14dOFFW10o25EtR/p2FTJdP2QSjhxCbMD9f3HId2SDMnD
 0u4=
X-IronPort-AV: E=Sophos;i="5.73,491,1583218800"; 
   d="scan'208";a="79412866"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2020 01:08:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 9 Jun 2020 01:08:38 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Tue, 9 Jun 2020 01:08:35 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 09/10] arm64: dts: sparx5: Add Sparx5 SoC DPLL clock
Date:   Tue, 9 Jun 2020 10:07:08 +0200
Message-ID: <20200609080709.9654-9-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609080709.9654-1-lars.povlsen@microchip.com>
References: <20200608123024.5330-1-lars.povlsen@microchip.com>
 <20200609080709.9654-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a DPLL clock to the Sparx5 SoC. It is used to generate clock
to misc peripherals, specifically the SDHCI/eMMC controller.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi | 37 ++++++++++++++---------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index baf4176ce1dfe..d4d7f9ce627bc 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -72,20 +72,29 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};

-	clocks: clocks {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-		ahb_clk: ahb-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <250000000>;
-		};
-		sys_clk: sys-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <625000000>;
-		};
+	lcpll_clk: lcpll-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <2500000000>;
+	};
+
+	clks: clock-controller@61110000c {
+		compatible = "microchip,sparx5-dpll";
+		#clock-cells = <1>;
+		clocks = <&lcpll_clk>;
+		reg = <0x6 0x1110000c 0x24>;
+	};
+
+	ahb_clk: ahb-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;
+	};
+
+	sys_clk: sys-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <625000000>;
 	};

 	axi: axi@600000000 {
--
2.27.0
