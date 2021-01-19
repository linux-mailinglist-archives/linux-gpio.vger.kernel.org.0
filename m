Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA882FB2D4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbhASHT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:19:59 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:33940 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728594AbhASHSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:18:46 -0500
Received: by mail-lj1-f182.google.com with SMTP id m10so20759848lji.1;
        Mon, 18 Jan 2021 23:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tO6TArPCft4SsS7zinMP/yVERBOCtziNNR684d1B0wk=;
        b=G/WhYpV0NgAuGHj4BhhjnPnpeGj4p02I0Y4GsynFFe8mYSm3DGymF7AFeYmLxKD4QQ
         a1OT/DOWKN1wNPZ1O0jEIYotvt3Sgzj0YOt+d6SeTDdQ94UhtpcgZXY7+Dqf5KK8O6dH
         3pPfkvZMruHfePePmxHvmn1ksRS33RgShRVrRdNBB4cYi1+ZVmtAldpv/eSGELEiK8TN
         2ag8Fy6yYsEObpTxUmjk7Uy7LK5g6cdfsGvSfptqNrBkSF4gZMXIXhF9KTg7qciJS+h2
         tVr7C80tdBCsKlarnJsBiTSCOxRSgWTKeJCT5ttMd4P8cJuERKj0UKjVzYSZbPjya80c
         N8cA==
X-Gm-Message-State: AOAM5324IjzpZ58sIOL8JKvvbH+FOQz9W8VPYj2TLKDn60jYWBEeY/Ul
        YLEUyI+IumzqOOls4qS9lxs=
X-Google-Smtp-Source: ABdhPJwNmvxo7ogFbV5I54CvyXWuleIRvQ3q+9kIpD6ViXF0TVbvKaNwt+fTnGDqDyEkRdR1Tqj6Kg==
X-Received: by 2002:a2e:9a0d:: with SMTP id o13mr1369119lji.355.1611040637917;
        Mon, 18 Jan 2021 23:17:17 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z14sm2253271lfq.130.2021.01.18.23.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:17:17 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:17:09 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 06/17] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Message-ID: <950a87e680822ab6457ff95bba96730fed93e14d.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for regulators on ROHM BD71815 PMIC.
5 bucks, 7 LDOs and a boost for LED.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v1:
- Changed patch order to fix ref dependecy
- Added missing schema for nodes wled, ldodvref, ldolpsr

 .../regulator/rohm,bd71815-regulator.yaml     | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
new file mode 100644
index 000000000000..7d0adb74a396
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd71815-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71815 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  This module is part of the ROHM BD718215 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  The valid names for BD71815 regulator nodes are
+  buck1, buck2, buck3, buck4, buck5,
+  ldo1, ldo2, ldo3, ldo4, ldo5,
+  ldodvref, ldolpsr, wled
+
+properties:
+  wled:
+    type: object
+    description:
+      properties for wled regulator
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        const: wled
+
+patternProperties:
+  "^((ldo|buck)[1-5]|ldolpsr|ldodvref)$":
+    type: object
+    description:
+      Properties for single LDO/BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^((ldo|buck)[1-5]|ldolpsr|ldodvref)$"
+        description:
+          should be "ldo1", ..., "ldo5", "buck1", ..., "buck5" and "ldolpsr"
+          for ldolpsr regulator, "ldodvref" for ldodvref reglator.
+
+      rohm,vsel-gpios:
+        description:
+          GPIO used to control ldo4 state (when ldo4 is controlled by GPIO).
+
+      rohm,dvs-run-voltage:
+        description:
+          PMIC "RUN" state voltage in uV when PMIC HW states are used. See
+          comments below for bucks/LDOs which support this. 0 means
+          regulator should be disabled at RUN state.
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-snvs-voltage:
+        description:
+          Whether to keep regulator enabled at "SNVS" state or not.
+          0 means regulator should be disabled at SNVS state, non zero voltage
+          keeps regulator enabled. BD71815 does not change voltage level
+          when PMIC transitions to SNVS.SNVS voltage depends on the previous
+          state (from which the PMIC transitioned to SNVS).
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-suspend-voltage:
+        description:
+          PMIC "SUSPEND" state voltage in uV when PMIC HW states are used. See
+          comments below for bucks/LDOs which support this. 0 means
+          regulator should be disabled at SUSPEND state.
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-lpsr-voltage:
+        description:
+          PMIC "LPSR" state voltage in uV when PMIC HW states are used. See
+          comments below for bucks/LDOs which support this. 0 means
+          regulator should be disabled at LPSR state.
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+        minimum: 0
+        maximum: 3300000
+
+        # Bucks 1 and 2 support giving separate voltages for operational states
+        # (RUN /CLEAN according to data-sheet) and non operational states
+        # (LPSR/SUSPEND). The voltage is automatically changed when HW
+        # state changes. Omitting these properties from bucks 1 and 2 leave
+        # buck voltages to not be toggled by HW state. Enable status may still
+        # be toggled by state changes depending on HW default settings.
+        #
+        # Bucks 3-5 and ldos 1-5 support setting the RUN state voltage here.
+        # Given RUN voltage is used at all states if regulator is enabled at
+        # given state.
+        # Values given for other states are regarded as enable/disable at
+        # given state (see below).
+        #
+        # All regulators except WLED support specifying enable/disable status
+        # for each of the HW states (RUN/SNVS/SUSPEND/LPSR). HW defaults can
+        # be overridden by setting voltage to 0 (regulator disabled at given
+        # state) or non-zero (regulator enabled at given state). Please note
+        # that setting non zero voltages for bucks 1/2 will also enable voltage
+        # changes according to state change.
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
-- 
2.25.4


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
