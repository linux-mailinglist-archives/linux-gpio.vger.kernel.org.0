Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972B0283285
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 10:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgJEIuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 04:50:08 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46835 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIuI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 04:50:08 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 09588xgO047591
        for <linux-gpio@vger.kernel.org>; Mon, 5 Oct 2020 16:08:59 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09588T6L047498;
        Mon, 5 Oct 2020 16:08:32 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Oct
 2020 16:28:11 +0800
From:   "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <minyard@acm.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <haiyue.wang@linux.intel.com>, <cyrilbur@gmail.com>,
        <rlippert@google.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>
CC:     <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Date:   Mon, 5 Oct 2020 16:28:06 +0800
Message-ID: <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09588T6L047498
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LPC controller has no concept of the BMC and the Host partitions.
This patch fixes the documentation by removing the description on LPC
partitions. The register offsets illustrated in the DTS node examples
are also fixed to adapt to the LPC DTS change.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 85 +++----------------
 1 file changed, 14 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index a92acf1dd491..866f54a09e09 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -9,13 +9,7 @@ primary use case of the Aspeed LPC controller is as a slave on the bus
 conditions it can also take the role of bus master.
 
 The LPC controller is represented as a multi-function device to account for the
-mix of functionality it provides. The principle split is between the register
-layout at the start of the I/O space which is, to quote the Aspeed datasheet,
-"basically compatible with the [LPC registers from the] popular BMC controller
-H8S/2168[1]", and everything else, where everything else is an eclectic
-collection of functions with a esoteric register layout. "Everything else",
-here labeled the "host" portion of the controller, includes, but is not limited
-to:
+mix of functionality, which includes, but is not limited to:
 
 * An IPMI Block Transfer[2] Controller
 
@@ -44,8 +38,8 @@ Required properties
 ===================
 
 - compatible:	One of:
-		"aspeed,ast2400-lpc", "simple-mfd"
-		"aspeed,ast2500-lpc", "simple-mfd"
+		"aspeed,ast2400-lpc", "simple-mfd", "syscon"
+		"aspeed,ast2500-lpc", "simple-mfd", "syscon"
 
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
@@ -55,66 +49,17 @@ Required properties
 - ranges: 	Maps 0 to the physical address and length of the LPC memory
                 region
 
-Required LPC Child nodes
-========================
-
-BMC Node
---------
-
-- compatible:	One of:
-		"aspeed,ast2400-lpc-bmc"
-		"aspeed,ast2500-lpc-bmc"
-
-- reg:		contains the physical address and length values of the
-                H8S/2168-compatible LPC controller memory region
-
-Host Node
----------
-
-- compatible:   One of:
-		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
-		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
-
-- reg:		contains the address and length values of the host-related
-                register space for the Aspeed LPC controller
-
-- #address-cells: <1>
-- #size-cells:	<1>
-- ranges: 	Maps 0 to the address and length of the host-related LPC memory
-                region
-
 Example:
 
 lpc: lpc@1e789000 {
-	compatible = "aspeed,ast2500-lpc", "simple-mfd";
+	compatible = "aspeed,ast2500-lpc", "simple-mfd", "syscon";
 	reg = <0x1e789000 0x1000>;
 
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x0 0x1e789000 0x1000>;
-
-	lpc_bmc: lpc-bmc@0 {
-		compatible = "aspeed,ast2500-lpc-bmc";
-		reg = <0x0 0x80>;
-	};
-
-	lpc_host: lpc-host@80 {
-		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
-		reg = <0x80 0x1e0>;
-		reg-io-width = <4>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x80 0x1e0>;
-	};
 };
 
-BMC Node Children
-==================
-
-
-Host Node Children
-==================
 
 LPC Host Interface Controller
 -------------------
@@ -145,14 +90,12 @@ Optional properties:
 
 Example:
 
-lpc-host@80 {
-	lpc_ctrl: lpc-ctrl@0 {
-		compatible = "aspeed,ast2500-lpc-ctrl";
-		reg = <0x0 0x80>;
-		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-		memory-region = <&flash_memory>;
-		flash = <&spi>;
-	};
+lpc_ctrl: lpc-ctrl@80 {
+	compatible = "aspeed,ast2500-lpc-ctrl";
+	reg = <0x80 0x80>;
+	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+	memory-region = <&flash_memory>;
+	flash = <&spi>;
 };
 
 LPC Host Controller
@@ -174,9 +117,9 @@ Required properties:
 
 Example:
 
-lhc: lhc@20 {
+lhc: lhc@a0 {
 	compatible = "aspeed,ast2500-lhc";
-	reg = <0x20 0x24 0x48 0x8>;
+	reg = <0xa0 0x24 0xc8 0x8>;
 };
 
 LPC reset control
@@ -194,8 +137,8 @@ Required properties:
 
 Example:
 
-lpc_reset: reset-controller@18 {
+lpc_reset: reset-controller@98 {
         compatible = "aspeed,ast2500-lpc-reset";
-        reg = <0x18 0x4>;
+        reg = <0x98 0x4>;
         #reset-cells = <1>;
 };
-- 
2.17.1

