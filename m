Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F3F3988CD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 14:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFBMFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 08:05:49 -0400
Received: from mout.gmx.net ([212.227.15.19]:60887 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhFBMFs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 08:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622635438;
        bh=ulkox2ATtAdbPPOEglhjZ3k4awk0Qn6kCKCuSyogJsg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=K9P2/iiJ8mYXqb6G1z6NNuVrNUt+HE9psjOZYpmr3urD1/0e0RaNNmAgueu0qsB/Z
         S3aCO0brAdmcbqKJP458JzShSTehbTDheQmamWMwS49h4WHIGOpEaPqK1RVmO+4GnX
         UMekteulEDUKahAx5RpVtMaJ36baq9S/dnPK8uIU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1lo8UB1zbV-000JWu; Wed, 02
 Jun 2021 14:03:58 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Subject: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global control registers (GCR)
Date:   Wed,  2 Jun 2021 14:03:22 +0200
Message-Id: <20210602120329.2444672-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P9ooxxcBWMlue7/aQhsUzie0pEsU417A/bVW+i8qKslDKwe1yoF
 P0JJK2l+NChG9mUbWE+NUkp8CPJhowOqBbLu2w/eaW939P6xr6+2y6PIp4vGMbzsl/BUcJN
 rMq74FWAWY9dkqJGs2YCx4c41ickvdnrLbxFpIpY/q8mshEtXf2n4OTzR+tXxZJr7tsvS5A
 AKeJHK9vJLxE9lAXxDQ3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RLLVYPBzafk=:/20tEdy806+Ejjw719ZFcz
 0RWaQ1HFc0WDKSSe0h+4TdP9N4RPrdOqkbNoE2k3uDdWC902rmq1iIxlQmg42UGTK1QvhlOZQ
 U3cVOGv793QjyKN6j4O5iZPmw1kX5yZK6ap1BqzbRLw+FVtQL/k3U1Cmp7DRtoD7K273XpK1k
 hzK1LZ+LQZBuYMg+wA2t1zBjBIPl9/apzPI9eBTE7kk8MbaaWwSmhPj5xbZG7QypKCsNOkjWx
 KKQ7j4CVTIV0ZXiwIN080YfDqumtQcX+JTdA22FP15if3vtF4ApDFB1u2SeDF40zio0lU9O9U
 1eHi7438pXfh6tbVcxCrnu7hCpyG9d6j/02uBksNZ9eZZ6nqKyCQd+XM1v6yr7w3Y53m9bej6
 Q/CTI+GFT3QVyxW+gzcbSmz6Ie4SnSfPqXtZEKmB9AD5aSDbX3iXGThvRk6Fv18qJKxMOFqI5
 /cKJbrsYKdSdzgUqZ5a07L1bTOvIZn0nagiTbGA9bXlVj0PJTS5zrchEDRHj8flqcPNSI+u9J
 keKRkx/JFGOFvBJnOKRfIemRKmlM6hi5r/0e2aaIK38LxbMGEpaUnqryS8uN9pNs0PL6JER6t
 /dIdK8CESVN0V3SoHH3YMTkSjX4rh/dW6dLPceRVQOp5XwIzqh9ALfvAVwEbK+BRBndHcjbcD
 sKRjCGEs2iHvcbE5s9Lfbe28jo7S2NJJ5uhbOAZwypoy+mI5SmPU0pDJ9wCbnTYuVutrmBA32
 ROYNca/CU9tVdkWYAGBBm08zBqgp/2IHO7tm2fvxM8qaWrT5gHyb2EbXmlldBrZyA2IgtmnlQ
 mUKi/WQWmFIkCl0XRt3W91kg3OeetOfnuVI8WXcVYdjay2PWr6HTi8cdkU3LMkDQted1qIOCA
 UURXyVUa14Qt05E/3eFYciteZjmrBzcjztF/42cMhzMnoRzcmmQeAHXPcbi2w/s816hMrwOZO
 I2KqYlCygdaGUkTDjjNS+SuzPlYuMEKlECDp2ooRj0XBNgAahY6SL19sOxKbx3nvCAz4W1XcJ
 pViyEalQV50cYxlgpqMyrR5ewKiimluVo8GLJ92bq1WDL8wdcrwUhov75iu6y1Hp0sLcf7ySY
 aonN8995GNifEwlE/ukzJo8huXbaWjGUXxL+2LvloRnMjf0tf+AXHRW/w==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
version information.

This patch adds a binding to describe this node.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../bindings/arm/npcm/nuvoton,gcr.yaml        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml b=
/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
new file mode 100644
index 0000000000000..3174279f7713a
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gcr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Global Control Registers block in Nuvoton SoCs
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+description: |
+  The Global Control Registers (GCR) are a block of registers in Nuvoton =
SoCs
+  that expose misc functionality such as chip model and version informati=
on or
+  pinmux settings.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,wpcm450-gcr
+          - nuvoton,npcm750-gcr
+      - const: syscon
+      - const: simple-mfd
+  reg: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gcr: gcr@800000 {
+      compatible =3D "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
+      reg =3D <0x800000 0x1000>;
+    };
=2D-
2.30.2

