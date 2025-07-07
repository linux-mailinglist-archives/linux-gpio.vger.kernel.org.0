Return-Path: <linux-gpio+bounces-22889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5DAFB5BA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8DB4A2E7A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636A92D8779;
	Mon,  7 Jul 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4T5odjR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A722D8371;
	Mon,  7 Jul 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897936; cv=none; b=RI2H21xhFCfraRRlM3VAQjual/1+Xc+OBevjeIYjxnr7bmK6M3O0zmbsZ/ZDJoNzMG4+XO3O9yJntUTKQpNQ4VW5mk+Y9CID28dJTqEjBMzX3MklS2FeohuXszreW8VMTrBXfsS9gtntTnNlDDea4XWZrw3Ob7JVSDyahDkHdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897936; c=relaxed/simple;
	bh=NOZc7un03Ey0gmPzOir0UNu2yUPYNopFYExaS+yplPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvREmsFEeONXEyfg1bMMMGSMi+Xw+u0jFAXGYRfDvlPXPO50jgb6kfN9py6Fhi7kU3CM9VQZjIC/l0JB2U8t8rAS0qFxwCySoD77xahSuHwtppk8BYDohwG9/3Aponzntu1/eyeVOSOoXNkSiHdE0MMznYkagu1wq2ZNmFvRLyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4T5odjR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso19701885e9.1;
        Mon, 07 Jul 2025 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897930; x=1752502730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZG+6Kvpw4cXSgWih98fLU49OAPritoAzwNthu8La5Y=;
        b=d4T5odjRsMfnLm81+Lc36UZvbsLL/5cg7WBocDaL8jO602arbmk6Rm2kxUr2De77xL
         12al1AdDKbhyx8xBovEKJw0SXvRBnoiy+c4MUDZPD1eEXGiroqeQkqT9/CgfK48sMcCF
         YyczI9SC+CLAxvhYDnYDV2BYukuDovaNI5XyDHEPPfpnxGDQlJ5CbwtuDNq1+L1ynNv1
         VBEGwoutDNEaseVdEchERvrOGWT8zOH7ctq2xsyT4fKt0W4799ziyB49XwLwmD/LvLkP
         imf5WuW2YbrHjQtnme/y2awRIFXphwqnCNzTsdAJA7tD4ElzZBG8yMrYRPkT1VqrBBWo
         SSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897930; x=1752502730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZG+6Kvpw4cXSgWih98fLU49OAPritoAzwNthu8La5Y=;
        b=PJlqW5rFXvKpJPKLJSHsELAPQpYAiP0cPTBEyJewouFHivpVIGUzTRmzMzmB65adzn
         zWrkjnfkxb15B/i5V4LAM9FgelxL+DTnSPMR/aA/oieYFetZV4EjZRwJ9TTsDy9tgoXc
         +I/GsbTKTpxLXNbB0lM6O5NjES7XYrkMxpvIzS/ILt8l01jPRW9Z5T64caJVNskj3DLH
         UDYWA+NtuGXl1x1nq6pJQJHmml3YPYqXElWwizgRy2/tUXwonhydM4UOkR3ga61OnczE
         ZBubziUUALGz5qXUprhfPx96Kc+f27YhSMM0P8TdLn+yZZ7lfFBveJWG537zHutSawsL
         0UFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCvIS+ycDfYfoQN4B1cFyLJbSQQbHaOrWYAIJwD2azGFxIxkBjfsNOlpRwrYLKGxwJs7JPS5FlxnRlKDhP@vger.kernel.org, AJvYcCVZnuIHQljQKYpAkpbvzV8XfdUoBntcNjzVhG4ZEj0YoiE7RVTb1Vq6P0bJmPQqd5du6Qx00gn+sOH0fQ==@vger.kernel.org, AJvYcCXz1/x+P3mapbEmwMpn753Ic87M4GHGuqlReM8ehWC6KNmBAG+kymgvhbV3As61J1why85U2aGDrB7D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdyjne+Lw1i2NoxkskjWnbmu2hv7H+Y7xkvZIEooHj2qjIIV63
	lS7H1q3lYYGQl6+iJ0zF+WnE0dBkc4XmLN1pWJhkZLAVIMFXUuIPpMqv
X-Gm-Gg: ASbGncvVHj9yQdQG4ehnRYNFp/48u9Jf1r5pThCpD4oHInXsC+Sz6x4n2a41HJIrwxm
	L/z7xIYYTw1lzx1Jf5NK71snWXwSeXyuL8fk0towUvuA1ulXV9ymLglAxpgpi/SOfwuR+8cArHf
	I6R24XEk5JshXniT3m3ynWOzUpr8KK0Rs3ztSphIztCgOBK8EAg//ax949nnhlxdY8hMelV44DX
	bLLDI9sXaZOqQkfagVw7XPlGVXfdJWSdNxZAgo/Sg7PvQ1FwHAm+I9W7JxQMoZ/Ue0p/hmuHyAT
	0dOErp6XLXFe8zFiBMEVw/t4+vSpes7mBNpYVLOHXRjY+lPIXxWnPllcpHp9nHB3fWDAvZwIDMz
	rJ52/19/tSFoWFm7ZOsM=
X-Google-Smtp-Source: AGHT+IF8osvRnUApHFrMkhCX+isGtvHJffC3wQCCYEa9mkQPOUHt0afFVtS27sCO05kuGlg4L4d2Cg==
X-Received: by 2002:a05:600c:648a:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-454b4e76b63mr105086555e9.13.1751897930402;
        Mon, 07 Jul 2025 07:18:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b966cbsm10131868f8f.49.2025.07.07.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:18:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
Date: Mon,  7 Jul 2025 15:18:46 +0100
Message-ID: <20250707141848.279528-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the pin and GPIO controller IP for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
header file used by both the bindings and the driver.

The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
Both share the same controller architecture; separate compatible
strings are added for each SoC to distinguish them.

Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped refference to gpio.txt instead pointed to
  in include/dt-bindings/gpio/gpio.h.

v1->v2:
- Added a new DT binding file
---
 .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 132 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
new file mode 100644
index 000000000000..ead5ab7e7ebb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,rzt2h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/T2H Pin and GPIO controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The Renesas RZ/T2H SoC features a combined Pin and GPIO controller.
+  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
+  Each port features up to 8 pins, each of them configurable for GPIO function
+  (port mode) or in alternate function mode.
+  Up to 8 different alternate function modes exist for each single pin.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a09g077-pinctrl # RZ/T2H
+      - renesas,r9a09g087-pinctrl # RZ/N2H
+
+  reg:
+    minItems: 1
+    items:
+      - description: Non-safety I/O Port base
+      - description: Safety I/O Port safety region base
+      - description: Safety I/O Port Non-safety region base
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: nsr
+      - const: srs
+      - const: srn
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description:
+      The first cell contains the global GPIO port index, constructed using the
+      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+      (e.g. "RZT2H_GPIO(3, 0)" for P03_0). The second cell represents the consumer
+      flag. Use the macros defined in include/dt-bindings/gpio/gpio.h.
+
+  gpio-ranges:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+additionalProperties:
+  anyOf:
+    - type: object
+      additionalProperties: false
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        Pin controller client devices use pin configuration subnodes (children
+        and grandchildren) for desired pin configuration.
+        Client device subnodes use the below standard properties.
+
+      properties:
+        pinmux:
+          description:
+            Values are constructed from GPIO port number, pin number, and
+            alternate function configuration number using the RZT2H_PORT_PINMUX()
+            helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>.
+        pins: true
+        gpio-hog: true
+        gpios: true
+        input: true
+        input-enable: true
+        output-enable: true
+        output-high: true
+        output-low: true
+        line-name: true
+
+    - type: object
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - clocks
+  - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
+    pinctrl@802c0000 {
+        compatible = "renesas,r9a09g077-pinctrl";
+        reg = <0x802c0000 0x2000>,
+              <0x812c0000 0x2000>,
+              <0x802b0000 0x2000>;
+        reg-names = "nsr", "srs", "srn";
+        clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 288>;
+        power-domains = <&cpg>;
+
+        sci_pins: serial0 {
+            pinmux = <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
+                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
+        };
+
+        sd1-pwr-en-hog {
+            gpio-hog;
+            gpios = <RZT2H_GPIO(39, 2) 0>;
+            output-high;
+            line-name = "sd1_pwr_en";
+         };
+    };
diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
new file mode 100644
index 000000000000..c73a7f25ef5c
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/T2H family pinctrl bindings.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A09G077_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A09G077_PINCTRL_H__
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
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G057_PINCTRL_H__ */
-- 
2.49.0


