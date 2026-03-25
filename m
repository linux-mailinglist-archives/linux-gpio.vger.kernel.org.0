Return-Path: <linux-gpio+bounces-34161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B2iOlT4w2nPvAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 15:59:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16B32755C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 15:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A46113140101
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C93F1643;
	Wed, 25 Mar 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rLK9j1IT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F53E92A1;
	Wed, 25 Mar 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449824; cv=none; b=XL+c989yuGCLvDHaRu/NieM36NqyvhLLU/Wpx6Mk44ycSNH7AiIc2uoiQnEE38QqFoHcUwoECFEMXio2hN/LTXGCBVOCc380mUDt562fNU3PN12uPzKMXJ/HaV/EPQY8NBeEGmjse+PGaWL5DAMi5EJTIgGTWIlsKycXJZWvAco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449824; c=relaxed/simple;
	bh=xmLqHbZKT2Cv/CWmcreGU77H12f7Xun8iJll/1MC4EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lI0ntEYpQHEUZoPz/uRBZrGJoNviyssq8mbxXPiw6iXxBtPYihbctKe8EyG6ZN6TAUJWZqVVqQH3x50LcJ55e0Olnk0vJI4boNQ1NgeOWcG6hHqwtXsNbjmvmFU45L7LjIzHlOmrxl7nkYM0DrfNUD1Iu43YJwtbaqXhJ316f9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rLK9j1IT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 026AB4E427EE;
	Wed, 25 Mar 2026 14:43:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85FB8601FA;
	Wed, 25 Mar 2026 14:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86D3D10451A7A;
	Wed, 25 Mar 2026 15:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774449818; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gX4rEvCiby9B2yvI++vEu3sfDTTG+/1csPgc0WEGIYs=;
	b=rLK9j1ITz0z0bNGSEhOrpOe7jzE4egSQ9Ey8bDhEEW7rnocN/skTK93R5+CdkmPXK+VGDZ
	h8wtTOqoJwB06VQRSfminh4dl9Et3oX89KvFjdrvOjJp5ur2+cJkesg5ZqC9RjlVOlrnh+
	W/1X5Im3k1nKsYMFkz+OergHTXKBrMGsh+JRuXbjzCGnNlmywFOKzyO+u9dLmrN5zf2xQV
	P+SwWsC5rPt0enndmu3ajlC5eqHqvP0pPmYys9wFS3NXisOC20N4VtHeXXpNOzAAGI3dra
	ndPYNEyp5O+HSdRrIAGYffxvUH2GDQfSEtH0Y6sbrQMGaK8wG1Z9EzJ/vlxEyg==
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
Subject: [PATCH v6 25/27] misc: lan966x_pci: Add dtsi/dtso nodes in order to support SFPs
Date: Wed, 25 Mar 2026 15:35:52 +0100
Message-ID: <20260325143555.451852-26-herve.codina@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,kernel.org,glider.be,gmail.com,linuxfoundation.org,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,bootlin.com,google.com,opensource.cirrus.com,cirrus.com,linaro.org,linux.intel.com,stgolabs.net,huawei.com,intel.com];
	TAGGED_FROM(0.00)[bounces-34161-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,0.0.2.88:email]
X-Rspamd-Queue-Id: 4D16B32755C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device-tree nodes needed to support SFPs.
Those nodes are:
 - the clock controller
 - the i2c controller
 - the i2c mux
 - the SFPs themselves and their related ports in the switch

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/misc/lan966x_evb_lan9662_nic.dtso | 96 +++++++++++++++++++++++
 drivers/misc/lan966x_pci.dtsi             | 42 ++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/misc/lan966x_evb_lan9662_nic.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
index 3ad50abee72d..20e1fe4f78bf 100644
--- a/drivers/misc/lan966x_evb_lan9662_nic.dtso
+++ b/drivers/misc/lan966x_evb_lan9662_nic.dtso
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/phy/phy-lan966x-serdes.h>
 
 /dts-v1/;
@@ -27,15 +28,94 @@ __overlay__ {
 			#size-cells = <2>;
 
 			#include "lan966x_pci.dtsi"
+
+			i2c0_emux: i2c0-emux {
+				compatible = "i2c-mux-pinctrl";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-parent = <&i2c0>;
+				pinctrl-names = "i2c102", "i2c103", "idle";
+				pinctrl-0 = <&i2cmux_0>;
+				pinctrl-1 = <&i2cmux_1>;
+				pinctrl-2 = <&i2cmux_pins>;
+
+				i2c102: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				i2c103: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+
+			sfp2: sfp2 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c102>;
+				tx-disable-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+			};
+
+			sfp3: sfp3 {
+				compatible = "sff,sfp";
+				i2c-bus = <&i2c103>;
+				tx-disable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+				los-gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
+				mod-def0-gpios = <&gpio 19 GPIO_ACTIVE_LOW>;
+				tx-fault-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+			};
 		};
 	};
 };
 
+&flx0 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&fc0_a_pins>;
+	pinctrl-names = "default";
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	status = "okay";
+};
+
 &gpio {
 	tod_pins: tod_pins {
 		pins = "GPIO_36";
 		function = "ptpsync_1";
 	};
+
+	fc0_a_pins: fcb4-i2c-pins {
+		/* RXD, TXD */
+		pins = "GPIO_9", "GPIO_10";
+		function = "fc0_a";
+	};
+
+	i2cmux_pins: i2cmux-pins {
+		pins = "GPIO_76", "GPIO_77";
+		function = "twi_slc_gate";
+		output-low;
+	};
+
+	i2cmux_0: i2cmux-0 {
+		pins = "GPIO_76";
+		function = "twi_slc_gate";
+		output-high;
+	};
+
+	i2cmux_1: i2cmux-1 {
+		pins = "GPIO_77";
+		function = "twi_slc_gate";
+		output-high;
+	};
 };
 
 &lan966x_phy0 {
@@ -64,6 +144,22 @@ &port1 {
 	status = "okay";
 };
 
+&port2 {
+	phy-mode = "sgmii";
+	phys = <&serdes 2 SERDES6G(0)>;
+	sfp = <&sfp2>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
+&port3 {
+	phy-mode = "sgmii";
+	phys = <&serdes 3 SERDES6G(1)>;
+	sfp = <&sfp3>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
 &switch {
 	pinctrl-names = "default";
 	pinctrl-0 = <&tod_pins>;
diff --git a/drivers/misc/lan966x_pci.dtsi b/drivers/misc/lan966x_pci.dtsi
index 170298084fa5..d5c2056e4e5c 100644
--- a/drivers/misc/lan966x_pci.dtsi
+++ b/drivers/misc/lan966x_pci.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2025 Microchip UNG
  */
 
+#include <dt-bindings/clock/microchip,lan966x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 cpu_clk: clock-600000000 {
@@ -61,6 +62,39 @@ port1: port@1 {
 				reg = <1>;
 				status = "disabled";
 			};
+
+			port2: port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port3: port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+	};
+
+	flx0: flexcom@e0040000 {
+		compatible = "atmel,sama5d2-flexcom";
+		reg = <0xe0040000 0x100>;
+		clocks = <&clks GCK_ID_FLEXCOM0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xe0040000 0x800>;
+		status = "disabled";
+
+		i2c0: i2c@600 {
+			compatible = "microchip,sam9x60-i2c";
+			reg = <0x600 0x200>;
+			interrupt-parent = <&oic>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clocks = <&clks GCK_ID_FLEXCOM0>;
+			assigned-clock-rates = <20000000>;
+			status = "disabled";
 		};
 	};
 
@@ -69,6 +103,14 @@ cpu_ctrl: syscon@e00c0000 {
 		reg = <0xe00c0000 0xa8>;
 	};
 
+	clks: clock-controller@e00c00a8 {
+		compatible = "microchip,lan966x-gck";
+		#clock-cells = <1>;
+		clocks = <&cpu_clk>, <&ddr_clk>, <&sys_clk>;
+		clock-names = "cpu", "ddr", "sys";
+		reg = <0xe00c00a8 0x38>, <0xe00c02cc 0x4>;
+	};
+
 	oic: oic@e00c0120 {
 		compatible = "microchip,lan966x-oic";
 		#interrupt-cells = <2>;
-- 
2.53.0


