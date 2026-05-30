Return-Path: <linux-gpio+bounces-37724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPjoOEv7Gmok+QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:59:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A492860D9E6
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84A52303CC5E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD12E3242D7;
	Sat, 30 May 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMUJy1dD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107131F99C
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153097; cv=none; b=okpXDdsr2AE6nLTZLlmXlrOGg4e8wpCOyfGk2U8CL9SP+zKJd9Gz9rtCGwHoxqrvQ67Si53zztqOEA0cizvYZXuC3soNaCFDmf7hUpS2M3Iofw96pgQsiqQnjzbiw7Pv+R3f37sQaGuvvDzX16F73PjTBHNq0mUc3Huw0qY5S6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153097; c=relaxed/simple;
	bh=KQ0HWbIe4sT9g4WWOwKDTbxWBgMTUypAxBBFAFnBohk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCIOGc+zc7353PKfwtBqhnJW6Tm/TeHBoJCKW4cdsK7BC9GiZdJz8+7mpO5BO8kHpZwTc1tmiUYPizZx7/mHuX6Lzxj7QxW+zivqMyTLXBnWUoDMfPy+x7lMgHqZhtnozt9b7xxjxe1QAoQtgddz0yQaQyMC1FGTwhT/YdwUqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMUJy1dD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ee1a56328so3067336f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153094; x=1780757894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFZAUjYaK9FWKgvs/ixolGySq1VzA8CfDWl5e2+n+8I=;
        b=bMUJy1dDeyPzL7dsm3f5AI6gIPREw/Z4cv+j5+ttCiN7z1UtQaICVdsy1c2Txxnw3V
         5F5GQKoOzQNXTSdWwZUUpz88W7ibpLIt42p9dfhmJ4ZoydfH+6MRkXLpNFYj3TWXZfoi
         rR4gZt89GPzLeGstsF0P8op74HJ3CvkjySqm+zSFpcP/T3sNimTRtjAcYmaqdosleir8
         T3H7a9DGraFkqND+fnzR0ltOIuFNqj1d506hV4MT5ullHTSD0CSc80YQ9Kz3fUcLDXxH
         FOeen9ZeRq/N7taB8+V4bYYHIDPaY2/AzwNzfpEYnLGUHqA+rfzetHRwg2dC/j0mqqbT
         Rakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153094; x=1780757894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFZAUjYaK9FWKgvs/ixolGySq1VzA8CfDWl5e2+n+8I=;
        b=XM+hu3wmTKUBh+GMOXeZK16TPyQRwVzDcV8+XY00YX1X/Frw8wlUCQThseVl0NjAco
         b7nMeLcwcaMpQ54QDK2z7kiFUIAgt6qx2aTg1w52go1GfpL6sxPOcsscGd1krz74UF1N
         FhWKww4AhYWhKynj9hL4K68JakHS22cks20fZuR15dYdcZXWhABvu7+VcydW7mptEc+d
         dZAyR+oPeinoGGwLedm3YatKKnbGlLzolfGN5KtZ0a0w9uPWDYHUcWChBXlzSJWq31Sw
         jz9japVWLPF+wIjAToIFYmswUCclgDeOGsFHhrtlwNsTXKyg5QAdPWj3ovcrNvpZWglr
         vUFA==
X-Forwarded-Encrypted: i=1; AFNElJ9mU8OcrGuk1sn5BfErXnOery/X39TMK/HCUX75Mzbi5yDo/1ZKDmSlVYpWOk6jypAXF3WTddl2eKb+@vger.kernel.org
X-Gm-Message-State: AOJu0YzJuUxEE2T1Xy/HGD/poaBMdKeEPZL2yAFeYY+d4LUSbV0Jkd5L
	mb0m1cQyngNbNDogzqLJpWGY2uRmtu2mKrPSX+trq7xSrgPAx4TMQIDvilFqBA==
X-Gm-Gg: Acq92OFgPxgZIjpG+zNmLHF8n9IWJMePS6sAE3WstawHkAZndTR+JwiblguPlPdw/UR
	w1KwHFFdvqamfRJhfuUDiSaPzJlyg932WGOvfR2AvLrr/UNDwLgf70e5AMnMbt1AKlzXf7+QDkT
	PES/muB/zTr9/ZZEGVRv81f3ECg9g1H3TYIlzGhl4080Ea69PqiR7gv5n5HQ4oad7InQGd1msuX
	NkUgWsMxTX5EWFd0EnoFiGVIzd0DVQfBcR9yg9+uOrsloiGEYrkIPOYzpRvzri0/MUrKqh0X8BJ
	873As7YYRroROYqJt1MDYP2yf4dsrT2AdEYc/hma+251uwU39O9GYOF/km1B1g50h2c8mdeQZOl
	kYbcFZKwmg2HqhCdcWpjUlGVR0EXOjryAGTYSExOTGfO9pM1MB6uWMOBpvejkLklrdOMnvRTTM0
	5+9Zo6i8AXTlyPu373jaxExKEDCckMy0M=
X-Received: by 2002:a05:6000:b12:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-45ef6aec9c7mr6669746f8f.3.1780153094030;
        Sat, 30 May 2026 07:58:14 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:13 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
Date: Sat, 30 May 2026 16:57:55 +0200
Message-ID: <20260530145800.1029920-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37724-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,lists.infradead.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yassineoudjana@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,collabora.com:email,protonmail.com:mid,protonmail.com:email,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.152.170.8:email]
X-Rspamd-Queue-Id: A492860D9E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yassine Oudjana <y.oudjana@protonmail.com>

Combine MT6795 pin controller document into MT6779 one. In the
process, amend the example with comments and additional pinctrl
nodes from the MT6795 example, replace the current interrupts
property description with the one from the MT6795 document since
it makes more sense and define its items using conditionals
as they now vary between variants. Also use conditionals to define
valid values for the drive-strength property as well as items of
the interrupts property for each variant since they are different
on MT6795.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  67 ++++-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      | 228 ------------------
 2 files changed, 65 insertions(+), 230 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 4dc9504e24ad..2124804c8863 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -8,6 +8,7 @@ title: MediaTek MT6779 Pin Controller
 
 maintainers:
   - Andy Teng <andy.teng@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
 
 description:
@@ -18,6 +19,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-pinctrl
+      - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
 
   reg:
@@ -81,6 +83,45 @@ allOf:
             - const: iocfg_lt
             - const: iocfg_tl
             - const: eint
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6795-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: base
+            - const: eint
+
+        interrupts:
+          minItems: 1
+          items:
+            - description: EINT interrupt
+            - description: EINT event_b interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
   - if:
       properties:
         compatible:
@@ -99,6 +140,15 @@ allOf:
             - const: iocfgb
             - const: iocfgr
             - const: iocfgt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 8, 12, 16]
+
   - if:
       properties:
         reg-names:
@@ -170,8 +220,7 @@ patternProperties:
 
           input-schmitt-disable: true
 
-          drive-strength:
-            enum: [2, 4, 8, 12, 16]
+          drive-strength: true
 
           slew-rate:
             enum: [0, 1]
@@ -263,5 +312,19 @@ examples:
                     mediatek,pull-up-adv = <0>;
                 };
             };
+
+            /* GPIO0 set as multifunction GPIO0 */
+            gpio-pins {
+                pins {
+                    pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                };
+            };
+
+            /* GPIO52 set as multifunction SDA0 */
+            i2c0-pins {
+                pins {
+                  pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
deleted file mode 100644
index 68e91c05f122..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ /dev/null
@@ -1,228 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: MediaTek MT6795 Pin Controller
-
-maintainers:
-  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
-  - Sean Wang <sean.wang@kernel.org>
-
-description:
-  The MediaTek's MT6795 Pin controller is used to control SoC pins.
-
-properties:
-  compatible:
-    const: mediatek,mt6795-pinctrl
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    description:
-      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
-      the amount of cells must be specified as 2. See the below mentioned gpio
-      binding representation for description of particular cells.
-    const: 2
-
-  gpio-ranges:
-    description: GPIO valid number range.
-    maxItems: 1
-
-  reg:
-    description:
-      Physical address base for GPIO base and eint registers.
-    minItems: 2
-
-  reg-names:
-    items:
-      - const: base
-      - const: eint
-
-  interrupt-controller: true
-
-  '#interrupt-cells':
-    const: 2
-
-  interrupts:
-    description: Interrupt outputs to the system interrupt controller (sysirq).
-    minItems: 1
-    items:
-      - description: EINT interrupt
-      - description: EINT event_b interrupt
-
-# PIN CONFIGURATION NODES
-patternProperties:
-  '-pins$':
-    type: object
-    additionalProperties: false
-    patternProperties:
-      '^pins':
-        type: object
-        additionalProperties: false
-        description: |
-          A pinctrl node should contain at least one subnodes representing the
-          pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
-          An example of using macro:
-          pincontroller {
-            /* GPIO0 set as multifunction GPIO0 */
-            gpio-pins {
-              pins {
-                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
-              }
-            };
-            /* GPIO45 set as multifunction SDA0 */
-            i2c0-pins {
-              pins {
-                pinmux = <PINMUX_GPIO45__FUNC_SDA0>;
-              }
-            };
-          };
-        $ref: pinmux-node.yaml
-
-        properties:
-          pinmux:
-            description:
-              Integer array, represents gpio pin number and mux setting.
-              Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
-
-          drive-strength:
-            enum: [2, 4, 6, 8, 10, 12, 14, 16]
-
-          bias-pull-down:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull down PUPD/R0/R1 type define value.
-            description:
-              For normal pull down type, it is not necessary to specify R1R0
-              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
-              will set different resistance values.
-
-          bias-pull-up:
-            oneOf:
-              - type: boolean
-              - enum: [100, 101, 102, 103]
-                description: mt6795 pull up PUPD/R0/R1 type define value.
-            description:
-              For normal pull up type, it is not necessary to specify R1R0
-              values; When pull up type is PUPD/R0/R1, adding R1R0 defines will
-              set different resistance values.
-
-          bias-disable: true
-
-          output-high: true
-
-          output-low: true
-
-          input-enable: true
-
-          input-disable: true
-
-          input-schmitt-enable: true
-
-          input-schmitt-disable: true
-
-          mediatek,pull-up-adv:
-            description: |
-              Pull up settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as
-              below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-          mediatek,pull-down-adv:
-            description: |
-              Pull down settings for 2 pull resistors, R0 and R1. User can
-              configure those special pins. Valid arguments are described as
-              below:
-              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
-              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
-              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
-              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
-
-        required:
-          - pinmux
-
-allOf:
-  - $ref: pinctrl.yaml#
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        pio: pinctrl@10005000 {
-            compatible = "mediatek,mt6795-pinctrl";
-            reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-            reg-names = "base", "eint";
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-ranges = <&pio 0 0 196>;
-            interrupt-controller;
-            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-            #interrupt-cells = <2>;
-
-            i2c0-pins {
-                pins-sda-scl {
-                    pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-                             <PINMUX_GPIO46__FUNC_SCL0>;
-                };
-            };
-
-            mmc0-pins {
-                pins-cmd-dat {
-                    pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
-                             <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
-                             <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
-                             <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
-                             <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
-                             <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
-                             <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
-                             <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
-                             <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
-                    input-enable;
-                    bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-                };
-
-                pins-clk {
-                    pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
-                    bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
-                };
-
-                pins-rst {
-                    pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
-                    bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
-                };
-            };
-        };
-    };
-- 
2.54.0


