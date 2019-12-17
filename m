Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C54122BDC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 13:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfLQMja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 07:39:30 -0500
Received: from foss.arm.com ([217.140.110.172]:35638 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbfLQMj3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Dec 2019 07:39:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBD6328;
        Tue, 17 Dec 2019 04:39:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98D8C3F718;
        Tue, 17 Dec 2019 04:39:27 -0800 (PST)
Date:   Tue, 17 Dec 2019 12:39:26 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        matti.vaittinen@fi.rohmeurope.com,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        mazziesaccount@gmail.com,
        Michael Turquette <mturquette@baylibre.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Pavel Machek <pavel@ucw.cz>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Applied "dt-bindings: regulator: Document ROHM BD71282 regulator bindings" to the regulator tree
In-Reply-To: <0985fec1cce98b1db66e5df2d9bcf2dfd9c224a7.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
Message-Id: <applied-0985fec1cce98b1db66e5df2d9bcf2dfd9c224a7.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
X-Patchwork-Hint: ignore
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The patch

   dt-bindings: regulator: Document ROHM BD71282 regulator bindings

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 84a867c078136887dea64fa6e336333b657bc6a1 Mon Sep 17 00:00:00 2001
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Date: Wed, 11 Dec 2019 11:35:57 +0200
Subject: [PATCH] dt-bindings: regulator: Document ROHM BD71282 regulator
 bindings

Document ROHM BD71828 PMIC regulator device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Link: https://lore.kernel.org/r/0985fec1cce98b1db66e5df2d9bcf2dfd9c224a7.1576054779.git.matti.vaittinen@fi.rohmeurope.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.20.1

