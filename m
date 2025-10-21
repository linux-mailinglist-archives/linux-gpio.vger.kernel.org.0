Return-Path: <linux-gpio+bounces-27388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D5BF70C0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B6084FFC07
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CB9330B3C;
	Tue, 21 Oct 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="F+zhHnzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD7D338900
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056676; cv=none; b=dQf+v29NiVRcSL9cSNK/nZDXkJwhlbNPCcZ1GQXWHJkF2GAzwn/a8foQ+YCkIa7659kmScq8xV7hKzJzolveTGfPXOEHffjHZUCz0ddYR+zgb86q3U3KWFxQXcdxLN3HD4r9Z6ejgnf6IoAGASwDPOGPoqkmsPJtB3ayd+tYTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056676; c=relaxed/simple;
	bh=ucYzVCWE51NmFx2/BwEBPsUCDxyYgQuvoNjfPTOejAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H55zkdwpL24syDgo0LYpPOVLJEXLjqmWrhK5YbiEjzIV3NmcF38zvUnfjG3J+3zjemg7Pk6OpiBw6Bs2dSzT5UUecFF0hrHAk5hSIPYx1mtryTdEMqpEocok0TiDwTuJyl2sQ22V6vCXmTfOFmyU3KiBp6ySqi25qD3WYynnNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=F+zhHnzn; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 3A9C168A1CE;
	Tue, 21 Oct 2025 16:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6urXFWKajG7kcvFel7TUKdKt+O2PPPG68C70YJSu5js=;
	b=F+zhHnzncWlcMdVdICpMKjG7HOxTgcKwkRwP1k9bJTl5+mXURjl9b+wZ8kB6bBad+2x3gz
	ydP7XyI3LiVSODo1BhgLzddF4Gj9ya7x6BXvL5mJTQRYxN+G1Fhf6iW6ko0ZHnytfTzrAk
	aEruKRZK+o5hVZE7QPY2868adoGPFANpqp0gcpAuNKIRJnNs1Uk73vBoj1+UcnK8pQHJiC
	1/RgmkBPntkfUCQ3ZzNV7B6OQh7hzUvemRkgwd7q6lTzVZ5LDwRvgl/eM/60UCNHZWicQi
	fQzEyXgTAwsVjaqHQAwnuB4WSG+wItrFQFPybhgMvNO0KxPzmjk78bibsXGiIQ==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v6 3/8] dt-bindings: leds: Binding for RTL8231 scan matrix
Date: Tue, 21 Oct 2025 16:23:58 +0200
Message-ID: <20251021142407.307753-4-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding description for the Realtek RTL8231's LED support, which
consists of up to 88 LEDs arranged in a number of scanning matrices.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 .../bindings/leds/realtek,rtl8231-leds.yaml   | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
new file mode 100644
index 000000000000..54e8593f8c06
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/realtek,rtl8231-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8231 LED scan matrix.
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+
+description: |
+  The RTL8231 has support for driving a number of LED matrices, by scanning
+  over the LEDs pins, alternatingly lighting different columns and/or rows.
+
+  This functionality is available on an RTL8231, when it is configured for use
+  as an MDIO device, or SMI device.
+
+  In single color scan mode, 88 LEDs are supported. These are grouped into
+  three output matrices:
+    - Group A of 6×6 single color LEDs. Rows and columns are driven by GPIO
+      pins 0-11.
+               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
+                |        |        |        |        |        |
+       P0/P6  --<--------<--------<--------<--------<--------< (3)
+                |        |        |        |        |        |
+       P1/P7  --<--------<--------<--------<--------<--------< (4)
+                |        |        |        |        |        |
+       P2/P8  --<--------<--------<--------<--------<--------< (5)
+                |        |        |        |        |        |
+       P3/P9  --<--------<--------<--------<--------<--------< (6)
+                |        |        |        |        |        |
+       P4/P10 --<--------<--------<--------<--------<--------< (7)
+                |        |        |        |        |        |
+       P5/P11 --<--------<--------<--------<--------<--------< (8)
+               (0)      (1)      (2)      (9)     (10)     (11)
+    - Group B of 6×6 single color LEDs. Rows and columns are driven by GPIO
+      pins 12-23.
+               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
+                |        |        |        |        |        |
+      P12/P18 --<--------<--------<--------<--------<--------< (15)
+                |        |        |        |        |        |
+      P13/P19 --<--------<--------<--------<--------<--------< (16)
+                |        |        |        |        |        |
+      P14/P20 --<--------<--------<--------<--------<--------< (17)
+                |        |        |        |        |        |
+      P15/P21 --<--------<--------<--------<--------<--------< (18)
+                |        |        |        |        |        |
+      P16/P22 --<--------<--------<--------<--------<--------< (19)
+                |        |        |        |        |        |
+      P17/P23 --<--------<--------<--------<--------<--------< (20)
+              (12)     (13)     (14)    (21)      (22)     (23)
+    - Group C of 8 pairs of anti-parallel (or bi-color) LEDs. LED selection is
+      provided by GPIO pins 24-27 and 29-32, polarity selection by GPIO 28.
+               P24     P25  ...  P30     P31
+                |       |         |       |
+      LED POL --X-------X---/\/---X-------X (28)
+              (24)    (25)  ... (31)    (32)
+
+  In bi-color scan mode, 72 LEDs are supported. These are grouped into four
+  output matrices:
+    - Group A of 12 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 0-11, polarity selection by GPIO 12.
+    - Group B of 6 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 23-28, polarity selection by GPIO 21.
+    - Group C of 6 pairs of anti-parallel LEDs. LED selection is provided
+      by GPIO pins 29-34, polarity selection by GPIO 22.
+    - Group of 4×6 single color LEDs. Rows are driven by GPIO pins 15-20,
+      columns by GPIO pins 13-14 and 21-22 (shared with groups B and C).
+           L2[n]    L2[n+6]   L2[n+12]  L2[n+18]
+            |        |         |         |
+       +0 --<--------<---------<---------< (15)
+            |        |         |         |
+       +1 --<--------<---------<---------< (16)
+            |        |         |         |
+       +2 --<--------<---------<---------< (17)
+            |        |         |         |
+       +3 --<--------<---------<---------< (18)
+            |        |         |         |
+       +4 --<--------<---------<---------< (19)
+            |        |         |         |
+       +6 --<--------<---------<---------< (20)
+          (13)     (14)      (21)      (22)
+
+  This node must always be a child of a 'realtek,rtl8231' node.
+
+properties:
+  $nodename:
+    const: led-controller
+
+  compatible:
+    const: realtek,rtl8231-leds
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  realtek,led-scan-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Specify the scanning mode the chip should run in. See general description
+      for how the scanning matrices are wired up.
+    enum: [single-color, bi-color]
+
+patternProperties:
+  "^led@":
+    description: |
+      LEDs are addressed by their port index and led index. Ports 0-23 always
+      support three LEDs. Additionally, but only when used in single color scan
+      mode, ports 24-31 support two LEDs.
+    type: object
+
+    properties:
+      reg:
+        items:
+          - items:
+              - description: port index
+                maximum: 31
+              - description: led index
+                maximum: 2
+
+    allOf:
+      - $ref: ../leds/common.yaml#
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - realtek,led-scan-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    led-controller {
+        compatible = "realtek,rtl8231-leds";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        realtek,led-scan-mode = "single-color";
+
+        led@0,0 {
+            reg = <0 0>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <0>;
+        };
+
+        led@0,1 {
+            reg = <0 1>;
+            color = <LED_COLOR_ID_AMBER>;
+            function = LED_FUNCTION_LAN;
+            function-enumerator = <0>;
+        };
+
+        led@0,2 {
+            reg = <0 2>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_STATUS;
+        };
+    };
-- 
2.51.0


