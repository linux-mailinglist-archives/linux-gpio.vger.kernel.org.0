Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C403F1057F2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 18:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfKURGf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 12:06:35 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:51225 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKURFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 12:05:45 -0500
Received: by mail-wm1-f48.google.com with SMTP id g206so4304930wme.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0CdnmC51s8zyTnLpxAdvzFdi46JVkNPrKhVWokBLXxs=;
        b=MtHMFqGZVY775jFfjaJ15GFKrvKbfCeBBsmVAs7NXZd7iIO3E+FWjIcTh7PT/DoXaO
         S6kpdiibTz0itXz2Sdu7eQdontLDT2ojO1VqikuX+pXiZjqYb/Yo/qi0F4e42ojrQ7Ki
         jPKPeyvP01tku3+kc0jV7S0B0kBxeFl3JgrOqZCq+eaaOa0RahXzS+1NbNgqslu3kuSs
         vOyAgwsF5IGTlK/VWfOoyX6wyGC5/psMGnukXjlTcA0UwbPJzlHufihHe0smfBgf+vqH
         nANKJ8vWlHDBuj4XlGbyN+c1bFaEFF/qmHEMPKHm5XvKt0duA6FEVG3notno8R0hGW5D
         CgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0CdnmC51s8zyTnLpxAdvzFdi46JVkNPrKhVWokBLXxs=;
        b=i+EUO1/5KMYgJxOfgUcZ05XRNFnXi3U+3Df5uiPhRvEEfQOrQvyYJbuw6tFnmsT77n
         NNt/Vv9X+QbeM8KGGC84MDjpOwgmL6MQ4rYxTroZOfzWJ+T3B6eYXkArjLgnagnc6iuP
         N6ohaxcZTd0LwBBfN/9LKPBlAplkwRag4M95nGJX/rVE0M5GY/ZhSeqyPXUEwiTyfm6p
         3BEBEYy7grRH9PY7TS6LVTJKqZcZx0KgZ52gktjmRDf7qXVq6whcbrMO2QP5i7Vr2ICE
         CsXXuwwAcANcJppWMNhNRtLkf39G+NKRMy1rTK/8yZ9nqOE8thhtVBBDLGVNrOp/kicX
         uRSw==
X-Gm-Message-State: APjAAAXMNnn+s+AF7G2Ia1KdGOtDc20Zd+80MiRqTXKRNWJE5Gh39Hav
        xBQ7GbsnRqM8ML8LtrzUcnBdog==
X-Google-Smtp-Source: APXvYqz41XUi/i449snUsGeAY7khe46YsE5Z+HymsQSpyib+sZRZ+eXisBLgjb+PH3JLIK2xtI9gtw==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr10544212wmc.60.1574355941485;
        Thu, 21 Nov 2019 09:05:41 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 09:05:40 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 02/12] ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
Date:   Thu, 21 Nov 2019 17:04:59 +0000
Message-Id: <20191121170509.10579-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds bindings for wcd9340/wcd9341 audio codec which can
support both SLIMbus and I2S/I2C interface.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..197a53bfa6cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
+  It has in-built Soundwire controller, pin controller, interrupt mux and
+  supports both I2S/I2C and SLIMbus audio interfaces.
+
+properties:
+  compatible:
+    const: slim217,250
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  slim-ifc-dev: true
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-buck-sido-supply:
+    description: A reference to the 1.8V SIDO buck supply
+
+  vdd-rx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-tx-supply:
+    description: A reference to the 1.8V tx supply
+
+  vdd-vbat-supply:
+    description: A reference to the vbat supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-micbias-supply:
+    description: A reference to the micbias supply
+
+  qcom,micbias1-microvolt:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: micbias1 voltage between 1800000 - 2850000 microvolt
+
+  qcom,micbias2-microvolt:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: micbias2 voltage between 1800000 - 2850000 microvolt
+
+  qcom,micbias3-microvolt:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: micbias3 voltage between 1800000 - 2850000 microvolt
+
+  qcom,micbias4-microvolt:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: micbias4 voltage between 1800000 - 2850000 microvolt
+
+  clock-output-names:
+    const: mclk
+
+  clock-frequency:
+    description: Clock frequency of output clk in Hz
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: |
+      WCD934x subnode for each slave devices. Bindings of each subnodes
+      depends on the specific driver providing the functionality and
+      documented in their respective bindings.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - slim-ifc-dev
+  - interrupts
+  - interrupt-controller
+  - clock-frequency
+  - clock-output-names
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - qcom,micbias4-microvolt
+  - "#interrupt-cells"
+  - "#clock-cells"
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    codec@1,0{
+        compatible = "slim217,250";
+        reg  = <1 0>;
+        reset-gpios = <&tlmm 64 0>;
+        slim-ifc-dev  = <&wcd9340_ifd>;
+        #sound-dai-cells = <1>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <54 4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #clock-cells = <0>;
+        clock-frequency = <9600000>;
+        clock-output-names = "mclk";
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,micbias4-microvolt = <1800000>;
+        clock-names = "extclk";
+        clocks = <&rpmhcc 2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        gpioctrl@42 {
+            reg = <0x42 0x2>;
+        };
+    };
+
+...
-- 
2.21.0

