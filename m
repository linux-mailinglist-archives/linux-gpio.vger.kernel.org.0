Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE6120C3BC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 21:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgF0TeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 15:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgF0TeR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 15:34:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5814C03E97A
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 12:34:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c11so6885153lfh.8
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OS0tuEEIRcucIT5KRfm48sO0MnOkhCN4BN78atXUZJM=;
        b=gsl6mzitEbwXjvrN1B3Ur3us6C+omy7IVxnu7879t+fu4oCG77fK52kG9IuAjVJJHm
         IBGx7BUbrYnLCWvjUsl26A4QgX9iF2UExte4/bCx32pEidze4SFfzuLIHUtI6guaHFPc
         01wUAiccO1akgglVH83h8CXdoW1miiqm8Wmuf1o7lo+AeFOnAv65OuSMjJ+PJrmgPJEN
         JvOFxUTbLr0LgHaXh9ZmaQMRuLU48gsNgyJwWZaDI7bNk0ZGci3glAyDnp7KqMfrM75i
         x4PyEqGpRVGWN/4gUCQlJbPVomYjCvOukraEYOqjUukUdgd2v+BiZz3DZuvK6VCkry8v
         qTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OS0tuEEIRcucIT5KRfm48sO0MnOkhCN4BN78atXUZJM=;
        b=U/D+LM71l8KcOW7QSE3smAQVDN8OcmK+u8e62G+LdGkJcxM4iETCEq3jI0wHFzD8eE
         ZxR45FRXOii8gKTe8GL1TCNftXeiD1RvD/C5LFerna7oWOwHINZWzh0u1lYqbu9CDnty
         3jc1kVhFgyyDqDBHZDUS0ZoXAmx3TZAKpzApwjAjmMeZLUwxasR+dRfhLBb8EhCG6+WD
         DI5WLuW02cLCq5UFlFQLiyrJdfbk7i2+TSvTqRJmQ6Folig+Kd0XBhzYxyqjkU/cpVSA
         /2nmVJmMRDN0L8dyhdyikORFjm5jhTOC/S961Xb/48xJ1JuJJCiNloBD3VdcHo3QHqpQ
         a7QQ==
X-Gm-Message-State: AOAM530bY2kk0+YQ+SsBFR4qGTKG+VJOaXGFeadbt91wwfRhTY6nD+L+
        xqMBJK+rDQqpRZIhLulEwF64zQ==
X-Google-Smtp-Source: ABdhPJz1sUmoW6q/FFxMkoywl+2L6RPbXOU/Zg0KC3kPOxMbo1ax14q0qVoKPrHtmsxFC6AWLEOg6Q==
X-Received: by 2002:ac2:5a50:: with SMTP id r16mr5423236lfn.170.1593286455052;
        Sat, 27 Jun 2020 12:34:15 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id a21sm991063ljn.2.2020.06.27.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 12:34:14 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 7c251c35;
        Sat, 27 Jun 2020 19:34:13 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
Date:   Sat, 27 Jun 2020 21:28:30 +0200
Message-Id: <20200627192833.217531-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm msm8226
pinctrl driver.

- Bindings documentation was based on qcom,sm8250-pinctrl.yaml by
  Bjorn Andersson <bjorn.andersson@linaro.org> and then modified for
  msm8226 content

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
new file mode 100644
index 0000000000..8d8dc15718
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8226-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. MSM8226 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  MSM8226 platform.
+
+properties:
+  compatible:
+    const: qcom,msm8226-pinctrl
+
+  reg:
+    description: Specifies the base address and size of the TLMM register space
+    maxItems: 1
+
+  interrupts:
+    description: Specifies the TLMM summary IRQ
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: Specifies the PIN numbers and Flags, as defined in
+      include/dt-bindings/interrupt-controller/irq.h
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      properties:
+        pins:
+          description:
+            List of gpio pins affected by the properties specified in this
+            subnode.
+          items:
+            oneOf:
+              - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+              - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
+          minItems: 1
+          maxItems: 36
+
+        function:
+          description:
+            Specify the alternative function to be configured for the specified
+            pins. Functions are only valid for gpio pins.
+
+          enum: [ gpio, cci_i2c0, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim5,
+            blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
+            blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
+            blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
+
+        drive-strength:
+          enum: [2, 4, 6, 8, 10, 12, 14, 16]
+          default: 2
+          description:
+            Selects the drive strength for the specified pins, in mA.
+
+        bias-pull-down: true
+
+        bias-pull-up: true
+
+        bias-disable: true
+
+        output-high: true
+
+        output-low: true
+
+      required:
+        - pins
+        - function
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        msmgpio: pinctrl@fd510000 {
+                compatible = "qcom,msm8226-pinctrl";
+                reg = <0xfd510000 0x4000>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+                gpio-ranges = <&msmgpio 0 0 117>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        };
-- 
2.25.1

