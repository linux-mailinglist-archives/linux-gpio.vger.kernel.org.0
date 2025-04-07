Return-Path: <linux-gpio+bounces-18388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0928A7ED79
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2953AB0E3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B9C2571C3;
	Mon,  7 Apr 2025 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOdQGUN+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F625334C;
	Mon,  7 Apr 2025 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053410; cv=none; b=iDuylVtY7V9ffrKIDEBWOAXRCJVxguZq0xAw1huwy97viGiMWUzOeoBKkiLaLwMsnWw19x/gjRfYJdZLJaidKNX/RkAqEJG4ScwDSD4d6zYe8tHyu/l8qca9z0/AlAtVQBAzh5qXJnqp1L1RhfC4ATBUB0kN4NR+Jy5GcHSnqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053410; c=relaxed/simple;
	bh=0B+1TewgmCWcrjnySW5/tZ42pXQm99cbWQWHYOy44Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlB17g7qyyqqiKzrfqzAhl4gJ4RDaM31R0j0JAsMPtVHZEf3uB8FUz3C5S1l0HHyC8tPafqDB14afBrN9tLQGGofor74TvLfmIlAPVabY2ifJmThcVaTO9jXKfra6kD6IDkZ3sLt3He+Og2l79MJKK+7sDV8rjrordK7DWDoKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOdQGUN+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2748322f8f.0;
        Mon, 07 Apr 2025 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053406; x=1744658206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1wJLCnm36VsIVOA9xaUtxp2j0FApHjt2X+/AAbbO7s=;
        b=ZOdQGUN+mmzTC/X49AvD10JMv8AtMQWFwalQ203gW+2sJ60IKI4ZzlX1t52bcV5r9E
         vvRZKBYbVsHCB12tlpVjlkRKUP4k5RgLVQUGTyeu7zsSgzM4/DLsHVu/9eaziF+6tHd+
         PrgoxI6FKe01EE1zoFft9RoV/dJi390M+OqNVn5HNpyDm9YA0Yr9LUEOF0wXnqSJLfX3
         8LMb2KdWabzz8JHncMbmrAohiRh2fnae38PxVYrCWWglfdcX72/R1t09eVq1Ri5cmXAv
         UfKKryC45v1QmSeIoWkaudOiZJ6KZSFT2M4IgHzpmJstiuiJ+V2WykQyW5XYbvTelTzU
         Aa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053406; x=1744658206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1wJLCnm36VsIVOA9xaUtxp2j0FApHjt2X+/AAbbO7s=;
        b=r5qKRth+yDDkzp8FQaT+zr4ubLjUZySEgp66ricDz2XIevCjkS7Z7Aj2rPHklbv7zW
         HSHWHxtENeLOAslxUb8OrqXckcv5E6cNH66aGqohQRlyCrXDhmNjdb2gY9lfLf59WKG9
         shG27/VE9YL0bwDjQnRB+Os8qxurTl9y/i5M0/42uFu4dzX3F7HvTIoHBBJQD/R1se/o
         Gw9ORYbMUncRU+P95e44qrFVKvgiV3hcYNVVqEMYGpot7Q2Y14wxQEmlheDwatpYVb8b
         iMIQdEjLERLUl2A+U7U7lnEBWX4DMNDERENvwW2ii/1LRByNYhdizi9LMuaKYcMgiz/q
         lqkg==
X-Forwarded-Encrypted: i=1; AJvYcCW83qQo8vfu40KnpdP+V08cAtlhaWYbmtePpL+/+rJcgADP0A0JzjXFwAZn0pI2kXv1mBQiyUKDpKkW@vger.kernel.org, AJvYcCWG+GHEYJMfmeX/aXpcRmIXHfrATeXCkSIV8iHEDCdS2qymSvQS21cPLSpYe8OKkhqJeWbriFDNcnUm@vger.kernel.org, AJvYcCWSgrcRdulh7QnZklFoCgi+84ClpyTlmLC7JqtvUnG0cWH0qBx9o0s1dPE+BCN8MxxWstr7LrV3lmXDiG72@vger.kernel.org, AJvYcCWXTbtXyzCN4WrSwfqdcxjUbVt/kjGSsq2sbjPljB1HSHsdrJ9F0ItgXuBNnkn80mtnPX1opKu2UQLbanuq@vger.kernel.org, AJvYcCWmp0zH45+bbXdgGND0oviLThbRaEXwzLEXloKh9sSJhxmAefg7V1XoFVxv7ptFetZfBaQj+DBri9A0ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyortkh1UbjbDhjChG033xqhdu31Api23PI9bf1wT8U+dH5lj5B
	b2yX6DWJHTIYhQn7D37cMThBw+1CN/MdrPDSFAd9L8v17QLkVu9E
X-Gm-Gg: ASbGncvm5/soCan2aOc11btDq44LWtll5ouj4hvhDYSPpYWYb5/HmSYHTbtLx6kpmyS
	mmy9Iniqj9we1hBMxLCE40po2bKkfNq12sO3dY8yMKsAf5UR/hLQr0JE7B6xkHMbn3ryAfcuaJB
	hBllXDmuVgrqxn934ESqjKb72jXkv20/XcwxNf8UyeU7AstYocWKSjIQBromMudL4XlyihOVOzM
	ZJSWyuMzjZN8WHrBWIJLmL9pRnIaTpkTFuaZ3lOvFAwu5gCI18nMAI5tmWBY8r0lFGfJ4wu0nA1
	3WCDkYwIM6duFwAoFh4/C/n7rI1l7Eof9BRR0EbPR4VwxGEYTuigeYwvAqvxkSVgXOrKxw==
X-Google-Smtp-Source: AGHT+IGM8Bd0+0meyyXaYi77kS+CgmgEFkuIXLXRWxW6kMoT6cOlwVvlt3zfWZnOhWRuzEEAdTG5wQ==
X-Received: by 2002:a5d:648d:0:b0:392:c64:9aef with SMTP id ffacd0b85a97d-39cb3596df3mr11592311f8f.20.1744053406215;
        Mon, 07 Apr 2025 12:16:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:45 -0700 (PDT)
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
Subject: [PATCH v2 04/12] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
Date: Mon,  7 Apr 2025 20:16:20 +0100
Message-ID: <20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add SoC identification for the RZ/V2N SoC using the System Controller
(SYS) block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes in the code.
---
 drivers/soc/renesas/Kconfig         |   5 ++
 drivers/soc/renesas/Makefile        |   1 +
 drivers/soc/renesas/r9a09g056-sys.c | 107 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |   3 +
 drivers/soc/renesas/rz-sysc.h       |   1 +
 5 files changed, 117 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3fa5ed36d20b..7f4b4088a14e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -396,6 +396,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for RZ/V2N"
 	default y if ARCH_RENESAS
+	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
 
@@ -451,6 +452,10 @@ config SYS_R9A09G047
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


