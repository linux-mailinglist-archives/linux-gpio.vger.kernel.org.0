Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B576FF4DA
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 19:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfKPS4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 13:56:04 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34391 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfKPS4D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 13:56:03 -0500
Received: by mail-lj1-f193.google.com with SMTP id 139so14264069ljf.1;
        Sat, 16 Nov 2019 10:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mvEclu5vTGP+CKxGJKD3pjj9Bl8VLFVbSby9vh8jVlA=;
        b=Hx4ylZQnzJweldoY3JDcBhI4XZbXmrC1CEgxGxWcO51UpQe+GUHwLMO4SDJHXajLYP
         xL+e27Fsj4WyFizEdFefyb73AFTItH+AF16y01rPIEbrwPQT/xFzbgoYSI84SoLhE0pZ
         WLZsSO+iFO+IE4wvDNrDxSupQqfWRhdyVMfsqcbUbvOvkgPlUTQYxglc0WQvXMyDUL+k
         zJjwrLUahE/EbL9qZK+P5TtHWkCfi5Cap7Hh7GDz2OXtTmflaTs8UVkvx9KEnpry7Zj9
         fVxN9Zp0X54qr5F06A5Czo2kIqU2FbcaW9HcaBmN9cSGBc3m2SJLVz3AoVD82n4y91SP
         QGRQ==
X-Gm-Message-State: APjAAAUhS3ds3jU/hLvfmXkNBUGAs8fIS7lEpBpS+6xMH9XcoxIb4RQD
        zyQU78k4cipfji8izIW4oqs=
X-Google-Smtp-Source: APXvYqxBzkanpzWWCj4GGeZj8fx5fJqGGW9rOAoXnzBZxyFsrDXaUHaPyGfsLRQOE/tq/p7OUZ4f2g==
X-Received: by 2002:a2e:9b5a:: with SMTP id o26mr9191654ljj.174.1573930560133;
        Sat, 16 Nov 2019 10:56:00 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id n1sm5766633ljg.44.2019.11.16.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 10:55:59 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:55:50 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <d29e0eb587b764f3ea77647392e45fac67bbd757.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../regulator/rohm,bd71828-regulator.yaml     | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
new file mode 100644
index 000000000000..c23ec4d8584b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd71828-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
+        pattern: "^ldo[1-7]$"
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
+        pattern: "^buck[1-7]$"
+        description:
+          should be "buck1", ..., "buck7"
+
+      rohm,dvs-run-voltage:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - minimum: 0
+            maximum: 3300000
+        description:
+          PMIC default "RUN" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+
+      rohm,dvs-idle-voltage:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - minimum: 0
+            maximum: 3300000
+        description:
+          PMIC default "IDLE" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+
+      rohm,dvs-suspend-voltage:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - minimum: 0
+            maximum: 3300000
+        description:
+          PMIC default "SUSPEND" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+
+      rohm,dvs-lpsr-voltage:
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/uint32"
+          - minimum: 0
+            maximum: 3300000
+        description:
+          PMIC default "LPSR" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
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
+      rohm,dvs-runlevel-microvolts:
+        minimum: 0
+        maximum: 2000000
+        maxItems: 4
+        description:
+          Array of voltages for run-levels. First value is for run-level 0,
+          second for run-level 1 etc. Microvolts.
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
