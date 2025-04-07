Return-Path: <linux-gpio+bounces-18395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FCA7ECF3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00AFA7A3B30
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB74259CA0;
	Mon,  7 Apr 2025 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUk9kSU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B62586EA;
	Mon,  7 Apr 2025 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053418; cv=none; b=bDx14lavW/NauJ/2T4eibXWYBsCFWn0FtGPQu7+nQRlCYx1jpL/1RmrsabBeNQStne87J41kVPoX/PzS78JN2yGTFesMY1uJTbVTPwJ7RKJIhr7W+wx2386jedIZ757LbDhaFiRfUmzDeEUCVAarLRNG4YQsBRQQFM8ChRwcG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053418; c=relaxed/simple;
	bh=H9IDe69EjDeeMRbuyVywCZcEKiSKmtygEFDsskB5U4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4gqminXVbkoksYFkqyMZaQmJU+zuYIIXmNhM+m4avapp7Vuyn8BoDw+/rFQ+p1CniNyvvxa1DTcAyrX/gJach8swPJo93VcRVeN5fE3qCgu992B5MLHX4FFHk8+pCwRri/uWDUSQY9qv5Z5/0VS4KCydPSb4GYRzzwRuidit40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUk9kSU5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so28261115e9.1;
        Mon, 07 Apr 2025 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053414; x=1744658214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+zOYwWqyIf3fGotD0J16Z6o1/QEeNbzuNTjs9DUhtM=;
        b=lUk9kSU5ydVe9ag3A8dxYWJ2V5jHwd/WTo/wvoO//Mk70fC8jM8/cCU/bVKcXMPKJl
         yf3b9WwjT/RAgwenymtDiJq0IEdP6losT6Fg5C7EKC98OjnTgBt8C6lPLvf/KjWOh2oD
         gxngkbtLj+L7/0BTGDixVPi7s5en/uVAL190yDGC3HtOh6KMDMzIiuma1BsamRibgfQi
         Kuosu0KMQYuTdFnpU66cspj3+KUGJr1DvZf1w/CXbGo3DsNAFMRNK6zlaXXcaU86M0kP
         85syxOsm64SZk3U4qtaXdCYmn2i6SN62az1bQ6E8/5PHKeIvSwHyrKBN8AOq0yLUsAtK
         A/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053414; x=1744658214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+zOYwWqyIf3fGotD0J16Z6o1/QEeNbzuNTjs9DUhtM=;
        b=SU4KSb7Vijp3D74sFWg7s7TRpCt/D7+NiYvOkBgE4fuQqlEzZs84ySX3HOHy+hYCCg
         hRdyFNsl8Tc3p4fe06M9YeCAbMIsTANPnRUE9XVtByjnc9ZnngineZbKI5rzrOGOiQzo
         JESHBDkSsjWc3AUDvrvWOvjINrqoL9FvxFND0hlgS2bvbxgSL1mXcMKgJMxdoec52WPT
         j7VnfBmOrPcaww25rMvcLtTZ5Hb6zDuYXpvBgRY1zEwU7UNoXF+aABfNsdZsQzdD0IRa
         hhT72w3NPr3wRQ0z/L4LLnxoMT3ZqSOVS/TfXqUqRER5w/dzDueyIarQSDKe2QEuPzAn
         TeUA==
X-Forwarded-Encrypted: i=1; AJvYcCW14fKKPOgHLTYExZuSgpRu5i5/pp4mKilfzBeAwVWmNghwyfzXBxk5rhkeKNd0xkKnYIGdQPyspy/CUw==@vger.kernel.org, AJvYcCW1Bi5bbb9bdGf8plx+8Hdf+ldPz8eKHwz6eIuRi1LkzYSpKHDZZYVe8UyXCywuTxRErER2JvYlohqN@vger.kernel.org, AJvYcCWnjbfBwixmk7f2Ta/9BYFNxpqEUER5gOezEjfYdLMTmj1gTP6UzodU5XHqFfGe4UuwDbx5W/uKlNZ/Rkt+@vger.kernel.org, AJvYcCWuncLrAmfYDvbcGpmfqHQ2bPU/OsLYlWvEU2HWNLhE9b945unIr8KVoBXbK2eQmryaB4KdLCHLJnds@vger.kernel.org, AJvYcCXUTUIbWitSDn4oPsGuW7BH08By9x9eoVWMvNu5CmyWHdCr99eAh5FuZHsC4t28jtRZ/nLEn8f+Q0WndGtT@vger.kernel.org
X-Gm-Message-State: AOJu0YzZz57Zoy51rvaLO9L3ueo5HigPAfou3Ad/DHLN3hYFaBO7Ruex
	covrb0/1mpg+dnWKPu8N4d6ZLXW2MGxEflEPdcql/Z66CxaGyjy4
X-Gm-Gg: ASbGncvPWEF3ac3yeClyDqZlwluU9R2z5PBtXYaUyMp2/Dd4JVlaqoiVFzJqIi3uGfL
	ZbukPGkYkqhwMXdaBgbOfJ8uatcyPgJaeO5z0nHCvlm5pv26ferXqRlGclijVNmIGX8+rhYv07g
	R3/4FLrtdAs2EXeqSzOzVwtGpTRbX0NtAo7rGAD3s6UkaosvjO6zXau2uxgxzW/ZdlkeqN/Mc6G
	loWZTQtfkZehUrOh9JLqCSrCoI76hnhAnw6eC8Ghwn9zBluyJp/P1/4LmRHwHLbNgja0osaM4Sn
	jQo2U75SklRBLiq4xS2LxnLg+739ash5S3dG9EmkPq0MkMZZezLqAGu4ryC3XZRngVQDcQ==
X-Google-Smtp-Source: AGHT+IFxUAwZ800UYk0s2MclfJVfQ8Oh1enutzUBD8uGItPgshGjAiQiYA7tuWFYtH5SrBbe+NLDkg==
X-Received: by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43ed0da49e6mr160918775e9.30.1744053414255;
        Mon, 07 Apr 2025 12:16:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 11/12] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
Date: Mon,  7 Apr 2025 20:16:27 +0100
Message-ID: <20250407191628.323613-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the initial Device Tree Source Include (DTSI) file for the Renesas
RZ/V2N (R9A09G056) SoC. Include support for the following components:

- CPU (Cortex-A55 cores with operating points)
- External clocks (audio, qextal, rtxin)
- Pin controller (GPIO support)
- Clock Pulse Generator (CPG)
- System controller (SYS)
- Serial Communication Interface (SCIF)
- Secure Digital Host Interface (SDHI 0/1/2)
- Generic Interrupt Controller (GIC)
- ARMv8 timer

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added RZV2N_Px, RZV2N_PORT_PINMUX, and RZV2N_GPIO macros in
  SoC DTSI as we are re-using renesas,r9a09g057-pinctrl.h
  in pictrl driver hence to keep the consistency with the
  RZ/V2H(P) SoC these macros are added.
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 282 +++++++++++++++++++++
 1 file changed, 282 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
new file mode 100644
index 000000000000..90964bd864cc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2N SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g056-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZV2N_Px = Offset address of PFC_P_mn  - 0x20 */
+#define RZV2N_P0	0
+#define RZV2N_P1	1
+#define RZV2N_P2	2
+#define RZV2N_P3	3
+#define RZV2N_P4	4
+#define RZV2N_P5	5
+#define RZV2N_P6	6
+#define RZV2N_P7	7
+#define RZV2N_P8	8
+#define RZV2N_P9	9
+#define RZV2N_PA	10
+#define RZV2N_PB	11
+
+#define RZV2N_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2N_P##b, p, f)
+#define RZV2N_GPIO(port, pin)		RZG2L_GPIO(RZV2N_P##port, pin)
+
+/ {
+	compatible = "renesas,r9a09g056";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	audio_extal_clk: audio-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	/*
+	 * The default cluster table is based on the assumption that the PLLCA55 clock
+	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set to
+	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionally can be
+	 * clocked to 1.8GHz as well). The table below should be overridden in the board
+	 * DTS based on the PLLCA55 clock frequency.
+	 */
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-425000000 {
+			opp-hz = /bits/ 64 <425000000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-212500000 {
+			opp-hz = /bits/ 64 <212500000>;
+			opp-microvolt = <800000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G056_CA55_0_CORE_CLK0>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G056_CA55_0_CORE_CLK1>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G056_CA55_0_CORE_CLK2>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A09G056_CA55_0_CORE_CLK3>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	qextal_clk: qextal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	rtxin_clk: rtxin-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		pinctrl: pinctrl@10410000 {
+			compatible = "renesas,r9a09g056-pinctrl";
+			reg = <0 0x10410000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G056_IOTOP_0_SHCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 96>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+		};
+
+		cpg: clock-controller@10420000 {
+			compatible = "renesas,r9a09g056-cpg";
+			reg = <0 0x10420000 0 0x10000>;
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
+			clock-names = "audio_extal", "rtxin", "qextal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sys: system-controller@10430000 {
+			compatible = "renesas,r9a09g056-sys";
+			reg = <0 0x10430000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G056_SYS_0_PCLK>;
+			resets = <&cpg 0x30>;
+		};
+
+		scif: serial@11c01400 {
+			compatible = "renesas,scif-r9a09g056",
+				     "renesas,scif-r9a09g057";
+			reg = <0 0x11c01400 0 0x400>;
+			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eri", "rxi", "txi", "bri", "dri",
+					  "tei", "tei-dri", "rxi-edge", "txi-edge";
+			clocks = <&cpg CPG_MOD 0x8f>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x95>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@14900000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x14900000 0 0x20000>,
+			      <0x0 0x14940000 0 0x80000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		sdhi0: mmc@15c00000  {
+			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c00000 0 0x10000>;
+			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
+				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa7>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi0_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi1: mmc@15c10000 {
+			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c10000 0 0x10000>;
+			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
+				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa8>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@15c20000 {
+			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c20000 0 0x10000>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
+				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 0xa9>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
-- 
2.49.0


