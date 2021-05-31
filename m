Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F344D395AF5
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 14:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhEaMxq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhEaMxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 08:53:40 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DB9C06138E
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:58 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id k7so6980683ejv.12
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZ6xGzQ1fYucC28Sy5XBR8mgxxxOu3bU8otSn6/V0po=;
        b=o5kes/mRYV7YKsBs96WoweZ2wGv+3fJW0Pvl9b9kquDY1X700c63DbHYGt6BX4g0s+
         +yBctNDfdR43wxH6Fd4Z/7cEdD9HsrO5sQRLscm+8Pc1gtlVH7yqkOJlX9qbOBe5fA34
         y8A6Z0+TofK86ABqdJU15OlXJSNeJDhNfQWI+iY6DuHWoueYmEIxcDrE7fgssOhJ8Sxg
         DgK9a8jgRbBh6xmwQgj/KK6AcGfw1CK2rA4YhmTpynQGxmdhXIw/eRJc2wr6h2hua38p
         +HCG98cQgDKyKJ1iYZtkgd0DMd6bm/WFkDj9YcxOC8skuRJpROhmvUu3rnY3UCUAHvoN
         pu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZ6xGzQ1fYucC28Sy5XBR8mgxxxOu3bU8otSn6/V0po=;
        b=nNwaBIJWQVU+Pa9eIN6Ltub4Whb3hJe3GmpF7lbniJGR5jNKAPrxApx8N7+NkMziSC
         /zb0oUl1Is6TSg1f8hKBuAaBWAnc1m2iuf6ZIvbjbApMgT9P5iiXfsnCjz1bVf8nYOCn
         Jrk7NR64LOTw0UuFj5FjQAyi7z8sKPPyKgBcEIn4SZCrzJ+M9f1bOZ5Aga0NBQnl0YTq
         4AZg4lKYx4VnuVHzoAAVvt0aFdxuPlplmZmobmTb/EwuwgMECP6awEARijnZ/wpIkaRp
         v9xXTIXPzJsD1/F7mc0AUEgTBd7gr8bX20L6bAJpi1ltiUlCXwCWUCtefUJ1PXGSRpHP
         Tb8A==
X-Gm-Message-State: AOAM532ZuNEFkjh2MRCCULmP2iO2w4susj6jBEMOofS72ikndWzdMnAu
        b9u8ew+fdJberLS/7rfs4zJM6g==
X-Google-Smtp-Source: ABdhPJwILK/Eui4YN3DAbyGkKPJOqsF5pFnUYGjboUHtjuCbzlwmZxlKxW3xVrvBrK8WdX6i/TLYFg==
X-Received: by 2002:a17:906:f150:: with SMTP id gw16mr21721645ejb.230.1622465517353;
        Mon, 31 May 2021 05:51:57 -0700 (PDT)
Received: from localhost.localdomain ([188.252.220.231])
        by smtp.googlemail.com with ESMTPSA id zb2sm5886898ejb.52.2021.05.31.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:51:57 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
Date:   Mon, 31 May 2021 14:51:42 +0200
Message-Id: <20210531125143.257622-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531125143.257622-1-robert.marko@sartura.hr>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documents for the Delta TN48M CPLD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Include bindings for reset driver

Changes in v2:
* Implement MFD as a simple I2C MFD
* Add GPIO bindings as separate

 .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 +++++++++
 .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
 .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
new file mode 100644
index 000000000000..aca646aecb12
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Delta Networks TN48M CPLD GPIO controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  This module is part of the Delta TN48M multi-function device. For more
+  details see ../mfd/delta,tn48m-cpld.yaml.
+
+  GPIO controller module provides GPIO-s for the SFP slots.
+  It is split into 3 controllers, one output only for the SFP TX disable
+  pins, one input only for the SFP present pins and one input only for
+  the SFP LOS pins.
+
+properties:
+  compatible:
+    enum:
+      - delta,tn48m-gpio-sfp-tx-disable
+      - delta,tn48m-gpio-sfp-present
+      - delta,tn48m-gpio-sfp-los
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
new file mode 100644
index 000000000000..2c6e2adf73ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Delta Networks TN48M CPLD controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Lattice CPLD onboard the TN48M switches is used for system
+  management.
+
+  It provides information about the hardware model, revision,
+  PSU status etc.
+
+  It is also being used as a GPIO expander for the SFP slots and
+  reset controller for the switch MAC-s and other peripherals.
+
+properties:
+  compatible:
+    const: delta,tn48m-cpld
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^gpio(@[0-9a-f]+)?$":
+    $ref: ../gpio/delta,tn48m-gpio.yaml
+
+  "^reset-controller?$":
+    $ref: ../reset/delta,tn48m-reset.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpld@41 {
+            compatible = "delta,tn48m-cpld";
+            reg = <0x41>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@31 {
+                compatible = "delta,tn48m-gpio-sfp-tx-disable";
+                reg = <0x31>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            gpio@3a {
+                compatible = "delta,tn48m-gpio-sfp-present";
+                reg = <0x3a>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            gpio@40 {
+                compatible = "delta,tn48m-gpio-sfp-los";
+                reg = <0x40>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            reset-controller {
+              compatible = "delta,tn48m-reset";
+              #reset-cells = <1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
new file mode 100644
index 000000000000..0e5ee8decc0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/delta,tn48m-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Delta Networks TN48M CPLD reset controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  This module is part of the Delta TN48M multi-function device. For more
+  details see ../mfd/delta,tn48m-cpld.yaml.
+
+  Reset controller modules provides resets for the following:
+  * 88F7040 SoC
+  * 88F6820 SoC
+  * 98DX3265 switch MAC-s
+  * 88E1680 PHY-s
+  * 88E1512 PHY
+  * PoE PSE controller
+
+properties:
+  compatible:
+    const: delta,tn48m-reset
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#reset-cells"
+
+additionalProperties: false
-- 
2.31.1

