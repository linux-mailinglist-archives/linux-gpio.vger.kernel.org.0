Return-Path: <linux-gpio+bounces-22186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E669AE83AF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD9C3B1E99
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 13:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051832638B5;
	Wed, 25 Jun 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed4Yqmx6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3609262FC0;
	Wed, 25 Jun 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856840; cv=none; b=nSKJWYD5331+uEiTZ/yXrGUGnIS6mxj07Yn7bTj73IgT614nwfGc/ANGwGIxmVEuCPwl8sdJsSSs0wzw4C2cMXRQ/a3rzZP/hT2TPXjL00h2srbjSSl/Xpm9QOMCfUBaWvuMp1OTSLC+vh1oT9uUCndrmNLgtAb+PZ/ldPncPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856840; c=relaxed/simple;
	bh=f95DOKQVMep6lO3UUHK3f9g7UT18EOcgr6xRPTyj3xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jD3DoeNWdD+QI8W22XGvtYWMAwtQvBMHEvF3kTnwCfAo9DlL6Gt3qeYjutols4CSMIFFB+lNflw6vsuEKXMDcFqYkcqzKTuykG2JEKaZA+NcyGme7aXIKjdOsZESX74bCXAwEkzXFcrDFGunT0SboGKqBIHfm46RcDmeSl6CATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed4Yqmx6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso6173505e9.0;
        Wed, 25 Jun 2025 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750856837; x=1751461637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XTvu4T6vOLKw4MlWKI9rFWklghuE8nfkKISZOl5Lrw=;
        b=ed4Yqmx6pyhny8mSXaXuKNy2jtdn4Sn9vD4YPnPKegkgb1XY/ReTEtWzfzaayBpOPz
         RKjDXIxQjNYxKZ2mjI32G34QN9XuAv5m693trdzgnVYcT2dq2//tFNdXeUbLbBN3eal5
         f9GgMw8BivWsxsYIz3A2qRVhz1TgruCNay9s8P697MvTNhvVQOVawsvdI5ZVScIvU61c
         4L2uidswYV+gn3+oUi/2iVeMDYEXbiEeRPz6PY55ZFneTXvzGZ6K408y/whzKVxj5KM3
         jLfUJJvYGUEp/HfOmrqP1tjzCO2YXFQPtxc0IVK2zVOABOhmfswlUP2ST6i54ooOzmYs
         l7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856837; x=1751461637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XTvu4T6vOLKw4MlWKI9rFWklghuE8nfkKISZOl5Lrw=;
        b=PW8lRfw0W4OL5sFI6+CV2PfMGmDdBcgsoh3Wy1L58pF1Pfl8pGKwXoPDFVeZpKHGpS
         +s26yo2PDRSGVYCazRJz6hY7F7CEwlHInlmzHGFRIhKRkWwP/qoAG3EgNxzRbWI1x0nK
         1vbRNWSdeFrxuRqnishgvWN0dq/A5x9mlSiMoWVSRvVSiU0m3IFAYY2p1fVKbXiJwMIB
         rmeWiImoogDuAF/m9XLJ2P8dEER0kiz9+Agj35CvrIaG0yvDRdkJXJ3LmwZRC0oc3BTC
         faa+XfdmFULkXqaOGFzN2oux+KcxnDvKbrXW5WkEK6mCrB+5aNBZA3lRV3olqna7W1KT
         brsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOHaAgxg9XwGvcb7FqpnOoiDb5dYz6PHy8xD2TjguWkpyhDHyD2YlMaKj858mg8/MNOb6wCcRPAmEFpw==@vger.kernel.org, AJvYcCVM3N/xZOczjra2ruwzTr+UanCM+xWV5T+Ojw/r9D2Wz+2pFgMuJ2yLuzsvFe8jqBSHGPvKHcycGd3bij5f@vger.kernel.org, AJvYcCXtKNR5EmRELqDjRqSOTaWFeFuWOXI0x5wd3qCT2ArItoFGGIV/gQ/NuFJu4qBaGh5l1hpjEsskwn6M@vger.kernel.org
X-Gm-Message-State: AOJu0YxZzZMcIF+E3y5anG9lbI9efc7DlQuj02XG4LLa0ams2NCMESuy
	Qk0IcoWBbGxmuEde4Hh0j8ECwO6SGfFTbnCwMaBxjOG6SD64rzp4pH+X
X-Gm-Gg: ASbGncv/AwJAulEL34PTX9xp23Ud6DWJPw9TdKlau25ffvNOXqYb/YfxFURCkOxxHfD
	W2xSSVmgHKKZwQM6gAdHkWYvWiUMyXUZ9v5jfc2m43NrKNEP+3W7jGJ5YHy7g2MeYqZzLJYrYfq
	4sSn0Zb3R6gKEX1rio74Y5iZgn0k2bz2EbdJta80jyMKyeKAC2cRlmSabj7JVF2bzbuURi3m1N6
	8tCoRjXHt3U6ScnfpInHbQOmejY5FD5nfsp8WNpiJGUo06goMcvu01F19GoXKAg0R1NXCPirGca
	urz2WxQydNA6im5XhuuRMw5gMOxU0ISRrUUIVPX+xRGvYGpAXmix34/zSJO7TB7TIOBL8uu9xWi
	RO45IGQ4dObkRRUpYOuD+
X-Google-Smtp-Source: AGHT+IGbo4sOV682McFTuPaUh/THdXf/l4I9qYOuWibwScuv2gUQ3VqqTaJnIUMv0SB6N/CpSkFdoA==
X-Received: by 2002:a05:6000:400b:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a6ed64b6b0mr2878903f8f.35.1750856834924;
        Wed, 25 Jun 2025 06:07:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm4548501f8f.83.2025.06.25.06.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:07:14 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
Date: Wed, 25 Jun 2025 14:07:10 +0100
Message-ID: <20250625130712.140778-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 000000000000..d3886eab93fe
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
+      flag, as mentioned in ../gpio/gpio.txt.
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


