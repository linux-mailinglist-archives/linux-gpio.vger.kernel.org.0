Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CEB422B5E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 16:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbhJEOpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 10:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbhJEOpf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 10:45:35 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6458C061766
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 07:43:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n8so30931902lfk.6
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fXdFJXiNXm1uhtE0yp16khaip7EKruNUySG0yQVGgF4=;
        b=OGvWzYzoNuKvEIeszQXLIr9+vbghJce2zekx6qI53BCFUke8rHc8G5yrflqAXVg0pc
         Eh6vGIC1MYJhrkL7u7CX7mQUpQzYVeKhp//A7irpfdezl7e2rqf4obJAsIPDpJIJae4a
         +6vh7yWGI3/J7uGROY52y9W9H542T2tjl8FA8ydMEbDuCT3+oXfQK0nvfVRs9NrI7XAJ
         VKvf6QUAzvWfvv5S2Yla+Ex2ZvTMHCHv6YYb9IPWcEIj2lZ/Oyp2iAOhSbyrMTjO9YlO
         zTlzKhg7QlX4GhZ2ETjehTtUC/TijtcnuiYm4HW4URJBiIaT1EzEMIYa/x93TGbasqIu
         E+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXdFJXiNXm1uhtE0yp16khaip7EKruNUySG0yQVGgF4=;
        b=x9uKzEnarndaAAKqRp1VwwOrA8IFqcDH7psdaywwWmHM6EnuQjD5xLB41gwSTAcH19
         N0geB3ckkWoA0L31yrrj5OGGSp72lNTzhw4qLBnN7tyn52R94Qz8H3xMmDgeWa5RY7Um
         57XHj8tjkDKiAT7gq84cFUP8kItu3Xvdgr07i7pAatkqzb9XQvh8wJndS8/dbYqalGWV
         dos4rdDRLBN88ZzBf7wuIniJG7m/Ve75y+vbQ6FgEPDEwj3ECbseJ1RblojgGgMBGy/P
         Hq8cpg2CgTeod88HWZ6Ppq5wBxiOPXQLTYs71idHsat1P9jEU9LLTHW8Aoo8RbmWHV9b
         0Vvw==
X-Gm-Message-State: AOAM5302zVOTvbeeU1qCeibpU+1VstQ/2QW2rbsoRciZpWCk0oAW5L35
        TWAvtNophVC8n1PQvnMWLWiT+g==
X-Google-Smtp-Source: ABdhPJz5pAldNO84rrQnw55FvK0THqJuVFs3aAhLYNgVCXGAw10jxNWvUcf9om5tpQbC0mNqAJVm9g==
X-Received: by 2002:a2e:70a:: with SMTP id 10mr22420649ljh.89.1633445013220;
        Tue, 05 Oct 2021 07:43:33 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm1987173ljc.120.2021.10.05.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:43:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
Date:   Tue,  5 Oct 2021 17:43:24 +0300
Message-Id: <20211005144329.2405315-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
References: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert Qualcomm PMIC MPP bindings from .txt to .yaml format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/pinctrl/qcom,pmic-mpp.txt        | 187 ------------------
 .../bindings/pinctrl/qcom,pmic-mpp.yaml       | 180 +++++++++++++++++
 2 files changed, 180 insertions(+), 187 deletions(-)
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
index 000000000000..6066857b5964
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml
@@ -0,0 +1,180 @@
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
+      gpio-line-names = "VDD_PX_BIAS", "WLAN_LED_CTRL",
+              "BT_LED_CTRL", "GPIO-F";
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

