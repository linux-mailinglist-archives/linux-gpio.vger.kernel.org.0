Return-Path: <linux-gpio+bounces-26276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF9B80038
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 16:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C424163BF9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109712F5A19;
	Wed, 17 Sep 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QFMhEa2s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00232C15B6
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092451; cv=none; b=LcDnk4Y4P/Q5LWJC8zQeXmTFSi8yUPiUrEMpcm+NE4p8COWqidVJs429/uk1ris+Ev37eBGIRL6xrUkTWJdjziIZ9Mn3yNn4pneTMqyGrR1tTWZ3+O4IyhZV5sKlEIoMXIyDt93K1xJj8iYEDl6DB1HkCVe9ihnX1iLJ8Oehj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092451; c=relaxed/simple;
	bh=YjwP6sZixK4ypMXmPktinGSovQSbCWxf6IKVN/Kk4to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LetO+qHOIiwegpUFyR9jSVI5itlilf5eGgTpBN69YFkU0T8evSwx+td9qvOsPgrzjyagrJz0XmnSSwhBdrWF4iqu0OSrqTZv64lXQVCa6AAWL6grROrauMXVT2Zqckj0xls7Hbn3eyVjJx/1TO0mmmL/8oMsZ/5Esi63HX6709w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QFMhEa2s; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250917070046epoutp0129c3f252780b0fa04ff6a2a65ef893a8~l-8QCfzTY1138711387epoutp01h
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250917070046epoutp0129c3f252780b0fa04ff6a2a65ef893a8~l-8QCfzTY1138711387epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092446;
	bh=/vCiTZ3N3P7ShOU4paNexYZlCAZ7bWu+BU5oOPi+Y7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFMhEa2sWKII3lgNKD534UbFbCHYKceyDOejV/OFIvSWxLJbB+RAbU+q9b9eZP8J5
	 VUtL0VfBV1yotttCOXkon6IwzJr1q6IDA00fZCvxHKTIq7cQxzczfc7Xm8cXByagrx
	 rzcCWoZZk+ZQ+KPeI0b6nR0MYkZpIO9GtYn6lyyY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250917070046epcas5p42fbee3393da460327da4513e759edfd5~l-8PYbXlg1695016950epcas5p4n;
	Wed, 17 Sep 2025 07:00:46 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRV652hTpz3hhT9; Wed, 17 Sep
	2025 07:00:45 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250917070044epcas5p4562c860c2ff5a3f848a91aa619c3a610~l-8OGYbc62143621436epcas5p4A;
	Wed, 17 Sep 2025 07:00:44 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917070041epsmtip10fe57999ad4f62cfcc5ef67bf230eb7a~l-8K5q-Ij2859728597epsmtip1e;
	Wed, 17 Sep 2025 07:00:41 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org
Cc: tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com, Ravi Patel <ravi.patel@samsung.com>
Subject: [PATCH 2/2] pinctrl: samsung: Add ARTPEC-9 SoC specific
 configuration
Date: Wed, 17 Sep 2025 12:30:04 +0530
Message-ID: <20250917070004.87872-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917070004.87872-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917070044epcas5p4562c860c2ff5a3f848a91aa619c3a610
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917070044epcas5p4562c860c2ff5a3f848a91aa619c3a610
References: <20250917070004.87872-1-ravi.patel@samsung.com>
	<CGME20250917070044epcas5p4562c860c2ff5a3f848a91aa619c3a610@epcas5p4.samsung.com>

From: SeonGu Kang <ksk4725@coasia.com>

Add Axis ARTPEC-9 SoC specific configuration data to enable pinctrl.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 49 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 3 files changed, 52 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 323487dfa8c2..5a64fb428142 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1866,3 +1866,52 @@ const struct samsung_pinctrl_of_match_data artpec8_of_data __initconst = {
 	.ctrl		= artpec8_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(artpec8_pin_ctrl),
 };
+
+/* pin banks of artpec9 pin-controller (FSYS0) */
+static const struct samsung_pin_bank_data artpec9_pin_banks0[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(8, 0x000, "gpf0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
+	ARTPEC_PIN_BANK_EINTG(8, 0x040, "gpe0", 0x08),
+	ARTPEC_PIN_BANK_EINTG(8, 0x060, "gpe1", 0x0c),
+	ARTPEC_PIN_BANK_EINTG(8, 0x080, "gpe2", 0x10),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0a0, "gpe3", 0x14),
+	ARTPEC_PIN_BANK_EINTG(2, 0x0c0, "gpe4", 0x18),
+	ARTPEC_PIN_BANK_EINTG(8, 0x0e0, "gps0", 0x1c),
+	ARTPEC_PIN_BANK_EINTG(8, 0x100, "gps1", 0x20),
+	ARTPEC_PIN_BANK_EINTG(5, 0x120, "gpi0", 0x24),
+};
+
+/* pin banks of artpec9 pin-controller (FSYS1) */
+static const struct samsung_pin_bank_data artpec9_pin_banks1[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(2, 0x000, "gpu0", 0x00),
+};
+
+/* pin banks of artpec9 pin-controller (PERIC) */
+static const struct samsung_pin_bank_data artpec9_pin_banks2[] __initconst = {
+	ARTPEC_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	ARTPEC_PIN_BANK_EINTG(8, 0x020, "gpa1", 0x04),
+};
+
+static const struct samsung_pin_ctrl artpec9_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 FSYS0 data */
+		.pin_banks	= artpec9_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(artpec9_pin_banks0),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 1 FSYS1 data */
+		.pin_banks	= artpec9_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(artpec9_pin_banks1),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 2 PERIC data */
+		.pin_banks	= artpec9_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(artpec9_pin_banks2),
+		.eint_gpio_init	= exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data artpec9_of_data __initconst = {
+	.ctrl		= artpec9_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(artpec9_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index c099195fc464..1d978443bd1b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1484,6 +1484,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #ifdef CONFIG_PINCTRL_EXYNOS_ARM64
 	{ .compatible = "axis,artpec8-pinctrl",
 		.data = &artpec8_of_data },
+	{ .compatible = "axis,artpec9-pinctrl",
+		.data = &artpec9_of_data },
 	{ .compatible = "google,gs101-pinctrl",
 		.data = &gs101_of_data },
 	{ .compatible = "samsung,exynos2200-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 3e8ef91d94a3..94334bd860ca 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -382,6 +382,7 @@ struct samsung_pmx_func {
 
 /* list of all exported SoC specific data */
 extern const struct samsung_pinctrl_of_match_data artpec8_of_data;
+extern const struct samsung_pinctrl_of_match_data artpec9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos2200_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos3250_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos4210_of_data;
-- 
2.17.1


