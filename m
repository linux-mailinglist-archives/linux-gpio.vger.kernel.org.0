Return-Path: <linux-gpio+bounces-32608-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P3BFVLYqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32608-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C16D217723
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE4EB3015156
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3E63822A3;
	Thu,  5 Mar 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKgbLoZa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A4313E1D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738520; cv=none; b=NCCv4fiqUPNYrRLcCm7udOFPM3ZY9dwS1u59BYled9Hlcux1ZKuxhC/4LXFi6FXsEYbgyxrnKxfw/ipFGLdkj9A8z26KjN93gWTnaYfpa3U2uR7zAwnIxdwgY68IbYa+ok2Py7eljIGSPpLSL1iNOKxHX4k/CohV9q1P54JtrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738520; c=relaxed/simple;
	bh=puVzQVVivVatnMzmHhQf7aghQyv1Ohkpm6fvRgahEf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FL5st107+OseCoymP4zkTbaLKezgbtjENy5gxDeTrduC4RShUXqx5r4HYdeAGEmf3Zyi7S+P6gYnFIVny4BTBFiKDIlwlwz+i+xXdb0XVqnu+AZnohBxn58xKPTHGM5boz1jNXfGVhPF69CZn/Ro6YkT3jcBEKsAQW2rFQWDNJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKgbLoZa; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1275910b930so5369203c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738518; x=1773343318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTfBwtx85kwVzzZ3HjdtefR3fnbTNSxXGk3ctCXP+Og=;
        b=UKgbLoZa1qLiM5v4KbLZrQeQWRp6IgTQNxIGdDhp5WTOl9r03jVJKw6jT4nshM8GQ+
         ycxvs5sdpkKIAnjyi+Y8f4/YgYwFhtVkPLcRxTaGz0erJ+T0qFRcDwdg9/q80TUuF7ym
         6YjaBe3Xahe0E6zvidOVukAwMdn60gyVprScVop2ahMZX0Ihj3FxPN5T+3OtG7BE9ySP
         9ppWbB4FPTnIBIKvKPGs8wFZ3w1kRByat9b/LO3orm8/QDnqkqpelo6qIXNYGmOU+pmr
         3JFt4g/ksvSFmYruHl5sAjXYVzIHVFHzvQRzr+uGjnT7k5AK6/mRJh6990ynGo4tB9JX
         l7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738518; x=1773343318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTfBwtx85kwVzzZ3HjdtefR3fnbTNSxXGk3ctCXP+Og=;
        b=HfbSm5Am9UW9DyCG6w+ZcUydCtbx01nnc0hPAS3iuuUPO5mHOrVBCdlHPpXnT+CuUt
         1Cbg80fb64FU7j0vm7p38CgjFt/GRIqHK3CrM/SmFh/Y3qTvPaTX/lrAwITyGF2GSYRS
         3CP75skOibsmUp1NscALJccjSmR2e4IvVeFvt+V5IiVP1VxJtSODXlYXKxHpsa/K/fwI
         De9Gbvj3gjeE5MK31d6NdWuyRz3pzBJdYB0Tj4IGSkrS5heejllFrUtBji2MLj5sDboq
         AuQCZDa/j4uduPgw2xlleb0vT3BwZawN2G7fDDZyFqGGywo0OWNtb7h9lR2Jbp0l5x6+
         HdUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV+9pOJkJgKB5x5jLAfLPloQ6P6QYWB6ZMk2uEuVerPW0gFbjScQPMeulegxkXCp20HBI4eYJAXOBu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqvQhWNWtg22y6VjrvYS36zyQv8qShepp5BrcZ31lC1ZSusyr
	4WuZa38ZqHjcNl0cWZANaTSLWoUtYU+bZ5/3D0xY6ZM8lMDNCMJvTWh5
X-Gm-Gg: ATEYQzzkLrLlBg2sjG+GB1rwiDKARSC8gg3E0bzbPcoEtjDgUPXuh641gZuVn8tqAL5
	z0hXlVeeca+oGsngUZ/LAhK4oj7qHFxuDcTkX3ycUdrm5EsoehIKnuP9MZUaqq/072uLPLNOrSL
	13LGbalyODHHts2GVcmCCFI9287S9wcYH6nZFf4S+N5+BwBNvCRTqwjYb6r5Po+EjXkPDv/qCMM
	P11SUvsN4eEJJxyIvBTym8hiplqDaM1oFMRnT16c3JROXNS1u0mCQQssj+qY3q3+Vsa2yV928/Y
	vvMMjKlxGC/RX+73TOxdf4LBEagM+OtiYh/9nBc4/R8bgrs7fzLJQtbu0Ss8ROf5slzXHgGqEIB
	HZ+H3x0+YoOPAzul+J2USLUBrLhjm6E/IE6nD3J26jZ+blGIiE2HtxHo4EtFb4KcRaYsaqwRyqI
	IuNl3KqKwYRFGhFQNhVod3vKfWRJbfRL8t0f49kmNGNZ+2tFopUMSvWqkrNVofDE1D7z8XuVNm3
	jhDOseMWtxJRUY=
X-Received: by 2002:a05:7022:2208:b0:123:3c65:d724 with SMTP id a92af1059eb24-128bc030d6fmr1068015c88.25.1772738518437;
        Thu, 05 Mar 2026 11:21:58 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:21:57 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:53 -0800
Subject: [PATCH v3 2/6] iio: adc: ti-ads7950: do not clobber gpio state in
 ti_ads7950_get()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-2-a23fdd1a079e@gmail.com>
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
X-Rspamd-Queue-Id: 6C16D217723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-32608-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Action: no action

GPIO state was inadvertently overwritten by the result of spi_sync(),
resulting in ti_ads7950_get() only returning 0 as GPIO state (or error).

Fix this by introducing a separate variable to hold the state.

Fixes: c97dce792dc8 ("iio: adc: ti-ads7950: add GPIO support")
Reported-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index b8cc39fc39fb..cdc624889559 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -427,13 +427,15 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+	bool state;
 	int ret;
 
 	mutex_lock(&st->slock);
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
-		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
+		state = st->cmd_settings_bitmask & BIT(offset);
+		ret = 0;
 		goto out;
 	}
 
@@ -444,7 +446,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		goto out;
 
-	ret = ((st->single_rx >> 12) & BIT(offset)) ? 1 : 0;
+	state = (st->single_rx >> 12) & BIT(offset);
 
 	/* Revert back to original settings */
 	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
@@ -456,7 +458,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 out:
 	mutex_unlock(&st->slock);
 
-	return ret;
+	return ret ?: state;
 }
 
 static int ti_ads7950_get_direction(struct gpio_chip *chip,

-- 
2.53.0.473.g4a7958ca14-goog


