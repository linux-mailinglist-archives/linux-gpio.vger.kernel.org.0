Return-Path: <linux-gpio+bounces-34966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNfnDuHV12lZTggAu9opvQ
	(envelope-from <linux-gpio+bounces-34966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 18:37:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E33CDB5F
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 18:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F81E300D36C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 16:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AF33D16E7;
	Thu,  9 Apr 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UppKiqZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166123A4502
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775752670; cv=none; b=fokqAGkVg6wyWQmdILpL9u+3CSJOEer/Q58Z8memeUkwZnpkQlncNwr88noKLhS/dasUYiYNHWDmLK1++TPIWlzqI/Qeodm68MC6B1G6TKdMT2k/k1FPAocVHgRKrZ1U6bErpXUM52jSlbXT2lgq1G34OtzxD//P2tCDBMERMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775752670; c=relaxed/simple;
	bh=6+9Yq/J748bAsu3wFGlZ94P4MyPnEJjVFXdnEHAaBHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFdT096kGoCi7GWNbFeQfc1EfxfXhIzYS5yAKk6ofNme0IcLvjfhUjG0Heki0DuT8HjlnLz3XqnRwSG+qU9ztNRKyJevO3w6VmXzB8C9Cu6v6mHjgxJLDAEiiYVYDp+O9aCmcdfMJCLgrebTDiR4KMk/nxrghYK7AkiP5T10GK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UppKiqZX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf906b007so677123f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775752666; x=1776357466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXhkcwFnrqpZXSNcKJMXEOAfSe5R07qP9cSyRDKM2Kg=;
        b=UppKiqZXHC6Kw5QG9b9w01UO/P00rHaE2G5Ru6IzGSZlhNx0E1O0z7DfkYzZNwA+Bx
         +pts7pLflUa7B/SsCOHZ7rmnS9r/Hl+PjfAIJLbGvhkFc8Pb9siM+roMwsAMMEaprr4D
         8hLu874FZJf4SzsVmtnmOhsjN/efOcxJ64ze2Ia+2KF5pMAZLxsO+zK63mNJy/pSHPeH
         z3/7fZni4I6dBfd2gDjV0GdQ0fodRhREbiuiUFGJWWBrQwjc7nOVcuqc1t97UuO8zqfJ
         LlLsQ1O2h/2yn2BdHpaByVrO/lamzVmr1cggi1jwTX2tfQmTGiyIK0rPdtyTJhZ24TQh
         PxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775752666; x=1776357466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXhkcwFnrqpZXSNcKJMXEOAfSe5R07qP9cSyRDKM2Kg=;
        b=jayBzvuoZ8yR9haBjHK4/2vGU8rLEmAEZoMC03kxH+KxuUGAltjDFeCA6YO8VZU06+
         LndxQa5SukNVLUQRRJnK8lgC2yr0/mu+5nd9S5CaQK3wbxwv+D7+rLmMfVqcMfG7xIqC
         kkZnJXDtrD++xqdr4oLr+Y1xSiftm9rDhrTUfm8x1Q5MUDS7aH+bH6PvPlnDuw369NXD
         OX24TzcuDrF+EcJyrV2u2sonB5NEB9FwyjKWs4FvXDu/kvp/D0+A1dkBkK4KAiyQDKds
         drCxfsvUa04djDyIiV0R9jEYyGXC9o1foG2sr1jY6rNxflHaQJcXQfSoe2NhOSzuomRz
         4WPg==
X-Forwarded-Encrypted: i=1; AJvYcCXdUKq3aujbUzvj2RwD07BTVgydJYRA3bYHuwnBHkApxf3YQbPa6IJ4q12u1FnjfHmWcowCH5HhKuHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyfhaZ49r0n03adyvBrltK2tXiYVwz/FTuOZFObkCcwJZKksRZ1
	hQ5XblkGpRq2zC1uGZCqJJ/mXDZeJyxRDl0xsDhWvwu6UxNXuZ0X1r6P
X-Gm-Gg: AeBDietMN5hVdf4bWTQvOaIKtYt7x7z6G86jCeNb8M5qPeaaPej5zpKAD/+q+noeHw4
	ZKePGAGxMzmFcNSJKvUmnP6sdJd6j6axUVjD+G3QsG3lvvUNHwDfoM+zUDRxCOrdPkZtt1BzCN7
	FMy6zY4IbNJ//RHpK+G+pgfrmo3zist4rpNkxqlueaR3afHkAloofIV6XCMhKUftJ+ZFvgC5ELY
	aE9O1nlXZrzWdl1C17Z05VBv/FX9knhPLW7wAk8IhHGnsG/RtvkG5KNvZOOV5wDsxlocNTaDzcu
	wYigEh31LU5+2T3RSxO3BB151dB1wG3I972F5uPnx1q8HvMsr6K5z2vudgu+nuYjibG3cU9YRfE
	WDhsS8HPQ54DXS1JCngVVVCFqOISXS9nHEtdEsunOvmvluWwIg5AH4F2vaJmlb5ETCf28qDTlly
	f+OUu5MDaetdNCd+WvSMAMSJJO0Yh890fhPVL3x9tnpIMYUG4F5HBsjdfmBeYTSy/iPcBUC40qe
	VeqluP6IM7lX/2Nz1Y89yvIb3oKhZhbqVEN1lynQoldJw==
X-Received: by 2002:a05:6000:2903:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43d292e8001mr38314231f8f.39.1775752666272;
        Thu, 09 Apr 2026 09:37:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e6c9:3997:12f3:90d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm76587f8f.2.2026.04.09.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 09:37:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Add SR register cache for PM suspend/resume
Date: Thu,  9 Apr 2026 17:37:36 +0100
Message-ID: <20260409163736.2419396-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34966-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C90E33CDB5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Include the SR (Slew Rate) register in the PM suspend/resume register
cache.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 561e6018fd89..347926dad0c9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -322,6 +322,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @pupd: PUPD registers cache
  * @ien: IEN registers cache
  * @smt: SMT registers cache
+ * @sr: SR registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
  * @oen: Output Enable register cache
@@ -336,6 +337,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u32	*ien[2];
 	u32	*pupd[2];
 	u32	*smt;
+	u32	*sr;
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
@@ -2741,6 +2743,10 @@ static int rzg2l_pinctrl_reg_cache_alloc(struct rzg2l_pinctrl *pctrl)
 	if (!cache->smt)
 		return -ENOMEM;
 
+	cache->sr = devm_kcalloc(pctrl->dev, nports, sizeof(*cache->sr), GFP_KERNEL);
+	if (!cache->sr)
+		return -ENOMEM;
+
 	for (u8 i = 0; i < 2; i++) {
 		u32 n_dedicated_pins = pctrl->data->n_dedicated_pins;
 
@@ -3002,7 +3008,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
 
 	for (u32 port = 0; port < nports; port++) {
-		bool has_iolh, has_ien, has_pupd, has_smt;
+		bool has_iolh, has_ien, has_pupd, has_smt, has_sr;
 		u32 off, caps;
 		u8 pincnt;
 		u64 cfg;
@@ -3023,6 +3029,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		has_ien = !!(caps & PIN_CFG_IEN);
 		has_pupd = !!(caps & PIN_CFG_PUPD);
 		has_smt = !!(caps & PIN_CFG_SMT);
+		has_sr = !!(caps & PIN_CFG_SR);
 
 		if (suspend)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PFC(off), cache->pfc[port]);
@@ -3068,6 +3075,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 
 		if (has_smt)
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SMT(off), cache->smt[port]);
+
+		if (has_sr)
+			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + SR(off), cache->sr[port]);
 	}
 }
 
-- 
2.53.0


