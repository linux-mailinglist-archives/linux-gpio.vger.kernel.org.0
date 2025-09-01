Return-Path: <linux-gpio+bounces-25270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6FB3D8ED
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 07:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5D7189965F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7422472A5;
	Mon,  1 Sep 2025 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rHp+9/sB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD5246770
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705370; cv=none; b=PF1bAeJ17Gt37XBJ2/v3DJYUvn50rpfpvRQmelUia19wJD9IeoPf52+evc+ubQ/Z0IoFyB7ImV63BQGXy6gXxCNeQk358i33AZmHbhVPrH/3ha7ZOEXK/w1kUdr/b8rmnm9fDaQ1NzCnWhqwxDa9FH8gKRl5rjPjMQK1XANbyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705370; c=relaxed/simple;
	bh=iz9/U1tHgQawwbKyv/wUMo02FxMcMY0gIUOHww7tSAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=NzsGOQrF8JlJ3ACdWrIndcQRCh4TaXDvgvUj4r/uRhZP2pc4pYpC6A+lqvDO4VKZTc52wv80ZQA92h3QZ3LmNnhXd13yQ/Ch8lV0vUIZA5eAzdS4/JiiuYs31AzevGlh16r3uZIF0GZ4dioQcNivp7PxgbmAkUDfSZ49YOZ3ig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rHp+9/sB; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250901054247epoutp04763af9f944cf5e8173e3e4ee2330961b~hEjldaATM0450404504epoutp04F
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 05:42:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250901054247epoutp04763af9f944cf5e8173e3e4ee2330961b~hEjldaATM0450404504epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705367;
	bh=OVf2kzdOSE35zubTYhy5p4HObUjPisVXLQwG/uTgz0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHp+9/sBJvdyKby+86phch8jULBaRcLAn3T6NBV6C3zUJyrclFb5ekOHNggA9yATf
	 n/LUsDpT9o0HdeFgPX+lAFRgAwc0W0pfkZDkKczKt/HvU1/6BZhRDxkckZcbOmrmpy
	 QYT9LAqO55388pJuA4j9IsxncgypHuZHKTCTGJTI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901054246epcas5p1b328b9c60a8a5ecbd961288890b9c346~hEjkqarrk1274712747epcas5p1m;
	Mon,  1 Sep 2025 05:42:46 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFd7T1ygVz6B9m4; Mon,  1 Sep
	2025 05:42:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97~hEjjBPtz71608616086epcas5p4j;
	Mon,  1 Sep 2025 05:42:44 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054239epsmtip29a7402a69a09b1ca1ada114007b15539~hEjeqp3Aw0762707627epsmtip28;
	Mon,  1 Sep 2025 05:42:39 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Priyadarsini G
	<priya.ganesh@samsung.com>
Subject: [PATCH v4 2/6] pinctrl: samsung: Add ARTPEC-8 SoC specific
 configuration
Date: Mon,  1 Sep 2025 10:49:22 +0530
Message-Id: <20250901051926.59970-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054244epcas5p474b65dbf838296ba3177edaeb2c6ec97@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

From: SeonGu Kang <ksk4725@coasia.com>

Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 50 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      | 10 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 5fe7c4b9f7bd..323487dfa8c2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -76,6 +76,15 @@ static const struct samsung_pin_bank_type exynos8895_bank_type_off  = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
 };
 
+/*
+ * Bank type for non-alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4
+ */
+static const struct samsung_pin_bank_type artpec_bank_type_off = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
@@ -1816,3 +1825,44 @@ const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
 	.ctrl		= gs101_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
 };
+
+/* pin banks of artpec8 pin-controller (FSYS0) */
+static const struct samsung_pin_bank_data artpec8_pin_banks0[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(5, 0x000, "gpf0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(4, 0x020, "gpf1", 0x04),
+	ARTPEC_PIN_BANK_EINTG(8, 0x040, "gpf2", 0x08),
+	ARTPEC_PIN_BANK_EINTG(4, 0x060, "gpf3", 0x0c),
+	ARTPEC_PIN_BANK_EINTG(7, 0x080, "gpf4", 0x10),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0a0, "gpe0", 0x14),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0c0, "gpe1", 0x18),
+	ARTPEC_PIN_BANK_EINTG(6, 0x0e0, "gpe2", 0x1c),
+	ARTPEC_PIN_BANK_EINTG(8, 0x100, "gps0", 0x20),
+	ARTPEC_PIN_BANK_EINTG(8, 0x120, "gps1", 0x24),
+};
+
+/* pin banks of artpec8 pin-controller (PERIC) */
+static const struct samsung_pin_bank_data artpec8_pin_banks1[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(8, 0x020, "gpa1", 0x04),
+	ARTPEC_PIN_BANK_EINTG(8, 0x040, "gpa2", 0x08),
+	ARTPEC_PIN_BANK_EINTG(2, 0x060, "gpk0", 0x0c),
+};
+
+static const struct samsung_pin_ctrl artpec8_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 FSYS data */
+		.pin_banks	= artpec8_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(artpec8_pin_banks0),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 1 PERIC data */
+		.pin_banks	= artpec8_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(artpec8_pin_banks1),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data artpec8_of_data __initconst = {
+	.ctrl		= artpec8_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(artpec8_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 362dc533186f..c9c38f8988dd 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -236,6 +236,16 @@
 		.name			= id				\
 	}
 
+#define ARTPEC_PIN_BANK_EINTG(pins, reg, id, offs)			\
+	{								\
+		.type			= &artpec_bank_type_off,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_GPIO,		\
+		.eint_offset		= offs,				\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 24745e1d78ce..c099195fc464 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1482,6 +1482,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &s5pv210_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
+	{ .compatible = "axis,artpec8-pinctrl",
+		.data = &artpec8_of_data },
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
 	{ .compatible = "samsung,exynos2200-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe1401a..be2dee886d81 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -381,6 +381,7 @@ struct samsung_pmx_func {
 };
 
 /* list of all exported SoC specific data */
+extern const struct samsung_pinctrl_of_match_data artpec8_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
-- 
2.49.0


