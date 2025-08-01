Return-Path: <linux-gpio+bounces-23960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A482B1852D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E135447F1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AF827AC35;
	Fri,  1 Aug 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZmOM4NM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3D1C7013;
	Fri,  1 Aug 2025 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063164; cv=none; b=IvjXilH/QNYPgIaxIeD29MCKZurQgoGCJgCSaQ7fa/P1nOe82WKfMA7TygNOvlflrQip8c8ms/fySYFvPp4wBu+rvLofYzbk3Jt1FWpwZPyN5w1HQIE5CQvp3kw/+i09ikW2/Dzgm2Y/mcow+1KbPIbdqgmkPcEQgEZl630HYoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063164; c=relaxed/simple;
	bh=EcMd7Y4Vze/cNlR9g13KLE4fw7Tz9Uy3g8iFJRjmkVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOskZDyq4to9F8sjSg1REzVGK0U+uOMWc2lkE3VKvp13I1osxGBO5uDQ+vLwqU3gJh+E0otlxqGSJyOOwcEM3flZI10wE9UWkz/XejrH7TJBYjhTL3VuD1vvMoI4frxCuSMkXApYL8TizMWqooN8KwWagOJk6TV3MTTOPlmlj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZmOM4NM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so17554235e9.0;
        Fri, 01 Aug 2025 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063161; x=1754667961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4Rl0BWwQjRCFxrN7MGEH2r5vVaso2Ia/We/ifeC6SE=;
        b=IZmOM4NMpKi4T1miB3Z//yPtB3sJhZWFsxrQPQ0MucRPyESRI1JAlFLXBHR9uxWx7x
         drtQa0U/hLWlCsNy7IVYV041vzkoi1BE85uOj7p+T0DjzJFhnhRwfzwWKvoTYGWJTuLa
         QNpcUbxBYTAJWkNidiaWoOTGGeRc+CWFywv8ZxTba4CpXPRlPwtiw6IvDgIiHh+FD0yn
         lPIUK1FzvK5EDZPW2fkGfyauqi8KOJYai0Hb0AS1J7KNJvEgWUkzIP1rdIK6lpNdMQ9x
         YQJ+ajbuWNchh0uRusFDaET+Bm14VJQD7MOeXKI0nkE5czKyiUS9cPF8SNPgbAqFySYb
         4+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063161; x=1754667961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4Rl0BWwQjRCFxrN7MGEH2r5vVaso2Ia/We/ifeC6SE=;
        b=PbB6m8jOMK298WAaCPewCnhiqLBkdhSlJgBPIHak2crK+72IqkD2d4e2eqrCz1PO6h
         1uqV1a5XGIgdN610jaCYYvm31tfA2pO4d6Cb/G10C1+oMvN9T7XhWyRcJeDVULNoSFmB
         HV22FVPE2ZE3HyMqOMSP3K6MSu9WUOjZp3aayhOwYXib803TSU7ThvADz4/vj8h2G1aV
         yvLz08sEX9Wm0N4FNcY9aQsGe85JFRpIYFkLh0weEZec8vSi+z8g9oCFRoWEUiknjRJq
         xAbi19CttBcM4xeZIjSo9QBw8ICFDtq9BCJONw2gXEhrrjtngRDs5vinMghBksuGETiV
         oOZg==
X-Forwarded-Encrypted: i=1; AJvYcCU9vKNEBh9qgP7kEgeOku9vfQvNIulCYV2BMKfLxBjOAQ9wmoW6ZNnedrV3+d5GnDFLYsWQEyHc9KPXEI5e@vger.kernel.org, AJvYcCUQd/6ukniRj7INtC0QAbhve0F/WlpbmFjjM8ONjyC/icoAeulfZLfkbcd0Ux2bwXn0uMnp6+eOZ03G@vger.kernel.org, AJvYcCXgVhRFYFgYXKQGrXi2MgbPuoEYcYY4FkaZZ8AlJ4HrGhiFdQSk54g1GLuS/oRl8SLgp5coe4vhecf9AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUCYvk3lbDhnjB6NTzoIytkxxLP89d7YzrrFGfkG+UZCskBIa
	LfRgwYMS1D7U0CmiTt2XhMBYEFYuvSTosB7XoI5IWL3TbW58rN2DySMs
X-Gm-Gg: ASbGnct/04iTRcLmWYFZLlpM4c/wzuCd/CoHLO3pYMDjwaM6ei2/gGWN25MKLCXM98g
	fArHdbG2L/GfvK/KymwTsBXYHow4CUqzipC1PGSkT5IQteD+IP+vsbqkej3jD2Onk0jUs4/6ntX
	cuRWRVF1/rWXGtn7RsQ0TJu+h/Jv4ewV53kzearM7Wc26OCBXhisF3rYUnzY+6O9nR4KGTgDx4B
	aY09VXAB7QFQULJVJQBq7kyrTKYa6D366dwCnvfSgOcNEthfwOj4FC+wsiM+Z29LwGcEkqE7+9m
	P0YDBRLCeVLswczBaU6ALwbNHdh1j6UMebDqHYsjKP0d77djbukCq8bmVuVTgEndDqJPkEGWp5k
	kaQYE9odIKOJbMyc3tETUE2xMKUHuie9ofC5cU/FVuMuIerdHBtb0marCklTyajKNrr1tAmoleD
	tE6ZGGqm4=
X-Google-Smtp-Source: AGHT+IG/x6a/kL/PEtvuz47r/5+5r6rqXMV87iRPNHG7/g+htuRBvtSz9Cqx5/jHJInNMvGgZvHlTg==
X-Received: by 2002:a05:600c:c102:b0:456:23e7:2568 with SMTP id 5b1f17b1804b1-458adbdf7b1mr24420195e9.13.1754063160805;
        Fri, 01 Aug 2025 08:46:00 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm6194406f8f.52.2025.08.01.08.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:45:59 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
Date: Fri,  1 Aug 2025 16:45:48 +0100
Message-ID: <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- Used patternProperties for pin configuration nodes
- Expanded example nodes

v2->v3:
- Dropped refference to gpio.txt instead pointed to
  in include/dt-bindings/gpio/gpio.h.

v1->v2:
- Added a new DT binding file
---
 .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 177 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
 2 files changed, 199 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
new file mode 100644
index 000000000000..b93643598961
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
@@ -0,0 +1,177 @@
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
+definitions:
+  renesas-rzt2h-n2h-pins-node:
+    type: object
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+    properties:
+      pinmux:
+        description:
+          Values are constructed from I/O port number, pin number, and
+          alternate function configuration number using the RZT2H_PORT_PINMUX()
+          helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>.
+      pins: true
+      phandle: true
+      input: true
+      input-enable: true
+      output-enable: true
+    oneOf:
+      - required: [pinmux]
+      - required: [pins]
+    additionalProperties: false
+
+patternProperties:
+  # Grouping nodes: allow multiple "-pins" subnodes within a "-group"
+  '.*-group$':
+    type: object
+    description:
+      Pin controller client devices can organize pin configuration entries into
+      grouping nodes ending in "-group". These group nodes may contain multiple
+      child nodes each ending in "-pins" to configure distinct sets of pins.
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
+
+  # Standalone "-pins" nodes under client devices or groups
+  '-pins$':
+    $ref: '#/definitions/renesas-rzt2h-n2h-pins-node'
+
+  '-hog$':
+    type: object
+    description: GPIO hog node
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+    required:
+      - gpio-hog
+      - gpios
+    additionalProperties: false
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
+unevaluatedProperties: false
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
+        serial0-pins {
+            pinmux = <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
+                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
+        };
+
+        sd1-pwr-en-hog {
+            gpio-hog;
+            gpios = <RZT2H_GPIO(39, 2) 0>;
+            output-high;
+            line-name = "sd1_pwr_en";
+        };
+
+        i2c0-pins {
+            pins = "RIIC0_SDA", "RIIC0_SCL";
+            input-enable;
+        };
+
+        sdhi0_sd_pins: sd0-sd-group {
+            sd0-sd-ctrl-pins {
+                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
+            };
+
+            sd0-sd-data-pins {
+                pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
+            };
+
+            sd0-sd-tmp-pins {
+                pins = "RIIC0_SDA", "RIIC0_SCL";
+                input-enable;
+            };
+        };
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
2.50.1


