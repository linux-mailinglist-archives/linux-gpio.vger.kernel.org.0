Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE116125EF5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfLSKdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:06 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:52502 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLSKdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:04 -0500
Received: by mail-wm1-f52.google.com with SMTP id p9so4892103wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xp7wCXpGcTVvcKAxVVzo9jEX41qdh69vVDMu6rxufAY=;
        b=eEX5v9lX8C+ZtbyJB8auS8U8CsO36kg32qqSK3F7y5vQaTkEfTO23mFeSZ+2t3qwdA
         6g3ZorcylCtjEpihICW97lcg+9XgghHL/GjFs1hwsOVZZ0h+dq/YAdc6YAjH7wco0wnF
         Hlvt20Xq9mQ0PjBiKyp2MK0u98XDKaHSNuo7UQsqD+M23IayKUodDl/AxnNZAdpvvqAy
         qo2QUcDLc8xmZNWrz0J6fozlNxLLwZ2LDPwBcRyfrG+vyn1vukDg2/fuoNAsooHccZ3J
         IANCKCmu9ng2i5X9B0FlvvoffWlz/2MxBauc31UZCvS1dbfkva6CBDMJRc+s7ScZHXq2
         Kp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xp7wCXpGcTVvcKAxVVzo9jEX41qdh69vVDMu6rxufAY=;
        b=ATUJ84Aaaf72QFGiBkQAO7HVBatJcjK7rPUqeciAQoAG5NNqnYhpvlbEw4OLyMRbxW
         aXDK1GXy5NwW91hq6/V+/k7MQPLsjLWQpW/SSdfCmNWAkGWI30DuuclH9QfdmxiDeq+1
         KWx54fCmLp6sMO7Wb3hxHGVbtp8Jb086WGsgqU7HoakCQTnj6pbt8s1kR73CILBvY8XX
         l8hQuyxRLbq6EvvfWP9k/GyzyLao10IcCH18M4F7JlCOLs8YNCXLRHE2ng01ri7l9LuC
         peujQL5Hhx5PUopoH4GYkRlgZrUJM2G0eVe/R1U6gzuc84L2SBrxsr8woc2/f4/+cyZP
         RtyQ==
X-Gm-Message-State: APjAAAWoZ7EJ9RK3DIDUG7zzL4Wf3ru/ThyuFCHY76CB2QJRUSpowip8
        tqdkdwtQvWreVfj4Agse6TUgEQ==
X-Google-Smtp-Source: APXvYqzUEagaYTJi8MGbiPAskDxge5eGOdAtGi0+q32gRMMqKS3+3vhstU1BV4VwEMPU44Zhc6QAyA==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr8849848wmj.39.1576751582540;
        Thu, 19 Dec 2019 02:33:02 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:33:01 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 01/11] ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
Date:   Thu, 19 Dec 2019 10:31:43 +0000
Message-Id: <20191219103153.14875-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds bindings for wcd9340/wcd9341 audio codec which can
support both SLIMbus and I2S/I2C interface.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..38eaf0c028f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,175 @@
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
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias4-microvolt:
+    description: micbias4 voltage
+    minimum: 1800000
+    maximum: 2850000
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
+  gpio@42:
+    type: object
+    allOf:
+      - $ref: ../gpio/qcom,wcd934x-gpio.yaml#
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
+        gpio@42 {
+            compatible = "qcom,wcd9340-gpio";
+            reg = <0x42 0x2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+...
-- 
2.21.0

