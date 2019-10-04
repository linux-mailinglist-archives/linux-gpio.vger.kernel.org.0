Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04640CB304
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 03:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbfJDBZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 21:25:41 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57886 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730267AbfJDBZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 21:25:41 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AED28886BF;
        Fri,  4 Oct 2019 14:25:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570152335;
        bh=DcGlMPetDsQUVAT/6MwUM8wLFetKjGpiYszyiFj30tw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=k4yEUwI28XQKYH0bmvRPuUnvMJ2uwC1OblIShpqMy/HQmXIBJRLzb6fK5NK8DuiKJ
         IfMW8nBjdDO7l3PAlpcpO3sTCDYrYsKN0+aqwYXdaz9oHTlWQam2KKV85ZzA5yCz5x
         MhPB8SYzqQEhiNWwKQ4mfx8h49QA4u2v17EeHrgV0vQCn68ev9LHqfzm1Ujx13xlFs
         7LaRk9W4ANUli9BJdOnFrwckSOxwhMY6VBDTA1JDFNHWmu4Z+yUzDH5/dqWbj5Ab1m
         7n0kEVc5xLZTbrLUQv2502fffqhgk9sQ2pPNFxp8kn42FZAOVwCNVVER9oiJlTDuwM
         hY1JPVts9WH0Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d969f8b0001>; Fri, 04 Oct 2019 14:25:36 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 615E813EEF0;
        Fri,  4 Oct 2019 14:25:34 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 81B3828003E; Fri,  4 Oct 2019 14:25:30 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, richard.laing@alliedtelesis.co.nz
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
Date:   Fri,  4 Oct 2019 14:25:24 +1300
Message-Id: <20191004012525.26647-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
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
---
 .../bindings/gpio/brcm,xgs-iproc.txt          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt b/=
Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
new file mode 100644
index 000000000000..328b844c82dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
@@ -0,0 +1,41 @@
+Broadcom XGS iProc GPIO controller
+
+This controller is the Chip Common A GPIO present on a number of Broadco=
m
+switch ASICs with integrated SoCs.
+
+Required properties:
+- compatible:
+    Must be "brcm,iproc-gpio-cca"
+
+- reg:
+    The first region defines the base I/O address containing
+    the GPIO controller registers. The second region defines
+    the I/O address containing the Chip Common A interrupt
+    registers.
+
+Optional properties:
+
+- interrupts:
+    The interrupt shared by all GPIO lines for this controller.
+
+- #interrupt-cells:
+    Should be <2>.  The first cell is the GPIO number, the second should=
 specify
+    flags.
+
+    See also Documentation/devicetree/bindings/interrupt-controller/inte=
rrupts.txt
+
+- interrupt-controller:
+    Marks the device node as an interrupt controller
+
+Example:
+	gpioa: gpio@18000060 {
+		compatible =3D "brcm,iproc-gpio-cca";
+		#gpio-cells =3D <2>;
+		reg =3D <0x18000060 0x50>,
+		      <0x18000000 0x50>;
+		ngpios =3D <12>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+		interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+	};
--=20
2.23.0

