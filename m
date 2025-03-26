Return-Path: <linux-gpio+bounces-18016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E83A71920
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315E23A804C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFA71FAC57;
	Wed, 26 Mar 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs6VsrTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020E1F3BB4;
	Wed, 26 Mar 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000014; cv=none; b=MW+FuABdOV7+3S7ymzBow1ci8phNrF4ubx162aVOUNcnXYN1OajH7Pk8GXiSZYp8GpIDmdMlPcniMPluCVG2z0HzFYofq39kCyQY4NnvkglEKfXCRVR4i+xvQCsr2BNcbZV0kfumLISPZMug8RKnPNr2xQMtM1mACUs4TV7Z3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000014; c=relaxed/simple;
	bh=CrSZzbNupfiCxBmSg0vAgeWQUShwmv4joaP4OfGWSHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeRaD6jEsRbPBAQ3pnNQFYNTt/c4dxNdbrgLXVV2qzGw5GFuFoMxgWF2QDM9lHainMqOkYfCUwbdTI7SvvdBa5elHXgd1/pVkpaRDAGyqIy4wT2LbVBlGlbbBGXH5QKpexzTvER7Nyw5I0bCpN+CFBxz1AKQis2hMlFfFX9zwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs6VsrTP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so3885372f8f.2;
        Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000010; x=1743604810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUzZZKdRA/nrtwrVMsRSl600s/LtFe+i4gqc1g40AFI=;
        b=bs6VsrTP0dXbZ2PaV3Tj+KTvuOZjUUcObQbpRrOUuXIOErDSFnR4DUZUo45gXJ3I3+
         q0HZuoBhhCBtw1ZGAJGRyg/F4y0lD2StpmuhA2wNSstM8rJsZNZOMY2A/rL/nyXRmzHH
         WvpBVnsav89DsJ7vCaKjSphw+Sb8DO3iDHrfIvEK/XJlOfJOzUF+LL9lqgLojD46Kef1
         Xzy/pWSED4VkbjMZwdt64RWbDwoXqlz7AWOUrGHFcu3wmZgWhRrt1kHFJ2nK7e8Uu3gY
         7XVbNAj4jOMU3yjbtXR3Aeo3TpPpbgy6ABrLsYxvBVpJ01ZHND7pdVchref12XrVGVaY
         kHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000010; x=1743604810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUzZZKdRA/nrtwrVMsRSl600s/LtFe+i4gqc1g40AFI=;
        b=q+kaLIpfyqWah8Zm9a6khl/OohJWkFFwL4sOn1ikxDKCU9BxFgCVEUfI3fpMYf9m/A
         +Q4gVAopCtuDrwmRbDXI74w5FT6eSaA8NyenqwpCmjw13ve2omYTFlzNRueTxw2wCMhT
         S9ojncWsJtWpN2FNO50SPUCHjXQRvijaBvyvSy2Wl3DPuJ+wcxD0QyCi5rH8BhYLnR5d
         a9JLw7zu7FEdgBboPIarO1m8SsqUAK3OxLkFIu3vM6iL5eQM46789CI5ntfihI1oQ4Hp
         2joJt0utJtwxvCHxiCzKFgF9aRbmjjZoQNBdwljTINgUMa1hjgzyJsw2S1clb6u8c0xn
         AWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJU0zokb4dKweppXCJ2stGu3oyhQCakorIMiEMko1R45Hmnf5iSeptVIcFRxSgG0gYvLl8xzYUcx4@vger.kernel.org, AJvYcCUgpocFkzvtPpeEWsc3cZKJuV54vtwh0FaWdOSAVEEKJ2IMrZSqgex0J8h8a9xGZDmp+SZajvsonvab3Q==@vger.kernel.org, AJvYcCUl3tysNYaGx7x0HpKK61A2YVQbZxIxZeg8d3PvFQKqtt+a2+3FZF50m8FJyJVhkjG7oME7ZlWWToEOT4Gw@vger.kernel.org, AJvYcCV3qx8O39SdGCKms3s6dvHnNrbEBP4WmtwvyiXWvWhkA+weTtOCjmnYw1Gfu0UmCVzX5xwiMWp6KtaT@vger.kernel.org, AJvYcCVtwH7AeZL/amDR0Lk64Ff8rt1z+tWg4L3SLBPJ9EMo9ehkwM84NxsQApuHoN15UMEtPq2WsqBEI/uh@vger.kernel.org, AJvYcCWPJOoJX6f/zOWteXMQepOz55jc+Y+rHj4po7zPLFLPgj+I4U1woJUox5W/uKLePtedpEYI+/pNGdWxTy7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/fT+NXr32rl+bhelOTCsXK1AFPPyxluX81oc7qDIOJi8/p8m
	3kscamr/hE/sIgjzOMvvDB0x+D+Ukfipkwm30GLzV4LWrNQ7Hjwl
X-Gm-Gg: ASbGncvg833qlsHlL1TfqjPFoQb151b4wDNAsRO3yn8JfloSthdF7+xIPf/hbyScpc+
	D89TTVIlv2jewOnUftvAdAcxzACcdO2V+40tzJDfvNnL3hveVDCcOM238Aa8BSlYdid7AARjxVw
	015da1kY2gH1Gvc+h0nVQMAtuuwHYCg1FBle+tgUwtI4hcqwFD+RrWRO7IRhXvivV+4jzQbUGv5
	7MWfUPjAXa+zkbr7ZlGfMB7FK3T6WVrfjLXcM2hhlKj6lwsVlbCVaQqKWR1CHmQPldPrkMZuLnU
	lAUKo3PmGzf5rE1BRqUX6vsmG/5yzDL8lI8IhH3+XeX/4MrIkFKcvuNL5drNZ2GtV+1r
X-Google-Smtp-Source: AGHT+IFEK+jlhPNvUrwlDVkGSbJqrzn40ggqtTSLr7IlAExJnoyHZvyqsCwFub0v2F1dz21J46ontg==
X-Received: by 2002:a05:6000:2cd:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-3997f92d09bmr17718923f8f.42.1743000010107;
        Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:09 -0700 (PDT)
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
Subject: [PATCH 10/15] clk: renesas: rzv2h: Add support for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:40 +0000
Message-ID: <20250326143945.82142-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The clock structure for RZ/V2N is almost identical to RZ/V2H(P) SoC
with less IP blocks compared to RZ/V2H(P). For eg: CRU2/3 are present
only on the RZ/V2H(P) SoC.

Add minimal clock and reset entries required to boot the Renesas
RZ/V2N EVK and binds it with the RZ/V2H CPG family driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig         |   5 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c | 152 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |   6 ++
 drivers/clk/renesas/rzv2h-cpg.h     |   1 +
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5a4bc3f94d49..50c20119d12a 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -41,6 +41,7 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
+	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_SH73A0 if ARCH_SH73A0
 
@@ -199,6 +200,10 @@ config CLK_R9A09G047
        bool "RZ/G3E clock support" if COMPILE_TEST
        select CLK_RZV2H
 
+config CLK_R9A09G056
+       bool "RZ/V2N clock support" if COMPILE_TEST
+       select CLK_RZV2H
+
 config CLK_R9A09G057
        bool "RZ/V2H(P) clock support" if COMPILE_TEST
        select CLK_RZV2H
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 2d6e746939c4..f9075bca6e95 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
+obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
new file mode 100644
index 000000000000..e2712a25c43a
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2N CPG driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/renesas,r9a09g056-cpg.h>
+
+#include "rzv2h-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G056_GBETH_1_CLK_PTP_REF_I,
+
+	/* External Input Clocks */
+	CLK_AUDIO_EXTAL,
+	CLK_RTXIN,
+	CLK_QEXTAL,
+
+	/* PLL Clocks */
+	CLK_PLLCM33,
+	CLK_PLLCLN,
+	CLK_PLLDTY,
+	CLK_PLLCA55,
+
+	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV16,
+	CLK_PLLCLN_DIV2,
+	CLK_PLLCLN_DIV8,
+	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV4,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
+static const struct clk_div_table dtable_2_64[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{4, 64},
+	{0, 0},
+};
+
+static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
+	DEF_INPUT("rtxin", CLK_RTXIN),
+	DEF_INPUT("qextal", CLK_QEXTAL),
+
+	/* PLL Clocks */
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
+	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
+
+	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+
+	/* Core Clocks */
+	DEF_FIXED("sys_0_pclk", R9A09G056_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_DDIV("ca55_0_coreclk0", R9A09G056_CA55_0_CORE_CLK0, CLK_PLLCA55,
+		 CDDIV1_DIVCTL0, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk1", R9A09G056_CA55_0_CORE_CLK1, CLK_PLLCA55,
+		 CDDIV1_DIVCTL1, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk2", R9A09G056_CA55_0_CORE_CLK2, CLK_PLLCA55,
+		 CDDIV1_DIVCTL2, dtable_1_8),
+	DEF_DDIV("ca55_0_coreclk3", R9A09G056_CA55_0_CORE_CLK3, CLK_PLLCA55,
+		 CDDIV1_DIVCTL3, dtable_1_8),
+	DEF_FIXED("iotop_0_shclk", R9A09G056_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+};
+
+static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
+	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
+						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
+						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6,
+						BUS_MSTOP(8, BIT(2))),
+	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10,
+						BUS_MSTOP(8, BIT(3))),
+	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13,
+						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
+						BUS_MSTOP(8, BIT(4))),
+};
+
+static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
+	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
+	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
+	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+};
+
+const struct rzv2h_cpg_info r9a09g056_cpg_info __initconst = {
+	/* Core Clocks */
+	.core_clks = r9a09g056_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g056_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g056_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g056_mod_clks),
+	.num_hw_mod_clks = 25 * 16,
+
+	/* Resets */
+	.resets = r9a09g056_resets,
+	.num_resets = ARRAY_SIZE(r9a09g056_resets),
+
+	.num_mstop_bits = 192,
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 88ab26a077ae..34a3145d72eb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1373,6 +1373,12 @@ static const struct of_device_id rzv2h_cpg_match[] = {
 		.data = &r9a09g047_cpg_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R9A09G056
+	{
+		.compatible = "renesas,r9a09g056-cpg",
+		.data = &r9a09g056_cpg_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R9A09G057
 	{
 		.compatible = "renesas,r9a09g057-cpg",
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index a7aa1da181e5..8a2466f10deb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -326,6 +326,7 @@ struct rzv2h_cpg_info {
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
+extern const struct rzv2h_cpg_info r9a09g056_cpg_info;
 extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
 
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.49.0


