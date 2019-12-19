Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59F9125F0D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfLSKdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39741 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfLSKdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:15 -0500
Received: by mail-wm1-f68.google.com with SMTP id 20so4933856wmj.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bP6qV0Ge4OMghuS4pDxfRI185IDu6wuYLbRLvgY6Moc=;
        b=SMNsyxx7pM0b1zkW0RLF0Ik1SoN8mF1dLMIOX7+uhrefdK8m4QfUEC8B7dESlSX43D
         o3Mm5OxXX1I1Rmrn4vAqg/c16QLZxlUS8daAh+vH2g1yQMIfxGCGj0/au5+jzW7+1MJV
         CjB5wB1FWHFqTBnr0RjOy39QxfQFfJC7GICtDSTJoct4srrMWKb9neNcdaKXc8URW2X+
         L+2HYf0iz/nnCVEkCxGVR1+guCkiAJp/XUKavpVFnQLjl77N/PiCHP+0qHECp+Wuz7aV
         NaQ2ATplLJ1sXdZE+5WBn6F0StShPIDMLvlccayCdSw+CQBZR/x2LVc0zyEIuLiugJP4
         HfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bP6qV0Ge4OMghuS4pDxfRI185IDu6wuYLbRLvgY6Moc=;
        b=WgVZetx6DZv7mYDpLC0I2VHs+pkhAzetw8oqgqrD+1DS+ocy0VIgGE6zs/7XWQRUB6
         4sZdXJxFD05p4O2XzHwfRzWML9cMFHt9zL/c7P97ZCXLywwUye6mDoP1tgRvsvv5xihf
         Y7pSaKexGV9PBzcB/KE4qejb2VIdFl6zw9uK+Jh4/RaRTBNsq+BHXzWdZCuKUa+LZf4/
         5VzQmlp2pO4c5l9UtCSFfEPFhhQuzjFreKEnEpl3Lc1NSGszsaK+h2eT/+1zeobdX9wB
         4reaSePZJREW0iMDEoCAnTXA0zsXLkm0ikT2ysX0zUtj8l/VDppIkHzJQejcgPWY3Bs1
         d46Q==
X-Gm-Message-State: APjAAAWxBC6UYJXP9XuvFjYXDH1GetbRgJpx3rSWjOQeInOqT0J5rTXi
        ePWHXtChuLQvhqWy/VtjJ4cedg==
X-Google-Smtp-Source: APXvYqzwOH98SgAnD5SDQMHUns16r8ldkHFrtDb0Q3HVojtJ8JC8Dm2IqDYd3FXluATryDb1bNRBCQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr8751070wmc.131.1576751592455;
        Thu, 19 Dec 2019 02:33:12 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:33:11 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add bindings for gpio
Date:   Thu, 19 Dec 2019 10:31:50 +0000
Message-Id: <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
gpio controller to control 5 gpios on the chip. This patch adds
required device tree bindings for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
new file mode 100644
index 000000000000..32a566ec3558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qcom,wcd934x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
+  gpio controller to control 5 gpios on the chip.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9340-gpio
+      - qcom,wcd9341-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdgpio: gpio@42 {
+        compatible = "qcom,wcd9340-gpio";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.21.0

