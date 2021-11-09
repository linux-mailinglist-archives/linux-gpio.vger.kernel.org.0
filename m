Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FF544ACAC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343520AbhKILfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343516AbhKILfk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:40 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3780C061767
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:53 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id f8so75503891edy.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSwjERU+mHTwJoAySbsl/JOKehwDXt/v3TeUwkBDMGI=;
        b=4bgOxRQBWmhA022XitiLtC4Ou9E6pighvbQeYJ1Xw5lS3ucSbDHOEA6MSeXGWGbpIb
         m0KXvv88pQUN9dv32KKnJN15c85L5lCti3Qm1Pz7UYOD5WL7nIKlQypa3mV9MOE0+zk+
         zBS8/CuRcGL/fHor1bh1Q3ZQtBAt7y3aCTyKmuJKf/IDfXukiFWCFUZPyyIL6xvr3ego
         ysAqa0+xqngQzZOxCdG7XClIKMLenNmvOp6Gd0CFTaINjyljrB7QsNjj6mxEOWTV7/id
         c94RcMIvHF7dS/k3yeisgSdTDQkg795Fxo1K4abuLPniIoX+nuwpGQH2IEPzBtct/0AB
         Swhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSwjERU+mHTwJoAySbsl/JOKehwDXt/v3TeUwkBDMGI=;
        b=45rrePIvK/MKY5CSrfN+Ry/Cu5SRXJhSiRLYxFfORMbhdHEQjP+iil9TdMF8wLdZtT
         dv0e0cFmNjM5c56+eEh+0w1t2ha3YZdChOE74xQUZZRBXx6rLrDkkwkDf3J4ZqFpZ8Wj
         vQh7zkvUOkMDhT90v0L4OnsscssG8k+I/gvlcWtuHd/JwPnDh6Fg4IDPmZpUt0a9fTqf
         h49GHbUagtkQ0BoU/2gl4W/d2r5M1ZWd8G7aC7mIUIm1Za0Na5rBkaU2LTSr978HrAqn
         3xGjlQYlRdqvG1nJsuycCvKb5SRokDRYqduBp+VoVCS3FEo4dyvXFuGnLWpmUbj7Bh8R
         0qkw==
X-Gm-Message-State: AOAM531Mg8RaurWludPHF6t1lsJndGEHIygOVhanZ0SjUKdrf9Mjr5o5
        7By1KbfTzP7G3htOf6zmd3E3Dg==
X-Google-Smtp-Source: ABdhPJxSq9z4twBHE9G27gNHIQHWBvvPvQyD+SU+kE6W7dbw3+85+vPf2kJY8BHefRz5f40O+NfDLw==
X-Received: by 2002:a05:6402:4381:: with SMTP id o1mr8703056edc.301.1636457572189;
        Tue, 09 Nov 2021 03:32:52 -0800 (PST)
Received: from fedora.. (cpezg-94-253-144-18-cbl.xnet.hr. [94.253.144.18])
        by smtp.googlemail.com with ESMTPSA id s4sm6771167ejn.25.2021.11.09.03.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:32:51 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, michael@walle.cc, andrew@lunn.ch
Cc:     luka.perkov@sartura.hr, bruno.banelli@sartura.hr,
        Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
Date:   Tue,  9 Nov 2021 12:32:38 +0100
Message-Id: <20211109113239.93493-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109113239.93493-1-robert.marko@sartura.hr>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documents for the Delta TN48M CPLD drivers.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v7:
* Update bindings to reflect driver updates

Changes in v3:
* Include bindings for reset driver

Changes in v2:
* Implement MFD as a simple I2C MFD
* Add GPIO bindings as separate
---
 .../bindings/gpio/delta,tn48m-gpio.yaml       | 39 ++++++++
 .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
 .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
new file mode 100644
index 000000000000..e3e668a12091
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
@@ -0,0 +1,39 @@
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
+  Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
+  It provides 12 pins in total, they are input-only or ouput-only type.
+
+properties:
+  compatible:
+    enum:
+      - delta,tn48m-gpo
+      - delta,tn48m-gpi
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
index 000000000000..f6967c1f6235
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
+  It is also being used as a GPIO expander and reset controller
+  for the switch MAC-s and other peripherals.
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
+                compatible = "delta,tn48m-gpo";
+                reg = <0x31>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            gpio@3a {
+                compatible = "delta,tn48m-gpi";
+                reg = <0x3a>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            gpio@40 {
+                compatible = "delta,tn48m-gpi";
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
2.33.1

