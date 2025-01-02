Return-Path: <linux-gpio+bounces-14418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3179FFE36
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC85D161AC1
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CD51B413E;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uo3yixYZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BAE1802B;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=RPrUk/nz0fQAvY9wH4NeE4jF0geuUQdczSj0efBqK+1IufLYSxNGYOInuQ3rB7HFLhhXCzs1D7pkByogj0h6bQEJxHxbSjWtN+YXT3lJmxbQ1FLCMxYVAMMShI6a8qKHYv5v/jttBpNktbwSmTi2RjlguLIYGZ5cAkdu+lcOEWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=mFttdxUf0zkS97qdKWAYSDQtG0SVAkS26FN4ZvrD4O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ut88Xg0U/NhaADglU32oyMp+UZDQ8AQNGdZsf6gHfhdnI5nbNQOrIC7xm3EIvXo6H5YO9M2+thCoNd4bfCPgDgjlmT/vpHGwtIWsKVUbkp4mb8jlFwaFpcdaKqSw6RKKxh+m+nERAXc7iJ4h7bWnOJGU9YUIQK4NZdiWffM31XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uo3yixYZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0564C4CEDF;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842741;
	bh=mFttdxUf0zkS97qdKWAYSDQtG0SVAkS26FN4ZvrD4O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uo3yixYZMMoVIueGO+G9SRCzblkf5+UPEV/AP1OeVZIG/WeDTGmR/ZAXM231WAgiH
	 rqWF7k++R9Ovgk8ZA2FbKJ8xu93l5QokS5U5XM7d/bXC64QwZxVL+XmHqMHt2nMiWv
	 8XqMv57EaAeHRmVAappmlVO1+wkEzxtNPR6UPtIbNyLtrrW4CUKHmhANtOwpXvMqdL
	 P13aYe8GQqDMVGCQ/UdrOwgTvPVOGyEJfaFyIY3jChX9NUqllFf+ETFwGwLI1KMfPU
	 7UC6Qtf6QdqfSbKFJd6flH0sbwRmokIIbBi/aY4xlp5pAp1l4ekTOzB5nINCS0reDg
	 pWKNhO6fuvoIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6699E7718B;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:44 +0100
Subject: [PATCH 03/19] powerpc: dts: mpc8315e: Use IRQ_TYPE_* macros
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-3-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=10387;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=27vJGZGlFwWizM+EMz5rgxyTnv087lEXb6iLZDOh3DE=;
 b=9363Ysi+0bn7S8tWB0fh1Ub3SedQBf3xmMz9WI6sCYjeYHhNuAhanngotMhu7PndyysNJ7P0a
 lqFKK9sAHo5AxNVhzQHHS8d20lltsGV001A4Puc90F4CesxY1Kukf+p
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

This increases readability, because "0x8" isn't very descriptive.

mpc8315erdb.dtb remains identical after this patch.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315e.dtsi   | 112 ++++++++++++++++++----------------
 arch/powerpc/boot/dts/mpc8315erdb.dts |   4 +-
 2 files changed, 62 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8315e.dtsi b/arch/powerpc/boot/dts/mpc8315e.dtsi
index 4830c8e5cd5c6858ea3a0c25e4a1f26fa87a7111..8741482905f0f30bf893a08b2602fdc6e74c23ff 100644
--- a/arch/powerpc/boot/dts/mpc8315e.dtsi
+++ b/arch/powerpc/boot/dts/mpc8315e.dtsi
@@ -12,6 +12,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	compatible = "fsl,mpc8315e";
@@ -48,7 +49,7 @@ localbus@e0005000 {
 		#size-cells = <1>;
 		compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
 		reg = <0xe0005000 0x1000>;
-		interrupts = <77 0x8>;
+		interrupts = <77 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
 	};
 
@@ -73,7 +74,7 @@ i2c@3000 {
 			cell-index = <0>;
 			compatible = "fsl-i2c";
 			reg = <0x3000 0x100>;
-			interrupts = <14 0x8>;
+			interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			dfsrr;
 		};
@@ -82,7 +83,7 @@ spi@7000 {
 			cell-index = <0>;
 			compatible = "fsl,spi";
 			reg = <0x7000 0x1000>;
-			interrupts = <16 0x8>;
+			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			mode = "cpu";
 		};
@@ -94,35 +95,35 @@ dma@82a8 {
 			reg = <0x82a8 4>;
 			ranges = <0 0x8100 0x1a8>;
 			interrupt-parent = <&ipic>;
-			interrupts = <71 8>;
+			interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			cell-index = <0>;
 			dma-channel@0 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0 0x80>;
 				cell-index = <0>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@80 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x80 0x80>;
 				cell-index = <1>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@100 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x100 0x80>;
 				cell-index = <2>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 			dma-channel@180 {
 				compatible = "fsl,mpc8315-dma-channel", "fsl,elo-dma-channel";
 				reg = <0x180 0x28>;
 				cell-index = <3>;
 				interrupt-parent = <&ipic>;
-				interrupts = <71 8>;
+				interrupts = <71 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
 
@@ -132,7 +133,7 @@ usb@23000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupt-parent = <&ipic>;
-			interrupts = <38 0x8>;
+			interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
 			phy_type = "utmi";
 		};
 
@@ -146,7 +147,9 @@ enet0: ethernet@24000 {
 			reg = <0x24000 0x1000>;
 			ranges = <0x0 0x24000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <32 0x8 33 0x8 34 0x8>;
+			interrupts = <32 IRQ_TYPE_LEVEL_LOW>,
+				     <33 IRQ_TYPE_LEVEL_LOW>,
+				     <34 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
 			mdio@520 {
@@ -167,7 +170,9 @@ enet1: ethernet@25000 {
 			reg = <0x25000 0x1000>;
 			ranges = <0x0 0x25000 0x1000>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <35 0x8 36 0x8 37 0x8>;
+			interrupts = <35 IRQ_TYPE_LEVEL_LOW>,
+				     <36 IRQ_TYPE_LEVEL_LOW>,
+				     <37 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 
 			mdio@520 {
@@ -184,7 +189,7 @@ serial0: serial@4500 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4500 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <9 0x8>;
+			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -194,7 +199,7 @@ serial1: serial@4600 {
 			compatible = "fsl,ns16550", "ns16550";
 			reg = <0x4600 0x100>;
 			clock-frequency = <133333333>;
-			interrupts = <10 0x8>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -203,7 +208,7 @@ crypto@30000 {
 				     "fsl,sec2.4", "fsl,sec2.2", "fsl,sec2.1",
 				     "fsl,sec2.0";
 			reg = <0x30000 0x10000>;
-			interrupts = <11 0x8>;
+			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,num-channels = <4>;
 			fsl,channel-fifo-len = <24>;
@@ -215,7 +220,7 @@ sata@18000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x18000 0x1000>;
 			cell-index = <1>;
-			interrupts = <44 0x8>;
+			interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
@@ -223,14 +228,17 @@ sata@19000 {
 			compatible = "fsl,mpc8315-sata", "fsl,pq-sata";
 			reg = <0x19000 0x1000>;
 			cell-index = <2>;
-			interrupts = <45 0x8>;
+			interrupts = <45 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 		};
 
 		gtm1: timer@500 {
 			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
 			reg = <0x500 0x100>;
-			interrupts = <90 8 78 8 84 8 72 8>;
+			interrupts = <90 IRQ_TYPE_LEVEL_LOW>,
+				     <78 IRQ_TYPE_LEVEL_LOW>,
+				     <84 IRQ_TYPE_LEVEL_LOW>,
+				     <72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			clock-frequency = <133333333>;
 		};
@@ -238,16 +246,16 @@ gtm1: timer@500 {
 		timer@600 {
 			compatible = "fsl,mpc8315-gtm", "fsl,gtm";
 			reg = <0x600 0x100>;
-			interrupts = <91 8 79 8 85 8 73 8>;
+			interrupts = <91 IRQ_TYPE_LEVEL_LOW>,
+				     <79 IRQ_TYPE_LEVEL_LOW>,
+				     <85 IRQ_TYPE_LEVEL_LOW>,
+				     <73 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			clock-frequency = <133333333>;
 		};
 
 		/* IPIC
-		 * interrupts cell = <intr #, sense>
-		 * sense values match linux IORESOURCE_IRQ_* defines:
-		 * sense == 8: Level, low assertion
-		 * sense == 2: Edge, high-to-low change
+		 * interrupts cell = <intr #, type>
 		 */
 		ipic: interrupt-controller@700 {
 			interrupt-controller;
@@ -261,14 +269,14 @@ ipic-msi@7c0 {
 			compatible = "fsl,ipic-msi";
 			reg = <0x7c0 0x40>;
 			msi-available-ranges = <0 0x100>;
-			interrupts = <0x43 0x8
-				      0x4  0x8
-				      0x51 0x8
-				      0x52 0x8
-				      0x56 0x8
-				      0x57 0x8
-				      0x58 0x8
-				      0x59 0x8>;
+			interrupts = <0x43 IRQ_TYPE_LEVEL_LOW>,
+				     <0x4  IRQ_TYPE_LEVEL_LOW>,
+				     <0x51 IRQ_TYPE_LEVEL_LOW>,
+				     <0x52 IRQ_TYPE_LEVEL_LOW>,
+				     <0x56 IRQ_TYPE_LEVEL_LOW>,
+				     <0x57 IRQ_TYPE_LEVEL_LOW>,
+				     <0x58 IRQ_TYPE_LEVEL_LOW>,
+				     <0x59 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = < &ipic >;
 		};
 
@@ -276,7 +284,7 @@ pmc: power@b00 {
 			compatible = "fsl,mpc8315-pmc", "fsl,mpc8313-pmc",
 				     "fsl,mpc8349-pmc";
 			reg = <0xb00 0x100 0xa00 0x100>;
-			interrupts = <80 8>;
+			interrupts = <80 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-parent = <&ipic>;
 			fsl,mpc8313-wakeup-timer = <&gtm1>;
 		};
@@ -286,24 +294,24 @@ pci0: pci@e0008500 {
 		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
 		interrupt-map = <
 				/* IDSEL 0x0E -mini PCI */
-				 0x7000 0x0 0x0 0x1 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x2 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x3 &ipic 18 0x8
-				 0x7000 0x0 0x0 0x4 &ipic 18 0x8
+				 0x7000 0x0 0x0 0x1 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x2 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x3 &ipic 18 IRQ_TYPE_LEVEL_LOW
+				 0x7000 0x0 0x0 0x4 &ipic 18 IRQ_TYPE_LEVEL_LOW
 
 				/* IDSEL 0x0F -mini PCI */
-				 0x7800 0x0 0x0 0x1 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x2 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x3 &ipic 17 0x8
-				 0x7800 0x0 0x0 0x4 &ipic 17 0x8
+				 0x7800 0x0 0x0 0x1 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x2 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x3 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x7800 0x0 0x0 0x4 &ipic 17 IRQ_TYPE_LEVEL_LOW
 
 				/* IDSEL 0x10 - PCI slot */
-				 0x8000 0x0 0x0 0x1 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x2 &ipic 17 0x8
-				 0x8000 0x0 0x0 0x3 &ipic 48 0x8
-				 0x8000 0x0 0x0 0x4 &ipic 17 0x8>;
+				 0x8000 0x0 0x0 0x1 &ipic 48 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x2 &ipic 17 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x3 &ipic 48 IRQ_TYPE_LEVEL_LOW
+				 0x8000 0x0 0x0 0x4 &ipic 17 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&ipic>;
-		interrupts = <66 0x8>;
+		interrupts = <66 IRQ_TYPE_LEVEL_LOW>;
 		bus-range = <0x0 0x0>;
 		ranges = <0x02000000 0 0x90000000 0x90000000 0 0x10000000
 			  0x42000000 0 0x80000000 0x80000000 0 0x10000000
@@ -329,10 +337,10 @@ pci1: pcie@e0009000 {
 		          0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
 		bus-range = <0 255>;
 		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 1 8
-				 0 0 0 2 &ipic 1 8
-				 0 0 0 3 &ipic 1 8
-				 0 0 0 4 &ipic 1 8>;
+		interrupt-map = <0 0 0 1 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 2 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
 	};
 
@@ -347,10 +355,10 @@ pci2: pcie@e000a000 {
 			  0x01000000 0 0x00000000 0xd1000000 0 0x00800000>;
 		bus-range = <0 255>;
 		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0 0 0 1 &ipic 2 8
-				 0 0 0 2 &ipic 2 8
-				 0 0 0 3 &ipic 2 8
-				 0 0 0 4 &ipic 2 8>;
+		interrupt-map = <0 0 0 1 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 2 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 3 &ipic 2 IRQ_TYPE_LEVEL_LOW
+				 0 0 0 4 &ipic 2 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <0>;
 	};
 };
diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index b39903c8813d194c104d1e22c6167d8a9cea0076..2ea71514900131893a70b44bab7bcc0bf4d86e44 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -87,13 +87,13 @@ ethernet@24000 {
 			mdio@520 {
 				phy0: ethernet-phy@0 {
 					interrupt-parent = <&ipic>;
-					interrupts = <20 0x8>;
+					interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 					reg = <0x0>;
 				};
 
 				phy1: ethernet-phy@1 {
 					interrupt-parent = <&ipic>;
-					interrupts = <19 0x8>;
+					interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
 					reg = <0x1>;
 				};
 

-- 
2.45.2



