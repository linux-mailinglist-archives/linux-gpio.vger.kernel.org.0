Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A1B421A8C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 01:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhJDXYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 19:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbhJDXYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 19:24:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B382C061749
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 16:22:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g41so78151314lfv.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/3gcHOhfvp5xgv2qzZFowXoIFji/xpSd6P4+0tcW2M=;
        b=Jszj49AV0IRCR/6aj3lsthSylf5xGmLysq060qpQtofvFPU2sCZ7EdZg87qEBOrjge
         2jLUsxyYJV9C5V0qvAFJJSbCjLlXBiUG6iT0ievKOOv6shNECfX3FBgdQTljaNPIF2A6
         3sk9Q5wV8HNMLCkQzvRaY0mEyr5y8h/Gm1L7ij4NaQMxwE9IeE0FDbxUCMF4ddezgXpn
         eD8w7LGc+IRQRgbMC274s29F27fq9Rds901myS1THBWGdHTC38KjOtgMRirGcdwNTRLu
         5W4uxzVhvFej93Z1ICRMPMRAmydi5IHaR/bGktWjgFy4bGlqqhBcZVWrgPwB3tQekDw+
         Wp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/3gcHOhfvp5xgv2qzZFowXoIFji/xpSd6P4+0tcW2M=;
        b=C483ihhxUCbaB1MYcMia6LTSZODsSeiD4PdXJNm78vp34G6BvJ8WZRPZ0G2GEXJc/Q
         UprEUdwMxmn9EylVjFQ+o4oTYSwmSJ9Gs8JtBWW56CL0HbppThgWLBxq0L6uIuSW+ASL
         ytWbArZlKPsjKbGkHFfQVFKyC1SkG8mp4JIPpykFhE7NHsqewJHX9VEqNTyfS3jdlr+s
         n75p0FOC2QgGpIJdg8cwRSht+V/I0VOVXn5F6XmeLTPmP4uicTNGBInC5+IXiGP2xdHu
         4f5NIY0RRXmJ7xgA514CexK1uOinVE7RY80SdZEXadBVzuuywGS/5OKtGpsQkBx/ocio
         rl3g==
X-Gm-Message-State: AOAM530ouSncnLTR+JDGzT+sc0sPrPIs3eZq3nZoZAx0QrNcrP2qMokM
        yk1QLvHYOf3Ow5f6bcKAjsyj3Q==
X-Google-Smtp-Source: ABdhPJxXKrlBndxCd7bzMF7uv2Gsmc77qSt3RKaACcKCnx0ZJGoNaIYzrE5SOBRvoj8zEnk4cUOROg==
X-Received: by 2002:a2e:b6d3:: with SMTP id m19mr18391111ljo.161.1633389748410;
        Mon, 04 Oct 2021 16:22:28 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h23sm1786219lja.131.2021.10.04.16.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 16:22:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
Date:   Tue,  5 Oct 2021 02:22:20 +0300
Message-Id: <20211004232225.2260665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
References: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Qualcomm PMIC MPP bindings from .txt to .yaml format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/pinctrl/qcom,pmic-mpp.txt        | 187 ------------------
 .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 178 +++++++++++++++++
 2 files changed, 178 insertions(+), 187 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
deleted file mode 100644
index 5363d44cbb74..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ /dev/null
@@ -1,187 +0,0 @@
-Qualcomm PMIC Multi-Purpose Pin (MPP) block
-
-This binding describes the MPP block(s) found in the 8xxx series
-of PMIC's from Qualcomm.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Should contain one of:
-		    "qcom,pm8018-mpp",
-		    "qcom,pm8019-mpp",
-		    "qcom,pm8038-mpp",
-		    "qcom,pm8058-mpp",
-		    "qcom,pm8821-mpp",
-		    "qcom,pm8841-mpp",
-		    "qcom,pm8916-mpp",
-		    "qcom,pm8917-mpp",
-		    "qcom,pm8921-mpp",
-		    "qcom,pm8941-mpp",
-		    "qcom,pm8950-mpp",
-		    "qcom,pmi8950-mpp",
-		    "qcom,pm8994-mpp",
-		    "qcom,pma8084-mpp",
-		    "qcom,pmi8994-mpp",
-
-		    And must contain either "qcom,spmi-mpp" or "qcom,ssbi-mpp"
-		    if the device is on an spmi bus or an ssbi bus respectively.
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Register base of the MPP block and length.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Must contain an array of encoded interrupt specifiers for
-		    each available MPP
-
-- gpio-controller:
-	Usage: required
-	Value type: <none>
-	Definition: Mark the device node as a GPIO controller
-
-- #gpio-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 2;
-		    the first cell will be used to define MPP number and the
-		    second denotes the flags for this MPP
-
-Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
-a general description of GPIO and interrupt bindings.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-The pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin or a list of pins. This configuration can include the
-mux function to select on those pin(s), and various pin configuration
-parameters, as listed below.
-
-SUBNODES:
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pin configuration subnode:
-
-- pins:
-	Usage: required
-	Value type: <string-array>
-	Definition: List of MPP pins affected by the properties specified in
-		    this subnode.  Valid pins are:
-		    mpp1-mpp4 for pm8841
-		    mpp1-mpp4 for pm8916
-		    mpp1-mpp8 for pm8941
-		    mpp1-mpp4 for pm8950
-		    mpp1-mpp4 for pmi8950
-		    mpp1-mpp4 for pma8084
-
-- function:
-	Usage: required
-	Value type: <string>
-	Definition: Specify the alternative function to be configured for the
-		    specified pins.  Valid values are:
-		    "digital",
-		    "analog",
-		    "sink"
-
-- bias-disable:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins should be configured as no pull.
-
-- bias-pull-up:
-	Usage: optional
-	Value type: <u32>
-	Definition: The specified pins should be configured as pull up.
-		    Valid values are 600, 10000 and 30000 in bidirectional mode
-		    only, i.e. when operating in qcom,analog-mode and input and
-		    outputs are enabled. The hardware ignores the configuration
-		    when operating in other modes.
-
-- bias-high-impedance:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins will put in high-Z mode and disabled.
-
-- input-enable:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are put in input mode, i.e. their input
-		    buffer is enabled
-
-- output-high:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    high.
-
-- output-low:
-	Usage: optional
-	Value type: <none>
-	Definition: The specified pins are configured in output mode, driven
-		    low.
-
-- power-source:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the power source for the specified pins. Valid power
-		    sources are defined in <dt-bindings/pinctrl/qcom,pmic-mpp.h>
-
-- qcom,analog-level:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the source for analog output. Valued values are
-		    defined in <dt-binding/pinctrl/qcom,pmic-mpp.h>
-		    PMIC_MPP_AOUT_LVL_*
-
-- qcom,dtest:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects which dtest rail to be routed in the various functions.
-		    Valid values are 1-4
-
-- qcom,amux-route:
-	Usage: optional
-	Value type: <u32>
-	Definition: Selects the source for analog input. Valid values are
-		    defined in <dt-bindings/pinctrl/qcom,pmic-mpp.h>
-		    PMIC_MPP_AMUX_ROUTE_CH5, PMIC_MPP_AMUX_ROUTE_CH6...
-- qcom,paired:
-	Usage: optional
-	Value type: <none>
-	Definition: Indicates that the pin should be operating in paired mode.
-
-Example:
-
-	mpps@a000 {
-		compatible = "qcom,pm8841-mpp", "qcom,spmi-mpp";
-		reg = <0xa000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&pm8841_default>;
-
-		pm8841_default: default {
-			gpio {
-				pins = "mpp1", "mpp2", "mpp3", "mpp4";
-				function = "digital";
-				input-enable;
-				power-source = <PM8841_MPP_S3>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
new file mode 100644
index 000000000000..96cb78ab6437
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMIC Multi-Purpose Pin (MPP) block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This binding describes the MPP block(s) found in the 8xxx series of
+  PMIC's from Qualcomm.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,pm8018-mpp
+          - qcom,pm8019-mpp
+          - qcom,pm8038-mpp
+          - qcom,pm8058-mpp
+          - qcom,pm8821-mpp
+          - qcom,pm8841-mpp
+          - qcom,pm8916-mpp
+          - qcom,pm8917-mpp
+          - qcom,pm8921-mpp
+          - qcom,pm8941-mpp
+          - qcom,pm8950-mpp
+          - qcom,pmi8950-mpp
+          - qcom,pm8994-mpp
+          - qcom,pma8084-mpp
+          - qcom,pmi8994-mpp
+
+      - enum:
+          - qcom,spmi-mpp
+          - qcom,ssbi-mpp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 12
+    description:
+      Must contain an array of encoded interrupt specifiers for
+      each available MPP
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+    description:
+      The first cell will be used to define gpio number and the
+      second denotes the flags for this gpio
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - interrupt-controller
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-pmic-mpp-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-pmic-mpp-state"
+
+$defs:
+  qcom-pmic-mpp-state:
+    type: object
+    allOf:
+      - $ref: "pinmux-node.yaml"
+      - $ref: "pincfg-node.yaml"
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in
+          this subnode.  Valid pins are
+                 - mpp1-mpp4 for pm8841
+                 - mpp1-mpp4 for pm8916
+                 - mpp1-mpp8 for pm8941
+                 - mpp1-mpp4 for pm8950
+                 - mpp1-mpp4 for pmi8950
+                 - mpp1-mpp4 for pma8084
+
+        items:
+          pattern: "^mpp([0-9]+)$"
+
+      function:
+        items:
+          - enum:
+              - digital
+              - analog
+              - sink
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-high-impedance: true
+      input-enable: true
+      output-high: true
+      output-low: true
+      power-source: true
+
+      qcom,analog-level:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Selects the source for analog output. Valued values are defined in
+          <dt-binding/pinctrl/qcom,pmic-mpp.h> PMIC_MPP_AOUT_LVL_*
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      qcom,atest:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Selects ATEST rail to route to GPIO when it's
+          configured in analog-pass-through mode.
+        enum: [1, 2, 3, 4]
+
+      qcom,dtest:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Selects DTEST rail to route to GPIO when it's
+          configured as digital input.
+        enum: [1, 2, 3, 4]
+
+      qcom,amux-route:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Selects the source for analog input. Valid values are defined in
+          <dt-bindings/pinctrl/qcom,pmic-mpp.h> PMIC_MPP_AMUX_ROUTE_CH5,
+          PMIC_MPP_AMUX_ROUTE_CH6...
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      qcom,paired:
+        - description:
+            Indicates that the pin should be operating in paired mode.
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+    pm8841_mpp: mpps@a000 {
+      compatible = "qcom,pm8841-mpp", "qcom,spmi-mpp";
+      reg = <0xa000 0>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-ranges = <&pm8841_mpp 0 0 4>;
+      interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
+
+      pinctrl-names = "default";
+      pinctrl-0 = <&pm8841_default>;
+
+      default-state {
+        gpio {
+          pins = "mpp1", "mpp2", "mpp3", "mpp4";
+          function = "digital";
+          input-enable;
+          power-source = <PM8841_MPP_S3>;
+        };
+      };
+    };
+...
-- 
2.30.2

