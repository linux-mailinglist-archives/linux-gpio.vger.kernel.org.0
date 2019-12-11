Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FC411A74D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbfLKJgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:36:08 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38828 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfLKJgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:36:08 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so16144229lfm.5;
        Wed, 11 Dec 2019 01:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uwMxFpJ6rVjutyAxoq/qUri7Fh/bI2bVb9TQUotv3no=;
        b=rlzk5FCFoUSCZAqpxIH2rJFMWEOx6XvjdKcJ4+dbguVBwFmjWO/YN4s/kNEZNWTWMp
         +Ud3PN7H28Ppfu014Rr7hCLJxQtWIPXk6ny2VsdqfrtNA6QRGGfPQ/ZoK3lu3/hrVFWs
         8127Ox9d2BJbfdyLs6/UDeULu6aUEm9y/yAZOaYjAZkBT+53EhxXOnv022e+09rJyF6u
         QHHSXDmsWnI+NEaFEjbytlVIs64r+UGXI9zWE8Ai1XNOQ9du0qQDeO3PHbbR+W+tY6x7
         1tX2+nuWmDW0U2H9WStuQQPm9jlIm1hi77OVkJnMESU73hOH5t8EfcAGTDqDntitvY/O
         txtg==
X-Gm-Message-State: APjAAAXp7ABdPYZJDoXE3Dc0tFPGjpHyQqK5Sor/tSBqx3OxG22a6q9k
        7rebFHGeVfUg+om0rx/VSsE=
X-Google-Smtp-Source: APXvYqxhRneKk5VwUGUNY4GR2CHpXNKKqGgC3/375a+Tuu1d0Hjcd0WjCJTwLp7RhQ18OIRwBRDbpA==
X-Received: by 2002:a19:4a:: with SMTP id 71mr1553768lfa.50.1576056964646;
        Wed, 11 Dec 2019 01:36:04 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id q17sm793405ljg.23.2019.12.11.01.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:36:04 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:35:57 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 01/15] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <0985fec1cce98b1db66e5df2d9bcf2dfd9c224a7.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changelog since v5:
- Remove regulator run-level properties
- Change SPDX to dual lisence
- remove forgotten comments about node name check (kept capitals as all
  ROHM PMIC bindings have capital nodes and names are meaningfull)
- comment indenting styling

 .../regulator/rohm,bd71828-regulator.yaml     | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
new file mode 100644
index 000000000000..71ce032b8cf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
+        # Supported default DVS states:
+        #     buck       |    run     |   idle    | suspend  | lpsr
+        #--------------------------------------------------------------
+        # 1, 2, 6, and 7 | supported  | supported | supported (*)
+        #--------------------------------------------------------------
+        # 3, 4, and 5    |                    supported (**)
+        #--------------------------------------------------------------
+        #
+        #(*)  LPSR and SUSPEND states use same voltage but both states have own
+        #     enable /
+        #     disable settings. Voltage 0 can be specified for a state to make
+        #     regulator disabled on that state.
+        #
+        #(**) All states use same voltage but have own enable / disable
+        #     settings. Voltage 0 can be specified for a state to make
+        #     regulator disabled on that state.
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
