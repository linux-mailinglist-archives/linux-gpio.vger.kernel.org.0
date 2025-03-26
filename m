Return-Path: <linux-gpio+bounces-18019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E52A7192B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13717188B175
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9422A1FCFC5;
	Wed, 26 Mar 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hecVdOv6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6971FBE9E;
	Wed, 26 Mar 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000018; cv=none; b=EctCswEOFpMeDUjBPOh/7sOPXUqjWYzf/4G9mCrcUsOPs7tbRXmVzJMLtS1x9uYCscjalc//HM2xHdndNyuYgbI332qh86HfdvJLfF6h3AYMS1DHZJAiSt/n93WJ01ZO/25OQAx6AzqjiAbJ9Cpd+sMe9pyEQzFMHg4xohdpSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000018; c=relaxed/simple;
	bh=4mJSffzQAA8/SKBNkOgmdVDWwvMqzcZHLeBFMhcqExk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgqqZa8HgVayWXTzW1J5DMAi97FDYrqpxd2g+6878/y536a2MYHsoHKRe62Bf5X8A5SQj+JesdN8d0RfZr5NkGc4V1JONV/AL15olc7sBQwkJyerAsHRybhgb9MRKOsu+3R+5RqrRgqtUjs8kg5iLeNjYSAN3buf91qjh3CTlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hecVdOv6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso44930495e9.2;
        Wed, 26 Mar 2025 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000014; x=1743604814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q10tmQw4d4n82X0z4LlSkRoHDEfQec/aY8BwvwViugQ=;
        b=hecVdOv6hQM/UjHMVcXYCcOXDW9fkXXI1KtnQfSplJxoO6Cr8u0TflR2eOlO1QDBb+
         q+Laas8cgr5oZCyaUsYh4HuPJDx/Eb3/A8SaX9BZbNH13S/47ThLIhmruJfs2lHjnRTJ
         YZphvRD8SHjDaDzh2QyL4Z3/8FX3q/qHp/mOjzP+ZgVh6qeVT4n4DDRcxqHHj+xQNdZX
         Hw5OWiliigu+S2ohPTEx05xKEUmo6yKrZDTnNa0psu9yyKfYh0carPhG7udO6l+8UbCe
         kqIPMj5BtNy0h3LxtYKlHCz7KU8/txA40b9ir4i4B9ah/PE7O6S3kOvJJWfduM6dVJeH
         S5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000014; x=1743604814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q10tmQw4d4n82X0z4LlSkRoHDEfQec/aY8BwvwViugQ=;
        b=ew9By/baOwRIeS6TyDFAYllvBoTkGna64M0bpWiuLO5620C4E3hb2hrigwIxRBSk5b
         FGIDqnhh4MC7ygatjyekA97QH364nzXDqioUjvzaysRWdQw86wYiLOeP/I/BLz15yEJ8
         EolMZlCK2N7NQMvqAw6BCUUDNaRWRJC2kg/W0q+ZRohw2gg+/8kpVctqJyKFtSOv36dl
         1i/0jyU/DXavxJlp6CwrEvbpISQ2p02uWuRzjMeAZM8sR+zBmNGmKVaIkie5ObA/No3R
         63/0HFu5YlMOlNXtsIPUFDzLSLu68u237g7dMlM7xASGincSWloYCPrkiuxPgUF85iLd
         16vg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ54fDQs6XpBQWr+WzGOcu+Ggc5SjzSQ+xC2U4ebfLJuV2vpQXsG81+qm8JERpzFEjWIUszAe0WAb7@vger.kernel.org, AJvYcCUZ4IA+WHPMGOg588I4wvbJySbjJE4UOMKLqS73Wj4g5bEVA79rpGYm4oq3oFxPRbPC4uT+J+4SrG6JJQ==@vger.kernel.org, AJvYcCW6Rgs5aIP03E2gJ0utso0rcDUoEf6yp4yKNhvRV41yPLMAnI2n7vJtJQHqdn69+DjuakGPSi4PJ3SQw+1E@vger.kernel.org, AJvYcCW7V3zFuQNwif4o1w8ljTvHbBGXgIFXBIlxEEZbFCkl7bx0gXY1V6TmGsx+75CcioixLsiKbO5o3TtT@vger.kernel.org, AJvYcCWQ1EqKuZ4VIty3cybZCnG8B5BBpYBTQMb6hgNvoWI1LFD8E00XPxL4h46EOa2Px9ZA3LcoCFdiMGUY@vger.kernel.org, AJvYcCXWHrw2zZ8OyP0uTFc4+YVLWWfRKMosJ6L/76peEbWV+YWD/y7/ao0STVhfQwlMEkF3T6BwGklYmg5UbASc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7v/8SRFdrNlRYON3948DWuPHQ0IFohSZUtEn3Gf9ZxNYk89KE
	oR5cU+eiRs+mcw6JbTE5E1xNmUlxSv3UfL1aq0xLezoR0V/rvmkb
X-Gm-Gg: ASbGncvZkLCya5wkkR9LKrVw+zp+A5n4sltyidP59kGUW8rVsMDcZhAlxPxEbcSCzSr
	g/PXwqIA/AR5QAi46bya12horu+EuXP/taTO1XTcusL5rB4ObDswEz0DsZ25/TRpRkE6bupWEd1
	abmAWT65tUOXxQwHCA4o4rWdEv6I+Duf1k74IatAysVtcQU+/hH52gdyoUQMUuocQTKGFPPGy7O
	lqHV7ZXowC4metFgL5mwvWDowdxo7JnL8kAF+HQ6YtYJ8PYRj1L9wJ4UnjfMlrMbuvKO0CTpsEe
	pqIiYBnaSFrqMG/h5NjMIZoDpEavCa8YI/ooz9FyotkuopBachx6VjtOnqsJy+9FUNMM
X-Google-Smtp-Source: AGHT+IFhbo/FW6BvxZ9UE1q9zuqz1Qw7bo30494+mRFayj1J1XJnAoEXcZ16gMN9jmMYNyHZ24rRYQ==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr160116825e9.21.1743000013925;
        Wed, 26 Mar 2025 07:40:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 13/15] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
Date: Wed, 26 Mar 2025 14:39:43 +0000
Message-ID: <20250326143945.82142-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Note, dtbs_check complains about missing interrupt properties for pinctrl.
This is because, as part of the initial support, the ICU has not been
added yet. The interrupt-related properties will be added to the pinctrl
node along with ICU support.
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 264 +++++++++++++++++++++
 1 file changed, 264 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
new file mode 100644
index 000000000000..a807dd90913f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2N SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g056-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
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


