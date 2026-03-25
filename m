Return-Path: <linux-gpio+bounces-34157-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIPmOAT5w2klvQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34157-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 16:02:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E0327668
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 16:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 984A330A2BD2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBD33EB7E3;
	Wed, 25 Mar 2026 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sSLi+gDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA463E557B;
	Wed, 25 Mar 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449752; cv=none; b=V8zHhXU6ZFgE8vWKUdIdYt8vxhwOZTnfCdI3g8Kp3HiSD9xAez6opkmoII+d7nkPudvSfzgbgQYmxC1XvV7bG0RAW5iPESLvlQTHfQUMEvmmFfOPgXJ9/bp/n/3XWkSsWLFxZpfr3lg2W5+AocaTvj1gK5ViXvAfJd9cM77xZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449752; c=relaxed/simple;
	bh=/I/gBBSQjoZsOjIL0B+Qyl0IZTqk8YHRpzEsG7bIEWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWZhuvdJEhk/pjzebqgtGzYEf0GaTVvesxPM6EtMri3tIDA/ycr7/65apBUjBfutIYBFLcEcqi2+bLYOOz+NUzbvvwQ72xVoUynzNAog+bwCiqEE2Qh2LUtmEgEFKex8zOiE3jdERq/G/YY7Ln1Teg0M4T6EcYeav8QbdEWDMwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sSLi+gDn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98AE8C580B1;
	Wed, 25 Mar 2026 14:42:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD63D601E2;
	Wed, 25 Mar 2026 14:42:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7054910451417;
	Wed, 25 Mar 2026 15:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774449745; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yHQfhazYClBqFiWTBjKI2wJ8nGAA1W+1s1WNH3rEj08=;
	b=sSLi+gDngKhTCb3YbcmUiWbH3av4+qM9w25P1wNQ2+ZNTZDJDrQb16tU6NC3qDQvoP/B5p
	mrkZ/HdKSC3o2WNNqAGRtkxGDRLPYmMdm5ITEtoOOmonZnTH5DANIhpjRAjJhEVnMpal1F
	nOJi2AsHbEz2dSCDp0YHjMjWxAPWFca2GrhsxRXJVVLlyP47Gm+0gmV4E3XAaXdZmAFVSu
	WhobF2tbjCCdyJXDj/ANT1yl2i8YjDCmExGB85INBy26P+opFcWZL/Zdkxl8R5Pf1qx+Fy
	MUeFQVqLPz4V2siBhPKTcgCyegOhp5RWpivj5cyYdJkaL39M6cp109pgCWuNFA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 21/27] misc: lan966x_pci: Split dtso in dtsi/dtso
Date: Wed, 25 Mar 2026 15:35:48 +0100
Message-ID: <20260325143555.451852-22-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325143555.451852-1-herve.codina@bootlin.com>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,bootlin.com,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com];
	TAGGED_FROM(0.00)[bounces-34157-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[63];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 595E0327668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The lan966x_pci.dtso file contains descriptions related to both the
LAN966x PCI device chip and the LAN966x PCI device board where the chip
is soldered.

Split the file in order to have:
  - lan966x_pci.dtsi
    The description related to the PCI chip.

  - lan966x_pci.dtso
    The description of the PCI board.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS                   |   1 +
 drivers/misc/lan966x_pci.dtsi | 130 +++++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtso | 175 +++++++---------------------------
 3 files changed, 166 insertions(+), 140 deletions(-)
 create mode 100644 drivers/misc/lan966x_pci.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..441fe74e7ef7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17305,6 +17305,7 @@ MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
 F:	drivers/misc/lan966x_pci.c
+F:	drivers/misc/lan966x_pci.dtsi
 F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
new file mode 100644
index 000000000000..170298084fa5
--- /dev/null
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Microchip UNG
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+cpu_clk: clock-600000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;  /* CPU clock = 600MHz */
+};
+
+ddr_clk: clock-30000000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
+};
+
+sys_clk: clock-15625000 {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <15625000>;  /* System clock = 15.625MHz */
+};
+
+pci-ep-bus@0 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * map @0xe2000000 (32MB) to BAR0 (CPU)
+	 * map @0xe0000000 (16MB) to BAR1 (AMBA)
+	 */
+	ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
+		  0xe0000000 0x01 0x00 0x00 0x1000000>;
+
+	switch: switch@e0000000 {
+		compatible = "microchip,lan966x-switch";
+		reg = <0xe0000000 0x0100000>,
+		      <0xe2000000 0x0800000>;
+		reg-names = "cpu", "gcb";
+		interrupt-parent = <&oic>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+			     <9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "xtr", "ana";
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port0: port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port1: port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+		};
+	};
+
+	cpu_ctrl: syscon@e00c0000 {
+		compatible = "microchip,lan966x-cpu-syscon", "syscon";
+		reg = <0xe00c0000 0xa8>;
+	};
+
+	oic: oic@e00c0120 {
+		compatible = "microchip,lan966x-oic";
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>; /* PCI INTx assigned interrupt */
+		reg = <0xe00c0120 0x190>;
+	};
+
+	reset: reset@e200400c {
+		compatible = "microchip,lan966x-switch-reset";
+		reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
+		reg-names = "gcb","cpu";
+		#reset-cells = <1>;
+		cpu-syscon = <&cpu_ctrl>;
+	};
+
+	gpio: pinctrl@e2004064 {
+		compatible = "microchip,lan966x-pinctrl";
+		reg = <0xe2004064 0xb4>,
+		      <0xe2010024 0x138>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&gpio 0 0 78>;
+		interrupt-parent = <&oic>;
+		interrupt-controller;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <2>;
+	};
+
+	mdio1: mdio@e200413c {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "microchip,lan966x-miim";
+		reg = <0xe200413c 0x24>,
+		      <0xe2010020 0x4>;
+		resets = <&reset 0>;
+		reset-names = "switch";
+		status = "disabled";
+
+		lan966x_phy0: ethernet-lan966x_phy@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		lan966x_phy1: ethernet-lan966x_phy@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+	};
+
+	serdes: serdes@e202c000 {
+		compatible = "microchip,lan966x-serdes";
+		reg = <0xe202c000 0x9c>,
+		      <0xe2004010 0x4>;
+		#phy-cells = <2>;
+	};
+};
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 94a967b384f3..3ad50abee72d 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -3,10 +3,7 @@
  * Copyright (C) 2022 Microchip UNG
  */
 
-#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -29,148 +26,46 @@ __overlay__ {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			cpu_clk: clock-600000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <600000000>;  /* CPU clock = 600MHz */
-			};
-
-			ddr_clk: clock-30000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <30000000>;  /* Fabric clock = 30MHz */
-			};
-
-			sys_clk: clock-15625000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <15625000>;  /* System clock = 15.625MHz */
-			};
-
-			pci-ep-bus@0 {
-				compatible = "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-
-				/*
-				 * map @0xe2000000 (32MB) to BAR0 (CPU)
-				 * map @0xe0000000 (16MB) to BAR1 (AMBA)
-				 */
-				ranges = <0xe2000000 0x00 0x00 0x00 0x2000000
-				          0xe0000000 0x01 0x00 0x00 0x1000000>;
-
-				switch: switch@e0000000 {
-					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
-					      <0xe2000000 0x0800000>;
-					reg-names = "cpu", "gcb";
-
-					interrupt-parent = <&oic>;
-					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
-						     <9 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "xtr", "ana";
-
-					resets = <&reset 0>;
-					reset-names = "switch";
-
-					pinctrl-names = "default";
-					pinctrl-0 = <&tod_pins>;
-
-					ethernet-ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
-
-						port0: port@0 {
-							phy-handle = <&lan966x_phy0>;
-
-							reg = <0>;
-							phy-mode = "gmii";
-							phys = <&serdes 0 CU(0)>;
-						};
-
-						port1: port@1 {
-							phy-handle = <&lan966x_phy1>;
-
-							reg = <1>;
-							phy-mode = "gmii";
-							phys = <&serdes 1 CU(1)>;
-						};
-					};
-				};
-
-				cpu_ctrl: syscon@e00c0000 {
-					compatible = "microchip,lan966x-cpu-syscon", "syscon";
-					reg = <0xe00c0000 0xa8>;
-				};
-
-				oic: oic@e00c0120 {
-					compatible = "microchip,lan966x-oic";
-					#interrupt-cells = <2>;
-					interrupt-controller;
-					interrupts = <0>; /* PCI INTx assigned interrupt */
-					reg = <0xe00c0120 0x190>;
-				};
-
-				reset: reset@e200400c {
-					compatible = "microchip,lan966x-switch-reset";
-					reg = <0xe200400c 0x4>, <0xe00c0000 0xa8>;
-					reg-names = "gcb","cpu";
-					#reset-cells = <1>;
-					cpu-syscon = <&cpu_ctrl>;
-				};
-
-				gpio: pinctrl@e2004064 {
-					compatible = "microchip,lan966x-pinctrl";
-					reg = <0xe2004064 0xb4>,
-					      <0xe2010024 0x138>;
-					resets = <&reset 0>;
-					reset-names = "switch";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&gpio 0 0 78>;
-					interrupt-parent = <&oic>;
-					interrupt-controller;
-					interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
-					#interrupt-cells = <2>;
+			#include "lan966x_pci.dtsi"
+		};
+	};
+};
 
-					tod_pins: tod_pins {
-						pins = "GPIO_36";
-						function = "ptpsync_1";
-					};
+&gpio {
+	tod_pins: tod_pins {
+		pins = "GPIO_36";
+		function = "ptpsync_1";
+	};
+};
 
-					fc0_a_pins: fcb4-i2c-pins {
-						/* RXD, TXD */
-						pins = "GPIO_9", "GPIO_10";
-						function = "fc0_a";
-					};
-				};
+&lan966x_phy0 {
+	status = "okay";
+};
 
-				mdio1: mdio@e200413c {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					compatible = "microchip,lan966x-miim";
-					reg = <0xe200413c 0x24>,
-					      <0xe2010020 0x4>;
+&lan966x_phy1 {
+	status = "okay";
+};
 
-					resets = <&reset 0>;
-					reset-names = "switch";
+&mdio1 {
+	status = "okay";
+};
 
-					lan966x_phy0: ethernet-lan966x_phy@1 {
-						reg = <1>;
-					};
+&port0 {
+	phy-handle = <&lan966x_phy0>;
+	phy-mode = "gmii";
+	phys = <&serdes 0 CU(0)>;
+	status = "okay";
+};
 
-					lan966x_phy1: ethernet-lan966x_phy@2 {
-						reg = <2>;
-					};
-				};
+&port1 {
+	phy-handle = <&lan966x_phy1>;
+	phy-mode = "gmii";
+	phys = <&serdes 1 CU(1)>;
+	status = "okay";
+};
 
-				serdes: serdes@e202c000 {
-					compatible = "microchip,lan966x-serdes";
-					reg = <0xe202c000 0x9c>,
-					      <0xe2004010 0x4>;
-					#phy-cells = <2>;
-				};
-			};
-		};
-	};
+&switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tod_pins>;
+	status = "okay";
 };
-- 
2.53.0


