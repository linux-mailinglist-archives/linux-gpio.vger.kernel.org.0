Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F398283282
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 10:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgJEIuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 04:50:01 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46828 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 04:50:01 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 09588iso047545
        for <linux-gpio@vger.kernel.org>; Mon, 5 Oct 2020 16:08:44 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09588T7w047497;
        Mon, 5 Oct 2020 16:08:29 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Oct
 2020 16:28:10 +0800
From:   "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <minyard@acm.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <haiyue.wang@linux.intel.com>, <cyrilbur@gmail.com>,
        <rlippert@google.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>
CC:     <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 1/5] ARM: dts: Remove LPC BMC and Host partitions
Date:   Mon, 5 Oct 2020 16:28:02 +0800
Message-ID: <20201005082806.28899-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09588T7w047497
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LPC controller has no concept of the BMC and the Host partitions.

A concrete instance is that the HICRB[5:4] are for the I/O port address
configurtaion of KCS channel 1/2. However, the KCS driver cannot access
HICRB for channel 1/2 initialization via syscon regmap interface due to
the parition boundary. (i.e. offset 80h)

In addition, to be backward compatible, the newly added HW control bits
could be located at any reserved bits over the LPC addressing space.

Thereby, this patch removes the lpc-bmc and lpc-host child node and thus
the LPC partitioning.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi |  74 +++++++----------
 arch/arm/boot/dts/aspeed-g5.dtsi | 135 ++++++++++++++-----------------
 arch/arm/boot/dts/aspeed-g6.dtsi | 135 ++++++++++++++-----------------
 3 files changed, 148 insertions(+), 196 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 82f0213e3a3c..22996b3c4a00 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -338,58 +338,44 @@
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2400-lpc", "simple-mfd";
+				compatible = "aspeed,ast2400-lpc", "simple-mfd", "syscon";
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
-
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2400-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
-
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2400-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
-
-					ibt: ibt@c0  {
-						compatible = "aspeed,ast2400-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				lpc_snoop: lpc-snoop@90 {
+					compatible = "aspeed,ast2400-lpc-snoop";
+					reg = <0x90 0x8>;
+					interrupts = <8>;
+					status = "disabled";
+				};
+
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2400-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
+
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2400-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
+
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2400-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9c91afb2b404..617efa703207 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -430,90 +430,73 @@
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2500-lpc", "simple-mfd";
+				compatible = "aspeed,ast2500-lpc", "simple-mfd", "syscon";
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
+				};
+
+				kcs2: kcs@28 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
+					interrupts = <8>;
+					status = "disabled";
+				};
+
+				kcs3: kcs@2c {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
+					interrupts = <8>;
+					status = "disabled";
+				};
+
+				kcs4: kcs@114 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 
-				lpc_host: lpc-host@80 {
-					compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
-					reg = <0x80 0x1e0>;
-					reg-io-width = <4>;
-
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x80 0x1e0>;
-
-					kcs4: kcs@94 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x94 0x1>, <0x98 0x1>, <0x9c 0x1>;
-						interrupts = <8>;
-						status = "disabled";
-					};
-
-					lpc_ctrl: lpc-ctrl@0 {
-						compatible = "aspeed,ast2500-lpc-ctrl";
-						reg = <0x0 0x10>;
-						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-						status = "disabled";
-					};
-
-					lpc_snoop: lpc-snoop@10 {
-						compatible = "aspeed,ast2500-lpc-snoop";
-						reg = <0x10 0x8>;
-						interrupts = <8>;
-						status = "disabled";
-					};
-
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2500-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
-
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2500-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
-
-
-					ibt: ibt@c0 {
-						compatible = "aspeed,ast2500-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <8>;
-						status = "disabled";
-					};
+				lpc_ctrl: lpc-ctrl@80 {
+					compatible = "aspeed,ast2500-lpc-ctrl";
+					reg = <0x80 0x10>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+					status = "disabled";
+				};
+
+				lpc_snoop: lpc-snoop@90 {
+					compatible = "aspeed,ast2500-lpc-snoop";
+					reg = <0x90 0x8>;
+					interrupts = <8>;
+					status = "disabled";
+				};
+
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2500-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
+
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2500-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
+
+
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2500-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <8>;
+					status = "disabled";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..8dfb5847fc34 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -449,90 +449,73 @@
 			};
 
 			lpc: lpc@1e789000 {
-				compatible = "aspeed,ast2600-lpc", "simple-mfd";
+				compatible = "aspeed,ast2600-lpc", "simple-mfd", "syscon";
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
+				};
+
+				kcs2: kcs@28 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
+					interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				kcs3: kcs@2c {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
+					interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				kcs4: kcs@114 {
+					compatible = "aspeed,ast2500-kcs-bmc-v2";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
+				lpc_ctrl: lpc-ctrl@80 {
+					compatible = "aspeed,ast2600-lpc-ctrl";
+					reg = <0x80 0x80>;
+					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+					status = "disabled";
+				};
+
+				lpc_snoop: lpc-snoop@80 {
+					compatible = "aspeed,ast2600-lpc-snoop";
+					reg = <0x80 0x80>;
+					interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
 				};
 
-				lpc_host: lpc-host@80 {
-					compatible = "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
-					reg = <0x80 0x1e0>;
-					reg-io-width = <4>;
-
-					#address-cells = <1>;
-					#size-cells = <1>;
-					ranges = <0x0 0x80 0x1e0>;
-
-					kcs4: kcs@94 {
-						compatible = "aspeed,ast2500-kcs-bmc-v2";
-						reg = <0x94 0x1>, <0x98 0x1>, <0x9c 0x1>;
-						interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
-
-					lpc_ctrl: lpc-ctrl@0 {
-						compatible = "aspeed,ast2600-lpc-ctrl";
-						reg = <0x0 0x80>;
-						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
-						status = "disabled";
-					};
-
-					lpc_snoop: lpc-snoop@0 {
-						compatible = "aspeed,ast2600-lpc-snoop";
-						reg = <0x0 0x80>;
-						interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
-
-					lhc: lhc@20 {
-						compatible = "aspeed,ast2600-lhc";
-						reg = <0x20 0x24 0x48 0x8>;
-					};
-
-					lpc_reset: reset-controller@18 {
-						compatible = "aspeed,ast2600-lpc-reset";
-						reg = <0x18 0x4>;
-						#reset-cells = <1>;
-					};
-
-					ibt: ibt@c0 {
-						compatible = "aspeed,ast2600-ibt-bmc";
-						reg = <0xc0 0x18>;
-						interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-						status = "disabled";
-					};
+				lhc: lhc@a0 {
+					compatible = "aspeed,ast2600-lhc";
+					reg = <0xa0 0x24 0xc8 0x8>;
+				};
+
+				lpc_reset: reset-controller@98 {
+					compatible = "aspeed,ast2600-lpc-reset";
+					reg = <0x98 0x4>;
+					#reset-cells = <1>;
+				};
+
+				ibt: ibt@140 {
+					compatible = "aspeed,ast2600-ibt-bmc";
+					reg = <0x140 0x18>;
+					interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
 				};
 			};
 
-- 
2.17.1

