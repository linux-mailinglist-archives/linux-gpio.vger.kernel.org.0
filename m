Return-Path: <linux-gpio+bounces-8375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07793B4A9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 18:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D072815AD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 16:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000A715ECCA;
	Wed, 24 Jul 2024 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtVqqqLn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A215E5DC;
	Wed, 24 Jul 2024 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837574; cv=none; b=JDenF+PJP0YFQRrivOcgCzPKo2b/8pfleA/LRxlipaecIGkz8yH0n3HwUJQtSIM+jRth5GMy7KZQ51tJhqQ7YSWTI0H4xVvVByCYmjy/g5Ar3LS31j48lmqgpvhuIFadGlDJ52sAW3Tu6iCR1qsFAumXkfaYdnTeLoPIZ6/vBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837574; c=relaxed/simple;
	bh=Lx9S94uaQu9bvfC1G0Dl39LGuHtgMpD9VsQXFEuMsOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ah1xsMcCE2E5g2Ki2KU0o+8eHeAKDDk4LzohR2DqlxQBh9Vuvuk6qC+oSVlNLW1NBXmFT2WJlaZAuJyEvOI4D5igPNfRyqDBALd+hNnOOtOqk9rosPxkQF7oMgwopcDe8PQ8BBlvtUkuAgTV+l1cvtX0D4g1ZOe3iWvtyKHTpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtVqqqLn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd6ed7688cso19373725ad.3;
        Wed, 24 Jul 2024 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721837572; x=1722442372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGy8zPia1B1XKZzXuwWS8JSh1QUyF/w6Ab7CItZJ4ps=;
        b=MtVqqqLnuuHcLOKjlNk2oHm/AXnoQ9Mcvi+WOKVOFBrVp34ShzEt3v5XfLV3v0lzwR
         cC734j87LAv1JaZPjDN3y8y5/vtv4Z3FxKUwfGauKBoBoWANSy7L9A3ICLn7cTiWEbVY
         M2j3fOE0thAXV9LY6FcJGDNcZkF0hwwAtvIS8pClCgrzQI+OUDEdrsOoQKya1QY5bJEw
         ReMQ+77BMSbn5kS5DFch24xSep0hfOe0C5Mo/f2SBgC7II37aKdKx7h9xfNgtDFtVocB
         onhm0PdzFH7VAspCkfDjH/4wWh4A26xaJj7SUIXM9vXYLRitIwaQdF3TN9Mvt3CPjNT9
         jnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837572; x=1722442372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGy8zPia1B1XKZzXuwWS8JSh1QUyF/w6Ab7CItZJ4ps=;
        b=ou8X+e+qqwoiztz5nawzSWgiPEbsiu3vDNEkRby2X0dtKEHXPIy4/JQqPzAbVcJ0fk
         Sb/ruxf5q06hdWuvdeodQLGjtpow4a7IYPJAwUJKrD8vkmGSPN+xwVE7MGs063EQqjYc
         vUKnU2n+T9Q/lxGLRxXYBrfI9L5FbODFeadV7+CBTBYlfGwjp3Po/gl09H0Kk+dhSl3F
         0UVHA4ZjVCvWHwHBh0oFdDMzQUQ/WLXhfDSs6Wz4KXJJapzww90OF9UPvpCVCFahAkbi
         jVzATbgnwrXtheTi8nEVwwL8bP3gFUozvi/WLttZ3YJKsMCcYQybzlWHsfRpeT4bpOPV
         aqDg==
X-Forwarded-Encrypted: i=1; AJvYcCVVY0NzCOSnOBCO7J94obbge1TM9BbrSHD/p6ro2xSTuunh/GHRe0t8NjaJhWK8pT6slER9DXLZz8NVTSNMreCDozkmhSkCpTQgl75VWIo794/DcXi9LumCzNUSefHi4P1KvSAUD/qRfu3gYysd1KCQ8M06MyPBz5L147pKVXz1cLf2Sf0=
X-Gm-Message-State: AOJu0YyaLC4dDR5O/DeDDNq35AWO41ciwmBCdciumZuZVqlBF4/dewvP
	Ivnhu6pgQbkyucg4U8FJ1nPPNJUFiH/YSt7g1cxDuKE1N9RdPPbqVy04AEbvZ1k=
X-Google-Smtp-Source: AGHT+IGwOmSmZRzublCwto8iAdsGQCIJhKKjiFYZCs+wlRCvU3WxVvNuBUWb0T/QF+lXF8AXBA39Dg==
X-Received: by 2002:a17:903:230a:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-1fed352f8e7mr551235ad.7.1721837572292;
        Wed, 24 Jul 2024 09:12:52 -0700 (PDT)
Received: from fedora.. ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bd9bsm96065825ad.157.2024.07.24.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:12:51 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: nxp,lpc32xx-gpio: Convert to dtschema
Date: Wed, 24 Jul 2024 21:42:28 +0530
Message-ID: <20240724161235.130333-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP LPC32xx SoC GPIO controller bindings to DT schema format.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../devicetree/bindings/gpio/gpio_lpc32xx.txt | 43 ---------------
 .../bindings/gpio/nxp,lpc32xx-gpio.yaml       | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt b/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
deleted file mode 100644
index 49819367a011..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-NXP LPC32xx SoC GPIO controller
-
-Required properties:
-- compatible: must be "nxp,lpc3220-gpio"
-- reg: Physical base address and length of the controller's registers.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Should be 3:
-   1) bank:
-      0: GPIO P0
-      1: GPIO P1
-      2: GPIO P2
-      3: GPIO P3
-      4: GPI P3
-      5: GPO P3
-   2) pin number
-   3) optional parameters:
-      - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- reg: Index of the GPIO group
-
-Example:
-
-	gpio: gpio@40028000 {
-		compatible = "nxp,lpc3220-gpio";
-		reg = <0x40028000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <3>; /* bank, pin, flags */
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led0 {
-			gpios = <&gpio 5 1 1>; /* GPO_P3 1, active low */
-			linux,default-trigger = "heartbeat";
-			default-state = "off";
-		};
-
-		led1 {
-			gpios = <&gpio 5 14 1>; /* GPO_P3 14, active low */
-			linux,default-trigger = "timer";
-			default-state = "off";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml
new file mode 100644
index 000000000000..5974b2775d23
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,lpc32xx-gpio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,lpc32xx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC GPIO controller
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+    description: |
+      1) bank:
+        0: GPIO P0
+        1: GPIO P1
+        2: GPIO P2
+        3: GPIO P3
+        4: GPI P3
+        5: GPO P3
+      2) pin number
+      3) optional parameters:
+        - bit 0 specifies polarity (0 for normal, 1 for inverted)
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpio@40028000 {
+        compatible = "nxp,lpc3220-gpio";
+        reg = <0x40028000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <3>; /* bank, pin, flags */
+    };
-- 
2.45.2


