Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5210631FA8D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhBSO0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:26:44 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57523 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229636AbhBSO0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:26:43 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8A76758035F;
        Fri, 19 Feb 2021 09:25:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=ZSvondftxoXFn
        EZwBY61UTNdenBTZ8VqhBJd5vnp4n0=; b=dip7gmO7hSpZJl1qXFHNTdHXbB81b
        5e/vN/UqO2wem7vu/XWcQlTuljaGJ/CHxM648aCRWY2s3rMEAD0Iv/EcMiobFw/R
        k5g5y2vTJ9s1mqlzJp+L1evpJRfr74W7rRBc+/QbeUgj85rDEPQCnyoBySB2hElN
        9qmMFHzooVNL2N7AFPGm2xynRgyu2o9hyTbfpIJXul6/guHwGJZqQ7H68tX6GsS4
        4YC7f5XU4MFXS6bvVp7Xr7qvwS4buTEP1N3tFVjrni+IVw2rpkLVftL3XSmoUyI1
        /aoOnOAaV78wNeoUIRaFsqHhTjSfCsfmA7ama3VsoXLMmdmG8Y6w7HPrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ZSvondftxoXFnEZwBY61UTNdenBTZ8VqhBJd5vnp4n0=; b=EH9xlbp4
        mB37kBM57PYGntHRhs9HTdBcLxosr31K4rcFLSvWkU7w50xXzKMVNupmCxemFi6j
        KOWbVgBEELqJ7wee6+KyplVUNV0q01zEe9qNRFeKVsjrnOoJ2x7BXgq953pHz06y
        08p7Wzv3EegAiILEngAwg/U88El+lwsWtMA+ZyLj2ohvkMWhliU18Z0W9scPbD2B
        SgD5DO7PyqQlmvsg+9ud+4VcXYRzxbxPjzTOOg+q7lIH88QPWeOeD6wjjs545EYm
        bKA5ppoZP8i3reHJujj9Ih+wFqLr1Ea6Ckqwh5dOEPB1qYeOyGSYXjMd4sDFsuIt
        7nzZHMz3Z5Lyrw==
X-ME-Sender: <xms:dMovYNWHpWhnIbf7wQ-_BRd8Xl-tcs_RQUJeVN-TYyNlWYddr_aAjg>
    <xme:dMovYNlP1nxs33t7XTaWcNbAhGLyv7padtGLgjeCPi19UsbnnKDaiopWmKyKq7l8r
    IvexlR3E-j0cN8O4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
    hrnhepjefgvdevheetkeevgeegleelgfelteetjeffleffvdduudevieffgeetleevhfet
    necukfhppedugedrvddrledurdefjeenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:dMovYJZNaXRB6xBn0meNbVgAHic9bTwE3j8JOUc5NzmwZuqgU2-wTw>
    <xmx:dMovYAU5tgt7utCiSE8CM2D8AJFFF107gChvBwUrg-KvakJAc0XvXw>
    <xmx:dMovYHmJsNajcpuN8h-yhL0_oy_yz4E43yjy7ix1TQulmFYpx-mhAQ>
    <xmx:dMovYJ1HT7zIX6xh2rY_hT4rjb35Lt-nC14uL0DJtEKiS4mNt6ENfA>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0948A24005A;
        Fri, 19 Feb 2021 09:25:49 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org,
        joel@jms.id.au, lee.jones@linaro.org, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH 02/19] ARM: dts: Remove LPC BMC and Host partitions
Date:   Sat, 20 Feb 2021 00:55:06 +1030
Message-Id: <20210219142523.3464540-3-andrew@aj.id.au>
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

A concrete instance is that the HICRB[5:4] are for the I/O port address
configurtaion of KCS channel 1/2. However, the KCS driver cannot access
HICRB for channel 1/2 initialization via syscon regmap interface due to
the parition boundary. (i.e. offset 80h)

In addition, for the HW design backward compatibility, a newly added HW
control bit could be located at any reserved one over the LPC addressing
space. Thereby, this patch removes the lpc-bmc and lpc-host child node
and thus the LPC partitioning.

Note that this change requires the synchronization between device tree
change and the driver change. To prevent the misuse of old devicetrees
with new drivers, or vice versa, the v2 compatible strings are adopted
for the LPC device as listed:

	"aspeed,ast2400-lpc-v2"
	"aspeed,ast2500-lpc-v2"
	"aspeed,ast2600-lpc-v2"

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi |  68 +++++++----------
 arch/arm/boot/dts/aspeed-g5.dtsi | 119 +++++++++++++-----------------
 arch/arm/boot/dts/aspeed-g6.dtsi | 121 +++++++++++++------------------
 3 files changed, 130 insertions(+), 178 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b3dafbc8caca..ee22bc036440 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -343,58 +343,44 @@ vuart: serial@1e787000 {
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2400-lpc", "simple-mfd";
+				compatible = "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
+				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0x0 0x1e789000 0x1000>;
 
-				lpc_bmc: lpc-bmc@0 {
-					compatible = "aspeed,ast2400-lpc-bmc";
-					reg = <0x0 0x80>;
+				lpc_ctrl: lpc-ctrl@80 {
+					compatible = "aspeed,ast2400-lpc-ctrl";
+					reg = <0x80 0x10>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+					status = "disabled";
 				};
 
-				lpc_host: lpc-host@80 {
-					compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
-					reg = <0x80 0x1e0>;
-					reg-io-width = <4>;
-
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x80 0x1e0>;
-
-					lpc_ctrl: lpc-ctrl@0 {
-						compatible = "aspeed,ast2400-lpc-ctrl";
-						reg = <0x0 0x10>;
-						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-						status = "disabled";
-					};
-
-					lpc_snoop: lpc-snoop@10 {
-						compatible = "aspeed,ast2400-lpc-snoop";
-						reg = <0x10 0x8>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				lpc_snoop: lpc-snoop@90 {
+					compatible = "aspeed,ast2400-lpc-snoop";
+					reg = <0x90 0x8>;
+					interrupts = <8>;
+					status = "disabled";
+				};
 
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2400-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2400-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
 
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2400-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2400-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
 
-					ibt: ibt@c0  {
-						compatible = "aspeed,ast2400-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2400-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5bc0de0f3365..10ca2100f69b 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -434,90 +434,73 @@ vuart: serial@1e787000 {
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2500-lpc", "simple-mfd";
+				compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
+				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0x0 0x1e789000 0x1000>;
 
-				lpc_bmc: lpc-bmc@0 {
-					compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
-					reg = <0x0 0x80>;
-					reg-io-width = <4>;
-
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x0 0x80>;
-
-					kcs1: kcs@24 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
-						interrupts = <8>;
-						status = "disabled";
-					};
-					kcs2: kcs@28 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
-						interrupts = <8>;
-						status = "disabled";
-					};
-					kcs3: kcs@2c {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				kcs1: kcs@24 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 
-				lpc_host: lpc-host@80 {
-					compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
-					reg = <0x80 0x1e0>;
-					reg-io-width = <4>;
+				kcs2: kcs@28 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
+					interrupts = <8>;
+					status = "disabled";
+				};
 
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x80 0x1e0>;
+				kcs3: kcs@2c {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
+					interrupts = <8>;
+					status = "disabled";
+				};
 
-					kcs4: kcs@94 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x94 0x1>, <0x98 0x1>, <0x9c 0x1>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				kcs4: kcs@114 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <8>;
+					status = "disabled";
+				};
 
-					lpc_ctrl: lpc-ctrl@0 {
-						compatible = "aspeed,ast2500-lpc-ctrl";
-						reg = <0x0 0x10>;
-						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-						status = "disabled";
-					};
+				lpc_ctrl: lpc-ctrl@80 {
+					compatible = "aspeed,ast2500-lpc-ctrl";
+					reg = <0x80 0x10>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+					status = "disabled";
+				};
 
-					lpc_snoop: lpc-snoop@10 {
-						compatible = "aspeed,ast2500-lpc-snoop";
-						reg = <0x10 0x8>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				lpc_snoop: lpc-snoop@90 {
+					compatible = "aspeed,ast2500-lpc-snoop";
+					reg = <0x90 0x8>;
+					interrupts = <8>;
+					status = "disabled";
+				};
 
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2500-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2500-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
 
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2500-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2500-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
 
 
-					ibt: ibt@c0 {
-						compatible = "aspeed,ast2500-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2500-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 810b0676ab03..d91f48c3db62 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -460,90 +460,73 @@ wdt4: watchdog@1e7850c0 {
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2600-lpc", "simple-mfd";
+				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
 				reg = <0x1e789000 0x1000>;
+				reg-io-width = <4>;
 
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0x0 0x1e789000 0x1000>;
 
-				lpc_bmc: lpc-bmc@0 {
-					compatible = "aspeed,ast2600-lpc-bmc", "simple-mfd", "syscon";
-					reg = <0x0 0x80>;
-					reg-io-width = <4>;
-
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x0 0x80>;
-
-					kcs1: kcs@24 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
-						interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-						kcs_chan = <1>;
-						status = "disabled";
-					};
-					kcs2: kcs@28 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
-						interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
-					kcs3: kcs@2c {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
-						interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
+				kcs1: kcs@24 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
+					interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+					kcs_chan = <1>;
+					status = "disabled";
 				};
 
-				lpc_host: lpc-host@80 {
-					compatible = "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
-					reg = <0x80 0x1e0>;
-					reg-io-width = <4>;
+				kcs2: kcs@28 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
+					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
 
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x80 0x1e0>;
+				kcs3: kcs@2c {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
+					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
 
-					kcs4: kcs@94 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x94 0x1>, <0x98 0x1>, <0x9c 0x1>;
-						interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
+				kcs4: kcs@114 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
 
-					lpc_ctrl: lpc-ctrl@0 {
-						compatible = "aspeed,ast2600-lpc-ctrl";
-						reg = <0x0 0x80>;
-						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-						status = "disabled";
-					};
+				lpc_ctrl: lpc-ctrl@80 {
+					compatible = "aspeed,ast2600-lpc-ctrl";
+					reg = <0x80 0x80>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+					status = "disabled";
+				};
 
-					lpc_snoop: lpc-snoop@0 {
-						compatible = "aspeed,ast2600-lpc-snoop";
-						reg = <0x0 0x80>;
-						interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
+				lpc_snoop: lpc-snoop@80 {
+					compatible = "aspeed,ast2600-lpc-snoop";
+					reg = <0x80 0x80>;
+					interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
 
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2600-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2600-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
 
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2600-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2600-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
 
-					ibt: ibt@c0 {
-						compatible = "aspeed,ast2600-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2600-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
 				};
 			};
 
-- 
2.27.0

