Return-Path: <linux-gpio+bounces-28841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B0C70F60
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 47C172A7F0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749D036655B;
	Wed, 19 Nov 2025 20:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="6w1Nthd9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBCF3112C2
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582601; cv=none; b=Bzl/c3H8Q/KFF+LXJ0Lyi8SfWboUKwR4U0LIvqQqSQU/NZO8YkxTL+FemkmfYgOV7nuwjidkrzW7ZMS/cpwy/ZgnjBB/eCt9BmLNVt/5bhVXMal0U9Bl5uhWf+mXO/Mu9IEd/BKRp0Z35F33MRRCGZ3jGFN0tML4il5LFzFebt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582601; c=relaxed/simple;
	bh=s/dV4hD4pLvdVk0lpBcccvoVuY7MmNXE4tfgXIJEoV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snQTMlbQ6+2CCixuVOFeu4N+9Py3FXRIhFeUJA6hhMug8TfUgcPJTDbt28YKsQfL7X8gmZ2Z7WoxAQZZAFrndoo8+m1dUUT9h+Oegt2L8mEfCfoA+kPgmNrn1CumBElArOyoReonCQJdEtXInv+ew/jeEdX57P3nJXQkjLOBWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=6w1Nthd9; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 09F4E6A1E97;
	Wed, 19 Nov 2025 21:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763582595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfPC79sVv1RFvhB+PRy5Ef4sIEtbZNWKjMguIAr9qS0=;
	b=6w1Nthd9rixjkDlJJJ0gPgTYE/6o/BlpC/LUIlnblIDXHDK4zBkzWkt5+sHwjMQf/dHKJh
	ItECYqjDK0ruQePw1cWygp5uIOtYOiwFRJC45yN2MMuIXsFPE/UtPyH9muNtFpmrUgtv+m
	VBygeglWNVv4UtCO+rDrUH3vVoNTOULg1QLY7QWweB1iP9g12IW1AaJXMLGmIVoHeEcfTq
	hRzUxiV/SfqWEFvzvs0g6BB8C3yavn5pmFigAB6bojM8InvPFCvuGIMy09U/NfpyOPCg+w
	ewBVI6L6hpV2yNIdeN/ZJ1/JLTX40AH6eiId72VdViiDClzMEPouhX2N2lnh1Q==
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v8 1/6] dt-bindings: leds: Binding for RTL8231 scan matrix
Date: Wed, 19 Nov 2025 21:03:00 +0100
Message-ID: <20251119200306.60569-2-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119200306.60569-1-sander@svanheule.net>
References: <20251119200306.60569-1-sander@svanheule.net>
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
Changes since v7:
- Move $ref and add unevaluatedProperties for led nodes
- Drop example redundant with MFD binding

Changes since v6:
- Relax description formatting
- Enforce address format for led node names
- Use absolute paths for schema references
---
 .../bindings/leds/realtek,rtl8231-leds.yaml   | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
new file mode 100644
index 000000000000..c19911582a08
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
@@ -0,0 +1,136 @@
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
+    description:
+      Specify the scanning mode the chip should run in. See general description
+      for how the scanning matrices are wired up.
+    enum: [single-color, bi-color]
+
+patternProperties:
+  "^led@([1-2]?[0-9]|3[0-1]),[0-2]":
+    $ref: /schemas/leds/common.yaml#
+    description:
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
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - realtek,led-scan-mode
+
+additionalProperties: false
-- 
2.51.1


