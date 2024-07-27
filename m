Return-Path: <linux-gpio+bounces-8396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 947CD93DF78
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 15:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C831F218E1
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jul 2024 13:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C85313AA51;
	Sat, 27 Jul 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPkBEqTL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF46F303;
	Sat, 27 Jul 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722085227; cv=none; b=EyCGuebSOEy6tYjQuGp46wHF3JdC70tTPsfjK6lphcopvSw2iGQT33fuLv8bBhGimCajL2rdhElOTEKBYPlvvyeK0nnvP83sd+pnNpPQBtRwt3dEibU0MsxKf9RFxsxflZx3LFSRtVq1eO/FPlQDAYrlZhf8a5nu9CNog9JOHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722085227; c=relaxed/simple;
	bh=5thcGpGJ69XFlGA1JcPrbpuQqRrzWcuyzT0COcmxWqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcY45OdE03SkKsLwarKQB5Iyf4cPAJmNDlFZQNfPmCz6ZsMJlj743Mm4PD1PxYYh/wZafpPli4PDmpI2D3KBCwhgfZwW3Kmautu82/4lR5FAVsUVzeY7HyhKylNSRp9vMlIMbvrTyUdex0apQSt3IKdKpoIJEdlnV/DKLMjCm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPkBEqTL; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3db18102406so1285835b6e.1;
        Sat, 27 Jul 2024 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722085224; x=1722690024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke2b2wOLe+75TWmUjgmqpavix1co7pFeONNfWYeaTVs=;
        b=TPkBEqTLMW6PzqSjCP5ushcYf6ZVdSakzLCdI9gMVpmN/AVyuewBKbRuw3a8er4kLm
         rxKL9xv1O7h0VMa9fvZHmEiVW0fCFWCgQH33Bu+N2kZWtUNGAgB/5Zu7HjNbs3gc9axb
         XS0FDrUNSs+oGYBlXKXo2oV2Tmw5arBnIoTwkfwHa17nhgfZGY+xC8uCfl9I/JdREVcj
         WB2PNMFLwpZVmfEpxj+p/we2xghZeAHp4FGnMvXfZQBP2OxuzzOCQGhECy/yqtETbSSS
         aMnipYFHR7/b9AWSB6R5jmnnFigTsy3Vv0bkqSV8NUl8And/GNUaLyU8HDQT3LA88dMD
         WCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722085224; x=1722690024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke2b2wOLe+75TWmUjgmqpavix1co7pFeONNfWYeaTVs=;
        b=hT9UefIvC/kBRtHcUNN58c1FEpSKJwskteONFuBLP/p9Z25Wh2YHIn+7G+z2mQ2TVj
         UG8zv0tunvQ5FhhhSnjNl2h0k0JWuATaToODjDNc7gceKRuY3YPCpLGgIYK5bXErNGxY
         ZopDUxNtEEG9D3V7tqdb0kFuhCew8WiCgOoQMFRkXJmX9frg/dnrTeqA/hFUVHu7T8KV
         4jLcNXxoZO1/zN5/DNAFTzRfgC3XCGvTqGBSaaNHboXs8XA1hZ3XmUmkwrNTYbmt0G/g
         EPCsQ2Db5dyLOFhZmp32RBQIV3178wp3E+hpskdYDeoT2NyUpAEYTqsxMUlgCrndQ7bB
         5JcA==
X-Forwarded-Encrypted: i=1; AJvYcCXHehAtDCE+j41a/I+qUGjg+jfrj5+79Czwa+Reb9jq42K/2Jl1QmQ9ZKV2WBQKB/hbqeWdq4aK708Ytip0F6TQRQr866BR1rbxyr/GsQGvgX/oQOrj9f7a4sQwACKDc8ls33CNNW8HztbZHm9yE523Sg63UkkiVB7Sj8vvla6hL4au7t8=
X-Gm-Message-State: AOJu0YyriLW8AJZd2GNhQLXuTtUw3LdSQQN7MFASMTDD99BTfd3Qyns5
	eJIf1jy29Z6ocIOoFn40zyZjSXyWK0rqgOGcpmAYtvnwMtJyrDNo
X-Google-Smtp-Source: AGHT+IFugrwths5qXmiGrpyWRGPLjxYN9ABKLPzyxBbke/9wB2mDHVVUMREeBtaM84xUj8get90c5A==
X-Received: by 2002:a05:6830:3c05:b0:703:6a3e:d3ca with SMTP id 46e09a7af769-70940c61394mr3405364a34.26.1722085224394;
        Sat, 27 Jul 2024 06:00:24 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b9b7dsm7231551a91.21.2024.07.27.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 06:00:24 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: gpio: nxp,lpc3220-gpio: Convert to dtschema
Date: Sat, 27 Jul 2024 18:30:03 +0530
Message-ID: <20240727130008.408772-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP LPC3220 SoC GPIO controller bindings to DT schema format.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

--
Changes in v2:
  - Changed the file name to match the compatible string.
  - Removed optional from the description of '#gpio-cells' as it was wrongly
    present.
---
 .../devicetree/bindings/gpio/gpio_lpc32xx.txt | 43 ---------------
 .../bindings/gpio/nxp,lpc3220-gpio.yaml       | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml

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
diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml
new file mode 100644
index 000000000000..cea2f2bb2393
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,lpc3220-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC3220 SoC GPIO controller
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
+      3) flags:
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


