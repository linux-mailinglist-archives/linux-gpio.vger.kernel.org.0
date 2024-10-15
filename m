Return-Path: <linux-gpio+bounces-11325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43099DE68
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E1B21C23551
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05016198A30;
	Tue, 15 Oct 2024 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="XWmHLOOW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1837D18BB88;
	Tue, 15 Oct 2024 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973830; cv=none; b=ZSezlf7jNBxSaZXiXpZnPpk1vvo3qeKwp9I7p4+vFriY07te3PaFEHJuTg+9AsvHunB1qLnSKQN6bxqAKdNQ0/WuG3ybgoDArTMY/KpoH3b+2pWtEqPBlyEK15h5grV03nfBsn1KXEp/ckd23CpHH1azRKweAM8nWWYJn3XCN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973830; c=relaxed/simple;
	bh=AR66/OaRzfYm+EtRABHjuOd2PZp8U59f/SQLoC8FMDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6R0MebRzAwwwztPovnIvZohivXVncotsrGDb+tB/Qqqqtmj6NxtEwNm/Ak3SXWY+u2+0jggFlI1MULumn3itA9N8Hgweztnw/AcO9J55bxE0ZgYvS+chD3ZrVyCgCzqxTu53hyRnwRBu0a4b+8Qe3kLTpSxkUaV5fi84YPDo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=XWmHLOOW; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPNg5hDfz4wPF;
	Tue, 15 Oct 2024 06:30:27 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPNX5CD2z2x9B;
	Tue, 15 Oct 2024 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973822;
	bh=AR66/OaRzfYm+EtRABHjuOd2PZp8U59f/SQLoC8FMDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWmHLOOW7rdcYVFXws7im6Z8Z01kmK8YCBZs5uKsNdwgyyxjhKfAL+JMwFNb2jPnN
	 yLPjOhKBieJBE97uQdJ2+Ec0fqQ37cxuy0+RezAZCGeV6WZsOHucFSw7/mFItl8pe9
	 fHyjLIJ6ecEjx+L1z/lajdE/olcz33Ht1ICsLFI7fh/PVKfx+alZz1l8b5xZTUWoXm
	 0CZo8amqzEs+HhBNPadqr+OTvcYlS3P9dhBmycRc6VJgTIh3CMK12X928f2riqlGps
	 p4y7s+9d9NN99bHXLSzlx9juDixSCGf3PVW5FdoAKh9ur73gN/Nz69b0OPLd6hI6Bq
	 nEbf5jfoVuf2Q==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] pinctrl: samsung: Add support for Exynos990 pinctrl
Date: Tue, 15 Oct 2024 08:30:10 +0200
Message-ID: <20241015063010.713407-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015063010.713407-1-igor.belwon@mentallysanemainliners.org>
References: <20241015063010.713407-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Exynos 990 pin controller.
This SoC has 7 banks in total. The Exynos 990 uses the same bank types as
Exynos 850, so we use Exynos 850 macros.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 143 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index c5df4f1bc600..f07c26d37442 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -627,6 +627,146 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
 
+/* pin banks of exynos990 pin-controller 0 (ALIVE) */
+static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x080, "gpa4", 0x10),
+	EXYNOS850_PIN_BANK_EINTN(7, 0x0A0, "gpq0"),
+};
+
+/* pin banks of exynos990 pin-controller 1 (CMGP) */
+static struct samsung_pin_bank_data exynos990_pin_banks1[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTN(1, 0x000, "gpm0"),
+	EXYNOS850_PIN_BANK_EINTN(1, 0x020, "gpm1"),
+	EXYNOS850_PIN_BANK_EINTN(1, 0x040, "gpm2"),
+	EXYNOS850_PIN_BANK_EINTN(1, 0x060, "gpm3"),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x1c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm13", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm14", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm15", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2A0, "gpm21", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2C0, "gpm22", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2E0, "gpm23", 0x4c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x50),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x54),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x340, "gpm26", 0x58),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x360, "gpm27", 0x5c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x380, "gpm28", 0x60),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x3A0, "gpm29", 0x64),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x3C0, "gpm30", 0x68),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x3E0, "gpm31", 0x6c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x400, "gpm32", 0x70),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x420, "gpm33", 0x74),
+
+};
+
+/* pin banks of exynos990 pin-controller 2 (HSI1) */
+static struct samsung_pin_bank_data exynos990_pin_banks2[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpf1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x040, "gpf2", 0x08),
+};
+
+/* pin banks of exynos990 pin-controller 3 (HSI2) */
+static struct samsung_pin_bank_data exynos990_pin_banks3[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpf3", 0x00),
+};
+
+/* pin banks of exynos990 pin-controller 4 (PERIC0) */
+static struct samsung_pin_bank_data exynos990_pin_banks4[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp4", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0A0, "gpg0", 0x14),
+};
+
+/* pin banks of exynos990 pin-controller 5 (PERIC1) */
+static struct samsung_pin_bank_data exynos990_pin_banks5[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp5", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpp6", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp7", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpp8", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpp9", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0A0, "gpc0", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0C0, "gpg1", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0E0, "gpb0", 0x1C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpb1", 0x20),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x120, "gpb2", 0x24),
+};
+
+/* pin banks of exynos990 pin-controller 6 (VTS) */
+static struct samsung_pin_bank_data exynos990_pin_banks6[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(7, 0x000, "gpv0", 0x00),
+};
+
+static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos990_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos990_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks1),
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 2 HSI1 data */
+		.pin_banks	= exynos990_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 3 HSI2 data */
+		.pin_banks	= exynos990_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 4 PERIC0 data */
+		.pin_banks	= exynos990_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 5 PERIC1 data */
+		.pin_banks	= exynos990_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 6 VTS data */
+		.pin_banks	= exynos990_pin_banks6,
+		.nr_banks	= ARRAY_SIZE(exynos990_pin_banks6),
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
+	.ctrl		= exynos990_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos990_pin_ctrl),
+};
+
 /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
 	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 86c7de109bca..42e40860841b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1479,6 +1479,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos850_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
 		.data = &exynos8895_of_data },
+	{ .compatible = "samsung,exynos990-pinctrl",
+		.data = &exynos990_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
 		.data = &exynosautov9_of_data },
 	{ .compatible = "samsung,exynosautov920-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index dc930d620f55..615048f94524 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -385,6 +385,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
-- 
2.45.2


