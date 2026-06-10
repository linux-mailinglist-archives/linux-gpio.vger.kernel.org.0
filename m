Return-Path: <linux-gpio+bounces-38242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQ/gDsQ7KWr5SgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:26:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 737556683EB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:26:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K2IZVRVO;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38242-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38242-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C79ED306FB79
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CAB3F44C8;
	Wed, 10 Jun 2026 10:21:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C43EFD05
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086869; cv=none; b=t9zvDFUgKb0k2GhHBnj5rysYXCfVz1SCzqUSyCgd1Za/YsthFDraCinyWyNR6GjYdfiUZwfqraMjdoIDOYd9jaoZZoUShQMh/TRs81F72Wa/F6Iq7TH/e56wII6THNkCWFl9MuvZvqyD5ysBstBp1ASW5/if1HMO29PxcuyFN80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086869; c=relaxed/simple;
	bh=z2piZvL+mAaTAYZdczqHMzsCaYv/janICW5fPxWoyjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNdklL5Zt9yuUfakC/UFS9I1vtcBLu32QOrjsTGsUxuDvcniVVv4RV6d4KaQq3an1Vb9S92A2aUPp/3+CE1Fuk++Nz1DqqWRV6TQVT88ODMfVwRGOcq3nJHomTdUwzybOePj/SCvrow/Wt5Ia3Q/yRYqKOqHnRDqbnb09NM+Ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2IZVRVO; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55308215ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086866; x=1781691666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=K2IZVRVOqj+COv0SbmJ7yk0zYbPidm9/KYimjxAtqCWa0hMtfKdB0+4W92gy82OCek
         8wwAx2f2EEw5rUf4RJCqmrh8fmOGcw4pVLWJPVGKel4zIEZdV0Ud0/Upg5y2OTt+FeaQ
         qAjIImt7thDHlc3NjDjJAqp+Zyz4zhhg0zjJk9dFaiE9JQ7NQnPbvZU8tStDHMgj4a56
         wW2KZ57986BpU0/5L73nhxq9G2qb2rnDKUbYpGinDN1lSGb/SLdbz7OTgaw1RiimMx+u
         BDDdvqAn4SLY4XE7MQkghCePt30kcrYCb+c0gjgTlS+44PauY44s5nCo9W7KS1Qui5KH
         bHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086866; x=1781691666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6PfHdZyZ58+lAvtt9QURTlmXybxBjprQ5FeV+lzJh6Y=;
        b=ij7/J2FX72H0q7K7BlU02Sh6zo9qq95uLEavSA70UWwWqMoUSTRKQ5FtIiM300llKF
         yBl40RjxCR/4C54ooHSjLI4FjG+gtgiPvTArWUYj1oJerHaFp/yF9bD2cHK84CtND+oZ
         k9Tptdclie5qjmUDSSd+tK9/nJqKfP6ET58j5rpNM8GSZ6W4E1BgKfhyOkPhImKEdUxi
         uqC1VFC2o5ARZYYJms1cf9515M8gfTJxVLU//hfat/JnZn5MPB1rsXSMKTg/oDLOowE/
         l/JLLKQHtCc+GaRlGshKkw/kIo41280JLRMkSvRsgwd6Rgs5tTjnyKHH552j7ydNxIpw
         AJLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZckyZw4oToB+K2F1HQr9xSWwgIjBbtoxPoLuGBS6i6gv6tKZ77ZP4Z+UeG6/i32Kk+6d9rNyOPxLf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9d9LaVGhSG5pRasAk4lLs9oixOF8kwkP/BI3JkbySEUIjn+Yf
	YCnplzTrODVK8FXqjj/Z5XdKddTs1q18P0S8mReKqYT2GaekBKaGNMLV
X-Gm-Gg: Acq92OHGPcmfTxw2GTB04WmEs2EzWYtBFAsS2tvejhrHzJBaekL297QqWgm1lTVIybu
	BAdDbl3YhVLv9uTiDQdbbBQNhn+fiQ8jsgWqm52y/2Fqu06ChHjqNiFezg389u6XlaWKK2UAOrX
	ZRKtYYAi+7v165UBt+2D+EEFaty2a7CttZwdB6+zHfG+tDHxea0jrCT9PvngFxXAEcGhweZ3nYC
	rGuxOBvl6fcMiYFh87vyQMwqO73hg0xHFTy5Y3a72kkBcNHvgt2tqfXlA1zhSKSIGojueETylGh
	m2K3gAJAgdSKzU6mpgyO47var/W4uxKeT8tZdqkI1DivIE6M7qB47p1UXK9+4vaDRH060AGir45
	ScJKcst7aou4eSDb7XAhe7SAYuUgMqnsuKufg+B6j6sx/7UvhBm1YqyH2LHKDv3HvasmQWBBSZA
	qbzSvxhZ4jl/WPnhuthMzo0ZnLpg/QoohzOPo1XuUWWSxc/j8Mn+/vFUl7kA8bUlxwrOOAeAYa8
	2y72p0=
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr265633925ad.19.1781086866069;
        Wed, 10 Jun 2026 03:21:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:17 +0700
Message-ID: <20260610102021.83273-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38242-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 737556683EB

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 42 ++++++++++------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index f35318ae0739..618d8400913a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -283,7 +283,6 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 					unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -297,16 +296,14 @@ static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt++;
-	if (cfg->ref_cnt == 1)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   1 << cfg->tuner_en_shift);
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt++;
+		if (cfg->ref_cnt == 1)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   1 << cfg->tuner_en_shift);
+	}
 
 	return 0;
 }
@@ -315,24 +312,21 @@ static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
 					 unsigned int id)
 {
 	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
 		return -EINVAL;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
-	cfg->ref_cnt--;
-	if (cfg->ref_cnt == 0)
-		regmap_update_bits(afe->regmap,
-				   cfg->tuner_en_reg,
-				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
-				   0 << cfg->tuner_en_shift);
-	else if (cfg->ref_cnt < 0)
-		cfg->ref_cnt = 0;
-
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+	scoped_guard(spinlock_irqsave, &cfg->ctrl_lock) {
+		cfg->ref_cnt--;
+		if (cfg->ref_cnt == 0)
+			regmap_update_bits(afe->regmap,
+					   cfg->tuner_en_reg,
+					   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+					   0 << cfg->tuner_en_shift);
+		else if (cfg->ref_cnt < 0)
+			cfg->ref_cnt = 0;
+	}
 
 	ret = mt8195_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0


