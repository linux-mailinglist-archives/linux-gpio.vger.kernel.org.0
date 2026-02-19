Return-Path: <linux-gpio+bounces-31836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AxnLMZ1lmkIfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:30:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA915BB8F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB68F3058DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 02:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABE92773D8;
	Thu, 19 Feb 2026 02:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGgnh/Bo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F8271448
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468179; cv=none; b=i59kYvCSuZ6Jf4YVsreb6rEl56CVCpyVEwEzE9Gjt5Kw90A4j4vTqA2O1kP49AWtIAiROPeqXbsnhkKlGNHF2E0HsFs5iMjwviOHBriuYu9mnNW8Fhm3TXEBfbYwKmR7BGDbXyfZvVjOieiMLNcrrH3nCQ+Kh5o/LGGiV1SdJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468179; c=relaxed/simple;
	bh=2ptV1Xx56QfDBrLdYoSATcUoNP/8s/g1i+FnXCc7fjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llYFBMJJRxs656CCYthiU6engng7u0sDWQozepSBzQRuFYlXQ87Izcj32dlDZcCw4Z88AlhXdtSAvefnm8gFBuuV+QSta4TV85WIBxrzaoilkJbAOVTTR74q551jLoj1ah5ERYVHBb9WgiFDc2Ox37QQgYk9MsPPWxhpXelwrG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGgnh/Bo; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12721cd256bso463464c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771468178; x=1772072978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VoJX5vAwTEOYnmz7o7D9xEfXbcGfOzpGSFIbfxsNUg=;
        b=TGgnh/Boe6QQ+iF+sZfeqDa9Wi4yFH1/5ElXDenkc7mwKG37f88y9geMJZXtsAEK19
         b8HaQpzDuL9S4AEd7jmuWYeKLWElhJmXerEusM0ya1zkLhd+yxzWaewXK9+CRdelDtBe
         a4X/ivCm0IhyfuVxU78C0ZLgO1JT2WwPMOZcqKwbfCNz/B4sHVeSrHjZvfrSizHPnfZt
         Ub6Cu36wgSM0/sA6dsx43AdUN5OGh52nsFBLmXU00dVdc5xeKWFp0rJBHZLDt932ZoWM
         as9GuBhog2TyFF+7s84/HjheYU6VOx4eqs1RZRkQHT+LU976XMXKrmVlPSlOMakiUm8a
         QD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468178; x=1772072978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VoJX5vAwTEOYnmz7o7D9xEfXbcGfOzpGSFIbfxsNUg=;
        b=L8Zcne6eAlcupZzjPgNCtiW2hCXrxzNDtw2+Fr/98LX6Esf7DHANjRr5riUa5zm4DJ
         JJXvkJ8XOhHwPW5raEBSXb8wqkO7DanDWfvkq70BESmHIus0CYz6O4li0riTZD/3Ce9Y
         pTjAfFc8JT03LCCna4YfBbYB1r34sc/Svcn/Bm4zGsMHT24DMr06TQ6CPVAjLtrsf2Mg
         N/+QCr8XGbMXtcHvtjal+KqDTxt/qCi6rBi2itbvzr6FHAfeOIYRAAcOwpwd2GDzWHQM
         neAuAtqACpQZo1mkDTtviXxotojW0VrEDcU+hrLuJ5oT5XDScEBVtqmEpvySs+NoKud4
         eSnw==
X-Forwarded-Encrypted: i=1; AJvYcCXGofQHlo5jaDXT+OO/AZS0hTZuNxSpyUilb6epB4kblibT1sf4v4fMhVNb4fHxeh/74g+25vqSoIro@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJAMgjbcrb3gtCksVwiYg38KbBf5kHe/biVdxrC2HTKs/TzGQ
	8xje+F4NcDeG8nsBuoZXRkx7wUTIAtpnEVIQW00sD+pQMYVhKq806xBG
X-Gm-Gg: AZuq6aKgtG8/DQjJ2itcPy2vZeHbQ20K5R5+SSHY20eyUBAJadmZX45/ydp4Uj9nUKh
	CIzkwM0LkBBl2vya3la4oRgbRCWEJW4+f6dainh77cGLhaIoVNghanwNf03NzHKMh+saWEKRzq3
	/Y4OQzRkJgpLk//jNVz4hrTxYnIIGA6g6UVleD7hGgGXwz4/4RsIhLAip6uSod02+y6omKqmQD+
	JmEf5x/dY6D21LaNAFeAIE/TFuRv2YrmEGoGgV9wL3yPd3oEl+yWzjSDETg9SDfG95eofy3TmIH
	UCc8Rk9hdJfdRxq8+4bxnKYh4UwC/QZBQ0TVw5ILrfjjUSocm9sQ+slLvO10JqFG+Fj+/Un/8Bk
	8KPalzmCz0KrGt//98qCO7XwGHjTc9DvKx2wY8+3QWldW660LCV9JSP1sMvmx/OcaeE0A8OH93U
	93rsF7yDKOq7cjKN8c0jIg3upghxBbJyXXK14pkQMmdmHRhttCUwod91HEF8aWnDcwByzx8Qdim
	Bw//e2NX5NCSA4=
X-Received: by 2002:a05:7022:160a:b0:11a:2f10:fa46 with SMTP id a92af1059eb24-12741ae3323mr7734818c88.0.1771468177903;
        Wed, 18 Feb 2026 18:29:37 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm19609433eec.12.2026.02.18.18.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:29:37 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/4] iio: adc: ti-ads7950: do not clobber gpio state in ti_ads7950_get()
Date: Wed, 18 Feb 2026 18:29:26 -0800
Message-ID: <20260219022929.3558081-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31836-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32FA915BB8F
X-Rspamd-Action: no action

GPIO state was inadvertently overwritten by the result of sip_sync,
reuniting in ti_ads7950_get() only returning 0 as gpio state (or error).

Fix this by introducing a separate variable to hold the state.

Reported-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index b8cc39fc39fb..2a7d4a1d9fa9 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -427,13 +427,14 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret;
+	int ret = 0;
+	bool state;
 
 	mutex_lock(&st->slock);
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
-		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
+		state = st->cmd_settings_bitmask & BIT(offset);
 		goto out;
 	}
 
@@ -444,7 +445,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		goto out;
 
-	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
+	state = (st->single_rx >> 12) & BIT(offset);
 
 	/* Revert back to original settings */
 	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
@@ -456,7 +457,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 out:
 	mutex_unlock(&st->slock);
 
-	return ret;
+	return ret ?: state;
 }
 
 static int ti_ads7950_get_direction(struct gpio_chip *chip,
-- 
2.53.0.335.g19a08e0c02-goog


