Return-Path: <linux-gpio+bounces-38373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4L4NykxLGpkNQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:17:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31367ACE2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:17:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=KeIW7HwC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38373-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38373-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF557322D309
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785C03955CD;
	Fri, 12 Jun 2026 16:11:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33D392C57
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280713; cv=none; b=IZPLIVtNhJ0LZyytucM1zDk78BfZ44dS+0AJOjpZn+RN6oW0ZG/JEsTxLZ7dYwlMXmvgetPn2SFxp1RcySq8EnnvtLBToO9aBhyNbmcmUv+gS5w0fXwFZj2JJw7jsJBaGSZPVfZMr85ohwxcF2X4Z1iUYGo5atnQr/01fSNPGmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280713; c=relaxed/simple;
	bh=uVQ/QfUITA4f4FLXybW/WSpnDta2TCXz+ol81iHC93s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VRWYtKxiovBnDSwTlPpPP/L126xU9LbTmcLxl7XkIsL9nqquQn04UKDXCjfn7w1m92IabIAvNouEwJRZUYEyTTnd13D8EV6cs5p19d7e44iqpvqWhz2lQ04Mh2rrWwgNGZUZZAWWFVD4EU+el0hp/efm7WpkBxZ0xLk1GAstICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KeIW7HwC; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260612161142epoutp01eb608c5e1722349010aa2b352a3ae665~4YVyF2pz53070030700epoutp01I
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260612161142epoutp01eb608c5e1722349010aa2b352a3ae665~4YVyF2pz53070030700epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280702;
	bh=+77YLroza0fMjwhg9Q7iRDdFeSAXoL8N/biJ3uyYf8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeIW7HwCl9+OARa7DC7JjgHtwkDGNDUFGArTHzZpedFcp6ilHhgXXJFisNaM75wC2
	 4OisuVpfWASvhDZ8w2k8gv6BATqE8EWwpHoumiuWGrpD5az+RyeXRKzxk2oOF6/Jxk
	 5Vse6OPt8XxCCQE2XRC3wURIGIATbcbqg6Y/sags=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260612161142epcas5p4ad646328cf1819327ae104b589a645bb~4YVxr7epF3108931089epcas5p4_;
	Fri, 12 Jun 2026 16:11:42 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gcPf53mq1z6B9m5; Fri, 12 Jun
	2026 16:11:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260612161140epcas5p4322c5d35580d9a73e6f8b4f4607a1da0~4YVv8giAS2851028510epcas5p4G;
	Fri, 12 Jun 2026 16:11:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161138epsmtip140a4deaaa5f05dd462dff14b34fd7505~4YVtyCgRY2559525595epsmtip1d;
	Fri, 12 Jun 2026 16:11:37 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 3/5] pinctrl: samsung: Add Exynos8855 pinctrl configuration
Date: Fri, 12 Jun 2026 22:00:18 +0530
Message-Id: <20260612163020.411761-4-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612163020.411761-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161140epcas5p4322c5d35580d9a73e6f8b4f4607a1da0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161140epcas5p4322c5d35580d9a73e6f8b4f4607a1da0
References: <20260612163020.411761-1-alim.akhtar@samsung.com>
	<CGME20260612161140epcas5p4322c5d35580d9a73e6f8b4f4607a1da0@epcas5p4.samsung.com>
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
	TAGGED_FROM(0.00)[bounces-38373-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 9C31367ACE2

Add pinctrl configuration for Exynos8855. The bank type
macros are reused from Exynos850 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 124 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 3 files changed, 127 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index fe9f92cb037e..ba2a11f8e19d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -943,6 +943,130 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
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
+		.eint_wkup_init = exynos_eint_wkup_init,
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


