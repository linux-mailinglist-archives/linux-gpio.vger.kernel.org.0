Return-Path: <linux-gpio+bounces-6224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D398BF696
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 08:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467C31C22F00
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32992BB0F;
	Wed,  8 May 2024 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYL3jq+O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5528DDA;
	Wed,  8 May 2024 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151125; cv=none; b=tzS6hv7BI1kPjRVuOEbrVGANk5o5UgWhkyt/mBv2P13rizyu/hVsd3PFUqzcLfamI8WXjpv0ASv8j6B7TB1qGtx7Ek+LGNwfYwA0C+Q3CjoK8TNqf+sQC7IhKFh60E3gk6NBzrC6vpnRiMR65yAGz1LB5CwKXeBsMcjZOeDH+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151125; c=relaxed/simple;
	bh=uxrxbmAsPMLr8gccagqykeHs29KBvyewDg+sm6EJ0OA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rDg9oAQk+UsXVHQL+/+Uptcleh5i7VTgQE1JYtrDp56zPscT48Vyw1n2zeK4oEXeueGrcJYLBnxN9sutOGHeCr0FAInkUICpiIfKTYaXyzHvz8eXACgQ7O9vsd1SOpQPaqGsfbWZvduXzMAslXZcV4d287MLnqG1gMWh0YktKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYL3jq+O; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eeabda8590so6193805ad.0;
        Tue, 07 May 2024 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715151123; x=1715755923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdRAuvJPzDOFmcmDaL4P+X32ok4kuqJZRpeCq1BZFBg=;
        b=jYL3jq+O4AEpAFVxBRWaJZFtxwJdYwp3fUbz0ZS+LnAiJYQj9gFT20T4Q0HzYCv6KT
         68QEKT4IXzlZwJsimKyq+W5byEQ7tLgtokDEVrgCT1LMkRrw35vPbsj02MzDTq6O/VK3
         h2QsLqButUJsw3GEC0QXYbDQZhoP2cGLcTl4wcfgeUM32Sg2hpNJ0jQBfAKKf+k/ToEq
         qL+Q5oqZygPIWrBvefEj2hzrvC187ciqr7aw2dR2hN7I+mIJ+f4vdCutfzD3eJFxuYB0
         aQl+1WkcurroNO4BbWPtkaBlZ72lQaCNCjQxmSHlEpxi/uva9xE0Fib39eUB8sVXLZp/
         +RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715151123; x=1715755923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdRAuvJPzDOFmcmDaL4P+X32ok4kuqJZRpeCq1BZFBg=;
        b=NOYWcbEEeTOtNokU2n5wNenX/5ptxrH+vQ0MGl4Ygi+/joFVRLn1l3ODGoB23K9Kf/
         jZUetFjjrIVUpUVHVP2RbWJorUK3ifHv8V5pFmvqPDwsKfOSmDJ9seSoMm4OwQ0fGcIf
         62agypMivs9uEswSIXE4OSdclx6qjbUwwh3jP/uPJ93LDkll6x4/YLAlIDXzGZ8N+1rI
         TlDvbxULFl2QpXzgwS8xRPQo6/KBHiig2HwKLRF5l5KJv6DumdBL43u7alT5ayPET6MJ
         azbYLMZAAgntbV6aXgTxaZsAoGCuVfUmltG3gfJDMFlqNGYarT7LxLhFRYFZF14jVTlB
         tziA==
X-Forwarded-Encrypted: i=1; AJvYcCVxNcnETPgF2DF9s/PQVga3DvUObAt7KcrMezqxrhk/8zbWDnbcHJv5K7VVi/Y0JoeLsbm93KY9IfSn/6pIihucs9filMeAPtNg/SPdyQfcSpT7K6RtG6mCrdMB6dpgHcfdEr0UzkN0IYWa8OT7l9504e+t6ccMKsXh3ScRA+fcKGxPFhw=
X-Gm-Message-State: AOJu0YzFuzkWO43FndTJvoRrTTY9ealzUXyFdT8ruSgyp1BDYO/EbVzr
	hzcAYGNyN/t+FqwDRkBnwfT4GHyUOsbxgNtqPj40ly0lN124JBd9
X-Google-Smtp-Source: AGHT+IGAVtV8ZnJrfN5Xapafhwe+xWGeO3Vjd3KeQG3/4kSZLDwhcKTVkMUXYytsvJ/vGTMmELGz3Q==
X-Received: by 2002:a17:902:b7c1:b0:1e4:9ad5:7522 with SMTP id d9443c01a7336-1eeb0592106mr17717015ad.21.1715151123418;
        Tue, 07 May 2024 23:52:03 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e434923462sm11136267plg.50.2024.05.07.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 23:52:03 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 2/3] dt-bindings: pinctrl: Document nuvoton ma35d1 pin control
Date: Wed,  8 May 2024 06:51:40 +0000
Message-Id: <20240508065141.565848-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508065141.565848-1-ychuang570808@gmail.com>
References: <20240508065141.565848-1-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add documentation to describe nuvoton ma35d1 pin control and GPIO.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/nuvoton,ma35d1-pinctrl.yaml       | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
new file mode 100644
index 000000000000..763a49bd07dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 pin control and GPIO
+
+maintainers:
+  - Shan-Chun Hung <schung@nuvoton.com>
+  - Jacky Huang <ychuang3@nuvoton.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the system-management node.
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    properties:
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 2
+
+      interrupts:
+        description:
+          The interrupt outputs to sysirq.
+        maxItems: 1
+
+    required:
+      - gpio-controller
+      - '#gpio-cells'
+      - reg
+      - clocks
+      - interrupt-controller
+      - '#interrupt-cells'
+      - interrupts
+
+    additionalProperties: false
+
+  "-grp$":
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    patternProperties:
+      "-pins$":
+        type: object
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          nuvoton,pins:
+            description:
+              Each entry consists of 4 parameters and represents the mux and config
+              setting for one pin.
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            minItems: 1
+            items:
+              items:
+                - minimum: 0
+                  maximum: 13
+                  description:
+                    Pin bank.
+                - minimum: 0
+                  maximum: 15
+                  description:
+                    Pin bank index.
+                - minimum: 0
+                  maximum: 15
+                  description:
+                    Mux 0 means GPIO and mux 1 to 15 means the specific device function.
+
+          power-source:
+            description: |
+              Valid arguments are described as below:
+              0: power supply of 1.8V
+              1: power supply of 3.3V
+            enum: [0, 1]
+
+          drive-strength-microamp:
+            oneOf:
+              - enum: [ 2900, 4400, 5800, 7300, 8600, 10100, 11500, 13000 ]
+                description: 1.8V I/O driving strength
+              - enum: [ 17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000 ]
+                description: 3.3V I/O driving strength
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-schmitt-disable: true
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - nuvoton,sys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pinctrl@40040000 {
+        compatible = "nuvoton,ma35d1-pinctrl";
+        reg = <0x40040000 0xc00>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        nuvoton,sys = <&sys>;
+        ranges = <0x0 0x40040000 0x400>;
+
+        gpio@0 {
+            reg = <0x0 0x40>;
+            interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk GPA_GATE>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        uart-grp {
+            uart11-pins {
+                nuvoton,pins = <11 0 2>,
+                               <11 1 2>,
+                               <11 2 2>,
+                               <11 3 2>;
+                power-source = <1>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1


