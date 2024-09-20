Return-Path: <linux-gpio+bounces-10323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345E97D7C0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C9E286F51
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F168184533;
	Fri, 20 Sep 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu9Ubp1F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78C1836D5;
	Fri, 20 Sep 2024 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847127; cv=none; b=VFddvUGIVlj3tR8l/fVkCiCRb48tvfCWJzzEKo9G/vz6ULQR0RFvJ6/lhrHNlBLpxVmPqyzUYCuRXrObBMnU489BkMIi8Uuv3E7VcmjGhg/Puyt3RtMQV4eA6dEoi0zdblYja8LQxoxENuu7DyvoTOy/aeeFihs0SG3c8nNoIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847127; c=relaxed/simple;
	bh=nnMkvC+XyAEuuDZwwUqBlYeRO0rng1N8j2RJ08IlFZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHOHEK25EWnkw0STWe39DA880Jp0tq1h0xj/Phq///+0jqhv3rDH520V4OlK+wQWFfhwTZkvZh4+fJ2EYcbcskfGaMuT2haSzcRQLAQv/Pmwowfe9EHL9qMO3GbegZz7MoMTKcrKXN6QO9JgGPTINMTMnCod2dqzjSWgGwHFv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fu9Ubp1F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso14046445e9.0;
        Fri, 20 Sep 2024 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847123; x=1727451923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWhPgj6558rBvnUEezBxFowaJstUqM0WjuWqL552jj0=;
        b=Fu9Ubp1FvxGloUUNebeguzN8TGnO3d6JhHILzuYHEUjR4ltKBF2W98DY029S5/giZx
         KRbGGYiB45FgdYVBxkkM13HZwT+4ipj5j2z49215oOvBeDJSroEgJZ17WJXENKXblNFQ
         nSwzNGLGFT+vtWPKxll3WD8fsNskJBiFgBvEkTJ0+SE2PhZ1kS2YXKv4smEgMP1RMvZK
         0+/2+JAY/YOcXQZX0uicAayosnt5HlUYrUAzlFqLxA6xUK5/o7BYZYbB5g3sGM6tzIt+
         sWrBQFRr1UW3kP7PV1tRqZM4I897OOOJGQZR9C58jZblIk6hQGyw8v5jlTslcVhZpS5M
         b/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847123; x=1727451923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWhPgj6558rBvnUEezBxFowaJstUqM0WjuWqL552jj0=;
        b=LGJK3xqqVNFHqEC1JV8nlPErtXoAt5BG13wMLuKghJ2FeNGEFDqi9p92SFB0ukqTvx
         a9m5U7INEJ5aHDVIbbLjNrXIgRXlLEXlvKb9nQ33qsSd6Nin+23OIN0Juf7/1hkIdSj5
         QRCMN2YqXdVkE8F2cF5T9xSDqKtSf+3PuzLzKPZRJBlmBVHEq9Q+GeosZshH4hk+CCqi
         lToXY6EogXxqvp09wr9pBGa/pWqMCGLhgpiv2rT8LeQOxXHF4oUdAVA1i1nWryqybAOs
         //uV5SwEppVuHGEJRq88IY9XWRLRBjMJLX+wT6v1AjHO/ouLkOBCwWXfXSS7WljT1L6Q
         JXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+OwkASu1CpfWLnJWVmXSAwgnI8MjGaiWj0UyJIaFdIqkAuYIbQ/crVKVMqtAZywXI/hxIk4vmGQ2IDJbR@vger.kernel.org, AJvYcCXA+Ty6ZKtVt/QVeePlQygvql/WhlOAVVvM+NV3O0tGZ+912nvcdXnsCOMMjFepKyc2PY65DlzaH66B@vger.kernel.org, AJvYcCXd+99EcAR9TTHsXQHMdL4jsUJ5gFZEmn+Cqt+eEU/9VWwb0s/lqF1RhDdLa02s281Y1Fj4Ugyt4Mn8Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfZ9RcdTZRjFPF1wdMawL98IoABgRV/2mlAmVebNTDPl55D7Q
	rpS1KrDE1EzQfOeBTj+w8dfTVJQTaPz+IYmNJY8xbnVyleMR7gSZ
X-Google-Smtp-Source: AGHT+IHe2Nu21F7SsC/q8zSh0YQtEiShm36QF3fGRp7z0aDsLZDf8uGaAr2Zlv3MWvEvih4+KnruzQ==
X-Received: by 2002:a05:600c:4f53:b0:42c:bd4d:e8d6 with SMTP id 5b1f17b1804b1-42e7a8c1d04mr22155275e9.3.1726847123223;
        Fri, 20 Sep 2024 08:45:23 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:22 -0700 (PDT)
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
Subject: [PATCH v5 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
Date: Fri, 20 Sep 2024 18:45:03 +0300
Message-Id: <20240920154508.1618410-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the Exynos8895 SoC
used in Samsung Galaxy S8 and S8 Plus phones.

It has a newly applied pinctrl register layer for FSYS0 with a
different bank type offset that consists of the following bit
fields:

CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 137 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 150 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5480e0884..c5df4f1bc 100644
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
+	EXYNOS_PIN_BANK_EINTW(7, 0x0a0, "gpa4", 0x24),
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
+	EXYNOS_PIN_BANK_EINTG(8, 0x0a0, "gpe7", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpf1", 0x18),
+};
+
+/* pin banks of exynos8895 pin-controller 7 (PERIC1) */
+static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
+	EXYNOS_PIN_BANK_EINTG(3, 0x000, "gpb0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(5, 0x020, "gpc0", 0x04),
+	EXYNOS_PIN_BANK_EINTG(5, 0x040, "gpc1", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpc2", 0x0C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpc3", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0a0, "gpk0", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0c0, "gpe5", 0x18),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0e0, "gpe6", 0x1C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x100, "gpe2", 0x20),
+	EXYNOS_PIN_BANK_EINTG(8, 0x120, "gpe3", 0x24),
+	EXYNOS_PIN_BANK_EINTG(8, 0x140, "gpe4", 0x28),
+	EXYNOS_PIN_BANK_EINTG(4, 0x160, "gpf0", 0x2C),
+	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpe1", 0x30),
+	EXYNOS_PIN_BANK_EINTG(2, 0x1a0, "gpg0", 0x34),
+};
+
+static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
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
index 675efa5d8..86c7de109 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1477,6 +1477,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynos8895-pinctrl",
+		.data = &exynos8895_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
 		.data = &exynosautov9_of_data },
 	{ .compatible = "samsung,exynosautov920-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index a1e7377bd..dc930d620 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -384,6 +384,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
-- 
2.34.1


