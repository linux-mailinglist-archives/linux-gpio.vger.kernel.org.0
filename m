Return-Path: <linux-gpio+bounces-9914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8A971602
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218A21C22214
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFBB1B790E;
	Mon,  9 Sep 2024 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH6q4jlF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A381B78EB;
	Mon,  9 Sep 2024 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879660; cv=none; b=pdlVGI3+7UUHjZ02CBki5WcdWIc792HQNb95ehDzfI3zwFEbzEvuZLoyPnma8YYRUCKZPgXAN2lGxu6OIsr+mneTpkVFNIJSgrP/mC6MpAu7e9SLJv+KIuEKOy+rxRhlz+qVfNClR4P7Z89PbV1FXDJYVVeLsBXBvnMAukutSkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879660; c=relaxed/simple;
	bh=nRtd7hFLiJIBdqwJ//RZrrMgxZ1pF/c6MZ7hfsnOYo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pWYSeOYvFSRGys6XvR4eZnQhQZtZnyxbDd5SrNRUtRDzZkuLmkn/Iq1YtaAdHzQsGTLdBaJdsjvyZnyEguXqzto9+nTl5+Q1YP+fqc4WDHhsBr8oEhCzueGyEv3D/136Uyuz1FhwaTU03HY9nsKHqQZqpbPKzRgDD9DocdHlnio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH6q4jlF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c26311c6f0so4942111a12.3;
        Mon, 09 Sep 2024 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879657; x=1726484457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7i2bWmB71REqInuQTYbS35u0c0Kf+CAtF3EswzS+hA=;
        b=nH6q4jlF5lKIGKzbP/5M8Oa2olLjO86UUABLKumgSLUW0I9vR7GeyOGk96YPrN3Zzj
         FUO/lOz84Pyb9rnBCK8s+BAMKUGJ1B6UNksn1u9FUO/9+pD2zUl+Qs5yH9gg3LFzjXXd
         duYMRDlxKJuwRyeuVLE/aRykB1wj46aywNLqVd5CaAg0qn8axJwL7FYOzgEEsbdDFJJz
         ee1LchXCu7/ZwrAzyoEncTZUmmNZJW7jkAMrIDjOOJqgIKp2Xif/6RxHTWhxPSxkzD3s
         e+9fv/YfcCgECticUy48vbXpI/2oaCrKoxs/F18Z7KHm8VABDzKY0JvBUhH99AWnsasL
         yVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879657; x=1726484457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7i2bWmB71REqInuQTYbS35u0c0Kf+CAtF3EswzS+hA=;
        b=vEkzyGVmBOisH7ss4TPrZKR1/pnssYK5wymmUvo0LhJX1EkAQCRo3dUEZyY6jtlo8E
         O1x9XaBsEFCqEs+5TQrzr/ypwYWeRgsv1moa8pDonJ6rGi2AM68UjCHGmv8fSeBxM8Q4
         MBi1sIY+TXSSZJFgizVs6tdGGaZ+OGSGneZbQ65XVRJh1iVMUn6Se2RiO8APc+9daWNA
         ccS8QRazXtNrV53VQLZBPxoYn8j8b8MyNC8PMFsIOJZdWiCjg+XVOIMV9oVfCj/fALgI
         2W3YilU0jQy2HMkE0XPRoCrobBUvtc21zMPHYkLDqeW22ulIbnQNaXhZ6rBO6yKIWPSs
         eNkg==
X-Forwarded-Encrypted: i=1; AJvYcCUOSr/I5+O0jkWFGtx0/2ui6bGqO+G1Zwm3eG0yydcLGay/syGJY5q9+8gGE8TfuUpm1vIq0HIGHcr52gZs@vger.kernel.org, AJvYcCXOg81yIKZkGVFoYD0n/4/Ubhq8JumpIcr7nt9KEr6oeytkwxbFx1O7A8KvPLMXq8MX/KOgCOXMPU9nDQ==@vger.kernel.org, AJvYcCXV0GupOa23O+u/HPiRI4m/5C4jA+ucykzQCLqYuM/tMc66ZZWxcjbzuPndIjvM2N16cS1PGs+AsCAv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUp2rf6xXssbRQSqomBgo0KJJQepiDTe8ULq5qcV2eXJkX6v1M
	qNqp1+QOG10tmMNB+tePHxg4uWWpFof/pdyogQYfoLbd0bs9ZH2E
X-Google-Smtp-Source: AGHT+IFK5OWkYRs8utXGN6z38GN7u/wZVhIuYrbOuMSfQVCOsIaPkoEE4yYQeIki7wXqh0Lpss4Qnw==
X-Received: by 2002:a17:906:fd81:b0:a7a:b561:3575 with SMTP id a640c23a62f3a-a8a88857a11mr781932466b.56.1725879656699;
        Mon, 09 Sep 2024 04:00:56 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:56 -0700 (PDT)
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
Subject: [PATCH v4 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
Date: Mon,  9 Sep 2024 14:00:12 +0300
Message-Id: <20240909110017.419960-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
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


