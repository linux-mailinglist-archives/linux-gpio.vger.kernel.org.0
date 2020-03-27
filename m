Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9AF71955E3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 12:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgC0LDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 07:03:36 -0400
Received: from inva020.nxp.com ([92.121.34.13]:51932 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726217AbgC0LDf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 07:03:35 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ED4A31A0E3A;
        Fri, 27 Mar 2020 12:03:33 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 64D6B1A0E39;
        Fri, 27 Mar 2020 12:03:19 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 18BB440281;
        Fri, 27 Mar 2020 19:03:06 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux@roeck-us.net,
        gregkh@linuxfoundation.org, peng.fan@nxp.com, fugang.duan@nxp.com,
        krzk@kernel.org, bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        olof@lixom.net, dinguyen@kernel.org, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/3] dt-bindings: arm: fsl-scu: Add imx8dxl pinctrl support
Date:   Fri, 27 Mar 2020 18:55:57 +0800
Message-Id: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update binding doc to support i.MX8DXL pinctrl.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 7f42cc3..3910d2c 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -108,7 +108,8 @@ This binding uses the i.MX common pinctrl binding[3].
 Required properties:
 - compatible:		Should be one of:
 			"fsl,imx8qm-iomuxc",
-			"fsl,imx8qxp-iomuxc".
+			"fsl,imx8qxp-iomuxc",
+			"fsl,imx8dxl-iomuxc".
 
 Required properties for Pinctrl sub nodes:
 - fsl,pins:		Each entry consists of 3 integers which represents
@@ -116,7 +117,8 @@ Required properties for Pinctrl sub nodes:
 			integers <pin_id mux_mode> are specified using a
 			PIN_FUNC_ID macro, which can be found in
 			<dt-bindings/pinctrl/pads-imx8qm.h>,
-			<dt-bindings/pinctrl/pads-imx8qxp.h>.
+			<dt-bindings/pinctrl/pads-imx8qxp.h>,
+			<dt-bindings/pinctrl/pads-imx8dxl.h>.
 			The last integer CONFIG is the pad setting value like
 			pull-up on this pin.
 
-- 
2.7.4

