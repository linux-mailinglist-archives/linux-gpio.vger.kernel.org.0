Return-Path: <linux-gpio+bounces-38469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfTPOoW5L2qfFAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:36:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F00368497F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=DPl8wzNw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38469-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38469-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A0A5301D97B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396623CF679;
	Mon, 15 Jun 2026 08:34:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E803672A7
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512477; cv=none; b=FDWSva7qGp5wIZt4qeawyOIuJ9ovSonaBjWEnFELCiGd5V6SOFiiC/zqGybO6TYEJ4ixjhwHSLKhkjOU2E7nMALQl9BpN781wsvJiorw6H3+TiGGVS1vc1c4smvWziM44b3nCtJdCoi45dBbwLTDKb1xvTmlghuQpXDzDEDJ3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512477; c=relaxed/simple;
	bh=lUjfNzJljc6pCew56ylW0h89hecTLFa/Enx8RimY1UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=b22zWH3+LK/DPun8dEhabM6kfRsyaaPo07sk+CmIhyOCRWXCZDQPQEhnVY2t7VZhK61MbCbq2EGY+nnKgb4Qz//MAXDj2xMmLkY6KuVaK7O7Oi75o7xPGxpom4zwNci0MigtkWT4GlF5e4OwHv0GANtymg38y52lKliB+fbbQug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DPl8wzNw; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260615083425epoutp04d810fc5f6798c56d5fd238f530bfa124~5NCYWks1Q2352723527epoutp04u
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:34:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260615083425epoutp04d810fc5f6798c56d5fd238f530bfa124~5NCYWks1Q2352723527epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512465;
	bh=2TuCUnJcl3i2iahUAqxd7so5NQ4PkCBlWSxkqRQhZ54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DPl8wzNwf08mPKyYu+y68imFxdN5Hdj4zreptRkzAm1NPlhHOEMLBKh0LCiFDvkyc
	 AXtgudDK0fQlhrxrsuW3t+6Hgq0p1PsEVJqJ1CdkdpP7InLSU01Amiv6KqX/G/W642
	 MZs3HOBl+inXoBshuMl42/pUHbsdurlvYQf9P6BU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260615083425epcas5p18240bec5b7c43be998675bc4b72d8ccf~5NCXskdqN2834228342epcas5p1J;
	Mon, 15 Jun 2026 08:34:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gf3M41278z6B9mF; Mon, 15 Jun
	2026 08:34:24 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a~5NCWWXwz62361823618epcas5p3x;
	Mon, 15 Jun 2026 08:34:23 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083421epsmtip162543c33f4c42a23467e868735b52947~5NCUiGPfp0166001660epsmtip1j;
	Mon, 15 Jun 2026 08:34:21 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Date: Mon, 15 Jun 2026 14:22:50 +0530
Message-Id: <20260615085252.1964423-4-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a@epcas5p3.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38469-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F00368497F

Add pinctrl configuration for Exynos8855. The bank type
macros are reused from Exynos850 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 123 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 126 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index fe9f92cb037e..db120ae4d847 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -943,6 +943,129 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
 
+/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x020, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTN(3, 0x040, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTN(2, 0x060, "gpq1"),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpc0", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0a0, "gpc1", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0c0, "gpc2", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0e0, "gpc3", 0x1c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpc4", 0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpc5", 0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpc6", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpc7", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpc8", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpc9", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpc10", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpc11", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpc12", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpc13", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpc14", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x4c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x50),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x54),
+};
+
+/* pin banks of exynos8855 pin-controller 1 (CMGP) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x20,  "gpm1",  0x04),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x40,  "gpm2",  0x08),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x60,  "gpm3",  0x0c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x80,  "gpm4",  0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0xa0,  "gpm5",  0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0xc0,  "gpm6",  0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0xe0,  "gpm7",  0x1c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8",  0x20),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9",  0x24),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54),
+};
+
+
+/* pin banks of exynos8855 pin-controller 2 (HSI UFS) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gpf3", 0x00),
+};
+
+/* pin banks of exynos8855 pin-controller 3 (PERIC) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks3[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0,   "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x20,  "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x40,  "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x60,  "gpg0", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x80,  "gpg1", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(6, 0xa0,  "gpb0", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xc0,  "gpb1", 0x18),
+};
+
+/* pin banks of exynos8855 pin-controller 4 (PERICMMC) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks4[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(7, 0x0, "gpf2", 0x00),
+};
+
+/* pin banks of exynos8855 pin-controller 5 (USI) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks5[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x00, "gpp3", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gpp4", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpg2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(1, 0x60, "gpg3", 0x0c),
+};
+
+static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos8855_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos8855_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 2 HSI UFS data */
+		.pin_banks	= exynos8855_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 3 PERIC data */
+		.pin_banks	= exynos8855_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 4 PERICMMC data */
+		.pin_banks	= exynos8855_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 5 USI data */
+		.pin_banks	= exynos8855_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos8855_of_data __initconst = {
+	.ctrl		= exynos8855_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos8855_pin_ctrl),
+};
+
 /* pin banks of exynos990 pin-controller 0 (ALIVE) */
 static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ac6f6b02327..5ecc9ed4c44d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1500,6 +1500,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
+	{ .compatible = "samsung,exynos8855-pinctrl",
+		.data = &exynos8855_of_data },
 	{ .compatible = "samsung,exynos8890-pinctrl",
 		.data = &exynos8890_of_data },
 	{ .compatible = "samsung,exynos8895-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 937600430a6e..bb02fb49b2af 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -396,6 +396,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos8855_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
-- 
2.34.1


