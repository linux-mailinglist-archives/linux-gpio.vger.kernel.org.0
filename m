Return-Path: <linux-gpio+bounces-12535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE139BBAC4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9206A1C218AE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F5E1C729B;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF0QoIeB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00E1C3301;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=WgQV8d5AeH+p243OWF6fjgj/L/UQUL6gPf02wAB0IbNvbzHmsPOYcDMGFb/9kTjz4XX8xfU3X3m42C0294LJdnelEGP4m9M15YaBzhlSh56V4nJtg2sYm+pLQJTMTFMVpOBnuM/ssrAw2Tk6ol/M2VnRHBYSNkFhcdROvWkOpus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=ManeNSi9a6po2fahsyS5JlMeyByu3l8jJDY6wUCdXf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBcVpPxcNLcEOu4FtHlwXJaPZSiPrdNYl7tB2yaU7+KbLCdGeNAOO8JuJenCzouvU/jFEwB7bgo5C4b1ofR+TvFvyssoK0RS/n4wfalOaMs+5iWTreeRLTshPqnj+bwsO8wisP38mY7iQrGnUUItH5KUxHGfVZ/ASik2YBk/Zc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF0QoIeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C51FC4CEDD;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=ManeNSi9a6po2fahsyS5JlMeyByu3l8jJDY6wUCdXf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PF0QoIeBWsCNWdPRzuAbDylLXBIOFfmhiYcQhc4Z1zSEGzOTQ5mddd+eVTc+HiK3P
	 ClJRDkXejwaPAvE/2dKsQB/6+oRUWNhIEz4S7oGLjysIfX+Bp6ZkqXygfbHyT8aevR
	 axgGwVlNwDLNxBfwgLt7zMlRBWFA6+JJ+oEKPdEn8koF/DR1YMVKvHKh9pimJU4Rop
	 +pVzuLBWfKAAvBLG9nNBCFAckrW1eragw/ec9V7Ar490Ithc0ztL3KR0kLtBZ9o/nH
	 1LY2IAo5bbRivqSWlLF10tHQLcJYYlLctmhLSfXn3GvGpEve1Iha33pOZJWd6V0QjA
	 KdFrUM465TiKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044B1D1BDCC;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:06 +0100
Subject: [PATCH RESEND v13 04/12] dt-bindings: clock: Add Marvell PXA1908
 clock bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-4-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5085;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=TSes5VMwDbVr2Ciyf+7TtXMx+R/4KyK+lWL5sqtr0nk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0OnPZ0+j/HWT891Ux9/4p7gWSC+V+zgVvG3iq2Cs
 V8OJS5K6ChlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJ1DAz/FNh8nqio33xo8ui
 FSJ8Uq5y6+d/z39hwFwWaZ/evnN13D6G/zHXIw8dV+WVVElO3hQz7dqHvw2uXWX7uTIWvElIDvq
 qxAsA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add dt bindings and documentation for the Marvell PXA1908 clock
controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 48 ++++++++++++
 include/dt-bindings/clock/marvell,pxa1908.h        | 88 ++++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4e78933232b6b925811425f853bedf6e9f01a27d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA1908 Clock Controllers
+
+maintainers:
+  - Duje Mihanović <duje.mihanovic@skole.hr>
+
+description: |
+  The PXA1908 clock subsystem generates and supplies clock to various
+  controllers within the PXA1908 SoC. The PXA1908 contains numerous clock
+  controller blocks, with the ones currently supported being APBC, APBCP, MPMU
+  and APMU roughly corresponding to internal buses.
+
+  All these clock identifiers could be found in <include/dt-bindings/marvell,pxa1908.h>.
+
+properties:
+  compatible:
+    enum:
+      - marvell,pxa1908-apbc
+      - marvell,pxa1908-apbcp
+      - marvell,pxa1908-mpmu
+      - marvell,pxa1908-apmu
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # APMU block:
+  - |
+    clock-controller@d4282800 {
+      compatible = "marvell,pxa1908-apmu";
+      reg = <0xd4282800 0x400>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/marvell,pxa1908.h b/include/dt-bindings/clock/marvell,pxa1908.h
new file mode 100644
index 0000000000000000000000000000000000000000..fb15b0d0cd4c1cd5760a78ea16a1980cd305ea21
--- /dev/null
+++ b/include/dt-bindings/clock/marvell,pxa1908.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef __DTS_MARVELL_PXA1908_CLOCK_H
+#define __DTS_MARVELL_PXA1908_CLOCK_H
+
+/* plls */
+#define PXA1908_CLK_CLK32		1
+#define PXA1908_CLK_VCTCXO		2
+#define PXA1908_CLK_PLL1_624		3
+#define PXA1908_CLK_PLL1_416		4
+#define PXA1908_CLK_PLL1_499		5
+#define PXA1908_CLK_PLL1_832		6
+#define PXA1908_CLK_PLL1_1248		7
+#define PXA1908_CLK_PLL1_D2		8
+#define PXA1908_CLK_PLL1_D4		9
+#define PXA1908_CLK_PLL1_D8		10
+#define PXA1908_CLK_PLL1_D16		11
+#define PXA1908_CLK_PLL1_D6		12
+#define PXA1908_CLK_PLL1_D12		13
+#define PXA1908_CLK_PLL1_D24		14
+#define PXA1908_CLK_PLL1_D48		15
+#define PXA1908_CLK_PLL1_D96		16
+#define PXA1908_CLK_PLL1_D13		17
+#define PXA1908_CLK_PLL1_32		18
+#define PXA1908_CLK_PLL1_208		19
+#define PXA1908_CLK_PLL1_117		20
+#define PXA1908_CLK_PLL1_416_GATE	21
+#define PXA1908_CLK_PLL1_624_GATE	22
+#define PXA1908_CLK_PLL1_832_GATE	23
+#define PXA1908_CLK_PLL1_1248_GATE	24
+#define PXA1908_CLK_PLL1_D2_GATE	25
+#define PXA1908_CLK_PLL1_499_EN		26
+#define PXA1908_CLK_PLL2VCO		27
+#define PXA1908_CLK_PLL2		28
+#define PXA1908_CLK_PLL2P		29
+#define PXA1908_CLK_PLL2VCODIV3		30
+#define PXA1908_CLK_PLL3VCO		31
+#define PXA1908_CLK_PLL3		32
+#define PXA1908_CLK_PLL3P		33
+#define PXA1908_CLK_PLL3VCODIV3		34
+#define PXA1908_CLK_PLL4VCO		35
+#define PXA1908_CLK_PLL4		36
+#define PXA1908_CLK_PLL4P		37
+#define PXA1908_CLK_PLL4VCODIV3		38
+
+/* apb (apbc) peripherals */
+#define PXA1908_CLK_UART0		1
+#define PXA1908_CLK_UART1		2
+#define PXA1908_CLK_GPIO		3
+#define PXA1908_CLK_PWM0		4
+#define PXA1908_CLK_PWM1		5
+#define PXA1908_CLK_PWM2		6
+#define PXA1908_CLK_PWM3		7
+#define PXA1908_CLK_SSP0		8
+#define PXA1908_CLK_SSP1		9
+#define PXA1908_CLK_IPC_RST		10
+#define PXA1908_CLK_RTC			11
+#define PXA1908_CLK_TWSI0		12
+#define PXA1908_CLK_KPC			13
+#define PXA1908_CLK_SWJTAG		14
+#define PXA1908_CLK_SSP2		15
+#define PXA1908_CLK_TWSI1		16
+#define PXA1908_CLK_THERMAL		17
+#define PXA1908_CLK_TWSI3		18
+
+/* apb (apbcp) peripherals */
+#define PXA1908_CLK_UART2		1
+#define PXA1908_CLK_TWSI2		2
+#define PXA1908_CLK_AICER		3
+
+/* axi (apmu) peripherals */
+#define PXA1908_CLK_CCIC1		1
+#define PXA1908_CLK_ISP			2
+#define PXA1908_CLK_DSI1		3
+#define PXA1908_CLK_DISP1		4
+#define PXA1908_CLK_CCIC0		5
+#define PXA1908_CLK_SDH0		6
+#define PXA1908_CLK_SDH1		7
+#define PXA1908_CLK_USB			8
+#define PXA1908_CLK_NF			9
+#define PXA1908_CLK_CORE_DEBUG		10
+#define PXA1908_CLK_VPU			11
+#define PXA1908_CLK_GC			12
+#define PXA1908_CLK_SDH2		13
+#define PXA1908_CLK_GC2D		14
+#define PXA1908_CLK_TRACE		15
+#define PXA1908_CLK_DVC_DFC_DEBUG	16
+
+#endif

-- 
2.47.0



