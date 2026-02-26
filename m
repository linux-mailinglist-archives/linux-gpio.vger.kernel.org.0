Return-Path: <linux-gpio+bounces-32234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EI1HvpLoGnvhwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 14:34:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D95641A6A39
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 14:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 295B8302C818
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A21F36A008;
	Thu, 26 Feb 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KNeZaV/r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B20356A01;
	Thu, 26 Feb 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112858; cv=none; b=E7OtgNYN+I98R4/Ezd/qHGOtEReOyW6coTQKgYDYX4hqS6MZsP706Wokv+yf47gl6Wn7yK70ZoYr5xSGCKwFlvwcUF3wgM5vbJDrP6S3Eps/NFOiGGIjYCyWatOxy0XCOEVK8THgd+oZrBvEwxN7RQs+LMgIEVhodZ2sH5NfR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112858; c=relaxed/simple;
	bh=oBOR980TwjJ2dJBFw8+3I1q6s5oxOQVha3EWu0SuaCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+siBLW0yz0f8SNVo2gplaiWL0b+P0Zj9N98lbaGm5QK0r0EvcMMwJROmrmQXKDkVzzZQT9qGMunfR7zKlwB2yWs8JvrjiPtJoO8GngzqHjsUj3SlfMtq6WLpN0VjiYs9XFzDYA105p8SRp+hx4trUt2wiCgDDERqS/6Q/0Cf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KNeZaV/r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C19BC40697;
	Thu, 26 Feb 2026 13:34:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 199FD5FDEB;
	Thu, 26 Feb 2026 13:34:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF33F1036938E;
	Thu, 26 Feb 2026 14:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xbFb0N0mWFaPr9wcm17PmP2ipXvyfHX9OmBmbZQsT74=;
	b=KNeZaV/r2D4y2tqpheVcxI34BYQloP+7ONaViPVOQ/XbO0Yd5rbiPqnY2PylHWTh66FtiN
	mhWDmpOTSIvpm3k/6sle01DO5b42ucpL559O4QDGa1VQJPCNM1pDcl6JlNSYrNdq49WAjC
	6UbPzNEoaERWW7LBzrip4Ro73W/n+69y27WoFgR0PHySBSE+LX1wFFfoliOSruBNYCPwAJ
	WJvwxFVUdrdJSGudXt3Yo+Kt/veQcavfTjfWzVDtx2Ul2/KQe3g/v9Y3q0nhSnhCUCyTRr
	GM+djxHuM+DOoduxjqWRsP7H2Bt/JPIIjjq76/8jHlwGpKgkIaDxGoK4tiCljQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:46 +0100
Subject: [PATCH v3 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-2-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32234-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,e8400000:email]
X-Rspamd-Queue-Id: D95641A6A39
X-Rspamd-Action: no action

The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
various functions for the controllers present in the SoC.

The OLB produces 22 clocks derived from its input, which is connected
to the main oscillator of the SoC.

It provides reset signals via two reset domains.

It also controls 32 pins to be either a GPIO or an alternate function.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 +++++++++++++++++++++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++++
 2 files changed, 245 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
new file mode 100644
index 000000000000..8334876cf4e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq6lplus-olb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ6Lplus SoC system controller
+
+maintainers:
+  - Benoît Monin <benoit.monin@bootlin.com>
+  - Grégory Clement <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+
+description:
+  OLB ("Other Logic Block") is a hardware block grouping smaller blocks.
+  Clocks, resets, pinctrl are being handled from here. EyeQ6Lplus hosts
+  a single instance providing 22 clocks, two reset domains and one bank
+  of 32 pins.
+
+properties:
+  compatible:
+    items:
+      - const: mobileye,eyeq6lplus-olb
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      First cell is reset domain index.
+      Second cell is reset index inside that domain.
+    const: 2
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Input parent clock to all PLLs. Expected to be the main crystal.
+
+  clock-names:
+    const: ref
+
+patternProperties:
+  '-pins?$':
+    type: object
+    description: Pin muxing configuration.
+    $ref: /schemas/pinctrl/pinmux-node.yaml#
+    additionalProperties: false
+    properties:
+      pins: true
+      function:
+        enum: [gpio, timer0, timer1, uart_ssi, spi0, uart0, timer2, timer3,
+               timer_ext0, spi1, timer_ext1, ext_ref_clk, mipi_ref_clk]
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-strength: true
+    required:
+      - pins
+      - function
+    allOf:
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items: # PA0 - PA31
+                pattern: '^(PA[1,2]?[0-9]|PA3[0,1])$'
+      - if:
+          properties:
+            function:
+              const: timer0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA0, PA1]
+      - if:
+          properties:
+            function:
+              const: timer1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA2, PA3]
+      - if:
+          properties:
+            function:
+              const: uart_ssi
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA4, PA5]
+      - if:
+          properties:
+            function:
+              const: spi0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA6, PA7, PA8, PA9, PA10]
+      - if:
+          properties:
+            function:
+              const: uart0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA11, PA12]
+      - if:
+          properties:
+            function:
+              const: timer2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA13, PA14]
+      - if:
+          properties:
+            function:
+              const: timer3
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA15, PA16]
+      - if:
+          properties:
+            function:
+              const: timer_ext0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA17, PA18, PA19, PA20]
+      - if:
+          properties:
+            function:
+              const: spi1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA21, PA22, PA23, PA24, PA25]
+      - if:
+          properties:
+            function:
+              const: timer_ext1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA26, PA27, PA28, PA29]
+      - if:
+          properties:
+            function:
+              const: ext_ref_clk
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA30]
+      - if:
+          properties:
+            function:
+              const: mipi_ref_clk
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA31]
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller@e8400000 {
+        compatible = "mobileye,eyeq6lplus-olb", "syscon";
+        reg = <0 0xe8400000 0x0 0x80000>;
+        #reset-cells = <2>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+        clock-names = "ref";
+      };
+    };
diff --git a/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h b/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
new file mode 100644
index 000000000000..20d84ee24ad5
--- /dev/null
+++ b/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Mobileye Vision Technologies Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ6LPLUS_CLK_H
+#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ6LPLUS_CLK_H
+
+#define EQ6LPC_PLL_CPU		0
+#define EQ6LPC_PLL_DDR		1
+#define EQ6LPC_PLL_PER		2
+#define EQ6LPC_PLL_VDI		3
+#define EQ6LPC_PLL_ACC		4
+
+#define EQ6LPC_CPU_OCC		5
+
+#define EQ6LPC_ACC_VDI		6
+#define EQ6LPC_ACC_OCC		7
+#define EQ6LPC_ACC_FCMU		8
+
+#define EQ6LPC_DDR_OCC		9
+
+#define EQ6LPC_PER_OCC		10
+#define EQ6LPC_PER_I2C_SER	11
+#define EQ6LPC_PER_PCLK		12
+#define EQ6LPC_PER_TSU		13
+#define EQ6LPC_PER_OSPI		14
+#define EQ6LPC_PER_GPIO		15
+#define EQ6LPC_PER_TIMER	16
+#define EQ6LPC_PER_I2C		17
+#define EQ6LPC_PER_UART		18
+#define EQ6LPC_PER_SPI		19
+#define EQ6LPC_PER_PERIPH	20
+
+#define EQ6LPC_VDI_OCC		21
+
+#endif

-- 
2.53.0


