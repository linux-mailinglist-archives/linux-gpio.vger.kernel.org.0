Return-Path: <linux-gpio+bounces-18392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B48A7ED2C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2814C445939
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E332580F6;
	Mon,  7 Apr 2025 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAApnhPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891492571AB;
	Mon,  7 Apr 2025 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053414; cv=none; b=ZqmMYRpL60iRQKsGyWxB9YAqpQL3Fre5NdCRjvljJw309U9RrZd15vHfdnpwKGVxbrRLvFX4TOu1AwmhqZL9qjKrs0/OpabI+wAHXfXPaTNxxMoeMZpOleYWR/uurejUdeTtnAECKpeOWyPqsvW0rtzCi0L7vCMllMJ1c6KbUA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053414; c=relaxed/simple;
	bh=3kF9HNUGHBq5y/0THwRRkPCIqfjmzumpVHibDJmTqwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgeSTMCJIFm7uRX6uEvC/YY70VRAgpkarxSE7lfkEMvdwwHCpI6x4d2SG5rx2nX5hRiDFFnL6AEHL1v+KP9BblDzWYA/oUHNUx7441BUK+xN8f2oiFYnz0ujK2gO1uqYdW87XVxW1/uuzfsPgi/iWAwq5d0cVQomOUED6Q/KTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAApnhPD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2980677f8f.3;
        Mon, 07 Apr 2025 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053411; x=1744658211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugu1kcSjIPk0uZLfh/XqUv//0/H2ltkr1wXvDjZNZHc=;
        b=fAApnhPDdTU0efxi8JgDDsSv3ViqMz93W6nkl8DxEm6Dg4IYwhCLnGeVGpjHQnc52O
         UJa19C4kg/C6TW2fwcGZ2DaOHeV9Se4HZlnN4+NAxhwY6lhDuNuT3OvqPak6lc+leIDG
         2BnPF91lLTHszuPELiMrZ/8giaw4cqKCCNVFXN2ehmbL12mJcOQAQRHTL6OIMWDTeY0+
         l0+JrzMO2r7qtknY/OLv5o6h8T+LdrAbLTBQ9v1A7+DRmeaKvvZnKMHjjeT8Jpc53255
         7fjLkniMfZsYMARYwMwxceM6E3JP/OO92sUf+IHyXYYaneGXuzzDh7SD1qAyGvA/LbuV
         ZZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053411; x=1744658211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugu1kcSjIPk0uZLfh/XqUv//0/H2ltkr1wXvDjZNZHc=;
        b=ETPGathwkKv/l6v05qRZiUvsCT+bacPW3Jau3ZiYGld5M8fY0eu8cNXyW1YKBt22Cv
         cPImb99atPyAwdnVwcLw3Nt8nGK8qnd5UZReYjx1+ntSjQtwz9NNpvYoz8rFwr47FFfZ
         Qb70mXxlYPaqUNZ9jXBeiOyBy23OPi+ZGWlvdiZog5bFjQJl/Yyw5ZaVmETcdfyo5fIN
         C1WislGdrTSE2pCyNrKhRPyILYNfDKL3Jg+uIFN8ZFKST9rSn9FvZHtzWiFXauUQJUqZ
         VO8vBdRo1OHl9tw5GUidaGPqKuPpjZYlnvraemB1iQzavaj/loQajA2siqv1/kF6BtcQ
         Qrig==
X-Forwarded-Encrypted: i=1; AJvYcCU13/phH9du2U3q77H4rm26M7bj+GQqLe4SSR69/f0A1ub7pJk1p9JfdRMJnwEILwAIl4OnNpwyQWXRftI6@vger.kernel.org, AJvYcCUkX4quxoeVeg89vKH22c/CBse0mFdeG6Xfn37RkiXBdFWjHHZ3R7cDv2A8HzQavufWnK5Cg5P2E2jJag==@vger.kernel.org, AJvYcCUlxTOPA48bkTz3bUwtb5QOdcMatMzHcKZ0kQc8QIvz79nQZl4JDeanVv2Edk868NdA8MgD69BaqKIq@vger.kernel.org, AJvYcCV+4OIQvarUvH1m5R9TzZMLlzo1MRSfHn//uNXPqYBpbtu/Clit5LeaSMIxKruUuYCYH5vRt4A1FjuiFLTJ@vger.kernel.org, AJvYcCVQRmL3VVyzr0uw+JZQQZTtSxoAvseK8GgGF+fOhw8VHG9kxta8Ads0MLYWfQxeE1+gFS9CtaBV7SwV@vger.kernel.org
X-Gm-Message-State: AOJu0YxoW9vpe2oBdvy5TfnzZz3XlMc0OADuxeKubhFaLwY2TPhv+mla
	oa/P0iVQYeRmpBewClCDI/GwJ6pJs160G3CnwPUjlKQJHz/Zo5ld
X-Gm-Gg: ASbGnctMyb8xgyJEflc71VOe/kJQtZZbC7+/dMhV9+aXaPw+0c5Bj87M1wSv3+FtVEU
	MoqHfl43n/4NlBwvhXLiZtBs9BiBzNhLGGW8JP8GpJSzRgWwfH6wWTE5iU4/03QCpi/DXrfbkoj
	ZuJtJFZezWSMZvmG8vL/jG5eE4EadiDul/VeEC1S2PByJhLcMw1rToHd4mWbhqAsx9iJhLT/AL2
	8zZ1mo3sF59ZTXMDm4JkrNEws0UOofILm3zvhiQWCuOaVxcB8nvtTWdDDSOEIEiuLHJ/I9s40jh
	cypPe4lmN70s4P4UDjaL9Q2ffRsulTCBos8SzYJHzRQ1JjH14G23vwfHjzOCvcMlKELqpA==
X-Google-Smtp-Source: AGHT+IECsKa0uQVHtkUoa0q928rVwvGFirid86CzysMQzlGg22ejX+jonPprol1HieihHYIwUrY/Ig==
X-Received: by 2002:a05:6000:40dc:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-39cb35a87cemr11319212f8f.30.1744053410935;
        Mon, 07 Apr 2025 12:16:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:50 -0700 (PDT)
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
Subject: [PATCH v2 08/12] clk: renesas: rzv2h: Add support for RZ/V2N SoC
Date: Mon,  7 Apr 2025 20:16:24 +0100
Message-ID: <20250407191628.323613-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The clock structure for RZ/V2N is almost identical to RZ/V2H(P) SoC
with less IP blocks compared to RZ/V2H(P). For eg: CRU2/3 are present
only on the RZ/V2H(P) SoC.

Add minimal clock and reset entries required to boot the Renesas
RZ/V2N EVK and binds it with the RZ/V2H CPG family driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes in the code.
---
 drivers/clk/renesas/Kconfig         |   5 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g056-cpg.c | 152 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |   6 ++
 drivers/clk/renesas/rzv2h-cpg.h     |   1 +
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 3f9c4deb4c25..45f9ae5b6ef1 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -41,6 +41,7 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
+	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_R9A09G077 if ARCH_R9A09G077
 	select CLK_SH73A0 if ARCH_SH73A0
@@ -200,6 +201,10 @@ config CLK_R9A09G047
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
index 3989515dfec3..59e1a4489d18 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
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
index 37fca3b6bde7..59df9a56c22b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1369,6 +1369,12 @@ static const struct of_device_id rzv2h_cpg_match[] = {
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
index d0678ff1c7cb..50e09fd6bbf6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -339,6 +339,7 @@ struct rzv2h_cpg_info {
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
+extern const struct rzv2h_cpg_info r9a09g056_cpg_info;
 extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
 
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.49.0


