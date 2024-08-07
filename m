Return-Path: <linux-gpio+bounces-8617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1872E94A3AB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986291F22E7F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ABD1C9ED8;
	Wed,  7 Aug 2024 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFo/f+qr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF891D1741;
	Wed,  7 Aug 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021762; cv=none; b=cjyqB3p/nn3sonYg5zRpnuSx60sd1G0zShIjrYKeW1SbJP4WThahExxz0slJckxh0taydqjoDeM2mh8NMgFDhrNHVW3chVoedInEMwZNZ85+atZoPrZI4JDi02j8WZR4KV6lVdJentknpcGCdXj9e/AMl6xi0fg74RqkBfpKd6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021762; c=relaxed/simple;
	bh=Ps/ngxPdD2E1caQw1B5fJzSUmchuUrFlYrEy/iKWhbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AGp9iY3Ka5SINmS/+pTU15/LCs2gFDHOmiXPmjJ3+ABbBNow5Z4wg5bvFAdh5VQnOWusN53BQnl0h886f8eoJOLG70inxTde2wklbJ7iRUwYAIxfYL02uJTP+niGUZNQo95IZKWS55sE0gf0I30e5Mpi82Vwaqt3XdwPwkJOqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFo/f+qr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280bca3960so11210635e9.3;
        Wed, 07 Aug 2024 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021759; x=1723626559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpOR1yEEo9T7o54nBi7OPU1qWueiNJ1G/1IxzwZ9XpM=;
        b=jFo/f+qrG87cA1VurtALFDfTM1kQ/R39+o/fKER0mkuyry9vVx4MA+4p4OpzEpvgjt
         BnBb4sk39pMHoBGV1vFFAv6GXIy9FP9xI8nvji1InOt1CYLFtTXrGjxBuPwvtrJckl3x
         LsNdWo+JQVVzYZiYmdH47SIOJDISf3YorTTPO7ebxZDB0/nfZcnz4g4KFAt4FPb72sCr
         ICGDfr/NTRC+ii02Qp5ncbqk3EL3yuPiFp1jRpG2eEoRSnM5/FcBo/k9ff+hdE7QQtLK
         L5hQPvVdm/1JxcBzWjwheG+QYPgysoPb4iI6l7I9IUuLzW+15lB4VH0bkPWcBl0UextO
         V42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021759; x=1723626559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpOR1yEEo9T7o54nBi7OPU1qWueiNJ1G/1IxzwZ9XpM=;
        b=FtrkGRq8MzpSmnzrbQIkGafbnYO3AFaPMsk8sS4MyoILTt0Qvr5ufbrEgOWXOrHczM
         qefk+Kul3dwzV7tMG3C4sZoGQYnQeUsd1juLj5ZNm07+q2ybZTyoOCm8wYUMFJQzFGHq
         ojfLz/nHfHtGC7s1u72opkYgotw/cuTBwnIb07dFgHVfhyXgRhfMEAR9+giofeOpWYul
         xAmFDMUhmwFSMXC4olgZqGObR6JjeMoqzSMC+53gcLhfufJrteGVXHGc15dOSKzRXkG/
         5fV8PsPCgL4k1DmLU37NzFBJGhjVzKrjIgDLC8uneFui/GSZR1Or9DXn0rU3rUq/0Sg6
         ZLhg==
X-Forwarded-Encrypted: i=1; AJvYcCWVeICdqf2lMscifIaMli19N4Sb/WCy8dD/EKfscm5KG9Gm4swlg4h87nsy4kRPMlgYMBFOXXcvBohGdWYALNSdP8OdpklCDAs2zuasB47LnlL/puMzeSDwHxl40Kayecs4vA6pWqenul/CWM8Xf+fSaw5RHQBXVYB+/JSeKAKP5jtp8ic=
X-Gm-Message-State: AOJu0Yywv0jFhjL6KrOlviH9Kzf7M3LUZwW5Ai133MTWPXr5Mq3yr1hp
	x1G3ReHoeZ7rBmfzXVfyGPpWD43YOWx6UgFGHU1SdzbDvcf4FNw7Kzf2BAzp
X-Google-Smtp-Source: AGHT+IHdvsaWIsKEEUFQyYhMi/rV270dr8FZiTkHkxGYyFx2KDA4A3aEB9MQ/k8F7+yep81PfSIyig==
X-Received: by 2002:a05:600c:4e8e:b0:426:6667:5c42 with SMTP id 5b1f17b1804b1-428e6ae27eamr118579485e9.4.1723021758349;
        Wed, 07 Aug 2024 02:09:18 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
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
Subject: [PATCH v2 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
Date: Wed,  7 Aug 2024 12:08:53 +0300
Message-Id: <20240807090858.356366-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


