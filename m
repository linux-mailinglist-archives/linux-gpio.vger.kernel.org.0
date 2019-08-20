Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC5895712
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 08:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfHTGEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 02:04:37 -0400
Received: from inva020.nxp.com ([92.121.34.13]:39550 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728960AbfHTGEh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Aug 2019 02:04:37 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BE5BC1A0059;
        Tue, 20 Aug 2019 08:04:35 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AC48C1A003B;
        Tue, 20 Aug 2019 08:04:30 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 31CB9402B7;
        Tue, 20 Aug 2019 14:04:24 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v4] arm64: dts: ls1088a: fix gpio node
Date:   Tue, 20 Aug 2019 13:54:38 +0800
Message-Id: <20190820055438.43469-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

add ls1088a gpio specify compatible.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
Changes in v4:
	- update the patch description.
Changes in v3:
	- delete the attribute of little-endian.
Changes in v2:
	- update the subject.
 

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index dfbead4..ff669c8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -269,7 +269,7 @@
 		};
 
 		gpio0: gpio@2300000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
 			little-endian;
@@ -280,7 +280,7 @@
 		};
 
 		gpio1: gpio@2310000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
 			little-endian;
@@ -291,7 +291,7 @@
 		};
 
 		gpio2: gpio@2320000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
 			little-endian;
@@ -302,7 +302,7 @@
 		};
 
 		gpio3: gpio@2330000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
 			reg = <0x0 0x2330000 0x0 0x10000>;
 			interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
 			little-endian;
-- 
2.9.5

