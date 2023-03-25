Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11D06C8DAA
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 12:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjCYLyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 07:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCYLyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 07:54:53 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD327DBC1;
        Sat, 25 Mar 2023 04:54:50 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l12so4138128wrm.10;
        Sat, 25 Mar 2023 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679745289;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yw9jmvDFYY1NX7erx0M1FqRPlaGEzibtymH1npo6RI=;
        b=Uszk1/J0t8GjYMaTPsJRUtS8UAODUBf0NTLOTMXAFalAl8Plln3moTm10iTGTDqZ/N
         2sgXHgAE8eLHGH/5KgGPCpOBShQrFtIZfch2cJ7QJtjIgqFVpwufl2O8YlnJZNbg91p9
         yDHvHvCuYPNFRssIOkJieRrz9pN8Ot7DNPZ7qkoFjzJ55e4/e6wyhhCzHwKSipC+2z8m
         y0KiZYWRluUPSydcwwcu5/b4BaAw00o1WRbIa0goJ2yZDGA4sf6MonB2UfW+M2rmm0qw
         sj8BXdJz5Sol3AtZD9cJT8XwO/SaNFGYfzB9MIpoMcozsvVNQF0K+3VRZAsV90+vIs0L
         TE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679745289;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7yw9jmvDFYY1NX7erx0M1FqRPlaGEzibtymH1npo6RI=;
        b=0pGCetOXfNIXlwmIURbHcLwPZhnfwVW2IFD+5wMmsymJRQRFb43KJGKbl7p7IZAlEb
         tnNvml3OGiLM37TBWxO7q9k5TtOG+A7xWBT2harGb85YKoAETlWTBWl84wSoVTjOVTHC
         7sqCY6sGuqEnS4HxOXNgjlMGblaQve/sXIgSryQVhCNtbVs0FAuAbjFGHb8jo2in83Ti
         xo6ZQ8SiVmt6XikpLiO33NfNA68/Fd/7EsYGAcTKv/0dXlng9y5eI7+7TObZVZPGM6n8
         /Nw3jY3ccF62aFoRJ1LZ78acUdskJC9yHSyZgDxB5gZzU8xFA1Q46P527APXEk9HuVgS
         fRzQ==
X-Gm-Message-State: AAQBX9fQ45chNOX16hMmCZ1CuwPkTq3DeQ+TnUvcilTUSkUR3Scq+CtB
        bXOqFdYQ67+DOlg5UE7bN/4=
X-Google-Smtp-Source: AKy350bmk+tg5q5AKR3XsRJy8mBkj9ksD+WX0ixoMeSbzx96Ze3A3DX4k4H5CJ475i/tLj/0Ia+zlg==
X-Received: by 2002:a5d:6a87:0:b0:2d0:c73d:ef2a with SMTP id s7-20020a5d6a87000000b002d0c73def2amr4662903wru.24.1679745289055;
        Sat, 25 Mar 2023 04:54:49 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73a5:2800:e59a:ffcb:c722:70cf? (dynamic-2a01-0c22-73a5-2800-e59a-ffcb-c722-70cf.c22.pool.telefonica.de. [2a01:c22:73a5:2800:e59a:ffcb:c722:70cf])
        by smtp.googlemail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm20543769wrx.116.2023.03.25.04.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:54:48 -0700 (PDT)
Message-ID: <dd29c1b7-05db-dd98-df40-20a238d89a96@gmail.com>
Date:   Sat, 25 Mar 2023 12:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
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
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v8] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Amlogic Meson pin controller binding to yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- consider that more than one compatible can be set
- remove bus part from example
v3:
- remove minItem/maxItem properties for compatible
v4:
- split patch to be able to deal with the different reg/reg-names
v5:
- remove compatible definition from common yaml
- move pincfg-node and pinmux-node definition to meson-gpio object definition
v6:
- add meson-pins definition
- change usage of unevaluatedProperties
v7:
- add unevaluatedProperties to meson-gpio references under patternProperties
v8:
- fix position of unevaluatedProperties
---
 .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 67 +++++++++++++
 .../pinctrl/amlogic,meson-pinctrl-common.yaml | 57 +++++++++++
 .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 68 ++++++++++++++
 .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 72 ++++++++++++++
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 76 +++++++++++++++
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 78 +++++++++++++++
 .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
 7 files changed, 418 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
new file mode 100644
index 000000000..99080c9ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson A1 pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-a1-periphs-pinctrl
+      - amlogic,meson-s4-periphs-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mux
+          - const: gpio
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    periphs_pinctrl: pinctrl {
+      compatible = "amlogic,meson-a1-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@400 {
+        reg = <0x0400 0x003c>,
+              <0x0480 0x0118>;
+        reg-names = "mux", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&periphs_pinctrl 0 0 62>;
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
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
new file mode 100644
index 000000000..a7b29ef0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-common.yaml#
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
+  ranges: true
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+required:
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: true
+
+$defs:
+  meson-gpio:
+    type: object
+
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+
+  meson-pins:
+    type: object
+    additionalProperties:
+      type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
new file mode 100644
index 000000000..7c9c94ec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson G12 AOBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-aobus-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 3
+
+      reg-names:
+        items:
+          - const: mux
+          - const: ds
+          - const: gpio
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    ao_pinctrl: pinctrl {
+      compatible = "amlogic,meson-g12a-aobus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@14 {
+        reg = <0x14 0x8>,
+              <0x1c 0x8>,
+              <0x24 0x14>;
+        reg-names = "mux", "ds", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&ao_pinctrl 0 0 15>;
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
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
new file mode 100644
index 000000000..4bcb8b604
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson G12 PERIPHS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-periphs-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
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
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    periphs_pinctrl: pinctrl {
+      compatible = "amlogic,meson-g12a-periphs-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@40 {
+        reg = <0x40  0x4c>,
+              <0xe8  0x18>,
+              <0x120 0x18>,
+              <0x2c0 0x40>,
+              <0x340 0x1c>;
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
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
new file mode 100644
index 000000000..32d99c9b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-aobus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson8 AOBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8-aobus-pinctrl
+          - amlogic,meson8b-aobus-pinctrl
+          - amlogic,meson-gxbb-aobus-pinctrl
+          - amlogic,meson-gxl-aobus-pinctrl
+          - amlogic,meson-axg-aobus-pinctrl
+      - items:
+          - const: amlogic,meson8m2-aobus-pinctrl
+          - const: amlogic,meson8-aobus-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 3
+
+      reg-names:
+        items:
+          - const: mux
+          - const: pull
+          - const: gpio
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    pinctrl_aobus: pinctrl {
+      compatible = "amlogic,meson8-aobus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@14 {
+        reg = <0x14 0x4>,
+              <0x2c 0x4>,
+              <0x24 0x8>;
+        reg-names = "mux", "pull", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl_aobus 0 0 16>;
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
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
new file mode 100644
index 000000000..d0441051f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-pinctrl-cbus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson8 CBUS pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson8-cbus-pinctrl
+          - amlogic,meson8b-cbus-pinctrl
+          - amlogic,meson-gxbb-periphs-pinctrl
+          - amlogic,meson-gxl-periphs-pinctrl
+          - amlogic,meson-axg-periphs-pinctrl
+      - items:
+          - const: amlogic,meson8m2-cbus-pinctrl
+          - const: amlogic,meson8-cbus-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-z]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 4
+
+      reg-names:
+        items:
+          - const: mux
+          - const: pull
+          - const: pull-enable
+          - const: gpio
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    pinctrl_cbus: pinctrl {
+      compatible = "amlogic,meson8-cbus-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bank@80b0 {
+        reg = <0x80b0 0x28>,
+              <0x80e8 0x18>,
+              <0x8120 0x18>,
+              <0x8030 0x30>;
+        reg-names = "mux", "pull", "pull-enable", "gpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl_cbus 0 0 120>;
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
2.40.0

