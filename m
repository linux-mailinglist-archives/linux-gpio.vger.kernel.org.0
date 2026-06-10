Return-Path: <linux-gpio+bounces-38240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +MdFHOw6KWrKSgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:22:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DF668366
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:22:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hklkRN3M;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38240-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38240-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFB9630F9B32
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6065A3D566D;
	Wed, 10 Jun 2026 10:20:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5B3F0743
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:20:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086859; cv=none; b=gunndBhFzW6cf64vjMzVl6LFlHoIb4uqiLp/0la5i0KL2lh2WP/sKlZORxOKHyGIGepBzTtJ7wfGf1qKpyhsENrd8BUs2pI87mZ5zl0P/VXVtVFGdkZPIMCn/lbnSHLILa8tbvi53HnNwjVR7ZO90qwgdUDfKcv6IeZ7YuYMscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086859; c=relaxed/simple;
	bh=GFuEUxUc113IL3PLMCauoqpBjPzqAuM/CYALRcyREmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZHBgBcY8U6nYbnpKZZ1h5apxuXr3eXyxZp7wZELWSyOV+ZRnWXi/wI5iGp09Tm1NHEKj35RUhryxpSFZKq7MSvlFoHhyfH5rK1qsbnidPGdk40RVaFdNHwlQbM6mYxptogtSDtK3T9TyE1Dx6dfRVGAzaGI3hE8VDjfM7TpyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hklkRN3M; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0aa420401so50755565ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086857; x=1781691657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=hklkRN3M0YeSfzBRBSKiH9zBBf1nJkvLFiaw9KuUHtbSOKHLJR6o+ZCaAbc9ypT+5F
         hrug+/e4WbGDfuTHXbQJvVysnEbXmhnW7mAkgzRoHaLE+3h3fmkIaqqBEQTKsqDFNqoJ
         kISj17RICOF+dD+rOgqsYVqfCia1ElJh94EcAcqfCDdxVVn+6p66lPh2F6oQ9ggqAWdR
         pzRe3xuuhN8UnsSO4V6tGoPO1KlcGN71aAYyOtdraFtejLdFkgKV2gIrznnd3qZ0Fl2j
         d638RMjOTWwhqFZY72ntZRbprldRElFVEeoXGmE4jSl9rtt4SYIMTCoxAPy/QhzlBXDC
         CDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086857; x=1781691657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQ1CB1xaItZwOeJMb8jfEb8OFmetyjBrvgHBbV+tv7c=;
        b=PQCJ/xh21jX97TCtJiAN+FVLzg/IYxNuSQG3tuPbUW2XyYcX6iQXr/k1brLLGHVQIX
         KXYC7z63C9kzRjPy0QygEJnTKQfG5CFPW4Y3DdWRdd/4zfIt0J9TEdYE+omEikpAzuDr
         XIGJzkbgtlvRGC6Tr4Yz85Zrr5NFD5bfMgWhIa3n5ur8SymdX5kCRflyoGKMLlpYX3yt
         Bkq755/R+MGPSskeSzQWfnGSGMjkDVjiN7oDvFyyMU0ubtU2jdow0oehTbLdPPsQ3h4r
         sbA9T4yThrMCI8N+HJtjMo+Fa1CpRCSdLDJU2ENcIDwbvHjWymST2Tk2qoBjs/sfUl1o
         Achg==
X-Forwarded-Encrypted: i=1; AFNElJ8DqDmaPmralAyB8a/nKHMQWd0F+LIJjVK2hdnal8j6Y/DSSJ7YwIdhBfMdzcLBpGiUcJteLVGNDjUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRA0ZWWLcxa7kKuUnahdN5JMrbMMUF9DuGqdjVDuB41/OzBpge
	rb0HV77a/QXuQg+50qxHXVRMyhhyVW0H4B8f6HauK+e5B4SwoCrGHCr6
X-Gm-Gg: Acq92OGLgZUhl61toYyp/IlAToSYZ1hulwoRVxeiznoTpr5f2UQP/Spi21F6SSE8faV
	Om80XNH7GauEF7Idhd/ldBtlvK3TmL52zl/ABAfkwMqrDhiJdvJA/sp7RIXTMKA4hThfDRbTwh7
	T/IuKQPka6fD0v898QxcPnh7N9RU0icrnYGyvadFypGTwW4siniY/J2lX3LhX1QwIvfO1D2u0gS
	bCQpO7P0VYrpTFU5E7A/AOI8wyzsukhmrBO8K79ZPrh7tRyQ/89gdIaXIL2WMLKvrlRQ00dbe7C
	RJhVQDn9Q+tWR3jBLJij2vwz3ElAfdmGrG0I1w5ZNX6VzWL5Rx9WK6T/R6i+tkFt/4/RckYqrXN
	oF74WNMMMHrEiGvmfcQD5lUb5cQPTSJn69T5jcwvAQar9TERW3vvGHsvxrRovkd66xgBXf9fcdy
	t4r4zAXXQvPflFBKEjyNXtYM4/2dd3k4pLj1shA2ml0PGvIOJO9BkEldUUcroL8g1f8p++
X-Received: by 2002:a17:902:c40f:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c2bd0d3f54mr41954845ad.11.1781086857182;
        Wed, 10 Jun 2026 03:20:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:56 -0700 (PDT)
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
Subject: [PATCH 04/10] ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:15 +0700
Message-ID: <20260610102021.83273-5-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38240-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA9DF668366

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 7f411b857782..fc6cb3f0469e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -301,7 +301,6 @@ static int mt8188_afe_disable_tuner_clk(struct mtk_base_afe *afe,
 static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
-	unsigned long flags;
 	int ret;
 
 	if (!cfg)
@@ -315,8 +314,7 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&cfg->ctrl_lock, flags);
-
+	guard(spinlock_irqsave)(&cfg->ctrl_lock);
 	cfg->ref_cnt++;
 	if (cfg->ref_cnt == 1)
 		regmap_update_bits(afe->regmap,
@@ -324,32 +322,27 @@ static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int i
 				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
 				   BIT(cfg->tuner_en_shift));
 
-	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
-
 	return 0;
 }
 
 static int mt8188_afe_disable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
 {
 	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
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
 
 	ret = mt8188_afe_disable_tuner_clk(afe, id);
 	if (ret)
-- 
2.43.0


