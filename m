Return-Path: <linux-gpio+bounces-26105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E30B56805
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C60C189A3F4
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 11:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32EC262D0B;
	Sun, 14 Sep 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTArlidS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06325E824
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850309; cv=none; b=iFvHJg3vgN299TPRFmU0U4T7VjAOxlQNPgXQb7+g9aCWbdUSS2kVy4nxfGd1zH3QSuRjreuFGceInSDsyAJzKXSmLm1c4tJFh/97rE/vXy6YSNl02HB71rjCwJmBrW0GOQG4w6Km1ja5jgThqVTT0yE826bwFe0QPFkSfn2MvD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850309; c=relaxed/simple;
	bh=CvNdA1Lq3oTIIeItRHs3AN0gLyQF68rz0iGWHshqQmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ljuub5E8CHYiVk4tI+ext5d1pQk65Qa4YN7CwhgCJqyoXIpMOm5R98nbr7q87I48L4UgaYHdcDDXS8BSmK+tSJLZBhTXP4+vgQ119vjFt7at5snmHJCye9C20kTEK13exlC+pVYG+NpAxpejHeLnRGak99JYeot/OUzqqoMrQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTArlidS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ea3e223ba2so247529f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 04:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850305; x=1758455105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOBGx5UfQF1cbSUEX3Z3Fdo9tcNmtD8DWDihqQ0/EZc=;
        b=cTArlidSXa0f3fRGBkOQtkB/G8JLDNbEp0qTEHsmHE4MD8MDxPn2ebdVeU66NVTeeg
         hkLTCLeaI0TJx5Ge+ATpE1KiAjayibHpudWhnLQyMBSiYXN+gaSJV8Ien2sYPQRP61cd
         5ITSQUYwFTC6yzweIVGcccP9CbSlOisNZgX9YoNTn8iYRACpz4Tn84l3VDY4CdiB85um
         vCoF2J79i1Txn/QxOa2cTeVzQc9uAJC96y0euM+yzVXFXTYVOj+vZbio4mojYFxG42kh
         yJEbOr6p9hoxlaBHH9kaYsih7CtHb+L8HwTxK+gFa/igZaAr/TxFE8i/VDcM9CXZRiq4
         gHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850305; x=1758455105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOBGx5UfQF1cbSUEX3Z3Fdo9tcNmtD8DWDihqQ0/EZc=;
        b=tKFttYnKFJ+yogMDyiefd7zW8P1QHrtOyjpuO9N0ISDEXSbY6GSFco4QY0fb1j8QJn
         p02KqVZ7SyWKSpvBCbJ9/XCcaZL9+OqWsWjqGxxq4Ya39a+5LdrIfE1BmLT7TS2OWR4h
         /UA1ZwSBMmWqaInP2043x6sWy32WEdgpFJeYCzSmfjlMqEVQj6Tu/h4QzZdkDv4uiezb
         n/jczuZe2c0iUr0EksIkXcStJ7x1BuiyRihULtJvqUYPzWDrVoQQ2lPyJ7rP+2/abfuj
         sn8R3LEe+NIlnYlXQj+tPz4ytU45q6OB6llkMCRLHf94Z+StSF7CvFcYczqvwkcFHxc0
         pr0w==
X-Forwarded-Encrypted: i=1; AJvYcCUSIyP1kWJD357sRIxoF2uHrQEorwBkJAvYZUhoPj5sN/zG7LAnNtZGYC7n+1m2+RyR78eewQqNuK8T@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIZKiSovhf5R5a6+gJ/m2uwOrwzJ5zuOdA46dJ7dewxGlH8JQ
	X2eFghud2J9Ehsj7No3yPY+8dQ1qe0fZUmzsMGX16Ud69786NxpCrby/
X-Gm-Gg: ASbGnct9m8fPf0f0ZtMy2uVwWdHjg3PRhNAQkWW/6ZH30RRbQRDOk9ALDNBwwuyhRDb
	Y0mmJYkrrhrzE3gBNctInusJ6Znv2UrxY4JR5Ao+TsG0ndYMocXIRn69/j1y36nMJ1dnEcdsHgI
	Q7D5X9tZ2URxzq3PP7cez9as1JFXefCpUiqY80/3XzJYTsDp2t6+gZBGPNrmhrXsPbzcmcceUmb
	E1fqMvMxoWTp3lPgB0gfuLEecspufKTTYb04ZY6hRSU5ofoHUQK9DSEYc5gfjXT1r8h3STebh/E
	p2Wua+oLNciikrnT5S5leBDPkryd0dtv/UfP9qZ1NLTwU/0XjAa1W7wBg+iuMeiBJb73MiXWGyq
	+pm8l/AxfnL9xE8UUd6KB6+b2EoFo/JzGl90yFisGiNgMCR7pFLfPMFcfvPXixT6CcrTtSbILMi
	tOVAOgb9ek3MraPzBjhMY=
X-Google-Smtp-Source: AGHT+IH1kZMIQbcvz/AkhF5xVxViOePUrcgSUXzqMg2mlEpuTjv12GDP+FNhK68LyJiGfMQXmrywGA==
X-Received: by 2002:a05:6000:2584:b0:3e7:5edd:ce07 with SMTP id ffacd0b85a97d-3e7659f3bc0mr9211873f8f.40.1757850305268;
        Sun, 14 Sep 2025 04:45:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] pinctrl: samsung: add exynos8890 SoC pinctrl configuration
Date: Sun, 14 Sep 2025 14:44:57 +0300
Message-ID: <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the exynos8890 SoC, used in
Samsung Galaxy S7.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 157 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5fe7c4b9f..901047a72 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1476,6 +1476,163 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
 	.num_ctrl	= ARRAY_SIZE(exynosautov920_pin_ctrl),
 };
 
+/* pin banks of exynos8890 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+};
+
+/* pin banks of exynos8890 pin-controller 1 (AUD) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gph0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 2 (CCORE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x000, "etc0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 3 (ESE) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x000, "gpf3", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 4 (FP) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpf2", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 5 (FSYS0) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x000, "gpi1", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpi2", 0x04),
+};
+
+/* pin banks of exynos8890 pin-controller 6 (FSYS1) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x000, "gpj0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 7 (NFC) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf0", 0x00),
+};
+
+/* pin banks of exynos8890 pin-controller 8 (PERIC0) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x000, "gpi0", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpd0", 0x04),
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x040, "gpd1", 0x08),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x060, "gpd2", 0x0c),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x080, "gpd3", 0x10),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x0A0, "gpb1", 0x14),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x0C0, "gpb2", 0x18),
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x0E0, "gpb0", 0x1c),
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x100, "gpc0", 0x20),
+	EXYNOS8895_PIN_BANK_EINTG(5, 0x120, "gpc1", 0x24),
+	EXYNOS8895_PIN_BANK_EINTG(6, 0x140, "gpc2", 0x28),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x160, "gpc3", 0x2c),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x180, "gpk0", 0x30),
+	EXYNOS8895_PIN_BANK_EINTG(7, 0x1A0, "etc1", 0x34),
+};
+
+/* pin banks of exynos8890 pin-controller 9 (PERIC1) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x000, "gpe0", 0x00),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x020, "gpe5", 0x04),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x040, "gpe6", 0x08),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x060, "gpj1", 0x0c),
+	EXYNOS8895_PIN_BANK_EINTG(2, 0x080, "gpj2", 0x10),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0A0, "gpe2", 0x14),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0C0, "gpe3", 0x18),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x0E0, "gpe4", 0x1c),
+	EXYNOS8895_PIN_BANK_EINTG(8, 0x100, "gpe1", 0x20),
+	EXYNOS8895_PIN_BANK_EINTG(4, 0x120, "gpe7", 0x24),
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x140, "gpg0", 0x28),
+};
+
+/* pin banks of exynos8890 pin-controller 10 (TOUCH) */
+static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS8895_PIN_BANK_EINTG(3, 0x000, "gpf1", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos8890_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 1 AUD data */
+		.pin_banks	= exynos8890_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 2 CCORE data */
+		.pin_banks	= exynos8890_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 3 ESE data */
+		.pin_banks	= exynos8890_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 4 FP data */
+		.pin_banks	= exynos8890_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 5 FSYS0 data */
+		.pin_banks	= exynos8890_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 6 FSYS1 data */
+		.pin_banks	= exynos8890_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 7 NFC data */
+		.pin_banks	= exynos8890_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 8 PERIC0 data */
+		.pin_banks	= exynos8890_pin_banks8,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks8),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 9 PERIC1 data */
+		.pin_banks	= exynos8890_pin_banks9,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks9),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 10 TOUCH data */
+		.pin_banks	= exynos8890_pin_banks10,
+		.nr_banks	= ARRAY_SIZE(exynos8890_pin_banks10),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos8890_of_data __initconst = {
+	.ctrl		= exynos8890_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos8890_pin_ctrl),
+};
+
 /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
 	EXYNOS_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 24745e1d7..f58b7b10f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1496,6 +1496,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynos8890-pinctrl",
+		.data = &exynos8890_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
 		.data = &exynos8895_of_data },
 	{ .compatible = "samsung,exynos9810-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe14..4236d7ad8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -394,6 +394,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
-- 
2.43.0


