Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9B581561
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHEJYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:24:11 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37602 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfHEJYL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 05:24:11 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3CAF91A028A;
        Mon,  5 Aug 2019 11:24:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ABDF01A027D;
        Mon,  5 Aug 2019 11:24:05 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0194B402B5;
        Mon,  5 Aug 2019 17:24:00 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     linux-devel@linux.nxdi.nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1028a: fix gpio nodes
Date:   Mon,  5 Aug 2019 17:14:31 +0800
Message-Id: <20190805091432.9656-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

Update the nodes to include little-endian
property to be consistent with the hardware.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index aef5b06..7ccbbfc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -277,33 +277,36 @@
 		};
 
 		gpio1: gpio@2300000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
 			reg = <0x0 0x2300000 0x0 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		gpio2: gpio@2310000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
 			reg = <0x0 0x2310000 0x0 0x10000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		gpio3: gpio@2320000 {
-			compatible = "fsl,qoriq-gpio";
+			compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
 			reg = <0x0 0x2320000 0x0 0x10000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			little-endian;
 		};
 
 		usb0: usb@3100000 {
-- 
2.9.5

