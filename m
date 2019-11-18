Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D484FFEC2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 07:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfKRGyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 01:54:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38842 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfKRGyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 01:54:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id q28so12853002lfa.5;
        Sun, 17 Nov 2019 22:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ahLvsdtkxH4r9o1n1ZB2HO2oyc7ZYN5pHqG+YF1HOJg=;
        b=EVkRA5fevranwkUcSWoLgb6Xy1M9o7hALfW9PsEqvurryU1/J7g2aa2p5sbqvzrCYi
         +rMH0zwv72A0w6PRkO4O/F4/VBebMQr3Y99lBPONPyj3BNSfiJdK4HqJ7uSul75YzTuf
         qAFcrfHWIb6Fk74PGpmlSgCq9sISQNSr9Gm6CXnNDptzs6CG+96fg9nO6Zmba6iLPJs1
         PUOHNwAvGM55ncLRiYMVhk/81AgjyG6KHHdFCyBGMkDsypDQl4f70n6CVPTqq0LLlftp
         YIp0g3BFpDtRwcjI3vtjQfgm05lOr5Lv3slMf/X0Z8g0O/0YEw/iEea07Etema0UQqDM
         rIJA==
X-Gm-Message-State: APjAAAWHJ8ptqRRL5KFN4d2IFG/Mi/TreUr4i0DqQ35lwtDzCMawgoBG
        lQ8NyMw554YlzE50OGVn6W8=
X-Google-Smtp-Source: APXvYqy0xSSKUleLxXJU4EQM5lRUL/0uQ7/HXhiCgmcEJAoeL5Yw8yn6297cFzl3yLPXhxEnfT+35g==
X-Received: by 2002:a19:be92:: with SMTP id o140mr19781083lff.40.1574060043791;
        Sun, 17 Nov 2019 22:54:03 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id a11sm7697083ljp.97.2019.11.17.22.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 22:54:03 -0800 (PST)
Date:   Mon, 18 Nov 2019 08:53:57 +0200
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
Subject: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes from v4

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
