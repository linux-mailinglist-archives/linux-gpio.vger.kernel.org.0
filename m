Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE45B681BFD
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 22:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjA3VAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 16:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjA3VAh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 16:00:37 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5D14740A;
        Mon, 30 Jan 2023 13:00:31 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n13so1950682wmr.4;
        Mon, 30 Jan 2023 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KuSuW06HHF3831P0xJ/zxYyhYTNoVLwB7x4VqcQ3BUY=;
        b=aw41t3PiCVuliTn7GB71u3ZTHm5yQpZ4AAdgVa8UV92fR0y+n3BLzsnsKTmPpQMH0K
         DNvmj+ssAHPpX38Fvjmoe5iUzvk2j4k7OB0w66a7e91IUTCOeUcxLcNdLp3HFE/z0Pj/
         1ztyi0lVlM1Ypo4CZ57a0mj6jYEI2E6LCPY3q9IvOaflvMIH7uVEvvqjwLOi0E88WjOk
         9awAEh0cPp7qC8XQVoWBSlF285oJ5OjbMr3zMyAIglRMzt8c5r5/LmVrX2N89UOAV3vQ
         IITrtqrcE/6xaxiFdoDvExIupLvrmW6xHLfKmmKznOPnF2+iJ/wdP4ZoB+v5Q09VA1k9
         5wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuSuW06HHF3831P0xJ/zxYyhYTNoVLwB7x4VqcQ3BUY=;
        b=omsgVqOf3ieQhUVdn6I7xEuxh1ZXLDdVZ86KJlQhHK7+R0ko3VzXrpSZuk1iM6wICQ
         jPsEUPHnGRdNigy9V+kJTIC/h/TzOjJ34THMMU0hJf5wAj3BwOxNUAxhkstjwJgpJkTg
         ZYlRAogY3IY+1M2thX7TdlsWZvG5i6HxzqmaKT4Dsyc9Dqjfc1mOi/MMcdEczdx/V6eF
         K8qlOoi9SPNNLWMhe9syK+9mPNvB8bgDcGSatrww7Bdr6KOgfXilMD2UbIEPa0Jhc44e
         giGoTyKuNknoPxh7w3xM807zolRmTe888jsETHMFxtpXCo/u4Yvom8tdjpo0D2Tw0ZSF
         3SOw==
X-Gm-Message-State: AFqh2kowrbO/VgGLPptxe9SwxckP4EJWzO1dofLG8zuOh/JmfYgmxxSg
        ZxytWEhwViAj4Um53koz/uQ=
X-Google-Smtp-Source: AMrXdXtJed6wpGR2cYaoQZUKrCrllboFvOBM2MNrbyMZZ7PyjnFqAhhst3wANkrZshDgdFwY1oiE7Q==
X-Received: by 2002:a05:600c:4e05:b0:3d3:5a4a:9103 with SMTP id b5-20020a05600c4e0500b003d35a4a9103mr50950062wmq.31.1675112429300;
        Mon, 30 Jan 2023 13:00:29 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id l21-20020a05600c4f1500b003dc4050c97bsm13993322wmq.3.2023.01.30.13.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 13:00:28 -0800 (PST)
Message-ID: <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
Date:   Mon, 30 Jan 2023 22:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: en-US
Subject: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Amlogic Meson pinctrl binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- consider that more than one compatible can be set
- remove bus part from example
v3:
- remove minItem/maxItem properties for compatible
---
 .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
 .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
 2 files changed, 122 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
new file mode 100644
index 000000000..7aaae606b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8-cbus-pinctrl
+              - amlogic,meson8b-cbus-pinctrl
+              - amlogic,meson8m2-cbus-pinctrl
+              - amlogic,meson8-aobus-pinctrl
+              - amlogic,meson8b-aobus-pinctrl
+              - amlogic,meson8m2-aobus-pinctrl
+              - amlogic,meson-gxbb-periphs-pinctrl
+              - amlogic,meson-gxbb-aobus-pinctrl
+              - amlogic,meson-gxl-periphs-pinctrl
+              - amlogic,meson-gxl-aobus-pinctrl
+              - amlogic,meson-axg-periphs-pinctrl
+              - amlogic,meson-axg-aobus-pinctrl
+              - amlogic,meson-g12a-periphs-pinctrl
+              - amlogic,meson-g12a-aobus-pinctrl
+              - amlogic,meson-a1-periphs-pinctrl
+              - amlogic,meson-s4-periphs-pinctrl
+      - items:
+          - const: amlogic,meson8m2-aobus-pinctrl
+          - const: amlogic,meson8-aobus-pinctrl
+      - items:
+          - const: amlogic,meson8m2-cbus-pinctrl
+          - const: amlogic,meson8-cbus-pinctrl
+
+  ranges: true
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+required:
+  - compatible
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+patternProperties:
+  "^bank@[0-9]$":
+    type: object
+    properties:
+      reg:
+        minItems: 5
+        maxItems: 5
+
+      reg-names:
+        items:
+          - const: gpio
+          - const: pull
+          - const: pull-enable
+          - const: mux
+          - const: ds
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+
+examples:
+  - |
+    pinctrl {
+      compatible = "amlogic,meson-g12a-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@40 {
+        reg = <0x0 0x40  0x0 0x4c>,
+              <0x0 0xe8  0x0 0x18>,
+              <0x0 0x120 0x0 0x18>,
+              <0x0 0x2c0 0x0 0x40>,
+              <0x0 0x340 0x0 0x1c>;
+        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&periphs_pinctrl 0 0 86>;
+      };
+
+      cec_ao_a_h_pins: cec_ao_a_h {
+        mux {
+          groups = "cec_ao_a_h";
+          function = "cec_ao_a_h";
+          bias-disable;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
deleted file mode 100644
index 8146193bd..000000000
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-== Amlogic Meson pinmux controller ==
-
-Required properties for the root node:
- - compatible: one of "amlogic,meson8-cbus-pinctrl"
-		      "amlogic,meson8b-cbus-pinctrl"
-		      "amlogic,meson8m2-cbus-pinctrl"
-		      "amlogic,meson8-aobus-pinctrl"
-		      "amlogic,meson8b-aobus-pinctrl"
-		      "amlogic,meson8m2-aobus-pinctrl"
-		      "amlogic,meson-gxbb-periphs-pinctrl"
-		      "amlogic,meson-gxbb-aobus-pinctrl"
-		      "amlogic,meson-gxl-periphs-pinctrl"
-		      "amlogic,meson-gxl-aobus-pinctrl"
-		      "amlogic,meson-axg-periphs-pinctrl"
-		      "amlogic,meson-axg-aobus-pinctrl"
-		      "amlogic,meson-g12a-periphs-pinctrl"
-		      "amlogic,meson-g12a-aobus-pinctrl"
-		      "amlogic,meson-a1-periphs-pinctrl"
-		      "amlogic,meson-s4-periphs-pinctrl"
- - reg: address and size of registers controlling irq functionality
-
-=== GPIO sub-nodes ===
-
-The GPIO bank for the controller is represented as a sub-node and it acts as a
-GPIO controller.
-
-Required properties for sub-nodes are:
- - reg: should contain a list of address and size, one tuple for each entry
-   in reg-names.
- - reg-names: an array of strings describing the "reg" entries.
-   Must contain "mux" and "gpio".
-   May contain "pull", "pull-enable" and "ds" when appropriate.
- - gpio-controller: identifies the node as a gpio controller
- - #gpio-cells: must be 2
-
-=== Other sub-nodes ===
-
-Child nodes without the "gpio-controller" represent some desired
-configuration for a pin or a group. Those nodes can be pinmux nodes or
-configuration nodes.
-
-Required properties for pinmux nodes are:
- - groups: a list of pinmux groups. The list of all available groups
-   depends on the SoC and can be found in driver sources.
- - function: the name of a function to activate for the specified set
-   of groups. The list of all available functions depends on the SoC
-   and can be found in driver sources.
-
-Required properties for configuration nodes:
- - pins: a list of pin names
-
-Configuration nodes support the following generic properties, as
-described in file pinctrl-bindings.txt:
- - "bias-disable"
- - "bias-pull-up"
- - "bias-pull-down"
- - "output-enable"
- - "output-disable"
- - "output-low"
- - "output-high"
-
-Optional properties :
- - drive-strength-microamp: Drive strength for the specified pins in uA.
-			    This property is only valid for G12A and newer.
-
-=== Example ===
-
-	pinctrl: pinctrl@c1109880 {
-		compatible = "amlogic,meson8-cbus-pinctrl";
-		reg = <0xc1109880 0x10>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		gpio: banks@c11080b0 {
-			reg = <0xc11080b0 0x28>,
-			      <0xc11080e8 0x18>,
-			      <0xc1108120 0x18>,
-			      <0xc1108030 0x30>;
-			reg-names = "mux", "pull", "pull-enable", "gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-               };
-
-		nand {
-			mux {
-				groups = "nand_io", "nand_io_ce0", "nand_io_ce1",
-					 "nand_io_rb0", "nand_ale", "nand_cle",
-					 "nand_wen_clk", "nand_ren_clk", "nand_dqs",
-					 "nand_ce2", "nand_ce3";
-				function = "nand";
-			};
-		};
-	};
-- 
2.39.1

