Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB6B1D219A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 23:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbgEMV71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 17:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730332AbgEMV7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 17:59:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECADC05BD0D
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 14:59:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so335017pgl.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oMuwtgb2OcVuYmU/qlU+fBVpY5n0C+oIdI2dxORvY8g=;
        b=Tbxd8EQj0sl+geyiQZ3s6Vr5SEBuLkHBaWw2+9jpomdwxZ0rqCSk6ifuFXJyYGO5Zi
         xSeDm33xp4wXPtK7B7rlcuPF6BbaxLzKGxRSsEbaE+1cSNOTdzw8gojUTgaPWmtzb2E6
         KZj2Gak04PurH0lCQPf8yNT9RnSmKf7wYW8KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oMuwtgb2OcVuYmU/qlU+fBVpY5n0C+oIdI2dxORvY8g=;
        b=LIXw88hKVfSGbgxQqt25ub7voJEPHwZkT9AtvIPLLCM9rdfOrMGtsW/jyaJcQ0wzZ7
         DLYfdyS4uFhU63buMh4ZO6jDUDO5t64GwS9qRtwZNA5QekJIHFHFBTHQ5PoAgRTMMtsz
         ERoOTb2+202LSXN7ubX6G2draqEtsWgRJINr1qTuqzW4/E4YnhYF/U+oN/hnIEVFH56f
         4IZpSYtdBlsbnZdokBg2Qr/XJS/XPYIqiScHJ+J2wXqLhH0obLw5J8F0g/xyv/yHOBOb
         KHcQPk22nlxv2VT/MQGuRZ35fL7CCcwU3LdgU24OSxj9tRjeMuzYkFrZqskrPYCCWmTg
         Yxtw==
X-Gm-Message-State: AOAM532aKTsHCRK44k3nLk3lQtCKz09E84EisuWcImzcD224AYxXfuqN
        vQA/x7HCgdSm2U/Gk+fqvh4Gfg==
X-Google-Smtp-Source: ABdhPJx+UnFmi0FGlaF+9mdq+fNVJjeXfBPJOxBzaaMfI79bmG+44wi8Keu6UnmwMCZcSGqfmf5Omg==
X-Received: by 2002:aa7:8b15:: with SMTP id f21mr1280026pfd.72.1589407163263;
        Wed, 13 May 2020 14:59:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k27sm547169pgb.30.2020.05.13.14.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:59:22 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, devicetree@vger.kernel.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        jonas@kwiboo.se, linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
Date:   Wed, 13 May 2020 14:59:01 -0700
Message-Id: <20200513145807.v6.2.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200513215902.261547-1-dianders@chromium.org>
References: <20200513215902.261547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This moves the bindings over, based a lot on toshiba,tc358768.yaml.
Unless there's someone known to be better, I've set the maintainer in
the yaml as the first person to submit bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
I removed Stephen's review tag on v5 since I squashed in a bunch of
other stuff.

Changes in v6: None
Changes in v5:
- Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/

Changes in v4: None
Changes in v3: None
Changes in v2:
- specification => specifier.
- power up => power.
- Added back missing suspend-gpios.
- data-lanes and lane-polarities are are the right place now.
- endpoints don't need to be patternProperties.
- Specified more details for data-lanes and lane-polarities.
- Added old example back in, fixing bugs in it.
- Example i2c bus is just called "i2c", not "i2c1" now.

 .../bindings/display/bridge/ti,sn65dsi86.txt  |  87 ------
 .../bindings/display/bridge/ti,sn65dsi86.yaml | 285 ++++++++++++++++++
 2 files changed, 285 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
deleted file mode 100644
index 8ec4a7f2623a..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-SN65DSI86 DSI to eDP bridge chip
---------------------------------
-
-This is the binding for Texas Instruments SN65DSI86 bridge.
-http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
-
-Required properties:
-- compatible: Must be "ti,sn65dsi86"
-- reg: i2c address of the chip, 0x2d as per datasheet
-- enable-gpios: gpio specification for bridge_en pin (active high)
-
-- vccio-supply: A 1.8V supply that powers up the digital IOs.
-- vpll-supply: A 1.8V supply that powers up the displayport PLL.
-- vcca-supply: A 1.2V supply that powers up the analog circuits.
-- vcc-supply: A 1.2V supply that powers up the digital core.
-
-Optional properties:
-- interrupts-extended: Specifier for the SN65DSI86 interrupt line.
-
-- gpio-controller: Marks the device has a GPIO controller.
-- #gpio-cells    : Should be two. The first cell is the pin number and
-                   the second cell is used to specify flags.
-                   See ../../gpio/gpio.txt for more information.
-- #pwm-cells : Should be one. See ../../pwm/pwm.yaml for description of
-               the cell formats.
-
-- clock-names: should be "refclk"
-- clocks: Specification for input reference clock. The reference
-	  clock rate must be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
-
-- data-lanes: See ../../media/video-interface.txt
-- lane-polarities: See ../../media/video-interface.txt
-
-- suspend-gpios: specification for GPIO1 pin on bridge (active low)
-
-Required nodes:
-This device has two video ports. Their connections are modelled using the
-OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for DSI input
-- Video port 1 for eDP output
-
-Example
--------
-
-edp-bridge@2d {
-	compatible = "ti,sn65dsi86";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x2d>;
-
-	enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
-	suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
-
-	interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
-
-	vccio-supply = <&pm8916_l17>;
-	vcca-supply = <&pm8916_l6>;
-	vpll-supply = <&pm8916_l17>;
-	vcc-supply = <&pm8916_l6>;
-
-	clock-names = "refclk";
-	clocks = <&input_refclk>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			edp_bridge_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			edp_bridge_out: endpoint {
-				data-lanes = <2 1 3 0>;
-				lane-polarities = <0 1 0 1>;
-				remote-endpoint = <&edp_panel_in>;
-			};
-		};
-	};
-}
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
new file mode 100644
index 000000000000..07d26121afca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -0,0 +1,285 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SN65DSI86 DSI to eDP bridge chip
+
+maintainers:
+  - Sandeep Panda <spanda@codeaurora.org>
+
+description: |
+  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.
+  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=sn65dsi86&fileType=pdf
+
+properties:
+  compatible:
+    const: ti,sn65dsi86
+
+  reg:
+    const: 0x2d
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for bridge_en pin (active high).
+
+  suspend-gpios:
+    maxItems: 1
+    description: GPIO specifier for GPIO1 pin on bridge (active low).
+
+  vccio-supply:
+    description: A 1.8V supply that powers the digital IOs.
+
+  vpll-supply:
+    description: A 1.8V supply that powers the DisplayPort PLL.
+
+  vcca-supply:
+    description: A 1.2V supply that powers the analog circuits.
+
+  vcc-supply:
+    description: A 1.2V supply that powers the digital core.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Clock specifier for input reference clock. The reference clock rate must
+      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
+
+  clock-names:
+    const: refclk
+
+  gpio-controller: true
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is pin number, second cell is flags.  GPIO pin numbers are
+      1-based to match the datasheet.  See ../../gpio/gpio.txt for more
+      information.
+
+  '#pwm-cells':
+    const: 1
+    description: See ../../pwm/pwm.yaml for description of the cell formats.
+
+  ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for MIPI DSI input
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+            additionalProperties: false
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description:
+          Video port for eDP output (panel or connector).
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description:
+                      If you have 1 logical lane the bridge supports routing
+                      to either port 0 or port 1.  Port 0 is suggested.
+                      See ../../media/video-interface.txt for details.
+
+                  - minItems: 2
+                    maxItems: 2
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                    description:
+                      If you have 2 logical lanes the bridge supports
+                      reordering but only on physical ports 0 and 1.
+                      See ../../media/video-interface.txt for details.
+
+                  - minItems: 4
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum:
+                        - 0
+                        - 1
+                        - 2
+                        - 3
+                    description:
+                      If you have 4 logical lanes the bridge supports
+                      reordering in any way.
+                      See ../../media/video-interface.txt for details.
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 4
+                items:
+                  enum:
+                    - 0
+                    - 1
+                description: See ../../media/video-interface.txt
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - vccio-supply
+  - vpll-supply
+  - vcca-supply
+  - vcc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+      };
+    };
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        enable-gpios = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
+        suspend-gpios = <&msmgpio 34 GPIO_ACTIVE_LOW>;
+
+        interrupts-extended = <&gpio3 4 IRQ_TYPE_EDGE_FALLING>;
+
+        vccio-supply = <&pm8916_l17>;
+        vcca-supply = <&pm8916_l6>;
+        vpll-supply = <&pm8916_l17>;
+        vcc-supply = <&pm8916_l6>;
+
+        clock-names = "refclk";
+        clocks = <&input_refclk>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            edp_bridge_in: endpoint {
+              remote-endpoint = <&dsi_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            edp_bridge_out: endpoint {
+              data-lanes = <2 1 3 0>;
+              lane-polarities = <0 1 0 1>;
+              remote-endpoint = <&edp_panel_in>;
+            };
+          };
+        };
+      };
+    };
-- 
2.26.2.645.ge9eca65c58-goog

