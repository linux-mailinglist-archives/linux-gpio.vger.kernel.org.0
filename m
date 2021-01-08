Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57C62EF32B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbhAHNho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:37:44 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:35729 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbhAHNho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:37:44 -0500
Received: by mail-lf1-f51.google.com with SMTP id u25so2194578lfc.2;
        Fri, 08 Jan 2021 05:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m7peezITxLo8cvzv94lyciJjJzgj2cWPwMBBkA+DKGQ=;
        b=RzgazgmU/JysZvE3dYImbp6zj3wp/Xc6Ue24Sgjr17ZWC/Ar2iBW8LkGYgT+aWxUXw
         FzK+Aci9rop9feCTb+DjS8EdDBQ/HICkn0a6jTj2q8PgWNmTnoK9UpMK7dnhwKH3syRt
         P5W+iH2X8t445xsRKbFklej8jkUBaleGLiyA5V+ShDUSk/oYFNUVxlHTQtIL3Uin9kXJ
         eWzmk8nUPiBNT2fL8NqOOr8QXr5tzGnDqLdDmj7Ne2I/aYxY6FerHM1qcPcU7hd6rwG7
         a82zOgQperr64HgrIbleK0BpAitArKHZgsM4PyoS4xFgvPhr8FN8jIQ6WOX/9tWGVNRs
         UIZA==
X-Gm-Message-State: AOAM531/H8oxs9WHtzIrBWwV/3mNn3Nbosb1e92Dwo4TNs7NC3wCFOQY
        /lh7entvA3h8OHfzcIdYDIs=
X-Google-Smtp-Source: ABdhPJytLjRzLl7i42qpSSbNSeQbKkO4vzWD2amf/jiSEaAP9/cBku58fW1UqyYDALU0cSGng9B6Ug==
X-Received: by 2002:a2e:3c01:: with SMTP id j1mr1480663lja.258.1610113005584;
        Fri, 08 Jan 2021 05:36:45 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id y3sm2072102ljh.107.2021.01.08.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:36:45 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:36:38 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
Subject: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Message-ID: <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for regulators on ROHM BD71815 PMIC.
5 bucks, 7 LDOs and a boost for LED.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../regulator/rohm,bd71815-regulator.yaml     | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
new file mode 100644
index 000000000000..2aa21603698c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
@@ -0,0 +1,104 @@
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
+patternProperties:
+  "^(ldo|buck)[1-5]$":
+    type: object
+    description:
+      Properties for single LDO/BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^(ldo|buck)[1-5]$"
+        description:
+          should be "ldo1", ..., "ldo5" and "buck1", ..., "buck5"
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
