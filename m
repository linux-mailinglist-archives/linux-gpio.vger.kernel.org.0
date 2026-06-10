Return-Path: <linux-gpio+bounces-38246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9u7qG1Q7KWreSgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:24:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE46683A7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ahUfTj7Y;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38246-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38246-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9832E31280E7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4295B3F6C3A;
	Wed, 10 Jun 2026 10:21:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F423F5BEC
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086885; cv=none; b=ZVyGzSYbzuMcrh8cZ3rwi6giV790xE2kLs/8lu3b+Ax45NYxKUtZFgUqecnDP1yoltw3bhUQ8HUW9OsA2sBVMmPOWUVp3gvmRhDUhjdNC/hpYXbYzCAjmd6FQJBCEJt301rbQrTAWFYbx29Lxuu3kpeEjA99Ws/xpPwCDC0X3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086885; c=relaxed/simple;
	bh=1D3oru0dFtWb5ZXGrKjETr+J2Jt5UjZXp2oe5HZM5mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZGs0fOWwvNahnLQoJdriRtAVnvqfqGGrkRh8ex8XcE+J5Ij8Osdu7Y6BJSkvDyzJYijHWGCVsVnIZ6ZRag8T1R0W2l5c3eMhRRl3Yr1OE2JaERzd1KftMBbLoxaAZANxsMqfsi78uqkFKz6c/NIB05uy1cxudCjaDroZUxZ7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahUfTj7Y; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf22d29dabso43946855ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086883; x=1781691683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=ahUfTj7YUV1Oy99+/ojOY1I+hwgbBRJy5SLsXUXIrcK+TDefPbH+aJBWVjwTKH/ca4
         tYYVGgB6BIP9ieu7nkD/TVQSKgOdNGc7LRIwP3y+4HN5RZLPo3MbgO8kyCLfGuBctV84
         q+IWmw80ykct+wClcHfVKesX+HKopEYbgfRgIuZlz+ZWekKg90oxX826e+sug0LQcMMa
         9FQQduXxHQ8ZC7n6c/FVLTLZ9MNC7p2CipVC6MBtPf5jmARBvp+jBqfqiOX6HzrJxDei
         fC3rjVfmFYkFA+oqezMlOBzhhQZ+SWXCmbVKd8vo66x8+qQHWRzjVb/dpPj/w1P4dtal
         /VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086883; x=1781691683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XujJTqPif96ZcsPOUAZQ6B5C/J5OqNB1kq3+Ep+LgvM=;
        b=CO1iuLvjDkDywUA0G6Gzc2t+jNn+J8pVq/2PIGvRIiwxnxQc7PSbPLucR/Y0TJyPuA
         +SNrSuBT2E+wUyhMqXAMGN61XK7/iHR8Yc2GGTUdanH/eBj1xP/CcA2aUSb8jOpPstZm
         /Qd4g97yTI98aI55zhcLACPZo/2qO+7QVHiEs4c4cipIiLatANOba4ORm2+Ki+WwCJbU
         B6nhkDJ8HuHwIZKO5eTFieWAUloI/ta3Nr2KWBfIP3Krl0+vvc6OzbnxGR3VFWcXekEZ
         +3+NRlknua+occagDDyv25neZZxUTcTwlUSeVwmwX2rPaAPI+IbgIgVXRO7xXepkaOKH
         DWww==
X-Forwarded-Encrypted: i=1; AFNElJ8klZzD407yx8cxWIx6rO43O1y18K+rmKSLHF7eBcS95JmDHYZuvf5JIgDiofblUSnu+TJUsLWi5lud@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4Dcsx/n7jYFCOMpfFmScyWjw3IX3qK8U7qWWlyBOYaJjbyCZ
	aAHdImQ+FAvYhZgl39G8X2ldyKTtCmjvRU7W4FPILFO/tP+nI07f5HT4
X-Gm-Gg: Acq92OGmnZMlVeBLlvSpxSrRC5prvgWU9rCfNQD6ZrZCkpy3oTWHvCD3cOa1gOaLQsk
	gJ4+qzygxc0Gl7PoAdu96nTUhlHTUy3SwTINuRgOyDKt910nN1JtEvfszckGMpmVJx62//kBfds
	PbxnsWFq1ZlJXPabS55GSUN135H3GG2sJyxFY7KMV/TLoFd/3D3dfd9385An5QIZP/h44H+iI30
	IDSxEn5hCUh7xsZhjSTakdT6VDZWOSq9yiCBM27DLQnz5pmRZUGr1UvX4/VqWzXhxa/RIlTaoue
	rVxSS38NznGPFxwZ+lqPZkssc4QBW4epsJJHb1cYS/tGMzELxo4mkyztNquPdsrktjCIiIi25+a
	3Z3nYpPZ0McpGK3bR0usGL95nemTLS4/xMB5vZtTvUtPCEsjocM89EiWOjoBz7jCjZ+Yc6lDCbd
	WAcwzB+5S/fGJ1FnQdgMdRFTooM2c52I3tvBC1nRTXImfeo/tNiFdtXz/7eUn18zcSSBZ8
X-Received: by 2002:a17:902:ef50:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2a1c99a9bmr82532235ad.28.1781086883340;
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:23 -0700 (PDT)
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
Subject: [PATCH 10/10] ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:21 +0700
Message-ID: <20260610102021.83273-11-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38246-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFCE46683A7

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cb9beb172ed5..a058973662b3 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -463,7 +463,6 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
 void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 {
 	int i;
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
@@ -475,7 +474,7 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	if (!i2s_data)
 		return;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	if (enable) {
 		i2s_data->i2s_out_on_ref_cnt++;
@@ -490,8 +489,6 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 		else if (i2s_data->i2s_out_on_ref_cnt < 0)
 			i2s_data->i2s_out_on_ref_cnt = 0;
 	}
-
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
 }
 
 static void mt8365_dai_set_enable(struct mtk_base_afe *afe,
-- 
2.43.0


