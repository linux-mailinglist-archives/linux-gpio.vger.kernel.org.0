Return-Path: <linux-gpio+bounces-20308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1AABCA78
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 23:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBA7189901A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 21:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04B621ADC9;
	Mon, 19 May 2025 21:57:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0017261D;
	Mon, 19 May 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691871; cv=none; b=PeskeiTXfjSu8KR9/cLgyMmAq+lml0wdRkp5fInX5Fz8i6e8FRFJvsg4oJe52FfITO56x41I4oC4BQaUltyGeZ3qe/6i8YopK/c+ZD/42ptCy/kc5MKKgLYqimW5BrvLprdLhoBYBMZdGHQBEry3ON4OZXHxn0cDveGSzTBfPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691871; c=relaxed/simple;
	bh=SeaZ/79UXnQ9W+1Fb4RO4ybPcFFQeXuWQkq+UdynrxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWHc3IT2+7m7RPvjWFwdxP7QKjY8nMiVU9ZzA8OiDtpmHV+zLiTA0U+BgWlEC2ZCo0K0xd0pyXOsHzO6BTx/U+GfMjkeCoz6K9BLlbQuWQLdOfeJ0z9gn2lfhYZfhixqAFqXbHoItMJp/xixyW1rCm333tXY0Vczv6gJd/vliTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: NAVLYW99TlSnBwIjWoyCFA==
X-CSE-MsgGUID: iKCGXRcOTxeHgNzm7uNQIg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 May 2025 06:57:47 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.3])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E619840B3E4E;
	Tue, 20 May 2025 06:57:43 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: add compatible for Renesas RZ/T2H
Date: Mon, 19 May 2025 23:57:31 +0200
Message-ID: <20250519215734.577053-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) pinctrl

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 .../bindings/pinctrl/renesas,pfc.yaml         | 59 +++++++++++++------
 include/dt-bindings/pinctrl/rzt2h-pinctrl.h   | 23 ++++++++
 2 files changed, 65 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/rzt2h-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index cfe004573366..6d6f97daad17 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -29,6 +29,7 @@ properties:
       - renesas,pfc-r8a774b1    # RZ/G2N
       - renesas,pfc-r8a774c0    # RZ/G2E
       - renesas,pfc-r8a774e1    # RZ/G2H
+      - renesas,pfc-r9a09g077   # RZ/T2H
       - renesas,pfc-r8a7778     # R-Car M1
       - renesas,pfc-r8a7779     # R-Car H1
       - renesas,pfc-r8a7790     # R-Car H2
@@ -74,27 +75,41 @@ properties:
   power-domains:
     maxItems: 1
 
-allOf:
-  - $ref: pinctrl.yaml#
-
 required:
   - compatible
   - reg
 
-if:
-  properties:
-    compatible:
-      enum:
-        - renesas,pfc-r8a73a4
-        - renesas,pfc-r8a7740
-        - renesas,pfc-sh73a0
-then:
-  required:
-    - interrupts-extended
-    - gpio-controller
-    - '#gpio-cells'
-    - gpio-ranges
-    - power-domains
+allOf:
+  - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - renesas,pfc-r8a73a4
+            - renesas,pfc-r8a7740
+            - renesas,pfc-sh73a0
+    then:
+      required:
+        - interrupts-extended
+        - gpio-controller
+        - '#gpio-cells'
+        - gpio-ranges
+        - power-domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,pfc-r9a09g077
+    then:
+      required:
+        - gpio-controller
+        - '#gpio-cells'
+        - gpio-ranges
+      properties:
+        reg:
+          items:
+            - description: base address of register block 0
+            - description: base address of register block 1
 
 additionalProperties:
   anyOf:
@@ -194,3 +209,13 @@ examples:
                     power-source = <3300>;
             };
     };
+
+  - |
+    pinctrl: pinctrl@812c0000 {
+            compatible = "renesas,pfc-r9a09g077";
+            reg = <0x802c0000 0x2000>,
+                  <0x812c0000 0x2000>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl 0 0 287>;
+    };
diff --git a/include/dt-bindings/pinctrl/rzt2h-pinctrl.h b/include/dt-bindings/pinctrl/rzt2h-pinctrl.h
new file mode 100644
index 000000000000..7842783fdb7a
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rzt2h-pinctrl.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/T2H family pinctrl bindings.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_RZT2H_PINCTRL_H
+#define __DT_BINDINGS_RZT2H_PINCTRL_H
+
+#define RZT2H_PINS_PER_PORT	8
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZT2H_PORT_PINMUX(b, p, f)	((b) * RZT2H_PINS_PER_PORT + (p) | ((f) << 16))
+
+/* Convert a port and pin label to its global pin index */
+#define RZT2H_GPIO(port, pin)	((port) * RZT2H_PINS_PER_PORT + (pin))
+
+#endif /* __DT_BINDINGS_RZT2H_PINCTRL_H */
-- 
2.43.0


