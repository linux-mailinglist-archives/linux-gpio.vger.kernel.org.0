Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2A170667
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729835AbfGVRI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:08:29 -0400
Received: from mout.gmx.net ([212.227.17.20]:38761 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728887AbfGVRI3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563815283;
        bh=pOipip/7SqtkvUBVosuhUW8StWC6Eq11sbfDOvaTu7Q=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZwYF0nDMAeBRG23gIr8vph6vCHmXVzh5Oc6eXpUPa26K85FB2T54eaZmGl4Mclv2U
         MAOabspJXe6JPy5J/ddNUTyoKPRxpgqvFeJBSVSgO14mpcBGnqpysJB/G0JTRej5ho
         8XxXImAFo5cnTHpVlmVCNjkJNSeyg4PIVos6l0kE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.131]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LqQTl-1iK0iw2bjd-00e836; Mon, 22 Jul 2019 19:08:03 +0200
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
Subject: [PATCH 14/18] dt-bindings: arm: bcm2835: Add Raspberry Pi 4 to DT schema
Date:   Mon, 22 Jul 2019 19:07:33 +0200
Message-Id: <1563815257-2648-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
References: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:tO/RDLStxpBhSjI1Yvpz+5kIM9YY1HHCUcN1/0HPyCye/v1766M
 dUboVfHUppGM2laRPxmJ9p4clRdI+r8cKyEfUJAYlxhgtufM1SQUbq57V2XeOgPwG97pmn6
 hv1S8Q/w+SkPySkFVdtASHwD5ZJWe7FRz2IySKhn8bMxOMi71BqjQ1Mhn3M5AC+7b0WmO38
 JKEJ4JvfbgF3tXTBvDoWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zjxQ1KMgLug=:bfvv6r+DDraqyjvFqBBjPS
 YsTOefVQWL/J+48TcXkjaff5GfVDeb+Tah6l/Vd+W54jG7SNsXF57krrl+r6MxXK9VlAdMo8S
 s0nO8a7GpIY4AAFf8mJqZ/dGPiD0EoVaP/LU0Y+JTd/laZfuXgsXfJmDZ7MCW0o6ggdzT0Z+0
 IloG1T6ZD43C2ZdEbsYesgFAklAZ/R2mv/E+2dXpEKnuwb52gZZLkXfdoZs+5w19sCK7Tc9jx
 qLgMb/oJBHAGHgqGiEB3LGRbbwd3o2INW41rmL3zfwWRtP9KOQopRKCEDs53vz+V2IL+JwcCL
 NlvbZrkBAVT2/PLg/cZ5czNZLrZKB6muQ3RslgFq5T4fYEKgoGRHNdJakkabkZvLZIKO3snBD
 x1MsKSlHeqV3aGCGDTRwlNPgzNoPlpYw/ADvg+7IO/u8SIE85w48XSPUrA2KRy02OdYagE0Mq
 nwi9D7vEmIN126abhIBCzKxlrjhHyXoWVJ17Do0faABNv100SDzUHNCusB8cA3j7rcQbF79mT
 SLv4JA6duJ5J7+7nM4jCvWCQ0Yk+1q07kyJgDfxE5d+V0RCCygZdiYOs8tFNdggP+H0ImWzc0
 /r4YJyLeqNFpM+JzAm3sERhWgNrcwJb46GhxoB5U2jlgf0+dXSGVXIWPrc+Y7d4ZJNW2o2t1m
 CafN2uzea+XJdWnWCEENBKNUWv6KN+khx+t8/mXV1X/6uyiUHiDiwo1SAPydvzPtiwM8z+5MG
 gYHoqmEeMCeSh74qJUC4Sw8Mzkwpdf+FVR9Dli+7BpP6uiPVOIGIbceq7gcZYCJDoFYuc8jyp
 ykQ8wcRzReuAb/JtoFcbj5Xm6tqIEUpu0bAk9Fw0j6tiCF7f+PK5xscPKmdOLXFtlJridSiKQ
 b1eU9bJ3Lrx9BhNw6s2DP8lYMJJtNb6z57WoGKmueGnBvhOK2284VMSqHvXwFTYt04QoK4eb1
 8C7r+COQ1GzgNRTEr8/F2L50H0ZOD4KAvLUmRtpHRfLnzsSFxmG5nNYGdxw3cPMTL4kXjZqw3
 tEDoWmytBNsDXtTpf+xBE8NRKQ2ymZVGKVcWPJAe+HN8oCqbDuT77skql+K9P54GBvr/S8UQs
 WG+3WE0ioDojQg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new Raspberry Pi 4 to DT schema.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Docu=
mentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 1a4be26..8c3bbad 100644
=2D-- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -15,6 +15,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: BCM2711 based Boards
+        items:
+          - enum:
+              - raspberrypi,4-model-b
+
       - description: BCM2835 based Boards
         items:
           - enum:
=2D-
2.7.4

