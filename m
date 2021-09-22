Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0495A41512F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237381AbhIVUML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 16:12:11 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53674 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbhIVUMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 16:12:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18MKAcV8016902;
        Wed, 22 Sep 2021 15:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632341438;
        bh=HwsQ1px6ElVAM7E7RMWeh+ei1nZgXj6vInZm6WaZNw8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=YPVkgH20ROH3+t8VxnCiy/LKUh9/64L6wI6Gl66Nz9s3aRtUj7huPfD62/X+b+p55
         P98NzFFSnqThEGDmBaAXyyC+YRvgn6cPFj2aCvWGGmSXd7VBzZMIcvT+qDD6OAXvFV
         gIX81trDCc8J1nfpeX8ZuyUnZkViqKfqCgz5ITf8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18MKAcEX034008
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Sep 2021 15:10:38 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Sep 2021 15:10:37 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Wed, 22 Sep 2021 15:10:37 -0500
From:   "M, Aparna" <a-m1@ti.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Govindraju, Aswath" <a-govindraju@ti.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Strashko, Grygorii" <grygorii.strashko@ti.com>
Subject: RE: [PATCH RESEND] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to yaml
Thread-Topic: [PATCH RESEND] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to yaml
Thread-Index: AQHXr6pP3EiJdIl1NkOu403Qgaj9n6uwezcw
Date:   Wed, 22 Sep 2021 20:10:37 +0000
Message-ID: <90c368f366e440a58928e222e1683139@ti.com>
References: <20210922120631.21948-1-a-m1@ti.com>
In-Reply-To: <20210922120631.21948-1-a-m1@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.235.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

This is the latest patch resend. I'm not sure why patchwork has not been ab=
le to pick it up.


Regards,
Aparna

-----Original Message-----
From: M, Aparna=20
Sent: Wednesday, September 22, 2021 5:37 PM
To: Govindraju, Aswath <a-govindraju@ti.com>; linus.walleij@linaro.org; rob=
h+dt@kernel.org; Raghavendra, Vignesh <vigneshr@ti.com>; Strashko, Grygorii=
 <grygorii.strashko@ti.com>
Cc: devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; bgolaszewski@ba=
ylibre.com; M, Aparna <a-m1@ti.com>
Subject: [PATCH RESEND] dt-bindings: gpio: Convert TI TPIC2810 GPIO Control=
ler bindings to yaml

* Convert gpio-tpic2810 bindings to yaml format
* Remove outdated gpio-tpic2810 bindings in .txt format

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../bindings/gpio/gpio-tpic2810.txt           | 16 --------
 .../bindings/gpio/gpio-tpic2810.yaml          | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)  delete mode 100644 Doc=
umentation/devicetree/bindings/gpio/gpio-tpic2810.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.ya=
ml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt b/Doc=
umentation/devicetree/bindings/gpio/gpio-tpic2810.txt
deleted file mode 100644
index 1afc2de7a537..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-TPIC2810 GPIO controller bindings
-
-Required properties:
- - compatible		: Should be "ti,tpic2810".
- - reg			: The I2C address of the device
- - gpio-controller	: Marks the device node as a GPIO controller.
- - #gpio-cells		: Should be two. For consumer use see gpio.txt.
-
-Example:
-
-	gpio@60 {
-		compatible =3D "ti,tpic2810";
-		reg =3D <0x60>;
-		gpio-controller;
-		#gpio-cells =3D <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml b/Do=
cumentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
new file mode 100644
index 000000000000..64f475eb4278
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-tpic2810.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPIC2810 GPIO controller bindings
+
+maintainers:
+   - Aswath Govindraju <a-govindraju@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tpic2810
+
+  reg:
+    maxItems: 1
+    description: The I2C address of the device
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+    - compatible
+    - reg
+    - gpio-controller
+    - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio1: gpio@60 {
+        compatible =3D "ti,tpic2810";
+        reg =3D <0x60>;
+        gpio-controller;
+        #gpio-cells =3D <2>;
+    };
--
2.17.1

