Return-Path: <linux-gpio+bounces-11182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333199A347
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844F91F225A3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57B218591;
	Fri, 11 Oct 2024 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb90vxsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2547F21791A;
	Fri, 11 Oct 2024 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648366; cv=none; b=aSyxQzLweImTHkO2zNZ72scQf/4RUUBwkvnjSo1Jxy4GwxctCVVIJlHqd8tBF2u55zK0iEf8NNyw7t/vat5AaU6UWyAkWCpnqHAuSX8S2uqN14xecsWjNBTr/s4sor/s9UuWIlaKMr4UWdBYeOOt7AV4ufy8YvSv1o6K8bFPccw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648366; c=relaxed/simple;
	bh=ZS96SXEKz25p8BkZyMw1UOyObzO3d4IH8fSU0usgcqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ic18H6MNOr/BRqYgXYb/VJbsa39hvYvMExshlUUIpp8PYGT4z2ZnsU19HtthSjrgjGJZhebRIlqtJc4N97iHia4Rv1R83fYcGFIzDahFHpH2xc1N4ydZIsqPFdgRgr8lRHRAhBYpzoRh5OQH//zcyBy3R6IEQoF9nO8qhVeG2GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb90vxsV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a995f56ea2dso311982466b.1;
        Fri, 11 Oct 2024 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648362; x=1729253162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbkJhBNvbLA0rU5pxqbPnArYwcfJhzHvFfnKZnLNyWk=;
        b=Sb90vxsVMWzZe6bIEcsEFY20qP95T2S0sra5/M0Me4NSBQMvgEIeSUv1awmq7shhKC
         rkPsTnA5FWcK2Racssv4l3P9WQXV18taBFivErD19pwVgVFtwqWGoobi7xDayr/IIRrG
         EKTxfde5fMyvxe3vCJKLj8LXWWA3jJFY1H83SAG5AoIjETrFyhmQ1VgIFx+SMiW0iI/7
         LC0nIHNsnAcQhN45jAl76zKJw2UqmQ/H0xGLDOUiXdt+eyAQVQNSKtS8md9FFjLScYUl
         bYpbtYtOEpz1DW8euEBcjILXxzq+Is5jvR9pw6FSlSgvzHmiydSFEBci1vDhsAssR1O+
         NNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648362; x=1729253162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbkJhBNvbLA0rU5pxqbPnArYwcfJhzHvFfnKZnLNyWk=;
        b=LmXuKDjJ1KVP0tzGdrzGwkuUWdCOLi2dAV3RwrOuOs/G+K1JThmq8Mtp1ItO5KdrNb
         V/ubwamFr9sSIaFNy/2Ab80cCS8B5q2KleGphym/ROvUPq5RS95gSqdYlQ2EVG5eMxJE
         qcyzd+rWu55pjciTVB02En0yJ6l76AW/licjhe0X0aRzk1zppC4FOT94K8CSh9h84DHn
         GPp845VGEWIqVWZzq23fDf4T/1778dJKf3h6jbG93wSGLveTJRYPbTdgyLbZgQBUzDcv
         0r83pjfshhddYZw88+BnhDsIY3Fgd0ZY0vnhBqMTr3TsMvcCeWZrJLPiCREFGi+y0fH6
         Ziwg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ykrr9lwCscz94r8/p8nek0hOA2sp0HAANDcJHQnx/pfbQhPTeWQamBUz3xPA/6Kppc3WirPJZCmY@vger.kernel.org, AJvYcCWSudnSQHFoAWIVrP7BUr+h56OIiq0rhjF2b2TMizeDXooX3YuBlljlUgcgQOj/PgDwXBwJtP3d5dGAuNaq@vger.kernel.org, AJvYcCXXg1S7GsYnAKz+YbTvL7CwlX4cykNcXVwPklBjfsbwv4XNFOe5bLLYnxT0m4i3/1SVtQftPbjisup2hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7L3WRESaYBbJKX2i28qfWWGOYW3ruRc37/d3QLWssQZ4hUVZ
	uFSBiWC5mdiVaV9kGhr7rDS+9W7SIO0ePpY9QhmNXsPfITY98kIx
X-Google-Smtp-Source: AGHT+IGosFECC8l818u+iBX54kwYlnxwq+hbOkNZb9l4mwYmklvJfAc9saGcx/m2p/MoXMnBPeArdw==
X-Received: by 2002:a17:907:f1a8:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a99b9583966mr212839166b.47.1728648362065;
        Fri, 11 Oct 2024 05:06:02 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:01 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
Date: Fri, 11 Oct 2024 15:03:48 +0300
Message-ID: <20241011120520.140318-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index bf8dc176553c1..7ac1a85f822f1 100644
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
@@ -263,6 +312,20 @@ examples:
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
 
         mmc0 {
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
deleted file mode 100644
index 68e91c05f1220..0000000000000
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
2.46.2


