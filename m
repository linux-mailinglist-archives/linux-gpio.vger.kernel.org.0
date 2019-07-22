Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D907066A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbfGVRI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:08:29 -0400
Received: from mout.gmx.net ([212.227.17.20]:46507 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729199AbfGVRI3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563815283;
        bh=RvH7nQF7Ul4xhBjPYxybJf+PkfOOFW9bdxdIzx6qwCU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=LbHMHAzCJH2toIrC0Ng+Jl2XTmmpJv+n4wIDr5ZAAIpDr51z5l1w8LT4c4dIVFzWv
         qUjnh6CQka5BDEKM9S0DZyWnE7HFYqXoL7L+6ug/eFfKhPNwcyY/P54K4OqUnZ6xaf
         u3qoBLDEmQOzlZxEFCurIjegQf40KXiya9u0w7P8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.131]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LwJko-1iUccG3pok-017z03; Mon, 22 Jul 2019 19:08:03 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 13/18] dt-bindings: arm: Convert BCM2835 board/soc bindings to json-schema
Date:   Mon, 22 Jul 2019 19:07:32 +0200
Message-Id: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:e/EFY+cnEb5FAJqNuZ+nYlRoYfTIDfYwVTNRovuSMgvoPhIOD+Y
 Pye1trVVUVTSU0Sh6e6rVHZx7TxpR1mSSh5dPewUukGAk/eiexeOIQYGEyeFdS7d6jleGbC
 iKhv1v9GK/tnPqGDC4vINZRrr0/tJ/pvRz+i4KAC+08yIYyTwwMofGoJuf3jZex/DtNiKxZ
 LnmEwbIMORMnhS9RJ2sHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HpbA/KTLjeI=:nP8md4F9HwaGyJdlmrQ8wY
 6CEhm3yPtJZi4uV2orB8QEmiBlkf7KEF/3G6ot0Ic+Tg+p3d+vg67h0YC4QCZhXzKm+YZZ+Uz
 lNLcpeiQAS+zjD1u/6amSUe2DL9tm2ewoWhuyP/5rt8I50SHpqodrECV3swZO5Pi4Pd8KRmWv
 VObBoXU3m+qKRmm2wKjYkKg+d7WdEIpA0F0PqQQDAXLofoPRfWmxm4fWtQnN/AZAKK6+wEd1x
 4OYN3mmWAwlLnWJKVITJsRMG44gSSGl90zjviZx5liK3CRp07fE99Kq1EiPLiAtrCnH3i5rkQ
 lVzhqGW/0H6/NXjIi2OnebbRFsEI3igXLhEelCYtsfk+Smm7b0ydGEidtxeaRE2QtVwGU5g6I
 RZ+6rUyLaKV50wdmsBXGFTcKgi7urHmFGEc/kjlw+FR4gOOaEdeVobyjnXc5UUKEPjSDHaH+n
 Y0hXOCbPmj3BOx5Wryh/FWWniXdvDqo0cVthW5Mp8uw6b0Ego0ACJJCywJisZIq9uhIUclWML
 zj8sboJ5QVBWxviShcXHe75WeFIqK+Rp0e+9WY+et3kfK9NO/LF3T0qqbZp1hHz6qYbJPf11W
 YmXF//UDMBjrSv1OfzTNp7+9bOmjZA4a6VgyEbPcakrOLXO76p5c/w8P+0uAcB4oHB/l6J7dJ
 6V6N0C4bx58Dz8YS3laJvF8pEtoSOK9wntFWjqDrSUxXihLhHlKH66L0jrti/KEtUiQ3olPIr
 lNdlyDRWENoyK7SRbE/GddCyOSwVbB46QSGdIZQQuW3M3F7cLv2Rnrs5Ci3MVOkRJrHMWe+H7
 xOOQ+4aOpfxRj728V+PUVwGdQpVHfxFQgvlKuamG74GNwb1hcRLBUTs7jIQakcJaoplzmFIIO
 cuiaEyM3RtGHBrGg2qyShGRCNnlclCvOJ4dFbHdoN38OInhlBfTLnqAUx7HnNmh9K8ub7aqNn
 /EXGZmtS//CNBXnmxLU1dRoAWByMV8LhbhTGj2rwjXPcMyTyR8mhc9YLbLy17KDPBDQH9FiBK
 ISZuP3x4KP1yDEeOuZ4dJ84OX6vUlAJNhrBfLblOexGXhLRBN+dKp0F2DOTmq0/uz4wHEBhBX
 As8jYUm5ORPhU8=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the BCM2835/6/7 SoC bindings to DT schema format using json-schema=
.
All the other Broadcom boards are maintained by Florian Fainelli.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       | 46 +++++++++++++++
 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   | 67 -----------------=
-----
 2 files changed, 46 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835=
.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Docu=
mentation/devicetree/bindings/arm/bcm/bcm2835.yaml
new file mode 100644
index 0000000..1a4be26
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/bcm/bcm2835.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2711/BCM2835 Platforms Device Tree Bindings
+
+maintainers:
+  - Eric Anholt <eric@anholt.net>
+  - Stefan Wahren <wahrenst@gmx.net>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: BCM2835 based Boards
+        items:
+          - enum:
+              - raspberrypi,model-a
+              - raspberrypi,model-a-plus
+              - raspberrypi,model-b
+              - raspberrypi,model-b-i2c0  # Raspberry Pi Model B (no P5)
+              - raspberrypi,model-b-rev2
+              - raspberrypi,model-b-plus
+              - raspberrypi,compute-module
+              - raspberrypi,model-zero
+              - raspberrypi,model-zero-w
+          - const: brcm,bcm2835
+
+      - description: BCM2836 based Boards
+        items:
+          - enum:
+              - raspberrypi,2-model-b
+
+      - description: BCM2837 based Boards
+        items:
+          - enum:
+              - raspberrypi,3-model-a-plus
+              - raspberrypi,3-model-b
+              - raspberrypi,3-model-b-plus
+              - raspberrypi,3-compute-module
+              - raspberrypi,3-compute-module-lite
+
+...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt b/=
Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
deleted file mode 100644
index 245328f..0000000
=2D-- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Broadcom BCM2835 device tree bindings
=2D-------------------------------------------
-
-Raspberry Pi Model A
-Required root node properties:
-compatible =3D "raspberrypi,model-a", "brcm,bcm2835";
-
-Raspberry Pi Model A+
-Required root node properties:
-compatible =3D "raspberrypi,model-a-plus", "brcm,bcm2835";
-
-Raspberry Pi Model B
-Required root node properties:
-compatible =3D "raspberrypi,model-b", "brcm,bcm2835";
-
-Raspberry Pi Model B (no P5)
-early model B with I2C0 rather than I2C1 routed to the expansion header
-Required root node properties:
-compatible =3D "raspberrypi,model-b-i2c0", "brcm,bcm2835";
-
-Raspberry Pi Model B rev2
-Required root node properties:
-compatible =3D "raspberrypi,model-b-rev2", "brcm,bcm2835";
-
-Raspberry Pi Model B+
-Required root node properties:
-compatible =3D "raspberrypi,model-b-plus", "brcm,bcm2835";
-
-Raspberry Pi 2 Model B
-Required root node properties:
-compatible =3D "raspberrypi,2-model-b", "brcm,bcm2836";
-
-Raspberry Pi 3 Model A+
-Required root node properties:
-compatible =3D "raspberrypi,3-model-a-plus", "brcm,bcm2837";
-
-Raspberry Pi 3 Model B
-Required root node properties:
-compatible =3D "raspberrypi,3-model-b", "brcm,bcm2837";
-
-Raspberry Pi 3 Model B+
-Required root node properties:
-compatible =3D "raspberrypi,3-model-b-plus", "brcm,bcm2837";
-
-Raspberry Pi Compute Module
-Required root node properties:
-compatible =3D "raspberrypi,compute-module", "brcm,bcm2835";
-
-Raspberry Pi Compute Module 3
-Required root node properties:
-compatible =3D "raspberrypi,3-compute-module", "brcm,bcm2837";
-
-Raspberry Pi Compute Module 3 Lite
-Required root node properties:
-compatible =3D "raspberrypi,3-compute-module-lite", "brcm,bcm2837";
-
-Raspberry Pi Zero
-Required root node properties:
-compatible =3D "raspberrypi,model-zero", "brcm,bcm2835";
-
-Raspberry Pi Zero W
-Required root node properties:
-compatible =3D "raspberrypi,model-zero-w", "brcm,bcm2835";
-
-Generic BCM2835 board
-Required root node properties:
-compatible =3D "brcm,bcm2835";
=2D-
2.7.4

