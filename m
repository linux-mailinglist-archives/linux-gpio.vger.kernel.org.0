Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BA84261B2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhJHB10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbhJHB1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34A8C061714
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:30 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z11so24037302lfj.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/FnULHtOSn2r5lygapPAHJMuBEtxiZqi9m5HusuZIQ=;
        b=JpdfMMMWW2nPaI/K2OrZTUJ1ABBi7mYPTEPpP/qdP2k69L9XHKfRXN9EScbtOXHIIk
         07oX9fTBSctsN0nS+r9pG3J+QQjq9ZGN2jdR5Js0CgYP75VYCrYTFtd3UAwZxIRQnXrm
         5uXbKlOcWcs2fhesulYbaZV+AQOV/fcFCh5LQ1qAyc1b/vTozLhkkx3RuBCeWKhj/ani
         3xpPK0QunT7ZB8abxJ4q2DGd567nZNUVTPLIcT4EHcUk/BniG8vMgWd6c31oetZhYZrZ
         Cc6e4gwqIF3hOwqvuK/Qf6amcnn/xSOtuO3tQ7WiBldAFqPb5wX50d6nARxveyVfQnSM
         9iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/FnULHtOSn2r5lygapPAHJMuBEtxiZqi9m5HusuZIQ=;
        b=EHOxwr3JDOnogkzVvXK9b5eLzLDUeCFOh40cvoylvDA/tJcdMmXIiS+wGwlPSdvVB0
         KNhLbp8GVpZ8rlM6GQyUv1g1KXUbJFgcyTsxVjVi/hh2PdxQhFeRTWJlT19RraMPXGPZ
         14RbFCQsO1iJIFT5raxFCpqPoF2cJLMJU086jPA0LUwZfNZbvutjAJAHxKm5SFZSkNin
         BjWd8QEXoqK6p5iKXak8yzitTJnzUSHFBM+j/r0L8q/1LBAZoMVBN370f8iETvfRCAM+
         kjFQQKc3Vg8q4OEEKhAu4MMicsknwc8wqz3pmK6UM8bpyDpn4nwDXIgXDdNjgE6X4rMK
         zmkA==
X-Gm-Message-State: AOAM533YkBixRyL3p7oLEHS78sHbyAhez3WbXfj3XlD/+6AQScIqAPOM
        4EM0R1ybH1mq32DcZWYd4whBbA==
X-Google-Smtp-Source: ABdhPJxZCnso9Ba4OnK+R5zwz6duAbXeXHdnHJgQ+kKF52E2HRWXLur2ym3AS5Zvb3pLATe3JnTDzQ==
X-Received: by 2002:a05:651c:d0:: with SMTP id 16mr374187ljr.428.1633656328842;
        Thu, 07 Oct 2021 18:25:28 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 01/25] dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
Date:   Fri,  8 Oct 2021 04:25:00 +0300
Message-Id: <20211008012524.481877-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Qualcomm PMIC MPP bindings from .txt to .yaml format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/pinctrl/qcom,pmic-mpp.txt        | 187 -----------------
 .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 188 ++++++++++++++++++
 2 files changed, 188 insertions(+), 187 deletions(-)
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
index 000000000000..475733cabb02
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -0,0 +1,188 @@
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
+  gpio-line-names: true
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
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-pmic-mpp-state"
+      - patternProperties:
+          "mpp":
+            $ref: "#/$defs/qcom-pmic-mpp-state"
+        additionalProperties: false
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
+      gpio-line-names = "VDD_PX_BIAS", "WLAN_LED_CTRL",
+              "BT_LED_CTRL", "GPIO-F";
+      interrupts = <4 0xa0 0 0>, <4 0xa1 0 0>, <4 0xa2 0 0>, <4 0xa3 0 0>;
+
+      pinctrl-names = "default";
+      pinctrl-0 = <&pm8841_default>;
+
+      mpp1-state {
+        pins = "mpp1";
+        function = "digital";
+        input-enable;
+        power-source = <PM8841_MPP_S3>;
+      };
+
+      default-state {
+        gpio-mpp {
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

