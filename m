Return-Path: <linux-gpio+bounces-25520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A6B4228E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F09ED1B26151
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E3530E85E;
	Wed,  3 Sep 2025 13:56:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D768230E0E7
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907781; cv=none; b=mIyzq76MaKS2C9pLyukNgXgtSu9/a//fHSWljYq4uTuE8z0n9Qwj8vFs7zlw0AohSfzUEymKNq6Hqa1zZL1OWWBgxopNgoLuYQJHrIBzhxmZU/mezDgfk1PTD7L3kaF/IAXU2ePDoMkJVvl7kluBlXNdHbbdxg2oMpHMA0d4CAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907781; c=relaxed/simple;
	bh=OnQYOk+52qAYd0yryT9dBjrtNuF2ueF50xBunhTkKIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMna0FJK8q+ufV45/G7nL0JTqtQnvKSTKakM3/+6MSvzRQEhmZYZf5zzP48XTl+Pruqb01RKOclWnfEquZ7z7597VOGP+waZE0f9X7WkkuihtT5MNarmaCwzO5RKNAv9NA5HOpXrIA0vmTGR4zCpsl3oQHfBDltLw2pXMWrAwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1utnxx-0007v8-37; Wed, 03 Sep 2025 15:56:01 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1utnxw-003ZMO-1t;
	Wed, 03 Sep 2025 15:56:00 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1utnxw-000000034Tm-26V1;
	Wed, 03 Sep 2025 15:56:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 03 Sep 2025 15:55:45 +0200
Subject: [PATCH v6 1/2] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>
References: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
In-Reply-To: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907760; l=7048;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=OnQYOk+52qAYd0yryT9dBjrtNuF2ueF50xBunhTkKIU=;
 b=0zOtCWsi2hMxiQjr/vKDx7zF2YpdyCN3Hb60h9eBueaCATqwlY2VWybDTF2uq21GZQ9gz6Aq2
 lNnuCKulLBxDdkeei8ZAeJbUn8q4RBQ870OpLESPXmK0go8cKgMiAaX
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
Generator With One PLL, Four Differential Outputs, Two Inputs, and
Internal EEPROM.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
 2 files changed, 222 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4d40b8101fd7e094bb1b79c071e1be2c1fefec23
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CDCE6214 programmable clock generator with PLL
+
+maintainers:
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description: >
+  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
+  Two Inputs, and Internal EEPROM
+
+  - CDCE6214: https://www.ti.com/product/CDCE6214
+
+properties:
+  compatible:
+    enum:
+      - ti,cdce6214
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - enum: [ priref, secref ]
+      - const: secref
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#clock-cells':
+    const: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '^conf':
+        type: object
+        additionalProperties: false
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        properties:
+          pins:
+            items:
+              enum: [priref, secref, out0, out1, out2, out3, out4 ]
+          io-standard:
+            description: |
+              1: CMOS
+              2: LVDS
+              3: Low-Power HCSL
+              4: XTAL mode
+              5: differential
+            enum: [1, 2, 3, 4, 5]
+            $ref: /schemas/types.yaml#/definitions/uint32
+          xo-cload-femtofarad:
+            description: >
+              Load capacity for XO in Femtofarad
+            $ref: /schemas/types.yaml#/definitions/uint32
+          xo-bias-microampere:
+            description: |
+              Bias current setting of the XO
+            $ref: /schemas/types.yaml#/definitions/uint32
+          cmosp-mode:
+            description: |
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polrity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 3
+          cmosn-mode:
+            description: |
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polrity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 3
+
+        allOf:
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: priref
+            then:
+              properties:
+                io-standard:
+                  enum: [ 1, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: secref
+            then:
+              properties:
+                io-standard:
+                  enum: [ 1, 4, 5 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    const: out0
+            then:
+              properties:
+                io-standard:
+                  enum: [ 1 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum:
+                      - out1
+                      - out4
+            then:
+              properties:
+                io-standard:
+                  enum: [ 1, 2, 3 ]
+
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum:
+                      - out2
+                      - out3
+            then:
+              properties:
+                io-standard:
+                  enum: [ 2, 3 ]
+
+        required:
+          - pins
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ti,cdce6214.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@67 {
+            compatible = "ti,cdce6214";
+            reg = <0x67>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #clock-cells = <1>;
+            clocks = <&clock_ref25m>;
+            clock-names = "priref";
+
+            cdce6214_pins: cdce6214-pins {
+                conf1 {
+                    pins = "secref";
+                    io-standard = <CDCE6214_IOSTD_XTAL>;
+                    xo-cload-femtofarad = <8100>;
+                    xo-bias-microampere = <100>;
+                };
+
+                conf2 {
+                    pins = "out1";
+                    io-standard = <CDCE6214_IOSTD_CMOS>;
+                    cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                };
+
+                conf3 {
+                    pins = "out4";
+                    io-standard = <CDCE6214_IOSTD_CMOS>;
+                    cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
new file mode 100644
index 0000000000000000000000000000000000000000..6d2cc5f01864e70a3fbccbfe20e67899e0d049e4
--- /dev/null
+++ b/include/dt-bindings/clock/ti,cdce6214.h
@@ -0,0 +1,24 @@
+#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
+#define _DT_BINDINGS_CLK_TI_CDCE6214_H
+
+/* Clock indices for the clocks provided by the CDCE6214 */
+#define CDCE6214_CLK_OUT0	2
+#define CDCE6214_CLK_OUT1	3
+#define CDCE6214_CLK_OUT2	4
+#define CDCE6214_CLK_OUT3	5
+#define CDCE6214_CLK_OUT4	6
+#define CDCE6214_CLK_PLL	7
+#define CDCE6214_CLK_PSA	8
+#define CDCE6214_CLK_PSB	9
+
+#define CDCE6214_IOSTD_CMOS	1
+#define CDCE6214_IOSTD_LVDS	2
+#define CDCE6214_IOSTD_LP_HCSL	3
+#define CDCE6214_IOSTD_XTAL	4
+#define CDCE6214_IOSTD_DIFF	5
+
+#define CDCE6214_CMOS_MODE_LOW		1
+#define CDCE6214_CMOS_MODE_HIGH		2
+#define CDCE6214_CMOS_MODE_DISABLED	3
+
+#endif /* _DT_BINDINGS_CLK_TI_CDCE6214_H */

-- 
2.47.2


