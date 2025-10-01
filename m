Return-Path: <linux-gpio+bounces-26705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6EBAF90C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 10:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E522A1C59
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 08:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C85C27AC31;
	Wed,  1 Oct 2025 08:13:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74727A124
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759306391; cv=none; b=Ndwbki0BFMitXjdGmzpzRJl4lDiBnIR1N/0BGPvcmd64KQWRxuVczUMgMngkuPcoJF17Rf1bv1n5JRhTbsxiks0LvfgwdXiuG1S0vTMZpFyp3JOlJCGpxJ6P9c6120Mq8wOdjfa8WULelMLMX85N93Gls+vGcGSEnguZkOj8nys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759306391; c=relaxed/simple;
	bh=h3ADPW9r5rolT1+uJwNhR+2ZwcAzsMjIcaSnS5UxmRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KG2cBmazg4yzPehQmsFkACg6TadkuDo8gIhHz0CHwJCC+iRM/OUspIbVpeLaCElMvu+22FvXhn9VgwpCjanarrbsU/IX/VyBcAJTxlKu3Z7CQgsenk35EZ0iS3imIfNShG7tlL6v8c4BGGzb0Hb5NYgXpOlJgjNu1lJ14MOh5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3rxH-0004Pc-AX; Wed, 01 Oct 2025 10:12:55 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3rxG-001NZh-2i;
	Wed, 01 Oct 2025 10:12:54 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3rxG-00000001m9N-38mV;
	Wed, 01 Oct 2025 10:12:54 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 01 Oct 2025 10:12:53 +0200
Subject: [PATCH v7 1/2] dt-bindings: clock: add TI CDCE6214 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-clk-cdce6214-v7-1-5f8b44da95a5@pengutronix.de>
References: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
In-Reply-To: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759306374; l=6852;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=h3ADPW9r5rolT1+uJwNhR+2ZwcAzsMjIcaSnS5UxmRA=;
 b=Bmp77GeczRx2uhFNIUBSJiVYJaWCgiKNzN3jZMAqJAaFKdBhMAKsKDSzGN28kWgSrU1q66zps
 itAHDr5r/doAEYMxiLsU4yn7IuVxQFCSf9ATyBoVxA4YTOyiBh+uuU1
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
 .../devicetree/bindings/clock/ti,cdce6214.yaml     | 192 +++++++++++++++++++++
 include/dt-bindings/clock/ti,cdce6214.h            |  25 +++
 2 files changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4a9c9155894afff7768c4ddf6aa1ab5a02d6acc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
@@ -0,0 +1,192 @@
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
+  '#clock-cells':
+    const: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
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
+
+          ti,io-standard:
+            description: |
+              1: CMOS
+              2: LVDS
+              3: Low-Power HCSL
+              4: XTAL mode
+              5: differential
+            enum: [1, 2, 3, 4, 5]
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          ti,xo-cload-femtofarads:
+            description: Load capacity for XO in Femtofarad
+
+          ti,xo-bias-microamp:
+            description: Bias current setting of the XO
+
+          ti,cmosp-mode:
+            description: |
+              Driving mode for CMOSN output:
+              1: Low Polarity
+              2: High Polrity
+              3: Disable
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 3
+
+          ti,cmosn-mode:
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
+            #clock-cells = <1>;
+            clocks = <&clock_ref25m>;
+            clock-names = "priref";
+
+            cdce6214_pins: cdce6214-pins {
+                conf1 {
+                    pins = "secref";
+                    ti,io-standard = <CDCE6214_IOSTD_XTAL>;
+                    ti,xo-cload-femtofarads = <8100>;
+                    ti,xo-bias-microamp = <100>;
+                };
+
+                conf2 {
+                    pins = "out1";
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                };
+
+                conf3 {
+                    pins = "out4";
+                    ti,io-standard = <CDCE6214_IOSTD_CMOS>;
+                    ti,cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
+                    ti,cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
new file mode 100644
index 0000000000000000000000000000000000000000..41ec4f8868bbbffc3416bda6d105858c3f18acd4
--- /dev/null
+++ b/include/dt-bindings/clock/ti,cdce6214.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
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
2.47.3


