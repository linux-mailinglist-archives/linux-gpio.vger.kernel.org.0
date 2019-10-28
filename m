Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26187E798F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 21:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbfJ1UGD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 16:06:03 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34746 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730681AbfJ1UGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 16:06:02 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 934968365D;
        Tue, 29 Oct 2019 09:05:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572293159;
        bh=TrZJM1xTX9YI9Sdqm4mhE1ENesdMtbUdy83TCSciGhM=;
        h=From:To:Cc:Subject:Date;
        b=nNKt5jO5bgRnJhc6K+jGMLqOOKO5vycLmCX0Wase1PP9cT/2p2HG6wnb7TOt+Pcqu
         19Ljg4KDdskhm6ZBczGa6+ehBnrP8BhcdfhrsMC0x4woRMWxJ+6vggLPMuen9xW5nm
         14i0ARyseE+yUYY+p7CO25B4tX6++LFAU3S/j0xRA9lAj1p1AIFPz3NWInGoc4rZgk
         HoyI79t669QwjTPczbBxUn2BEh5hGL8rcGW7+Fznwzxbib9sOGRaeNYAKDJblfXO76
         N+4lgnq+zt7q9V3Y/Y8WzZ3Ray1qa5OAa7mQOT96cTMpEiqSNZvEVlDLBopvfouiAx
         dmNUjqSzlb6pg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db74a260000>; Tue, 29 Oct 2019 09:05:58 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 91EDF13EE9C;
        Tue, 29 Oct 2019 09:05:58 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id ACEA128005C; Tue, 29 Oct 2019 09:05:57 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
Date:   Tue, 29 Oct 2019 09:05:55 +1300
Message-Id: <20191028200555.27524-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This GPIO controller is present on a number of Broadcom switch ASICs
with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
blocks but different enough to require a separate driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    Changes in v5:
    - correct $id line following rename
    - add reviewed-by from Rob
   =20
    Changes in v4:
    - rename brcm,xgs-iproc.yaml -> brcm,xgs-iproc-gpio.yaml as suggested
   =20
    Changes in v3:
    - incorporate review comments from Rob and Bart
   =20
    Changes in v2:
    - Document as DT schema
    - Include ngpios, #gpio-cells and gpio-controller properties

 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
new file mode 100644
index 000000000000..64e279a4bc10
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom XGS iProc GPIO controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description: |
+  This controller is the Chip Common A GPIO present on a number of Broad=
com
+  switch ASICs with integrated SoCs.
+
+properties:
+  compatible:
+    const: brcm,iproc-gpio-cca
+
+  reg:
+    items:
+      - description: the I/O address containing the GPIO controller
+                     registers.
+      - description: the I/O address containing the Chip Common A interr=
upt
+                     registers.
+
+  gpio-controller: true
+
+  '#gpio-cells':
+      const: 2
+
+  ngpios:
+    minimum: 0
+    maximum: 32
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+dependencies:
+  interrupt-controller: [ interrupts ]
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio@18000060 {
+        compatible =3D "brcm,iproc-gpio-cca";
+        #gpio-cells =3D <2>;
+        reg =3D <0x18000060 0x50>,
+              <0x18000000 0x50>;
+        ngpios =3D <12>;
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells =3D <2>;
+        interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+
+...
--=20
2.23.0

