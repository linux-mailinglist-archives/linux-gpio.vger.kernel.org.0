Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DC5341566
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 07:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbhCSG2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 02:28:36 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33657 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233865AbhCSG21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 02:28:27 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 79132580A7A;
        Fri, 19 Mar 2021 02:28:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=jqgrbOeF372kIwTWjevU9VS3gs
        JIe6BCt8qh17+30Ws=; b=czl0aAnTucQqpeAVrdeq5zoo+NvsiSKJIfuWYluNjX
        4wMSfY5kyD0CNy3WYxfz/5B/2MXU2H8AQFNSvMs4qNAnKrRg373jrIatUZCF+fD0
        5O4YIgaJZK3RHljosZEtVr64Cv+iy/vPUzWUs+cptukE9PFSvNid5//zJWXmEzq7
        IUuJwx1gRroCQ1dp/jPN3PcJvqLWoCtW8eajphloH2jBiKqWUaxRBG0N5qgQCSJ0
        9ai8Pd1xpH9fUZ9gArRiwIuNiCHz8Jy/WBwrr6SClItH51NV03hhwg7mrKgnDHcI
        cOA+tuhHgwG9Xkix8zYE/vYuMaq8mp2dwWi7P7Zzs1NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jqgrbOeF372kIwTWj
        evU9VS3gsJIe6BCt8qh17+30Ws=; b=KuQYyQcv39PKGIFYTELA8fxZA/QNd+P63
        0bP++zjwu0ls12rrN/ioZqCyFG8kPy8luaPVc1P+eRygwizrd7B5HHXM/I6xPKJi
        YOaWYqik4hZH5KsQf6BpuGm7o6NXVLggPmxDkTej8pvhLnVLiy3hRX89jzMaWZ3n
        qSlHU+cR9z7KCFD3CyDUq98RKlZpYBr5YMftJ+K6AXI/zQxs3yUY/8+oShVj5u9i
        E/G83NaiLXwTDWMOwDjK6XxRcvyP5FJj7tiFA4fsabCryr9d3cykkAAYs6LWVUjS
        W9vYbZ3ClK+w4FckeP2Mm4gOn9tC5in3hxgX8QEuOPFabXTlQP7KQ==
X-ME-Sender: <xms:iERUYAHL707Rmg9XlMeedJvLUgGQeo9VAUOmEPGO2btS43sdmkCAfw>
    <xme:iERUYJVxXlcE63cze4R1nh1mywzYAvrOuyXeEXiZPz-1Zgn-5IFARVBMXMmL7rHtE
    C9lYKZdgqdCCtz_eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvficu
    lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrh
    hnpeekhfeiffejveefveehtdeiiefhfedvjeelvddvtdehffetudejtefhueeuleeftden
    ucfkphepuddukedrvddutddrudekuddrheehnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:iERUYKKS_u-DR3vCiOAuct8YMQVzJ8IoHyq9_opJI4CCJ63Chbdqqw>
    <xmx:iERUYCFnXdXjaubBXkP-L2pjIAwOqBkm8K80HovciLt6NR4OtakBYg>
    <xmx:iERUYGVTHLAFmbzzkijLOko41CQ4NxtV4Nb4tn9R-Oyx1R2mypkizA>
    <xmx:ikRUYEaOazWhEiGAMjCW-UOstJLsdYWZs4oeNG-mO-9OGSxFqdZcbQ>
Received: from localhost.localdomain (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
        by mail.messagingengine.com (Postfix) with ESMTPA id B422E24005A;
        Fri, 19 Mar 2021 02:28:18 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     joel@jms.id.au, ryan_chen@aspeedtech.com,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree@vger.kernel.org, tmaimon77@gmail.com,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        avifishman70@gmail.com, venture@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        tali.perry1@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org, benjaminfair@google.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/21] dt-bindings: aspeed-lpc: Remove LPC partitioning
Date:   Fri, 19 Mar 2021 16:57:32 +1030
Message-Id: <20210319062752.145730-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>

The LPC controller has no concept of the BMC and the Host partitions.
This patch fixes the documentation by removing the description on LPC
partitions. The register offsets illustrated in the DTS node examples
are also fixed to adapt to the LPC DTS change.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
 1 file changed, 25 insertions(+), 75 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index d0a38ba8b9ce..936aa108eab4 100644
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
 
@@ -44,80 +38,36 @@ Required properties
 ===================
 
 - compatible:	One of:
-		"aspeed,ast2400-lpc", "simple-mfd"
-		"aspeed,ast2500-lpc", "simple-mfd"
-		"aspeed,ast2600-lpc", "simple-mfd"
+		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
+		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
+		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
 
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
 
 - #address-cells: <1>
 - #size-cells:	<1>
-- ranges: 	Maps 0 to the physical address and length of the LPC memory
-                region
-
-Required LPC Child nodes
-========================
-
-BMC Node
---------
-
-- compatible:	One of:
-		"aspeed,ast2400-lpc-bmc"
-		"aspeed,ast2500-lpc-bmc"
-		"aspeed,ast2600-lpc-bmc"
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
-		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
-
-- reg:		contains the address and length values of the host-related
-                register space for the Aspeed LPC controller
-
-- #address-cells: <1>
-- #size-cells:	<1>
-- ranges: 	Maps 0 to the address and length of the host-related LPC memory
+- ranges:	Maps 0 to the physical address and length of the LPC memory
                 region
 
 Example:
 
 lpc: lpc@1e789000 {
-	compatible = "aspeed,ast2500-lpc", "simple-mfd";
+	compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 	reg = <0x1e789000 0x1000>;
 
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x0 0x1e789000 0x1000>;
 
-	lpc_bmc: lpc-bmc@0 {
-		compatible = "aspeed,ast2500-lpc-bmc";
+	lpc_snoop: lpc-snoop@0 {
+		compatible = "aspeed,ast2600-lpc-snoop";
 		reg = <0x0 0x80>;
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
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+		snoop-ports = <0x80>;
 	};
 };
 
-BMC Node Children
-==================
-
-
-Host Node Children
-==================
 
 LPC Host Interface Controller
 -------------------
@@ -149,14 +99,12 @@ Optional properties:
 
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
@@ -179,9 +127,9 @@ Required properties:
 
 Example:
 
-lhc: lhc@20 {
+lhc: lhc@a0 {
 	compatible = "aspeed,ast2500-lhc";
-	reg = <0x20 0x24 0x48 0x8>;
+	reg = <0xa0 0x24 0xc8 0x8>;
 };
 
 LPC reset control
@@ -192,16 +140,18 @@ state of the LPC bus. Some systems may chose to modify this configuration.
 
 Required properties:
 
- - compatible:		"aspeed,ast2600-lpc-reset" or
-			"aspeed,ast2500-lpc-reset"
-			"aspeed,ast2400-lpc-reset"
+ - compatible:		One of:
+			"aspeed,ast2600-lpc-reset";
+			"aspeed,ast2500-lpc-reset";
+			"aspeed,ast2400-lpc-reset";
+
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
 
 Example:
 
-lpc_reset: reset-controller@18 {
+lpc_reset: reset-controller@98 {
         compatible = "aspeed,ast2500-lpc-reset";
-        reg = <0x18 0x4>;
+        reg = <0x98 0x4>;
         #reset-cells = <1>;
 };
-- 
2.27.0

