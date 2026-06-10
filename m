Return-Path: <linux-gpio+bounces-38241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6l5CCqE7KWrzSgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:25:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544B6683DC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h3Ty1Ml+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38241-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38241-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC193014B05
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A84C3F076B;
	Wed, 10 Jun 2026 10:21:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A93EDE76
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086863; cv=none; b=WOT3SRK6mfjVa+ovTjH5zg+1yy09Fwez68fmDiG5LL8Ys3oKXXuHec9P1peDUCmHqAmd++Ju/ukDkwwhrm1wzvBmSq3bKpOS4Wwu7Gw1yW7EaNaRqWbqh5gYe39fdYtswDvXKDg8iiZ9dJjnHJg2ahJOxXS6H/qsJsoSwVyu7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086863; c=relaxed/simple;
	bh=oqCFls7mvbDi78AmlfEIReCmwgy1BeuT4n4FaEn6K+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtHF8CrIZ1Pro5S1KARCyj62rvqjS+rRKXg5XgplXUTNmbt0LlhbHcLuz7T9qBFDSfmtAgsqjPEyzjjpz1eWedbirOlqGUFwGiE6kwtZiTnKbcpiRjAEobvLl6a65u8/dJtAJkmttcCNTWbe0d3vJZPOJLJcDZXp6YrRpqU3Gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3Ty1Ml+; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3315c5dso68727435ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086861; x=1781691661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=h3Ty1Ml+Gfq0CZgQ2mXDqHywLwgtfJ5zrIbRZw0SEwwBPJcAT8wsgqOsv2DLom/CT/
         oHHrA7O8SJ2rHiKYi1iiTGmWE9HY6M4C+tw2HIWQT0AC/3YgVKVpUyCYmWaLQ/A09AhJ
         9z84yDMCJK74kUha3LSZMeBjHmqaS/C5lMRnyNzRfTNREJSek74mudNmkp/1tpP0RWOK
         gJNlebEdUKq8Usx0aPc3LyKGy6UjuuYskKl5VFXr5UDDpkm9WbAB8yu4JK8KOWRf1egq
         FCp/Pc400xswVtzP4LTGVT7yMOHMBY+YSSt7Hg8UXTZV14ddyDnZDZJUosK+Tfk6xpNB
         q+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086861; x=1781691661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=ftTwd0n5hvy1CReAGl9QBBpUCnVymxTRnDrOECy2ZJb7qeMcvPuHVnYDSZzB3zCQi8
         mGMZYaKlQpWHSdZqoc765nd6K84wNI81W6YKcxFt7PBYUqLQnBl7GO9W81XapNOO/RWv
         Bigj7RnHiBA/TtCKxT4WDSFVUBc3i1xkcjZsciLSK1ezZ74eUSWTFC+NVKU0cZFEZ6uJ
         xYlsJ6zJFwY+AHqIjERSg0iP7dRy2U4x1Tld8Cq4YjrE4Y/eeGPz3tMJhPkFR9WggHLb
         UscPj4WO2QYhRImQUV+Xok8ynTDFmHn1ILhZZcULfOWAdIew2l7UmO5wNLcyoywkcu0E
         au/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Cj+RXDBMTzXqjn0DwJdhOadAlXY9HuDieHB9GVVZxMbeJotGrpGY3OBuNh3TAHR84cdJN4EXggG23@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiEfRriYAd1hFyz/3mR3OA70A72Rc4EK1a+W2DIY+hIEloeej
	hzKoD4CKZSkksxER8cC2iXu6r1S/bSYKOJEhV7kcaUZQ7fOHar8k5RWP
X-Gm-Gg: Acq92OGq4ilaGGLxap2lpbuU7yWItIzeXZZL/OgpRyWIPN1uc2sduSz7tAnGcfzAEf6
	XxI0bcOwXGU3OvsLD/IpGWN7RmXpWOT9iQ7w4i5Ztewmth6cIcZRrErtcSfD6jnNsyX2LI87F4I
	WomZRhFeU2K/dxtD4CcqdWPaSASiWzsgEzJI56zIfyiSVqaagaSPj3m6TS5I5EiY1nq0D5DTw/H
	WpVgiGeYwyN6NVd5pKIuFwmKeyWLqbPwL3r+mct5W+Mz5LUz0ZDT6NsjGvFm1PpjdY+OlxiLs31
	aYLZ+cPWyGkQB3JZ1hruU30BV5fX2gzRXLaF3bv3ryBznRJS9U/eAqkwcWUTjZUgHAe3dPp65tR
	kzF+lJebfJeGoDW0WGCeNy7jyg0CHYDPix5HgItp208+6lJtM9KQOCZLH+JBuvSNDx5zt453JuQ
	cLsV5AGM+2+w9cGWUlT+Bx6asULtRnup4mZlPaZS4t8aURLRZ1xKEs5yMKR0C+ly83DUrGTLjF/
	j1f6j4=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr310019635ad.1.1781086861478;
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
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
Subject: [PATCH 05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:16 +0700
Message-ID: <20260610102021.83273-6-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38241-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 2544B6683DC

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the explicit mutex_lock()/mutex_unlock() pair to guard(mutex)
to simplify the locking logic and automatically release the mutex on
all exit paths.

This changes the mutex release point from immediately before dev_warn()
to automatic cleanup at scope exit. However, the affected path only emits
a warning and immediately returns -EINVAL, without any further processing.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index de5e1deaa167..b993ca2dbd7c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,7 +208,7 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
@@ -296,11 +296,9 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 		}
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
 		return -EINVAL;
 	}
-	mutex_unlock(&gpio_request_mutex);
 
 	return 0;
 }
-- 
2.43.0


