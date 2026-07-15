Return-Path: <linux-gpio+bounces-40118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MlbfE81+V2pZTQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:36:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74E75E37B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:36:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KOe2Bz3P;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40118-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40118-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6FCB3054194
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACAA46AEF2;
	Wed, 15 Jul 2026 12:29:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A55845BD7F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118584; cv=none; b=UQYfQp2lWbzVyp56+CAXehafOVFOGfa1RwdtY03P3up/TAEHsd5TjrXS5va43rZOUayQRhprIfvaHUbJjfUWWYUpyX7YI/CmVGX6Gn9485+c2SovQxicErRaZWScr//ujwz1oClmNBheBke7GNAEYnOCyvsYfszrOFuwg7LK1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118584; c=relaxed/simple;
	bh=KY8T9GZ0q7wGAoC2CqLDc1Ng1zwHtvMAIUMn0uKmUko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tiih6muEKJE7MVlIqRYcwk3IJ+U1yi0AWLhiBR3k3z40nkUyCNVxBZaMJUEqoyGdWSbXklomOavaSVvneX6bPWz+dCVMAucNbEwZiq3GH86WhrbRIznn6sYtVG8ugCycbSr2cRyW0wEwJZ+J4rizkjk4tuXYV5DpS7E0jLLoxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOe2Bz3P; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f45e206dso4496095e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118578; x=1784723378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ffpOVmxEgLoaCWkah67vyuTnecgePb6qoQjLtT9PDs=;
        b=KOe2Bz3PFqwuUxq9Nd2YZders41XCYGAxnEk22UdkJ9P5rpQhg0jSNTgNu87sLEO2I
         fAWK1ON5mo/6nMsGB4CAdVIqAN29JNJfKCP3wZ8SJBIjDotQg7fBBGkmvIpJbVjKCt7Y
         Dh4VGJQruFxRL7IDfqzPSMPSewhSOSPRJp/A1hEKzxChtik0qvAs9q3Lc40CtvCfBbxO
         ng86BzcMT9i2rkODe62TfxXKb0XZhkACZEvDW9L25Lb+cVdTO9L+M21rBE2fRGAl/J59
         IFqRoSyRhnrB+rnASS4FqTGuf1CfvIPcUIdutzTWSjpSHEeCCV72sFXJQrCz04kjwL8K
         G3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118578; x=1784723378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ffpOVmxEgLoaCWkah67vyuTnecgePb6qoQjLtT9PDs=;
        b=Id6FxzMDorfdLYhe22VF904Xf2syIqtxAkO48C0Ie5OHYlZU2b82Y6hCdN+TPSEw8i
         D6rrWWhD6PyJzk+lNpApfof/jYPIeZocS64Zz+eqbVUbT+JxgFRYcfDTZcFuPRLwbTGS
         hZFUkVzcVCj0/C9fqCMx6+J0CfDqTAln/StctPoJUvLupr1QC/DehtaGXYVLCvejF7gc
         6NP4oGMi7V21MsL4aD66qO5nfw2DCnWBBqBraKTrFfVpWWtOcNrTkn3jfetWxPtZSWKe
         h8HxH2zgLZ5XrVOUIUqihOhlk138e1+tfP+HBm/j6LI+aYEEQ4dn7FZKcKWGozn+fzcW
         Zcrg==
X-Forwarded-Encrypted: i=1; AHgh+RqjKjDZS59BbKEKmG1zimz2prSRQzZmkvFy/k3/bGOLTmhJJ4QTPf8Nihjx50cfBtPw+rjUZAfoOL8S@vger.kernel.org
X-Gm-Message-State: AOJu0YyBX57h+ph8hIVUY8K56ICA8eq6eFZ/JrbS1lUA5SJeenvO68c/
	IyYjw8icbfNkk9O7kVGXGg0RYCBi/knlaKVkNXZ1XgwYcGX4Rv99p1A0
X-Gm-Gg: AfdE7ckUKrr6wB4vRXfPGMTwbCR9qActysTET0cBHEV2Y/j+YjfKNrNE5rB1EQs4F/F
	MsMjBlZ5NgSZM9T8K7AhjSLkQxRAUxb7tMBjbKGfkKCMVyLjJ23YA17cYhe+QkgNMVYSEU+esG9
	OaXhtlWz/8VSe26+7x7QL3iSLOnN2NkseYfAJKPMLEkjRO9NoIqFR6GerQir8eRAlLccxXVdIps
	nY8GRyuQQSlWrNK9oT2uM04/46O3yFvqImN8f8AEXuJBcpeZQ4gmT3T8175TMqYZ4mzSXeJcvYq
	LejjHbBQ44a0fxfQGToZWN4UvafW/MfV3BxJhgaZjf58fajKfdepDPv28E6yMbCvmTUzbUvkfVI
	wmKB6RW5Gzupkte7UEn6JgsFm8litb0jK4WGs2+L7Gz0GABNuQ48vDm8gmmwUmWOlpz65YtF2z9
	BOWboAzkKq7SD5fN+4tkXvAEs=
X-Received: by 2002:a05:600c:8b65:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-493f8885308mr177231885e9.7.1784118577373;
        Wed, 15 Jul 2026 05:29:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:36 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 3/8] pinctrl: npcm8xx: support RG2 drive strength selection
Date: Wed, 15 Jul 2026 15:29:18 +0300
Message-Id: <20260715122923.1938327-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40118-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E74E75E37B
X-Rspamd-Action: no action

RG2 pins 110-113 and 208-209 do not use the per-bank ODSC bit that the
driver relies on for the rest of the drive-strength handling. Their
strength is encoded in GCR_DSCNT[7:6] and supports four values: 8, 12,
16 and 24mA.

Mark those pins as a dedicated drive-strength class and translate the
pinconf get/set operations to the shared GCR_DSCNT field so the full
hardware range becomes available.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 75 ++++++++++++++++++++---
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 1d5b3c648..8d7dfb326 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -82,6 +82,8 @@
 #define NPCM8XX_INTCR4_R1_RMII_EN	BIT(12)
 #define NPCM8XX_INTCR4_R2_RMII_EN	BIT(13)
 #define NPCM8XX_INTCR4_RMII3_EN	BIT(14)
+#define NPCM8XX_GCR_DSCNT_RG2DS_SHIFT	6
+#define NPCM8XX_GCR_DSCNT_RG2DS_MASK	GENMASK(7, 6)
 
 #define NPCM8XX_DEBOUNCE_MAX		4
 #define NPCM8XX_DEBOUNCE_NSEC		40
@@ -1287,6 +1289,7 @@ static struct pinfunction npcm8xx_funcs[] = {
 #define DRIVE_STRENGTH_LO_SHIFT		8
 #define DRIVE_STRENGTH_HI_SHIFT		12
 #define DRIVE_STRENGTH_MASK		GENMASK(15, 8)
+#define DSTR_RG2			BIT(16)
 
 #define DSTR(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
 			 ((hi) << DRIVE_STRENGTH_HI_SHIFT))
@@ -1419,10 +1422,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(107,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(108,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(109,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
 	NPCM8XX_PINCFG(114,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(115,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(116,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
@@ -1513,8 +1516,8 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(201,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
 	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(203,	faninx, MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
-	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
-	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
+	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
 	NPCM8XX_PINCFG(210,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(211,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(212,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	r3rxer, MFSEL6, 30,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
@@ -1954,6 +1957,56 @@ static int npcm8xx_set_slew_rate(struct npcm8xx_gpio *bank,
 	return 0;
 }
 
+static int npcm8xx_get_rg2_drive_strength(struct npcm8xx_pinctrl *npcm)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(npcm->gcr_regmap, NPCM8XX_GCR_DSCNT, &val);
+	if (ret)
+		return ret;
+
+	switch ((val & NPCM8XX_GCR_DSCNT_RG2DS_MASK) >>
+		NPCM8XX_GCR_DSCNT_RG2DS_SHIFT) {
+	case 0:
+		return 8;
+	case 1:
+		return 12;
+	case 2:
+		return 16;
+	case 3:
+		return 24;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int npcm8xx_set_rg2_drive_strength(struct npcm8xx_pinctrl *npcm, int nval)
+{
+	u32 val;
+
+	switch (nval) {
+	case 8:
+		val = 0;
+		break;
+	case 12:
+		val = 1;
+		break;
+	case 16:
+		val = 2;
+		break;
+	case 24:
+		val = 3;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return regmap_update_bits(npcm->gcr_regmap, NPCM8XX_GCR_DSCNT,
+				  NPCM8XX_GCR_DSCNT_RG2DS_MASK,
+				  val << NPCM8XX_GCR_DSCNT_RG2DS_SHIFT);
+}
+
 static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 				      unsigned int pin)
 {
@@ -1962,10 +2015,13 @@ static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
 	int gpio = pin % bank->chip.gc.ngpio;
 	unsigned long pinmask = BIT(gpio);
-	int flg, val;
-	u32 ds = 0;
+	int flg, ds;
+	u32 val;
 
 	flg = pincfg[pin].flag;
+	if (flg & DSTR_RG2)
+		return npcm8xx_get_rg2_drive_strength(npcm);
+
 	if (!(flg & DRIVE_STRENGTH_MASK))
 		return -EINVAL;
 
@@ -1984,6 +2040,9 @@ static int npcm8xx_set_drive_strength(struct npcm8xx_pinctrl *npcm,
 	int gpio = BIT(pin % bank->chip.gc.ngpio);
 	int v;
 
+	if (pincfg[pin].flag & DSTR_RG2)
+		return npcm8xx_set_rg2_drive_strength(npcm, nval);
+
 	v = pincfg[pin].flag & DRIVE_STRENGTH_MASK;
 
 	if (DSLO(v) == nval)
-- 
2.34.1


