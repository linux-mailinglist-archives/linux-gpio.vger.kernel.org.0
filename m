Return-Path: <linux-gpio+bounces-858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63B800F57
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63588281E0B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD84C3D2;
	Fri,  1 Dec 2023 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPcyJ9Jo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E631728
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 08:11:12 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so1574681f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 08:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447071; x=1702051871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIRiFvkZkuJ6M7VsCy6R3plkoLvGrNtnDEy3wD4Fsu8=;
        b=bPcyJ9JopJfsSY4VGqFWJCZMLVvCAF8uTw6rZXVTarUT5jb6JkSZwLyKyDHIaUqaYG
         GMve1vEUEZntJgpGr41dbIDdEM9XEMqXK6oPkVSbAg/dShC6VQrn1m3CVaW5wFHWQUn6
         QfVNpm30dY9AT8gycGqlOifLB2BEVORkqU2D944aQXIY5LoCdtYw558NUoFjgcOujewg
         2QjYchQZ7cU8N9IynhEv2RfySy5ANGQra12DrC4SZ+3ssekHk7pauu2/ZSLNJmVURjnS
         J88Q/REFWvjfVcnCjYs8DholxdEjGgl0Bxtn10TLTLUWA2o9cTWGYCVAJNUj+Z2l6bSU
         rgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447071; x=1702051871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIRiFvkZkuJ6M7VsCy6R3plkoLvGrNtnDEy3wD4Fsu8=;
        b=dD0NDfl95VJ3UjxB5o4cLoI0utFswGVhaukMe+m102moELLSp1suQAzE7iGwUj2osC
         ymSBFHjlZKXo3sgxfgObI/j7eYvxVpfeMwKrdZyF6ee+9ZnNS4Fl7z1bwMG3sMNoHcrT
         gi2jgIxnN37hbx0hmtZUL+ySvdGK+CjRpbmAVp8xpmKE5l3mR4tNON3FHIDGjlOyWb19
         bRRDYhe72LJU2TpwWN0yZLCieCjyCDvi1MXXdBFJVtqMIbdBODfGJXthsqLQOZ4YF3BB
         fLnCg14KfItHRA0KzKU6sUCuZ16JTgfZYFNA5Eap4UaqYnD7Yks3WGE7ai7q34nqpm1q
         XA8A==
X-Gm-Message-State: AOJu0YxXyl2FWMnMc34LIjMxyFFFhAT3JwiE/PnJCo5YHnhW2JUtzCc1
	pkIW7sswvdI1AxHUD4BAoyD+pw==
X-Google-Smtp-Source: AGHT+IG/2viEeFirSie/FSBZ37JSvsEuChFTrFjBxjIG7RQjsg4N+1jcbdXSaTsiggRr4ovPJdlMxA==
X-Received: by 2002:a05:6000:1289:b0:333:2fc4:468 with SMTP id f9-20020a056000128900b003332fc40468mr682642wrx.97.1701447071054;
        Fri, 01 Dec 2023 08:11:11 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:10 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date: Fri,  1 Dec 2023 16:09:19 +0000
Message-ID: <20231201160925.3136868-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the gs101 SoC used in
Pixel 6 phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 198 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..e1a0668ecb16 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 	.ctrl		= fsd_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
 };
+
+/*
+ * bank type for non-alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ * (CONPDN bit field: 2, PUDPDN bit field: 4)
+ */
+static struct samsung_pin_bank_type gs101_bank_type_off  = {
+	.fld_width = { 4, 1, 4, 4, 2, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+/*
+ * bank type for alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ */
+static const struct samsung_pin_bank_type gs101_bank_type_alive = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
+/* pin banks of gs101 pin-controller (ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS9_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS9_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS9_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS9_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC0) */
+		.pin_banks	= gs101_pin_peric0,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC1) */
+		.pin_banks	= gs101_pin_peric1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume	= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI1) */
+		.pin_banks	= gs101_pin_hsi1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI2) */
+		.pin_banks	= gs101_pin_hsi2,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
+	.ctrl		= gs101_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 56fc11a1fe2f..75b9cf72ce73 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -537,6 +537,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
 			.data = &exynos7_wkup_irq_chip },
 	{ .compatible = "samsung,exynosautov9-wakeup-eint",
 			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "google,gs101-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
 	{ }
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index e2799ff1b5e9..1ffc90db079d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -147,6 +147,40 @@
 		.name		= id				\
 	}
 
+#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)	\
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_NONE,	\
+		.fltcon_type	= FLT_DEFAULT		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{						\
+		.type		= &gs101_bank_type_off,	\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_GPIO,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = FLT_DEFAULT,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type		= &gs101_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_WKUP,		\
+		.eint_offset	= offs,				\
+		.fltcon_type    = FLT_SELECTABLE,		\
+		.fltcon_offset	= fltcon_offs,			\
+		.name		= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 50c360b4753a..982a5702714c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1323,6 +1323,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynosautov9_of_data },
 	{ .compatible = "tesla,fsd-pinctrl",
 		.data = &fsd_of_data },
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 5fab3885a7d7..f6856290608c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -373,6 +373,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.43.0.rc2.451.g8631bc7472-goog


