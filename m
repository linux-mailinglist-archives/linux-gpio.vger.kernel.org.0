Return-Path: <linux-gpio+bounces-8361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE58939FF2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A4E282CB7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48F31514D3;
	Tue, 23 Jul 2024 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zwHqgf9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC401514C0;
	Tue, 23 Jul 2024 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734131; cv=none; b=Y76TGB7H0voAH3apf7xJn7lsfbz8NyZcWpu0DjTzTIHWmP/a1JIsxbEcWDCFvisURZMfVBhtLsNm3eeZgHARW1skmmsf6VnvyXxH+edcJhZseaRDQQFPEl+DgEPwOxHsM3Es0juMp2/SDSOOErLhalLCn/3WOQZ5it4CtP/+7YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734131; c=relaxed/simple;
	bh=0BnMHbAdBH79ScPTvVNbtezh5vCswpZdpOoIuQ4RzEE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSDdu6EoZ+OOPt8bbgqdUEVZp281HDhRLJ1M1HQjOX2zBB/4ghneenSMW0fP+c3zrnoIPnAT1YHyqKQV71zrHZHUoEttyeW+fTpIsVZB/hE/ihLHxTFfEBWClfgUr0/KRF1RFNln/eKl0QrhIJbkDn150xDABBFAyn+/K/2led8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zwHqgf9u; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734130; x=1753270130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BnMHbAdBH79ScPTvVNbtezh5vCswpZdpOoIuQ4RzEE=;
  b=zwHqgf9uOef8BKZyrBzU/K8FQIGXKQJrbpc7OhPviiHxitbc/RNIRdgS
   9Yqw6K1QIVowthpM4Ua7NfR9tofhOo3n842gEENEIbmTL7HRYQ8Cj5ZtY
   dOXFBafC8OGoG55j30OdHpphrYUYprRRtyBABKvv03lvDxghKMQ3D7VYr
   5frVuEbz0U3lCewOPJVPC3iXnhfNQFZUlN/SIzZBRKNZLgIVJLqzPpfAn
   3sWDHiUW7YTrzR9aUENfxsgnOUlZ6XL8KhylWg/umM1Ip4ZzIo2CycB9m
   vxlX3niAGEmGQtjmldcw336OxvyUCXXaWv2JzQEWQRWYzlozcVmwWglqL
   A==;
X-CSE-ConnectionGUID: ogbmHU+kQ5yxZ4OX2mUEtQ==
X-CSE-MsgGUID: Y70jeUQRQ8adVIWl7jhXaw==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574987"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:24 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 6/6] riscv: dts: microchip: update gpio interrupts to better match the SoC
Date: Tue, 23 Jul 2024 12:27:15 +0100
Message-ID: <20240723-framing-chaos-9f8e2df8889d@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0BnMHbAdBH79ScPTvVNbtezh5vCswpZdpOoIuQ4RzEE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ0+c/rLzj6Ppc85Px9Je/mcOm3vjiVrjRbV1iqs22S4J sjB901HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJcJYw/C/J9V7+K11BZNH0Rcf1vT czOGzLV//19JlVpFygvVjf13BGhpOWzN8z95a/mrlzou3PjANBLCaiLZLJzdY+MxdZxjTo8AEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There are 3 GPIO controllers on this SoC, of which:
- GPIO controller 0 has 14 GPIOs
- GPIO controller 1 has 24 GPIOs
- GPIO controller 2 has 32 GPIOs

All GPIOs are capable of generating interrupts, for a total of 70.
There are only 41 IRQs available however, so a configurable mux is used to
ensure all GPIOs can be used for interrupt generation.
38 of the 41 interrupts are in what the documentation calls "direct mode",
as they provide an exclusive connection from a GPIO to the PLIC.
The 3 remaining interrupts are used to mux the interrupts which do not have
a exclusive connection, one for each GPIO controller.
Setting of the mux should be done by the platform's firmware at boot, based
on the output of the "MSS Configurator" (FPGA configuration tool).

The microchip,mpfs-gpio binding suffered greatly due to being written
with a narrow minded view of the controller, and the interrupt bits
ended up incorrect. It was mistakenly assumed that the interrupt
configuration was set by platform firmware, based on the FPGA
configuration, and that the GPIO DT nodes were the only way to really
communicate interrupt configuration to software.

Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, fix the inaccurate description
of the interrupt controller hierarchy.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  8 ---
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 50 +++++++++++++++++--
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f80df225f72b4..7a9822d2a8819 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -83,14 +83,6 @@ &core_pwm0 {
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c50..e31e0aacb943b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -465,39 +465,79 @@ mac1: ethernet@20112000 {
 			status = "disabled";
 		};
 
-		gpio0: gpio@20120000 {
-			compatible = "microchip,mpfs-gpio";
-			reg = <0x0 0x20120000 0x0 0x1000>;
+		irqmux: interrupt-controller@20002054 {
+			compatible = "microchip,mpfs-gpio-irq-mux";
+			reg = <0x0 0x20002054 0x0 0x4>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <13>, <14>, <15>, <16>,
+				     <17>, <18>, <19>, <20>,
+				     <21>, <22>, <23>, <24>,
+				     <25>, <26>, <27>, <28>,
+				     <29>, <30>, <31>, <32>,
+				     <33>, <34>, <35>, <36>,
+				     <37>, <38>, <39>, <40>,
+				     <41>, <42>, <43>, <44>,
+				     <45>, <46>, <47>, <48>,
+				     <49>, <50>, <51>, <52>,
+				     <53>;
+		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			interrupt-parent = <&irqmux>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupts = <0>, <1>, <2>, <3>,
+				     <4>, <5>, <6>, <7>,
+				     <8>, <9>, <10>, <11>,
+				     <12>, <13>;
 			clocks = <&clkcfg CLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <14>;
 			status = "disabled";
 		};
 
 		gpio1: gpio@20121000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20121000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <32>, <33>, <34>, <35>,
+				     <36>, <37>, <38>, <39>,
+				     <40>, <41>, <42>, <43>,
+				     <44>, <45>, <46>, <47>,
+				     <48>, <49>, <50>, <51>,
+				     <52>, <53>, <54>, <55>;
 			clocks = <&clkcfg CLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <24>;
 			status = "disabled";
 		};
 
 		gpio2: gpio@20122000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20122000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <64>, <65>, <66>, <67>,
+				     <68>, <69>, <70>, <71>,
+				     <72>, <73>, <74>, <75>,
+				     <76>, <77>, <78>, <79>,
+				     <80>, <81>, <82>, <83>,
+				     <84>, <85>, <86>, <87>,
+				     <88>, <89>, <90>, <91>,
+				     <92>, <93>, <94>, <95>;
 			clocks = <&clkcfg CLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <32>;
 			status = "disabled";
 		};
 
-- 
2.43.2


