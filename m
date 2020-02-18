Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE9D81621D9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 08:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgBRH5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 02:57:44 -0500
Received: from inva020.nxp.com ([92.121.34.13]:53272 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgBRH5i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 02:57:38 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5FB4F1A0A1B;
        Tue, 18 Feb 2020 08:57:37 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F6561A0289;
        Tue, 18 Feb 2020 08:57:30 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 74087402E1;
        Tue, 18 Feb 2020 15:57:20 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 4/4] dt-bindings: pinctrl: imx8mp: Replace the uint32-array with uint32-matrix
Date:   Tue, 18 Feb 2020 15:51:40 +0800
Message-Id: <1582012300-30260-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The items of mux_reg/conf_reg/input_reg/mux_val/input_val/pad_setting
should be uint32-matrix instead of uint32-array, fix it and improve the
schema and example.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch.
---
 .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
index 2e31e12..6297e78 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
@@ -30,8 +30,6 @@ patternProperties:
 
     properties:
       fsl,pins:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/uint32-array
         description:
           each entry consists of 6 integers and represents the mux and config
           setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
@@ -39,6 +37,22 @@ patternProperties:
           be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
           integer CONFIG is the pad setting value like pull-up on this pin. Please
           refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          - items:
+              items:
+                - description: |
+                    "mux_reg" indicates the offset of mux register.
+                - description: |
+                    "conf_reg" indicates the offset of pad configuration register.
+                - description: |
+                    "input_reg" indicates the offset of select input register.
+                - description: |
+                    "mux_val" indicates the mux value to be applied.
+                - description: |
+                    "input_val" indicates the select input value to be applied.
+                - description: |
+                    "pad_setting" indicates the pad configuration value to be applied.
 
     required:
       - fsl,pins
@@ -59,10 +73,9 @@ examples:
         reg = <0x30330000 0x10000>;
 
         pinctrl_uart2: uart2grp {
-            fsl,pins = <
-                0x228 0x488 0x5F0 0x0 0x6	0x49
-                0x228 0x488 0x000 0x0 0x0	0x49
-            >;
+            fsl,pins =
+                <0x228 0x488 0x5F0 0x0 0x6	0x49>,
+                <0x228 0x488 0x000 0x0 0x0	0x49>;
         };
     };
 
-- 
2.7.4

