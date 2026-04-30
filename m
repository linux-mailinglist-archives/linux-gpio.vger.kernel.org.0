Return-Path: <linux-gpio+bounces-35850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEEHOi4i82nIxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:34:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D712349FE19
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 991D5300B599
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05B53A5E7F;
	Thu, 30 Apr 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGHUrYnt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD333A3816
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541671; cv=none; b=TbVRghKM77ogs3UFa+wQxOp80cTwqcZ4FrR1cnbSBqydpjJqYY0JmgVUnIUqjUuC1oLHY9tODGe8LPvkazCH/TtkLGnWHkdKdNhsPWlTpRK9XZ/0XVvyt9tA7Bsc18jmF4OD8tIpCrjqSHyUhE8Tf5j5RBigUzyVVycux1Qv5Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541671; c=relaxed/simple;
	bh=+VsM6Ck+0mhhhcVKrksxgtMDsF2usvUzWlIisd1MRss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Osx9EM6in5krpI3LratGxlVOGHAoQ5Zz1PEt74ratr7O9OevAD32QSsnbpirWr5pU78fI/lhEeM1xfhTbwrlts3KPXNyrKZBpm846kPqiOoJINY2MG1V/lEr9rXmtlgM0kcYJDOHPShIK782DR5Qa4gdbgN6zRCk6Fhp9/Xkmfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGHUrYnt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d70b3e159so371759f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541668; x=1778146468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKg3OC8AKD5+2DyohOa+42Ozw5Xain5YLEWs5Ro/WAo=;
        b=sGHUrYntl1yNwgfTuFDxFe27FNOB7qW+2NPFctc06VGgl2kxZEik0X5P9cNEehTybn
         kXzDX4zLK5YIJMz9/DcaWMB71KGXWxtiwMkIPQqYOxPbzHFmmn4XnjBzmKqe7gHvH7IZ
         t9xFm+eSdJEiZAFALsgMpEOjZZmy2fDTKNKKDiP/EOsXePT59B05mntltqszFN+SFzWH
         c2/u5Z6Aqo1dbOhy4AG6TEoXXxt9CvwzHrBuT22p+lxFn27L/NHwkj1Su9yoNCnZlMUt
         RCQWmMCZ+n/4zRolDoGhKYAeJzHvtuK8VJVNy0fT4IXRiLn7LWUrZFIaWm8kGycdcdL2
         YszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541668; x=1778146468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKg3OC8AKD5+2DyohOa+42Ozw5Xain5YLEWs5Ro/WAo=;
        b=C+/jbYEi/dvMcv2QWs/vhGM2PSEUnv8zg0BeIl5ZEPBfOlt1NqovIapg4Q5O3kAUxG
         CZGPap5qjNSoFoU/maCk9mLwDxtnjSKJ1gLMUDX1pTYufltaYGVO2GQuL/jg6JFtDC3d
         kJYP2FNA14j1f6OsoZjAZ20E9bIJz7O/0XTVnWlkUWGnlTgh0w/tgTeS0W0//Pz29Ptu
         J5VfEE6KKHJURN0nuuPqTbahvO1JUlw8pib52YGYsj4eNF51BOnwqhb0XBcwUSU3XFuA
         bVdbnCrbrAcNdbM5Nd+VHFR8fXktMyFotzxq2mL6I4O+Fcnls1ywo6R8I03SrQDrA1yY
         E2Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9CGS7cc5OpoSRQmxp5SZ8ztYpqbChwMUrOLXPV/y8gyFF+/yMxl6eScy2JimjkCqI0K4pDipHFmJ+i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx685sDctW3R+FdKfTC0W67lGO5b55rLDQMZ+m0kQJZaVkd9Kfs
	pnrtA8e7jfkR5OeYL52YBaRWDLqC9x6f/S4Y4ePykSHHXESdMiGMvvuE
X-Gm-Gg: AeBDieuAffnXBhO4t1A+p6UswJ+5xfbo8xWNT16kbliSXI/AUFJbk0YHaxkAN1lYLLs
	f4IJo5y4fzUbzILn4DvClmUO2pNl4aX9KuhYv9PBRUg9JiLPD616UXZPeEmPx7r45or5B/q2bdg
	OGpBA+mu1Cg3eXX33i2jRpEiBDvP4SQ3QXNtAWs1fyB6NYFCAm6es/kjqe84LC3yAx5+LYmfrq1
	CajH3uxhjANHk0LiLxG/Y0BWWrSSmU+TEkjeZaey+omSv8yXiEuEjpxSGKxt8vsQS3PPiNnhDfT
	d4QnmStsyuJ6guzUKaCF0uu74qeNAsDWLW2AD1MzgZUj5nXNrT3SkeyxhiWhshSsJeMbGzKeMKh
	lghWUW305hkUI2MsxHxBv7bHqe8Z0ei8fR4Zv1WNygjiZ4SXAPPVtp+jlvV1o4t35oG7q7rBRY9
	EPyhuP88RIGzRdTL8e6hMv5OKMlabtYas0VQ1ktRY+VLE7BReUasbjVs16
X-Received: by 2002:a05:6000:25c4:b0:43d:2f94:3b40 with SMTP id ffacd0b85a97d-4493c381e7dmr3475621f8f.6.1777541667841;
        Thu, 30 Apr 2026 02:34:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/7] pinctrl: renesas: rzg2l: Make QSPI register handling conditional
Date: Thu, 30 Apr 2026 10:34:07 +0100
Message-ID: <20260430093422.74812-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D712349FE19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35850-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

The QSPI register at offset 0x3008 is not present on all SoCs supported by
the RZ/G2L pinctrl driver. Unconditionally reading and writing this
register during suspend/resume on hardware that lacks it can cause
undefined behaviour.

Add a qspi field to rzg2l_register_offsets to allow per-SoC declaration of
the QSPI register offset, and guard the suspend/resume accesses with a
check on that field. Populate the offset only for the RZ/{G2L,G2LC,G2UL,
Five} hardware configuration, which is where the register is known to
exist.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index bc2154b69514..ca9d4a3ec737 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -145,7 +145,7 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008)
+#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -220,12 +220,14 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @sd_ch: SD_CH register offset
  * @eth_poc: ETH_POC register offset
  * @oen: OEN register offset
+ * @qspi: QSPI register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
 	u16 eth_poc;
 	u16 oen;
+	u16 qspi;
 };
 
 /**
@@ -3297,7 +3299,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
-	cache->qspi = readb(pctrl->base + QSPI);
+	if (regs->qspi)
+		cache->qspi = readb(pctrl->base + regs->qspi);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 
 	if (!atomic_read(&pctrl->wakeup_path))
@@ -3323,7 +3326,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 			return ret;
 	}
 
-	writeb(cache->qspi, pctrl->base + QSPI);
+	if (regs->qspi)
+		writeb(cache->qspi, pctrl->base + regs->qspi);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -3381,6 +3385,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 		.sd_ch = 0x3000,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
+		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
-- 
2.43.0


