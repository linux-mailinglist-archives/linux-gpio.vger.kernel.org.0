Return-Path: <linux-gpio+bounces-39052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XIcDOagAQGqVbAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:56:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 440ED6D25B3
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 18:56:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b="DS7/Ash+";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39052-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39052-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9A4B3045458
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 16:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92D6331A53;
	Sat, 27 Jun 2026 16:54:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163A0330D25
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579265; cv=none; b=PU9UW9swmZjNyagkMs/0StZSgTHkljZng1rhlgTaHO8liBtwpcMNnztLkSIbu6EHTtZ+/MqoBVDtGCc8NnPJ1NzyFrLZLOe9CPI26pS8R2caaGyyjDwbVwmVPUEbcU3HkkDT8NAZtOF7gdEfq+B1IXhr9MWacUANLnS62u2ADRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579265; c=relaxed/simple;
	bh=hSEmROm8SEPZCud+B22oAYNUxTEsjx9HxK986gfmWOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=EHTxebwzdMXj/0/3ErduHRSreiA1IpitvP249OJe094zkX1A51FhAU/WXkF1IfMqxASocUHX2lssa4p9aPUa6ECuHGkTSpLMz3dwvWhcaknVoiLzCvmhqfmTQBNovfZxtBvSW3PLJovOvQMlnifOG3NB6LsH3Un+zonHL3gPTEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DS7/Ash+; arc=none smtp.client-ip=203.254.224.33
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260627165417epoutp034a8049797107a1d6b57bf243cdd17827~8-mPci_5H2520025200epoutp03e
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 16:54:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260627165417epoutp034a8049797107a1d6b57bf243cdd17827~8-mPci_5H2520025200epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579257;
	bh=dvSaTF5pP9hZBKiGaY1brArgrgsqyvyLkCLlB4ntWBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DS7/Ash+M5TuHQM2+D8+bpNfyOOdxR0+IMzaX555Nyyc80+CrnKT4eon+syG4EX7n
	 4st0HlkJ1hjrTk8PSS7kPsEvnUbnd/fl5TV432axdBH4nZyvOxnO6U3Dm9TDThk0Ms
	 zrkH4Nx5Txx9YOfRyyHjjBx/UOiVBBypN7Ptv3bY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260627165416epcas5p1bbfe65d605d7c9530950cc97628b2034~8-mOMFvEn0125001250epcas5p1l;
	Sat, 27 Jun 2026 16:54:16 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gndtH0gcGz6B9m4; Sat, 27 Jun
	2026 16:54:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a~8-mM1CJBf2445424454epcas5p1l;
	Sat, 27 Jun 2026 16:54:14 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165412epsmtip10132818cc4d4da88d218d19fa791a441~8-mLMGwO72364623646epsmtip1J;
	Sat, 27 Jun 2026 16:54:12 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 3/6] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Date: Sat, 27 Jun 2026 22:42:25 +0530
Message-Id: <20260627171228.2687857-4-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a@epcas5p1.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 440ED6D25B3

Add pinctrl configuration for Exynos8855. The bank type
macros are reused from EXYNOS850 and GS101 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 132 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 135 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index fe9f92cb037e..1aa977d2a1f8 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -943,6 +943,138 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
 };
 
+/* pin banks of exynos8855 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks0[] __initconst = {
+	GS101_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(4, 0x020, "gpa1", 0x04, 0x08),
+	EXYNOS850_PIN_BANK_EINTN(3, 0x040, "gpq0"),
+	EXYNOS850_PIN_BANK_EINTN(2, 0x060, "gpq1"),
+	GS101_PIN_BANK_EINTW(1, 0x080, "gpc0", 0x08, 0x10),
+	GS101_PIN_BANK_EINTW(1, 0x0a0, "gpc1", 0x0c, 0x14),
+	GS101_PIN_BANK_EINTW(1, 0x0c0, "gpc2", 0x10, 0x18),
+	GS101_PIN_BANK_EINTW(1, 0x0e0, "gpc3", 0x14, 0x1c),
+	GS101_PIN_BANK_EINTW(1, 0x100, "gpc4", 0x18, 0x20),
+	GS101_PIN_BANK_EINTW(1, 0x120, "gpc5", 0x1c, 0x24),
+	GS101_PIN_BANK_EINTW(1, 0x140, "gpc6", 0x20, 0x28),
+	GS101_PIN_BANK_EINTW(1, 0x160, "gpc7", 0x24, 0x2c),
+	GS101_PIN_BANK_EINTW(1, 0x180, "gpc8", 0x28, 0x30),
+	GS101_PIN_BANK_EINTW(1, 0x1a0, "gpc9", 0x2c, 0x34),
+	GS101_PIN_BANK_EINTW(1, 0x1c0, "gpc10", 0x30, 0x38),
+	GS101_PIN_BANK_EINTW(1, 0x1e0, "gpc11", 0x34, 0x3c),
+	GS101_PIN_BANK_EINTW(1, 0x200, "gpc12", 0x38, 0x40),
+	GS101_PIN_BANK_EINTW(1, 0x220, "gpc13", 0x3c, 0x44),
+	GS101_PIN_BANK_EINTW(1, 0x240, "gpc14", 0x40, 0x48),
+	GS101_PIN_BANK_EINTW(1, 0x260, "gpj0", 0x44, 0x4c),
+	GS101_PIN_BANK_EINTW(1, 0x280, "gpj1", 0x48, 0x50),
+	GS101_PIN_BANK_EINTW(1, 0x2a0, "gpj2", 0x4c, 0x54),
+};
+
+/* pin banks of exynos8855 pin-controller 1 (CMGP) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks1[] __initconst = {
+	GS101_PIN_BANK_EINTW(1, 0x00,  "gpm0",  0x00, 0x00),
+	GS101_PIN_BANK_EINTW(1, 0x20,  "gpm1",  0x04, 0x04),
+	GS101_PIN_BANK_EINTW(1, 0x40,  "gpm2",  0x08, 0x08),
+	GS101_PIN_BANK_EINTW(1, 0x60,  "gpm3",  0x0c, 0x0c),
+	GS101_PIN_BANK_EINTW(1, 0x80,  "gpm4",  0x10, 0x10),
+	GS101_PIN_BANK_EINTW(1, 0xa0,  "gpm5",  0x14, 0x14),
+	GS101_PIN_BANK_EINTW(1, 0xc0,  "gpm6",  0x18, 0x18),
+	GS101_PIN_BANK_EINTW(1, 0xe0,  "gpm7",  0x1c, 0x1c),
+	GS101_PIN_BANK_EINTW(1, 0x100, "gpm8",  0x20, 0x20),
+	GS101_PIN_BANK_EINTW(1, 0x120, "gpm9",  0x24, 0x24),
+	GS101_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28, 0x28),
+	GS101_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2c, 0x2c),
+	GS101_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30, 0x30),
+	GS101_PIN_BANK_EINTW(1, 0x1a0, "gpm13", 0x34, 0x34),
+	GS101_PIN_BANK_EINTW(1, 0x1c0, "gpm14", 0x38, 0x38),
+	GS101_PIN_BANK_EINTW(1, 0x1e0, "gpm15", 0x3c, 0x3c),
+	GS101_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40, 0x40),
+	GS101_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44, 0x44),
+	GS101_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48, 0x48),
+	GS101_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4c, 0x4c),
+	GS101_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50, 0x50),
+	GS101_PIN_BANK_EINTW(1, 0x2a0, "gpm21", 0x54, 0x54),
+};
+
+/* pin banks of exynos8855 pin-controller 2 (HSI UFS) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks2[] __initconst = {
+	GS101_PIN_BANK_EINTG(2, 0x0, "gpf3", 0x00, 0x00),
+};
+
+/* pin banks of exynos8855 pin-controller 3 (PERIC) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks3[] __initconst = {
+	GS101_PIN_BANK_EINTG(8, 0x0,   "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(8, 0x20,  "gpp1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x40,  "gpp2", 0x08, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x60,  "gpg0", 0x0c, 0x18),
+	GS101_PIN_BANK_EINTG(3, 0x80,  "gpg1", 0x10, 0x1c),
+	GS101_PIN_BANK_EINTG(6, 0xa0,  "gpb0", 0x14, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0xc0,  "gpb1", 0x18, 0x28),
+};
+
+/* pin banks of exynos8855 pin-controller 4 (PERICMMC) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks4[] __initconst = {
+	GS101_PIN_BANK_EINTG(7, 0x0, "gpf2", 0x00, 0x00),
+};
+
+/* pin banks of exynos8855 pin-controller 5 (USI) */
+static const struct samsung_pin_bank_data exynos8855_pin_banks5[] __initconst = {
+	GS101_PIN_BANK_EINTG(8, 0x00, "gpp3", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x20, "gpp4", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x40, "gpg2", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(1, 0x60, "gpg3", 0x0c, 0x10),
+};
+
+static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos8855_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks0),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos8855_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 HSI UFS data */
+		.pin_banks	= exynos8855_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 PERIC data */
+		.pin_banks	= exynos8855_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 PERICMMC data */
+		.pin_banks	= exynos8855_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 USI data */
+		.pin_banks	= exynos8855_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos8855_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= gs101_pinctrl_suspend,
+		.resume		= gs101_pinctrl_resume,
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


