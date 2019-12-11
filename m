Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2880911A759
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfLKJhD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:37:03 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43019 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfLKJhD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:37:03 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so16118200lfq.10;
        Wed, 11 Dec 2019 01:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d7t+a1/3JXcfHypRDxQ+jP5QTBbLKpLSjEX+9e+Rmq8=;
        b=WdTQG9gATaVg8pbQ7poqzM5LazNsCCrejXsjwhur2vcv9lgB/PZKQ9nLhMq3iajuxo
         WydA9SSmV2tmlD/cJbqF5v6zaa+x2mk9w54EZ2Qjz0iCQLVlmn8zwPx8P7vDS8rKEXoT
         Cw68oOt6nCUI/WBvd0WaWRbnpITaYaMUeqn48CoOmNUvah4sgAFzdxCbDW7/lKx8XCKz
         WUglVT8mlitEhcQT2Wn6V+ao8AiDqv7SeXkBBnIhK312g7CiOhZ0CisxmYwJdvDt+634
         /BpXTNhbi8IduLsz8uYwBXImgIf221z90uw2+mCYgDkBwMBARYQgKNOQjSN9RhhDP1Ur
         /SDw==
X-Gm-Message-State: APjAAAXW9L7GF9gsgqBXm21kOnc3JTaLicksvLpo2n2V8YdwmSXd4TLu
        zMRn7tS3gwYYL4jQ8pPW0jg=
X-Google-Smtp-Source: APXvYqx3+8ch4aPq44a33YvHM0oTmUmAWD330tsFYrv/fSP+x0XcWzGiGR72qDQ+p0n/K23ZwfWg1w==
X-Received: by 2002:ac2:5c4a:: with SMTP id s10mr1560650lfp.88.1576057019626;
        Wed, 11 Dec 2019 01:36:59 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id c9sm781202ljd.28.2019.12.11.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:36:59 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:36:51 +0200
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
Subject: [PATCH v6 02/15] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <697ae4380150cbd08a963de0942b8218868d924b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
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

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v5:
- Change SPDX to dual lisence
- added select: false
- replace oneOf + const by enum

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
