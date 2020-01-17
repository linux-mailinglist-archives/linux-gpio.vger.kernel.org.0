Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A525514064A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgAQJhp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:37:45 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33160 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgAQJho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:37:44 -0500
Received: by mail-ed1-f68.google.com with SMTP id r21so21674238edq.0;
        Fri, 17 Jan 2020 01:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c+wXb2cJErE61GOTeyodMvD+n3txh4GhuXDIAPrZGcI=;
        b=S1v1KcJpxQ0hP+6IoIcLxVXcwGFD8/xhd3oGOxgyosateVXcJN5BeLwnBzTljv/Pj4
         yvRZ+sFAgNWcfdMTY+9+dO+A8jLW5cMPPTXh2dsNzAzVcLewsHyjMh5H+siaXRsMWDtp
         Wq+pAflEoSpoRB5/84/BlCiZFJxu7jECEllDsZbHcRMiyMhlW6IGrWCDdBKr3q1eAVgV
         ExwBlSz8UJr/FOXV4piK3CUSBeey31limYUmR2cB/pgB3R/M+H3TcNAH7g4qU/2OyGt8
         5t4t/GQHnzYUHDgvLWB0TcvlATI69eZZ6gTK7vtIVbpVkz7siG9hv965UoScGjU2XJxd
         uAjg==
X-Gm-Message-State: APjAAAVv2ir67XNu7jSRVfgQnESmz+/xLHXsb640LsBYKV3patqr7ZiH
        15hvsnxHkTZM0dr67sHiDUueS2sX
X-Google-Smtp-Source: APXvYqyQ0TQRX4itTVTmgpItDhRHub6JcjOgxB9gqqoEOimbj2vpgJOFCqHRW5vVfO10NgiYVksfuQ==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr5180236ljh.187.1579253479262;
        Fri, 17 Jan 2020 01:31:19 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id r9sm13656820lfc.72.2020.01.17.01.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:31:18 -0800 (PST)
Date:   Fri, 17 Jan 2020 11:31:05 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v10 01/13] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <35bf147cc3077ceda9689655e5a23dad8098dbb2.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
no changes since v9

 .../bindings/leds/rohm,bd71828-leds.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
new file mode 100644
index 000000000000..b50f4bcc98f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/rohm,bd71828-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit LED driver
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  This module is part of the ROHM BD71828 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+
+  The LED controller is represented as a sub-node of the PMIC node on the device
+  tree.
+
+  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
+
+select: false
+
+properties:
+  compatible:
+    const: rohm,bd71828-leds
+
+patternProperties:
+  "^led-[1-2]$":
+    type: object
+    description:
+      Properties for a single LED.
+    properties:
+      #allOf:
+        #- $ref: "common.yaml#"
+      rohm,led-compatible:
+        description: LED identification string
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/string"
+          - enum:
+            - bd71828-ambled
+            - bd71828-grnled
+      function:
+        description:
+          Purpose of LED as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/string"
+      color:
+        description:
+          LED colour as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+
+required:
+  - compatible
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
