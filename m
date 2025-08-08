Return-Path: <linux-gpio+bounces-24076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14FB1E942
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46841A04950
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8798827EC7C;
	Fri,  8 Aug 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nzz+Wr4s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D96219311;
	Fri,  8 Aug 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754659832; cv=none; b=pzc1KN4o2OjUJ4kIgpl8uNRTZocom0wswifb3I2uPQc34dG5AXHlMJLS7N6mOb70BOtVxrvDShMZGDh6DoPXvju47hB9I2aVKeBPeYfmRdaLV4GF7a9WV92kqWyf3Jzi4QvHeJd0AA5je96mJRoGgcr444kA/K0eDZoPSNE5myc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754659832; c=relaxed/simple;
	bh=lCUlvCrkPPcH3lUHjYVr8yjc5d08GdvRQ+QSo9zyPQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoQWZvKuPDXjGZi5A5Efov20P3mDvceYmypEf6PwNNxwTByALxvTu7W8jsE3GWibjZCaLawvjTCoaKL3drpOXBK4T4DdJFa1BLuvD3AnEy/45RrShNwkYpK6ur1nHdit38p3gCWuYdjJCUelqWxzUc5DOZAuv0YSVQ1vYkCuZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nzz+Wr4s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso1201808f8f.1;
        Fri, 08 Aug 2025 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754659828; x=1755264628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEVEPSpmdmunlUBJ6D5MwQ9YzFsOPF1Igit3SsIGiwc=;
        b=Nzz+Wr4s6QS9+WGjJiS3+fn+xKc8/uAcmp+RisqbC4STDJu4jZ1y8d/RAJ+GuYWdEk
         FaG+mdTGNS7JWtZUfLVeHm9nQK8+ZSr/RYHYarmII0tyhhH+BoeoohNS4R1gPMw3eNdU
         codsh9dlKu5JgVdoea+1feD92c5p/LxAAnU0VcHBjuv+LKsEVpAfWGE/B+50EZ8bTBbr
         TsmaNkW29qFB7ZVLnZEg2WWDLM5HAgtpqq/EUAZ3tqnrMWNXOBgidSIAKeGXGL1OXzqW
         emm9ruiysU4Y8Npx4U9R7xYrxWwx/NZcAu/4CGNNIOxPeNNTg06bqgCicGk1kgPLRda4
         ouFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754659828; x=1755264628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEVEPSpmdmunlUBJ6D5MwQ9YzFsOPF1Igit3SsIGiwc=;
        b=sAMBX9rxYacJCGNl4vroDKjcEE+mqe1ht9iLY0smFceUEYz8Z/OuKdkWVIktR6O+jP
         84aCdgytK7Y3l0x5MVFKVEJT3LKwpqM2yWNAy0mcNiHPE7Wd9OXPwsybreI88wEGj6Aq
         8avF5EAHXPr8wlEhxK8GOD8htKBzPnuuDMj2figHSLFp3WEec86QzXP1XUmOCYzA1sbh
         o7kNA/c0kykYSsULvWI92kXrA/lFMlNgu3QFDznb/LZofKdRLyBEZuhd2AYrumVFyQma
         Ucjjqm3Yt4HdyZDgMkszDsbMnQyrnm51jvFXIGGAaeKRjcZwmMW6pLbL10gACeSajU1M
         IH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUJpYp3xNYWOB4uJ/97U/e3rvBmyRJMLtqoMx6owlx6N/DGSD1fT2J4JlDj6gbAKSnOsWdQGEodiHLYTA==@vger.kernel.org, AJvYcCUqHQ6BL9WT6Fem/QJN5EEg/zQ1AwgHiFcrp/Mmq4nyuhsjPggLJVysfqvuDJ5eSN5XPEYMt/67GpMb@vger.kernel.org, AJvYcCWvwjqlaA3woBOLJ/tQCNY7NprKpmkg2zZ8RmyLi7V8xApgXRBFuYzSKQlbYFDDVuUSj0GCWdtS93vE4Ge8@vger.kernel.org
X-Gm-Message-State: AOJu0YzW9YnG6sa2c9wh8ziOAnNWCR87fPKiKncbsMMV9E6DxlrhbtQU
	pOO7dNwWveKmOI0epCf3yq08YraXJ1kSRq186P52lMhe60KCDXQ2j961Kett+gMJ
X-Gm-Gg: ASbGncu+3tCMyYT2IZ/me1zov/gs1TAn6fRa1G9h7iJJwjUzltU9mPM6KwJEMFsQgy+
	NhwVEoOBiEYAXhu17Yr4cMU3VmCV+YEeZN7M+KTMVcSZuanSADOm9XNHcPIrtas+ALtwGYGNvjF
	heC3ccQIzfFP57jFU6NlugVpcxau1XUCiEMNkBuZxYVl12KU6gMfOI35UBI1b1o0BHEKUHoRsLG
	I9tdg7KnDHd6bxbKiC6Uqvg46LDY6U0hNiNVknlSQTZPlcC8Of+0Pe3LjiaLa/4p8IwSXoG3HPW
	4iw0IJXnglWZ6+h80raRn8uqjeDg75TlWzu8UXyYAqH+/7k+02eqYPYvxcitdZTTaDfi+sQRj7i
	MRBvncs+lNkqpsFcR6lgmHGwMzwow2Rg1TwOfyfWSDuMAteDfNFhWlR1ZSyG5yGs5Wc/Xnv6F5z
	Eq6FBQYFI=
X-Google-Smtp-Source: AGHT+IG9rBY8q6NigEAktO+Ixosn240fEzDcvqk3SXn87WlR5TbJqAE/7oIkbq2157tohoTAlzCaNQ==
X-Received: by 2002:a05:6000:400b:b0:3b7:7936:e7fb with SMTP id ffacd0b85a97d-3b900b750aamr2466519f8f.30.1754659827468;
        Fri, 08 Aug 2025 06:30:27 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm31527769f8f.70.2025.08.08.06.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 06:30:26 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
Date: Fri,  8 Aug 2025 14:30:15 +0100
Message-ID: <20250808133017.2053637-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3->v4:
- Renamed DT binding file from renesas,rzt2h-pinctrl.yaml to
  renesas,r9a09g077-pinctrl.yaml
- Updated the title and description to include RZ/N2H SoC
- Updated description, fixing the information about mux functions
- Dropped sd0-sd-tmp-pins sub node from sdhi0_sd_pins in the example node
- Added reviewed-by tag from Rob

v3->v4:
- Used patternProperties for pin configuration nodes
- Expanded example nodes

v2->v3:
- Dropped refference to gpio.txt instead pointed to
  in include/dt-bindings/gpio/gpio.h.

v1->v2:
- Added a new DT binding file
---
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    | 172 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
 2 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
new file mode 100644
index 000000000000..a45b3d854dc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/T2H and RZ/N2H Pin and GPIO controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  The Renesas RZ/T2H and RZ/N2H SoCs feature a combined Pin and GPIO controller.
+  Pin multiplexing and GPIO configuration are performed on a per-pin basis.
+  Each port supports up to 8 pins, each configurable for either GPIO (port mode)
+  or alternate function mode. Each pin supports function mode values ranging from
+  0x0 to 0x2A, allowing selection from up to 43 different functions.
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


