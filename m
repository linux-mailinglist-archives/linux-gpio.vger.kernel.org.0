Return-Path: <linux-gpio+bounces-32610-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMqJDWXYqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32610-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E103A217749
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8518B307E437
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8C13BED57;
	Thu,  5 Mar 2026 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K33Bjgkm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13133A711
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738522; cv=none; b=Wb/l95SULd/ZnU+48DablsYgSRlVMAoUJgi5I9fhNvmfFJEHAQciGJR8Lk6tU+CWQFIPerey1wOn0f5vx2wNEldcE0RTkpeRkEZ4FrLsRtJ8JYS+mpo3t5kB1iW6nTULRN74m6t4QCSyzg/iZp+xnJ1MlkJTvCRlsb6aDweMN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738522; c=relaxed/simple;
	bh=XVUWmg8j3ejye14jr+R8v/V5hJcLtfFCwO0Xfv6pPUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqC6Gcqv4t9xObzR+9gwqqVFMdqEWvv/9xF6IyuwYDpObcbS3CBa0CP9h8xtYPzzo7gprk+4q4J07LAjOhSe3XkJFPLWCgsfhn8LIGZvcN6SJlPma7XQHsQWRqdH37faXVhK4IjM0S+2GsoyGFy+fXi4qRRdlaj41cjuticcz/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K33Bjgkm; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be36d8495eso1058744eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738521; x=1773343321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5/kB0ndwJkYYZGbdBM/LgcKSk2jku2aKtlMXuF9DS4=;
        b=K33BjgkmHwlt+3gQJh3O/5EfoWOE0wPnzCnopROpyOzffVD7tzA/pKb1csMHdP8wrf
         8fppCxfacXKW9GgDBosKsmKn+XxJeSeQB7iPHGjqut5YhGaaVixcF+nLDfC2fze+m48w
         Wigfc5t042aRoX6X9dzxMZhEVluTdssjrfHFamWPtR6Bep/ctAEnQh0VhmmP9Zn+QQPs
         rmqgK+BJNoNFtuAMssQepPYt16IEPT7ponGKsJWW3THL5lXucsgKLsSHzLiFLmvEb5TA
         5f8rjHhPcScuSYkWZB+iZNrr0eOPsyaoFYrvmFCcacU/ZmqLVroy6gMJv8BQcIbrFQJN
         a/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738521; x=1773343321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5/kB0ndwJkYYZGbdBM/LgcKSk2jku2aKtlMXuF9DS4=;
        b=B7Em9C3BcK+mx9O/haoODmDN3E4WPVT67Jlgxovi5FAdgz1k2+th5g5fxRwaHstOV/
         MqkKM++mxnvkROMvG9zfmrYe7LPl+u1tr6aN1AtxSZntpTtiFiTEplVMIII1ovtGiMcD
         g8Room5ZL6sNou5NPAdNYHCJUqPFx5ArIVoA51t9jHjFQoqKCoE5zQ5Y4x2gvxftfNm9
         5/UOfyZfJPVLTF1Rm2aNF9PlemnrkQLenbhCHPdcgw6TbwoF1BbD67S71m8HItXTkbAg
         bCSbhjDcBGTr9l4+ui83eTyAcrmCiCXH9w26DzZ7hCEdGPgp30alqkqnSswWQXGKNel4
         /aYg==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZVxg9SNKcIxivv1eEpBMi/XdkTkRVEJS3F54HwYfIWx4DVKMLSRQ4kBAFpsHZv2L6u34r0JsSPTN@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6T3HCIYQycTIoFiE9V620dDrfQyXOJovnAXNsNDFNCFgLPyZ
	fUZSxmvT6nRBZbAu0ezTaXJ2OIugQeYj6KSc8iwFGNu2137IBzRJLJMKIDvPcg==
X-Gm-Gg: ATEYQzwpjsT98cAr/CuTZxmMFWDdg9ahm4iB51lma/ANw6K9JdgDXKUB7mFetWqXYDS
	EhzIx1PRiT2y3XaYg9GrbzggcwpSuZSaeNjzw004Jklnvf7dm4OjvcU0TjIT7VkQvowGP0UX2XZ
	fTz5/GGvGJ1aydj30dS0ixzU42XTuqZgYrdyXG0JQDkuCBPmyhUGuKbmWTLa1i9pC8Nyyc3itQc
	FhfXvWOK2NFnYd8aVc1g3amSC9Xj9q23hbStYGWQU+4GugXtikpeMCt1vDMAAemIWvMbt54KP6W
	PF5pTgWhA0xJNnQqLwbgFWAOVwgq/y8zJk3R867Dy2JRKQ7I/kcY1HvFACO15TviM5fdGSE9UHx
	s3A5RJm8YQf1DiFvqZCAEuQyWUZz+78OlqmK74xga4KV0f8/XaTJo4W7GIs7nbJwfiS0VNRUNqZ
	J7S9+LfIlaLtRjFHBZLgNUbadKCXg20UxSrjhATfWGb6uq4JO6rcoim8qly3wmUQutH7yPoMuO0
	JvqYU2FZHnBwQLTRR0ed3ttQg==
X-Received: by 2002:a05:7300:724f:b0:2be:fe8:8af6 with SMTP id 5a478bee46e88-2be3e62136emr1287405eec.17.1772738520860;
        Thu, 05 Mar 2026 11:22:00 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:22:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:55 -0800
Subject: [PATCH v3 4/6] iio: adc: ti-ads7950: simplify check for
 spi_setup() failures
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-4-a23fdd1a079e@gmail.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.15-dev-94184
X-Rspamd-Queue-Id: E103A217749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-32610-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

spi_setup() specifies that it returns 0 on success or negative error on
failure. Therefore we can simply check for the return code being 0 or
not.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 1515089dd759..273c35e03185 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -527,7 +527,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi->bits_per_word = 16;
 	spi->mode |= SPI_CS_WORD;
 	ret = spi_setup(spi);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&spi->dev, "Error in spi setup\n");
 		return ret;
 	}

-- 
2.53.0.473.g4a7958ca14-goog


