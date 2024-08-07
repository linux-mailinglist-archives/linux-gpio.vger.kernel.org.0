Return-Path: <linux-gpio+bounces-8605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED294A2DB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 209CB1C236ED
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA91D0DF4;
	Wed,  7 Aug 2024 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ4uwEnu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CF1CCB51;
	Wed,  7 Aug 2024 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019339; cv=none; b=ef3UGzw+ANUjdFCVFbLPARhlcBh1MBPH18a68qJd+jTQTJXGXNQ+k+bUueVcG5WOECPkaIg2TepEVUhcRAStzjPdWwt4eLNoAHMg8SZiw+SguyQAApFeSxPjH01WuD9+wW/ZhzdWUekcskTrxSIClMQVGYjdM454Qynq/ea0Leo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019339; c=relaxed/simple;
	bh=dkEfGvx0TTEqBalC1ZNEJShPvZi8jIOWo+9ZCs2OGpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ifkjvgw10DwuicUlDxYVjsq+TgXq/F9cAbBf/ZYaxa9S8NC1PzTlXl/v0TnyBrQZYRnhZer1cAP7pcajEiTxDMdbYcswOrGJA4kxo3LA2BKc1vcd/XquQ5prxFnVpy+yD1Ukz/S0e/l72nqJ/ucunRoi3FNPOaI3cbaNM3yv2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ4uwEnu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f1870c355cso16095111fa.1;
        Wed, 07 Aug 2024 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019336; x=1723624136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wov9QVyzDiIiezxCcBBKSZiN0jg16OibX2RU6GJmFTU=;
        b=JQ4uwEnuxLg88CUGI+1CYASShicz60ZZOabO7mmCpEZSZV1CVn6xUQSElseiw3Ujow
         VjKg23upYG4O5lhEYeR07RJDpadLXBRNEJN6JMLIUsS7O7LnlHvCGZK2OjCCEv6zdpVV
         ImdyJfDWGIcM4DI9bBcv7BoehOZVYY/RsMnERbZVFeRVuu6bsz0kNrWs+uWnwJwoR5pO
         GpNwtB4gSPk20T5fm4Qy0G05miD+BwCObok4ppIpBJaBhJvCPdBR73NnPOLgsVJaSbCj
         qfd5MaK+hySJn8XMIpTKpOPE596QtsfUxD6E8X/V0bm3LxkBXtW4hrYFwyWeRnxgVrfP
         JcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019336; x=1723624136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wov9QVyzDiIiezxCcBBKSZiN0jg16OibX2RU6GJmFTU=;
        b=g5CMgetRm/86AzbvNJbPt0e09vCiBf0HGkxaB3E6sG2Kq+Drb1SMkqHvDnKo6PZ0j+
         MRcP+Py67tT2zH0QfyxmATWAkn1E8XCAzOv/9/J572lyC21kXbO3KPX2hVWy8RKtImSD
         DLfAy8XCQyFSOl/VfwZ+AH4x4PDcCakB1y1Tfg/bjjez+RxP8e7b+rOgKTRw4p3pnbcD
         40uGhjMBfGlPmOM+18g9kk7b8GuIWk16hCuCyVhHbRqLql42JkYud75+jXp1tLgSqWHX
         QCuGWS5aUjou9n4uQgARr5R8pDblGrhrVS3nBDnuwutPtpG9V99XYWbclF1mgmyufoyt
         PP9A==
X-Forwarded-Encrypted: i=1; AJvYcCXAc9ZdlFBcHS5H9C0TJLIKHz6hlcd43sEKdYANX438sPIuGhbUlw2hcttmtHPHc86qsYgj4P4xmVgFdynDfGMBtDPFjMjrcOtHKAlKiINs7mxLZ91JX3l7Eqisr3YVIDxlh8O4hj752wIZe7KYWoemh+NwcudX7itl1vpOH+h1G6FGsTs=
X-Gm-Message-State: AOJu0YysCFc+T2rwOocOJAiSMWh+humCcQWTRzqQTj2f050r4lBW8g/a
	A6KxEa2kalQjgmXcRCTCyvHs5Xj2PEgBgc8cWoeXPfM0S2mm+k1X
X-Google-Smtp-Source: AGHT+IETGlf7wSCQIAznOgJ2L5DcGAzB+uRE6FuZrqysRB+Xjh01N4uSZThrfUV5jw3N1Uxf6tjKOQ==
X-Received: by 2002:a2e:9cc4:0:b0:2ef:2504:22d8 with SMTP id 38308e7fff4ca-2f15ab5e795mr111555341fa.48.1723019335710;
        Wed, 07 Aug 2024 01:28:55 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:55 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
Date: Wed,  7 Aug 2024 11:28:37 +0300
Message-Id: <20240807082843.352937-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add support for the pin-controller found on the Exynos8895 SoC
used in Samsung Galaxy S8 and S8 Plus phones.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 137 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 150 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5480e0884..0d5d14cf0 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -58,6 +58,15 @@ static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
 };
 
+/*
+ * Bank type for non-alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
+ */
+static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
+	.fld_width = { 4, 1, 2, 3, 2, 2, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
@@ -866,6 +875,134 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
 	.num_ctrl	= ARRAY_SIZE(exynosautov920_pin_ctrl),
 };
 
+/* pin banks of exynos8895 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
+	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
+	EXYNOS_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
+	EXYNOS_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
+	EXYNOS_PIN_BANK_EINTW(8, 0x080, "gpa3", 0x0c),
+	EXYNOS_PIN_BANK_EINTW(7, 0x0A0, "gpa4", 0x24),
+};
+
+/* pin banks of exynos8895 pin-controller 1 (ABOX) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gph0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(7, 0x020, "gph1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(4, 0x040, "gph3", 0x08),
+};
+
+/* pin banks of exynos8895 pin-controller 2 (VTS) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gph2", 0x00),
+};
+
+/* pin banks of exynos8895 pin-controller 3 (FSYS0) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __initconst = {
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpi0", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi1", 0x04),
+};
+
+/* pin banks of exynos8895 pin-controller 4 (FSYS1) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpj1", 0x00),
+	EXYNOS_PIN_BANK_EINTG(7, 0x020, "gpj0", 0x04),
+};
+
+/* pin banks of exynos8895 pin-controller 5 (BUSC) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(2, 0x000, "gpb2", 0x00),
+};
+
+/* pin banks of exynos8895 pin-controller 6 (PERIC0) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpd0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpd1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(4, 0x040, "gpd2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpd3", 0x0C),
+	EXYNOS_PIN_BANK_EINTG(4, 0x080, "gpb1", 0x10),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpe7", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpf1", 0x18),
+};
+
+/* pin banks of exynos8895 pin-controller 7 (PERIC1) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
+	EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpk0", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpe5", 0x18),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
+	EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
+	EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
+	EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
+	EXYNOS_PIN_BANK_EINTG(2, 0x1A0, "gpg0", 0x34),
+};
+
+static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos8895_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 ABOX data */
+		.pin_banks	= exynos8895_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks1),
+	}, {
+		/* pin-controller instance 2 VTS data */
+		.pin_banks	= exynos8895_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 3 FSYS0 data */
+		.pin_banks	= exynos8895_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 FSYS1 data */
+		.pin_banks	= exynos8895_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 BUSC data */
+		.pin_banks	= exynos8895_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 PERIC0 data */
+		.pin_banks	= exynos8895_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 PERIC1 data */
+		.pin_banks	= exynos8895_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos8895_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos8895_of_data __initconst = {
+	.ctrl		= exynos8895_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos8895_pin_ctrl),
+};
+
 /*
  * Pinctrl driver data for Tesla FSD SoC. FSD SoC includes three
  * gpio/pin-mux/pinconfig controllers.
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 305cb1d31..7b7ff7ffe 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -141,6 +141,16 @@
 		.name		= id				\
 	}
 
+#define EXYNOS8895_PIN_BANK_EINTG(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos8895_bank_type_off,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_GPIO,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
 #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pend_offs)	\
 	{							\
 		.type			= &exynos850_bank_type_off,	\
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5..ea3214897 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1409,6 +1409,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynos8895-pinctrl",
+		.data = &exynos8895_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
 		.data = &exynosautov9_of_data },
 	{ .compatible = "samsung,exynosautov920-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index d50ba6f07..f18877f2f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -363,6 +363,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
-- 
2.34.1


