Return-Path: <linux-gpio+bounces-16207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D658A3A631
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 19:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621DE3B591B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BEF272902;
	Tue, 18 Feb 2025 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kJfywxO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04A1F583D;
	Tue, 18 Feb 2025 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904576; cv=none; b=fSRXQF9Zd0VU2EWh/gV+pT0o+HlbQBnY/LkGjveVrRt9fEfFd0NpQOu2/wtPtTpvqkh0NHHfSrYGpOB26OCJX1er8jfcJ/8ceuz8nnj7Cnmn1pqjrVQ/XLQKJHAOTtOmj50zBktZnUx2TMx+jZ0b2haBe42ZYrN09m09i0rISCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904576; c=relaxed/simple;
	bh=CzffE0iAb+LNe57ihRfjLLgBYfwAr+KOT5fivJbV43k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkP1EMQLUDt9+6TNbq6KtCKFBncucoAxS/TExI+XxURPLgigR1o4H8UUosTeplU+hC2nLlI6TOgK5l/kNB4LfS4KXfkURYQBBKlJFJuiswDlO7QGzdbf/7oJTSh59bQQwWKusZUWR5ckbnn8x5Ct22SuEgIISMVi0EC8W/p959k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kJfywxO7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 51D97234ED;
	Tue, 18 Feb 2025 19:49:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCYEcoZQnwQW; Tue, 18 Feb 2025 19:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904572; bh=CzffE0iAb+LNe57ihRfjLLgBYfwAr+KOT5fivJbV43k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kJfywxO7Nfg6qC2sl2J22Avrkfzj6ARm9M4Cb1/uJBdY4D6l9yOxz1ZABTsGj0U2V
	 hXuM8cK7ZpepMaM09odm09QcxZB0jibyNZXMHXlSWxaZIYobFiuuE2awv3NgOvLqjz
	 ZJPZMp38uGisl+YDhTFTd5hOutBII4Uq7lub9kyPOaH3s5MGIeis1aJiNPqTcts3nf
	 evYXZn4ZpWBbfLnSleBTjmg4WlVph6zMV8i17ToNVVhOY77YsEtxXmPv1RW09zEQCM
	 SOqLm6oqponRPwUNNqGDYekSCcDxZl4hDgvlRg+7VcCPtt96SIhFkOGOk7uK1CdfMd
	 c7JCBYypdr8dA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:18:59 +0530
Subject: [PATCH v2 3/3] pinctrl: samsung: add support for exynos7870
 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pinctrl-v2-3-1ff9b10bf913@disroot.org>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
In-Reply-To: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=10044;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=CzffE0iAb+LNe57ihRfjLLgBYfwAr+KOT5fivJbV43k=;
 b=tnxGx1qP7tyxNGaIIqYr9Uys+DalH5eDzNQSx8vKsRHziFs7j9Iw7sxZfnolXqBACDjMx2FVO
 0bfC4kiSJpEClCWMrrb8/U0fdCVKjpq5MbvhwXDrWNNjAXf6MYBUb/W
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for the Exynos7870 SoC pin-controller in the pinctrl driver.
It has 8 GPIO banks, and 3-bit PINCFG_TYPE_DRV width.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 141 +++++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 4 files changed, 173 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce5eae3c21f11790b5a40037042c1d407..90343cbd8e6a252acedb921662cd2284547a21a7 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -40,6 +40,17 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
 };
 
+/* Exynos7870 has the 3bit widths for PINCFG_TYPE_DRV bitfields. */
+static const struct samsung_pin_bank_type exynos7870_bank_type_off = {
+	.fld_width = { 4, 1, 2, 3, 2, 2, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+static const struct samsung_pin_bank_type exynos7870_bank_type_alive = {
+	.fld_width = { 4, 1, 2, 3, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
 /*
  * Bank type for non-alive type. Bit fields:
  * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
@@ -450,6 +461,136 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
 
+/* pin banks of exynos7870 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTN(6, 0x000, "etc0"),
+	EXYNOS7870_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
+	EXYNOS7870_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
+	EXYNOS7870_PIN_BANK_EINTN(2, 0x0c0, "gpq0"),
+};
+
+/* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpz0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTG(6, 0x020, "gpz1", 0x04),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x040, "gpz2", 0x08),
+};
+
+/* pin banks of exynos7870 pin-controller 2 (ESE) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(5, 0x000, "gpc7", 0x00),
+};
+
+/* pin banks of exynos7870 pin-controller 3 (FSYS) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(3, 0x000, "gpr0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTG(8, 0x020, "gpr1", 0x04),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x040, "gpr2", 0x08),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x060, "gpr3", 0x0c),
+	EXYNOS7870_PIN_BANK_EINTG(6, 0x080, "gpr4", 0x10),
+};
+
+/* pin banks of exynos7870 pin-controller 4 (MIF) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x000, "gpm0", 0x00),
+};
+
+/* pin banks of exynos7870 pin-controller 5 (NFC) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpc2", 0x00),
+};
+
+/* pin banks of exynos7870 pin-controller 6 (TOP) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x000, "gpb0", 0x00),
+	EXYNOS7870_PIN_BANK_EINTG(3, 0x020, "gpc0", 0x04),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x040, "gpc1", 0x08),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x060, "gpc4", 0x0c),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x080, "gpc5", 0x10),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x0a0, "gpc6", 0x14),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x0c0, "gpc8", 0x18),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x0e0, "gpc9", 0x1c),
+	EXYNOS7870_PIN_BANK_EINTG(7, 0x100, "gpd1", 0x20),
+	EXYNOS7870_PIN_BANK_EINTG(6, 0x120, "gpd2", 0x24),
+	EXYNOS7870_PIN_BANK_EINTG(8, 0x140, "gpd3", 0x28),
+	EXYNOS7870_PIN_BANK_EINTG(7, 0x160, "gpd4", 0x2c),
+	EXYNOS7870_PIN_BANK_EINTG(3, 0x1a0, "gpe0", 0x34),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x1c0, "gpf0", 0x38),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x1e0, "gpf1", 0x3c),
+	EXYNOS7870_PIN_BANK_EINTG(2, 0x200, "gpf2", 0x40),
+	EXYNOS7870_PIN_BANK_EINTG(4, 0x220, "gpf3", 0x44),
+	EXYNOS7870_PIN_BANK_EINTG(5, 0x240, "gpf4", 0x48),
+};
+
+/* pin banks of exynos7870 pin-controller 7 (TOUCH) */
+static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __initconst = {
+	EXYNOS7870_PIN_BANK_EINTG(3, 0x000, "gpc3", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos7870_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 DISPAUD data */
+		.pin_banks	= exynos7870_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks1),
+	}, {
+		/* pin-controller instance 2 ESE data */
+		.pin_banks	= exynos7870_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 FSYS data */
+		.pin_banks	= exynos7870_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 MIF data */
+		.pin_banks	= exynos7870_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 NFC data */
+		.pin_banks	= exynos7870_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 6 TOP data */
+		.pin_banks	= exynos7870_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks6),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 7 TOUCH data */
+		.pin_banks	= exynos7870_pin_banks7,
+		.nr_banks	= ARRAY_SIZE(exynos7870_pin_banks7),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
+	.ctrl		= exynos7870_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos7870_pin_ctrl),
+};
+
 /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
 	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7b7ff7ffeb56bdde2504ec90c8df13bdd1ace70e..81c4b4a1acc20aeefe086ecf1fcf8644c3ca4395 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -112,6 +112,35 @@
 		.pctl_res_idx   = pctl_idx,			\
 	}							\
 
+#define EXYNOS7870_PIN_BANK_EINTN(pins, reg, id)		\
+	{							\
+		.type		= &exynos7870_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_NONE,		\
+		.name		= id				\
+	}
+
+#define EXYNOS7870_PIN_BANK_EINTG(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos7870_bank_type_off,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_GPIO,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
+#define EXYNOS7870_PIN_BANK_EINTW(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos7870_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_WKUP,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
 #define EXYNOS850_PIN_BANK_EINTN(pins, reg, id)			\
 	{							\
 		.type		= &exynos850_bank_type_alive,	\
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd4ca6e99c7e72a588d780f0542990ed9..e1962b78cef4ff63a7f3a71c1aa55adb84b70bf2 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1473,6 +1473,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
 		.data = &exynos7_of_data },
+	{ .compatible = "samsung,exynos7870-pinctrl",
+		.data = &exynos7870_of_data },
 	{ .compatible = "samsung,exynos7885-pinctrl",
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52ea0b4392714fa9bcdcbae8d253c73a1..3e82aab3eae8accb0586295c2ffd89667ad0c56a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -382,6 +382,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5410_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5420_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;

-- 
2.48.1


