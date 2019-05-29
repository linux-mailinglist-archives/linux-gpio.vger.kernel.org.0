Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C180D2D7E0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfE2IbT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 04:31:19 -0400
Received: from inva021.nxp.com ([92.121.34.21]:60842 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfE2IbO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 04:31:14 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 77FB92011CA;
        Wed, 29 May 2019 10:31:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8E10D200272;
        Wed, 29 May 2019 10:31:06 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 418BA402FA;
        Wed, 29 May 2019 16:31:00 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 3/3] arm64: dts: ls1088a: Revise gpio registers to little-endian
Date:   Wed, 29 May 2019 16:32:54 +0800
Message-Id: <20190529083254.39581-3-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529083254.39581-1-chuanhua.han@nxp.com>
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since fsl-ls1088a Soc GPIO registers are used as little endian,
the patch adds the little-endian attribute to each gpio node.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 661137ffa319..3e6d20d065bd 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -272,6 +272,7 @@
 			compatible = "fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -282,6 +283,7 @@
 			compatible = "fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -292,6 +294,7 @@
 			compatible = "fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -302,6 +305,7 @@
 			compatible = "fsl,qoriq-gpio";
 			reg = <0x0 0x2330000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
+			little-endian;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.17.1

