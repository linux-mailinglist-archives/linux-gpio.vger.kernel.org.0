Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E73EC1EA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfKALcE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:32:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42453 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKALcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:32:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id a21so9879910ljh.9;
        Fri, 01 Nov 2019 04:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g79LlidZ2Q6199flvIi6ql8D8EZxQF1RMl7GiAKKol8=;
        b=Q/nS53ZfnqFKAlPSqYhHxcsbilyp4cr9voWzIR2AuGuaSx5bJSvf53DSDdACxPBNko
         uDMyELBF5fble5kCv1GC+E4aG0E3xTRZaSINSaWPX7jkp9AtXN7jRd7lp8SmJNpLi1Fj
         h2R490LxBXg7s+ZnZSUI2FKMQvw49XMvl/YVnxBLOywJNIWLKLDAio/rrjQjWR7uIhrb
         IoaTRW27Bx7T55SGksbCoCo7PxCmV08/iSRzqyyot6odpePp1nKcW1YZMxNGUngLA31N
         m7D3Tai3cnfZ8kfefKQqQvBvBZ6UC6VH0tHegQUhhH16tojWwOxvbc8DlfOolS7HUKJW
         qHdA==
X-Gm-Message-State: APjAAAUFY7UCneHgnwhhqP6xG26f5+4uvplvjk+9QLd0GJzsIASvdpQ/
        bMxQ7djaOVZA/7qnAYjjsWA=
X-Google-Smtp-Source: APXvYqzriYWSyCdBVM6VFhdgPbXTUL2T3CT5e9dCPC4d7jW2/VjyrY1GTpsschySRC+P+zhNrObcKA==
X-Received: by 2002:a2e:6a02:: with SMTP id f2mr7726508ljc.174.1572607921509;
        Fri, 01 Nov 2019 04:32:01 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id m21sm2438960lfh.39.2019.11.01.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:32:01 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:31:46 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 03/15] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <ce43bfd90455b14216262494f4ba4028827239c0.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes from v2 - my first encounter with yaml :/

 .../regulator/rohm,bd71828-regulator.yaml     | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
new file mode 100644
index 000000000000..60715d8b92df
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd71828-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+  - Mark Brown <broonie@kernel.org>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  This module is part of the ROHM BD71828 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  Regulator nodes should be named to BUCK_<number> and LDO_<number>.
+  The valid names for BD71828 regulator nodes are
+  BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7
+  LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
+
+patternProperties:
+  "^LDO[1-7]$":
+    type: object
+    allOf:
+      - $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      #Is there a nice way to check the name is same as node name but lower case
+      regulator-name:
+        description:
+          should be "ldo1", ..., "ldo7"
+
+  "^BUCK[1-7]$":
+    type: object
+    allOf:
+      - $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      #Is there a nice way to check the name is same as node name but lower case
+      regulator-name:
+        description:
+          should be "buck1", ..., "buck7"
+
+      rohm,dvs-run-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          PMIC default "RUN" state voltage in uV. See below table for
+          bucks which support this.
+
+      rohm,dvs-idle-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          PMIC default "IDLE" state voltage in uV. See below table for
+          bucks which support this.
+
+      rohm,dvs-suspend-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          PMIC default "SUSPEND" state voltage in uV. See below table for
+          bucks which support this.
+
+      rohm,dvs-lpsr-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          PMIC default "LPSR" state voltage in uV. See below table for
+          bucks which support this.
+
+#Supported default DVS states:
+#buck		| run		| idle		| suspend	| lpsr
+#----------------------------------------------------------------------------
+#1, 2, 6, and 7	| supported	| supported	| 	supported (*)
+#----------------------------------------------------------------------------
+#3, 4, and 5	| 			supported (**)
+#----------------------------------------------------------------------------
+#(*)  LPSR and SUSPEND states use same voltage but both states have own enable /
+#     disable settings. Voltage 0 can be specified for a state to make regulator
+#     disabled on that state.
+#(**) All states use same voltage but have own enable / disable settings.
+#     Voltage 0 can be specified for a state to make regulator disabled on that
+#     state.
+
+      rohm,dvs-runlvl-ctrl:
+        description: |
+          buck control is done based on run-level. Regulator is not
+          individually controllable. See ../mfd/rohm,bd71828-pmic.yaml for
+          how to specify run-level control mechanism. Only bucks 1, 2, 6
+          and 7 support this.
+        type: boolean
+
+      rohm,dvs-runlevel0-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          voltage for run-level 0. Microvolts.
+
+      rohm,dvs-runlevel1-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          voltage for run-level 1. Microvolts.
+
+      rohm,dvs-runlevel2-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          voltage for run-level 2. Microvolts.
+
+      rohm,dvs-runlevel3-voltage:
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        description:
+          voltage for run-level 3. Microvolts.
+
+    required:
+      - regulator-name
+  additionalProperties: false
+additionalProperties: false
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
