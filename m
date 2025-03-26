Return-Path: <linux-gpio+bounces-18011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29CBA718DB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 614353BB3DB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D485A1F5824;
	Wed, 26 Mar 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhKVSk+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FAE1F4717;
	Wed, 26 Mar 2025 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000007; cv=none; b=HGYGcPV0KexsbWeGvHHvMKHNBoaaaODh3I/mdBT27H9x8mNzGPSKSCBFLOA/J4NxJyxn9b/D3CCj+rNw4IqUMBb0tA8wLI/eWTtukpli+uzNPa358DdNZMgohjI3eczOJzCubbrBhh0UM5j0Rf3Hm/GFlxZL2wvJfRlAil/i0Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000007; c=relaxed/simple;
	bh=64UwUTIvgWRvZ0CSeWSMSsnXtt77QiNce1FnjnKrh3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdwwY67+u/UPauojZ1IgCJ5IvbmozVDZMq1XXQ5VYfjHOpB0aH5gVsEFT7Q1TpwkP1x2M2PNEb4Qezu1FbyG73zflICyyOcHIj/xETWgnTysIHAJsJg8gy7T2EbLh+nKb7G9LbVT+h65aH5QZ4llPgF+FbL25e0g/RCzOq69lXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhKVSk+T; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso61690075e9.1;
        Wed, 26 Mar 2025 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000004; x=1743604804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfWPxJMZWDbPabK9A0cScyoCsTf6JLaH/ayUOaIY6ps=;
        b=BhKVSk+T8vijt/QOAVfeAPRJVEUduyjroa32sE1lZbpODUjmgGIVvmQQnuMlhQoFMH
         G5DomxxTz3hWLAK7o+Yvd7x4Ili6vh5Wbjvbr6UpjJH23ZhYbT0C9fi2s0DzlYwupIYI
         NL8o/2uUcxUsNbHI2bstUm1qxg4F0kZ7OoGDBHUeZmRGWJm4LlJgcpclpSkLi8gCUy+q
         C8sT7sB07m6LP1iVCOYEaurxpXm0pH0Lww10hH3lmPCIJNp/IGMXJK6RUqwzlBmc9AQ0
         xTl7ZjbzEgC1ekKeI7Q8OPqgt1LxQn4IKdS8AJJV4dcZM2GhWM9Dwm2ueGwitNx7zJRJ
         SRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000004; x=1743604804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfWPxJMZWDbPabK9A0cScyoCsTf6JLaH/ayUOaIY6ps=;
        b=EIZNrvijc2eWCWvCNTtQWRt96SPWl762NPxMtAAo/Az5Ho8SZyi7Ov0n0buEwIzrY/
         32S/qLj7WWW2CJQ7pMUSWr41mG4lOy48YDvD41MlOo7/0l8m4nTcV0qi5AbmHm+tbEgr
         O1YTyFYBWiftb6Ho2pNfClcWNg5PAL7TUutq5LQuKEGl36FroEYaGJdUljBrMN3k5AFR
         l6nBC43A0iTTMxCKXky9Mw/N2lMy/8ZzozxAEKvPVgJ9JwGTgM7ebPFYG/NYmTZ+cB6N
         yIUhtWkqnJNiGZb3PClYgRy1eRB7K2TzXCamOZ652zJiwJFE3ol9TQ+uwHy/ikYefYFZ
         WlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcSQqcavAJvSGSq6KNCqI7YjiDrZ1YQ3URvGQIr3SoyOFXWTIGaiFpYphKZjWRUj/VlgBOfrKNoEtA4xji@vger.kernel.org, AJvYcCV47sGZnZ04vY+GO3bRoMkJtN+2cxvN6MWqGtA72f4M5aAjrQ5iH5Y61ggEfiGmY9bIhZBVZ+FIYKKi@vger.kernel.org, AJvYcCWVxwUbU/u3jPCbvlQF++jbFhJxuoUluj3hM7zGU8QVJFEAsa8C2LUFNzWQQ5PC/mmbNQr5yUxyxIWCGrsb@vger.kernel.org, AJvYcCWcGnmaUK6rp3Mgkg35hjcg2MguF5ac7Qya7pQ+LE26sRRDjAHoPQncTyPe3JZMDU6na1DSX7z1UCJ1xQ==@vger.kernel.org, AJvYcCXLkfpeTs1XS954EUfSpIQ4HOZbcM12wN9F+jWUhe0tuoTjWSC6C8jQRpuO9wBiWSfYbXE0Uj0DYeVs@vger.kernel.org, AJvYcCXLsRtEq3yy7Zwa6aPzkujgOOlHxpDF77SQmXCB5uwr+5Qp/BD/XT2U2/Z+EkTErR3aEZL0PK3CfZVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7wkJdMd4KJ1b6BZ7SebPq6nupBtf3GLrbaAFsb02YUCbXk31
	C/A6qE1po47xDG7aLkyqAmxXG9MURQYbwjhHICl8luIeg5uPnwwz
X-Gm-Gg: ASbGncudRh/iDF4yeNcTm38t1zSE0QgVQSLZvuuSneOR0Dt3Jpu2UYHEqFBaHLXDzX6
	zAi7BQ8Y45c4JyZEj0eFnPcKg3aRFYAs3LYp/VWBr93T8NESeQtO8CAgY0hHmnuDBQKGF2NP52z
	1dSZGs67Vr6mZQVzqVFSJn9aKbtHdZkUmOjcvQogTFpR0fI5p/MZcRannROs/LPYz9QP2ha5cd9
	9VVQYf38Rd0VYMj76wBn+w0+6bwe7OWzJNVkbOnar7kxBcYtU6hl04MRMdAD0KfB1Jj4QbniN76
	5FQI5CisUeqk+F5ClY5b3oGGovyumAwWSupGKzWwAFhBgeCR6oun7VpLQF6vT/rsCr56
X-Google-Smtp-Source: AGHT+IFxPoFiFFzlZQKUvpyfPvY23wqd/3RQqJbo1Eebx/kOv3kRN9xR6Jg2ZqEFXucT15Ok+zJ/zw==
X-Received: by 2002:a05:600c:3d93:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43d58db553amr140420155e9.12.1743000003516;
        Wed, 26 Mar 2025 07:40:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
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
Subject: [PATCH 05/15] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:35 +0000
Message-ID: <20250326143945.82142-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add SoC identification for the RZ/V2N SoC using the System Controller
(SYS) block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig         |   5 ++
 drivers/soc/renesas/Makefile        |   1 +
 drivers/soc/renesas/r9a09g056-sys.c | 107 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |   3 +
 drivers/soc/renesas/rz-sysc.h       |   1 +
 5 files changed, 117 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 764aba6d1ae6..14888db23556 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -354,6 +354,7 @@ config ARCH_R9A09G047
 
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for RZ/V2N"
+	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
 
@@ -402,6 +403,10 @@ config SYS_R9A09G047
 	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYS_R9A09G056
+	bool "Renesas RZ/V2N System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 config SYS_R9A09G057
 	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
 	select SYSC_RZ
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 81d4c5726e4c..3bdcc6a395d5 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
+obj-$(CONFIG_SYS_R9A09G056)	+= r9a09g056-sys.o
 obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
new file mode 100644
index 000000000000..3bea674c785e
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/V2N System controller (SYS) driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/string.h>
+
+#include "rz-sysc.h"
+
+/* Register Offsets */
+#define SYS_LSI_MODE		0x300
+#define SYS_LSI_MODE_SEC_EN	BIT(16)
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+
+#define SYS_LSI_PRR			0x308
+#define SYS_LSI_PRR_GPU_DIS		BIT(0)
+#define SYS_LSI_PRR_ISP_DIS		BIT(4)
+
+#define SYS_RZV2N_FEATURE_G31		BIT(0)
+#define SYS_RZV2N_FEATURE_C55		BIT(1)
+#define SYS_RZV2N_FEATURE_SEC		BIT(2)
+
+static void rzv2n_sys_print_id(struct device *dev,
+			       void __iomem *sysc_base,
+			       struct soc_device_attribute *soc_dev_attr)
+{
+	unsigned int part_number;
+	char features[75] = "";
+	u32 prr_val, mode_val;
+	u8 feature_flags;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check GPU, ISP and Cryptographic configuration */
+	feature_flags = !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_FEATURE_G31 : 0;
+	feature_flags |= !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N_FEATURE_C55 : 0;
+	feature_flags |= (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N_FEATURE_SEC : 0;
+
+	part_number = 41;
+	if (feature_flags & SYS_RZV2N_FEATURE_G31)
+		part_number++;
+	if (feature_flags & SYS_RZV2N_FEATURE_C55)
+		part_number += 2;
+	if (feature_flags & SYS_RZV2N_FEATURE_SEC)
+		part_number += 4;
+
+	if (feature_flags) {
+		unsigned int features_len = sizeof(features);
+
+		strscpy(features, "with ");
+		if (feature_flags & SYS_RZV2N_FEATURE_G31)
+			strlcat(features, "GE3D (Mali-G31)", features_len);
+
+		if (feature_flags == (SYS_RZV2N_FEATURE_G31 |
+				      SYS_RZV2N_FEATURE_C55 |
+				      SYS_RZV2N_FEATURE_SEC))
+			strlcat(features, ", ", features_len);
+		else if ((feature_flags & SYS_RZV2N_FEATURE_G31) &&
+			 (feature_flags & (SYS_RZV2N_FEATURE_C55 | SYS_RZV2N_FEATURE_SEC)))
+			strlcat(features, " and ", features_len);
+
+		if (feature_flags & SYS_RZV2N_FEATURE_SEC)
+			strlcat(features, "Cryptographic engine", features_len);
+
+		if ((feature_flags & SYS_RZV2N_FEATURE_SEC) &&
+		    (feature_flags & SYS_RZV2N_FEATURE_C55))
+			strlcat(features, " and ", features_len);
+
+		if (feature_flags & SYS_RZV2N_FEATURE_C55)
+			strlcat(features, "ISP (Mali-C55)", features_len);
+	}
+	dev_info(dev, "Detected Renesas %s %sn%d Rev %s %s\n", soc_dev_attr->family,
+		 soc_dev_attr->soc_id, part_number, soc_dev_attr->revision, features);
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
+static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initconst = {
+	.family = "RZ/V2N",
+	.id = 0x867d447,
+	.devid_offset = 0x304,
+	.revision_mask = GENMASK(31, 28),
+	.specific_id_mask = GENMASK(27, 0),
+	.print_id = rzv2n_sys_print_id,
+};
+
+const struct rz_sysc_init_data rzv2n_sys_init_data = {
+	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 14db508f669f..ffa65fb4dade 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -88,6 +88,9 @@ static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYS_R9A09G047
 	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
 #endif
+#ifdef CONFIG_SYS_R9A09G056
+	{ .compatible = "renesas,r9a09g056-sys", .data = &rzv2n_sys_init_data },
+#endif
 #ifdef CONFIG_SYS_R9A09G057
 	{ .compatible = "renesas,r9a09g057-sys", .data = &rzv2h_sys_init_data },
 #endif
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index aa83948c5117..56bc047a1bff 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -42,5 +42,6 @@ struct rz_sysc_init_data {
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 extern const struct rz_sysc_init_data rzv2h_sys_init_data;
+extern const struct rz_sysc_init_data rzv2n_sys_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.49.0


