Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0CF31FA94
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhBSO1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:27:06 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43519 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230305AbhBSO04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:26:56 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 71E58580348;
        Fri, 19 Feb 2021 09:25:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=Of9fXLwiHKbZL
        z7SYjbDH9KiyUIl2ezf3PxW73gC+GE=; b=kVehsZZ7XShLXHhuPbxKT1C5qGW7x
        XyWiEMjHj9BnjB+jMrcLAWQfFJwNuviwye5rP/lvaXCQc6ZtCQGkZj7r+drwbsxR
        hMr8kjZj8s3ZTr+nsy4S2PG2lAG3OiImAQYmlpJKtsu5K0jTqBr9YOHr5n6D5D8I
        KeJkzn3x6nT+zvhUBoK8NNxhMYFtabFqXa7ryoN7olS1F56C5wytbr5hLm7W0/Jp
        tooAIITEEZd/9YRCzg40kZeeEYIrMStd2ik3CvtL+Ebi/YmM/xf3nQ/0A8Y1Heoa
        PzdU4VPZ3tqjl1B6kLbI1UiAP/cwlMxcgxiLBeR8iRR0yZv92V6G3mI/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=Of9fXLwiHKbZLz7SYjbDH9KiyUIl2ezf3PxW73gC+GE=; b=iVUYHjoR
        OYwYg6zAazMsY4C/vVhxwwQuv/3IOJ7Ro93v+4OWv3/CuWlbAuOLNq+uySkeO+2b
        K2j9d1vzwzxS/6AN/Cel6r6NLL+1IU2nQwvauavASrm5VxuplvFx0Cv8qwCu/ZxC
        ZYGTHrXotRNKEm0wKIeJEWgZ0i5I5+vEb4i5IgWylQav7Urqme1lTX6qS3EUzgHE
        rIwXnobp2NBbrR894OELx/Xnf0oehR7KapdngRWjQV+WwAeB2fPI37Q65l/VuIO4
        DbhkwOVKVuEQESbRseq/QFuI5ZWaaa5bqgcC8u6Zc8ZIbklbxFGp1XQbv4b76vJS
        pHiEKl7tlFQV+g==
X-ME-Sender: <xms:bcovYEx9tdO6bV-bw2UiVNGzD8bTUz1yByBlmOIf8o-BR3jVncwGuQ>
    <xme:bcovYIS93uRvbNlD1VklGwdxXvI0BWHZZwnCcLTDYmTUfURcGmHkQnM0gszQq5_vO
    r5gbwU_LQU66BQxcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhepjefgvdevheetkeevgeegleelgfelteetjeffleffvdduudevieffgeetleevhfet
    necukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:bcovYGWhK7a5ZAUqwWdJiVfaK8LX6gho6mHjDqFWBcfNkL-qDNFJiQ>
    <xmx:bcovYCjik2fiehnvOGkanWwWXJvN4wnrVo94C8qyvgtoRpo9g43Y6w>
    <xmx:bcovYGD_SmDoIHJDaCIMhEvtli3pdEo5BYjGXknoz5i8qSO5k6pa5A>
    <xmx:bcovYO3KgJ9ri94fSnxtCGKFt4oJ5_6gAhqKE69lpKmjoowJRkFqmg>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id BC8FC24005E;
        Fri, 19 Feb 2021 09:25:42 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org,
        joel@jms.id.au, lee.jones@linaro.org, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 01/19] dt-bindings: aspeed-lpc: Remove LPC partitioning
Date:   Sat, 20 Feb 2021 00:55:05 +1030
Message-Id: <20210219142523.3464540-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
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

