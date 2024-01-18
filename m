Return-Path: <linux-gpio+bounces-2341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB4831D95
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 17:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CABCB21CEE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 16:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C6C2C195;
	Thu, 18 Jan 2024 16:32:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617A28E02
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705595579; cv=none; b=j9oHtFSeILPHnNK/ieBWFA9Op9aL7+FhntoRtM7nc0y82T4hoWD/1hU9jZaH0oFo6+biCXMaJCr6main7dp1PoakPioyJhDgJs4776w42Y9MHWY7NTzfo4/U4e/cI6HQEKr8SxmCpP2H9uz2EjWAPIgYgKQNu9pnEvIQLvfckzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705595579; c=relaxed/simple;
	bh=xp5wqNmO+F5SY7+tEzQiJmR8UD4Aq+XQHZnGT1wC76c=;
	h=Received:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=otF/sqfY3Bjl5aTeJaDIuZdERek8DByNu5+bJY8BduQJQ3lltrPsk1ce7BnQnJRryT2yHD6qW+/Hgj/F2clFaZVjtfie7Ehc/v0NCIsQodErNhkefzlCkynNBm+Axt0/6nvnBRmL2qjVSzPioet6rQ3G865/H5VsbiuYaZxAa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ba0a:9cd8:eeb4:49de])
	by laurent.telenet-ops.be with bizsmtp
	id cGYo2B005041RrH01GYoiS; Thu, 18 Jan 2024 17:32:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rQVJB-00FqQQ-38;
	Thu, 18 Jan 2024 17:32:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rQVJw-001nEn-58;
	Thu, 18 Jan 2024 17:32:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Phong Hoang <phong.hoang.wz@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Add missing SCIF_CLK2
Date: Thu, 18 Jan 2024 17:32:37 +0100
Message-Id: <72f20c1bf32187bd30a963cafe27252907d661f9.1705589612.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705589612.git.geert+renesas@glider.be>
References: <cover.1705589612.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car V4H actually has two SCIF_CLK pins.
The second pin provides the SCIF_CLK signal for HSCIF2 and SCIF4.

Fixes: a4c31c56d2d35641 ("arm64: dts: renesas: r8a779g0: Add SCIF nodes")
Fixes: 39d9dfc6fbe1860e ("arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 0a46f315c307e3cb..7b05b9b3e0a85f44 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -185,13 +185,19 @@ psci {
 		method = "smc";
 	};
 
-	/* External SCIF clock - to be overridden by boards that provide it */
+	/* External SCIF clocks - to be overridden by boards that provide them */
 	scif_clk: scif {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
+	scif_clk2: scif2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -690,7 +696,7 @@ hscif2: serial@e6560000 {
 			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 516>,
 				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
-				 <&scif_clk>;
+				 <&scif_clk2>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
 			       <&dmac1 0x35>, <&dmac1 0x34>;
@@ -1066,7 +1072,7 @@ scif4: serial@e6c40000 {
 			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 705>,
 				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
-				 <&scif_clk>;
+				 <&scif_clk2>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x59>, <&dmac0 0x58>,
 			       <&dmac1 0x59>, <&dmac1 0x58>;
-- 
2.34.1


