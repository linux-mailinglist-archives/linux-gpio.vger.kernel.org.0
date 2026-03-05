Return-Path: <linux-gpio+bounces-32609-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ74J13YqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32609-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7B217739
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93EB307A11B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA8F30ACFB;
	Thu,  5 Mar 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9KcXdJm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7DE3806C3
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738522; cv=none; b=gNPj8y4bWszbea8Edj9GSH7awhJJy4bpD0JC7bsWyqNmaLI691gKzY+xPxrV+wsJsxbyZK1LsFqzXIilN6hdzVmMDtV3t2M5++Znp+gmZuCrfrhXW/z+7SPIW0PkGS76kRkSkEjvlTrzspfMVVDfd6Yf8jq2keVEob0DprDZf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738522; c=relaxed/simple;
	bh=3SWnArpUdPvh7sURBFPMyY8lv0kCsfhAdKB/7fgwDT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qc5rpkSOTiTmm+CF2fA3QYj1nMFvpaT9i3scmInmnczgG9g7ERcrrp+XxGUg7/48QiZiLfxaXbbSmasPqzsa+ARKBSM6A+EgtfySDuBpXIp16XUSDS9o2OzPk/VpifMUXYidoSA98DJPudX2VbQjROyULRPEjw/W5TYzQJNy0Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9KcXdJm; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732e6a123so892653c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738520; x=1773343320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRSHQ7gatZSUG3RtlqSDdsXge7aN0hna6nERoHcMWWI=;
        b=e9KcXdJmD95Na9Q6wV+O/tMphO4LEVfhZu6kYU3GrnJglzjoelJjBlmlG50kDZ3+EU
         jtDbyjwj9mvRWfJLv9fmYIrOesm7hvaQgSQgn+UxrUyj0JuwxbLbT8okGaTyWR2cCpjl
         DuvDcfZTBYs4bvV8sMNi/Crq6YlLawsR61CFNPfNFB8TxvOUVvmKkO/EC8bn2+vAQJNn
         EkK3+g8Uj/mnNvhE5cmn3hsKvZinweq4YGMC4N2wc7NtgMQUHI1Dsiy1UO3HL0zV/0qM
         MFDb+GL7yPxR+kQYSx+qjFRvgsN3jKBLKr5o1WGdRW3omxBzMhf5gCzW3u8Bs88x4YeR
         YufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738520; x=1773343320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRSHQ7gatZSUG3RtlqSDdsXge7aN0hna6nERoHcMWWI=;
        b=Oussy9nlSxXpGKz7/33WXT/ctZMsMrQ5Y7ILcTqst9rx5MrpbPTXm5fsd6ozKAi+iO
         SHxMEI/Vjd8hcU37vTsUbh491iTQmEVxppgZa4a10G5o4XDHDXVgWLln+7SsarC57pHg
         IFQK5pzoAGVOr/KdRzt1sqWdv9Zq2J7UH+TRfvCnz55gF47Lt151Ii1pR3hVDou+2lHp
         N7X2H+qCzletoAeEYdD39lq/Uc65OU4Kig+jlN0E/0W//l/j1j+U+ll4ptShOaJxpgw6
         7PdXWbMxH0SafDNR4/ORoprDdRRHf9p8pmxHkpwRacTIRPRNPQsG8tYTrofGgp+vMvLB
         a+sA==
X-Forwarded-Encrypted: i=1; AJvYcCXWKxPNv7IV/EAM0BfMS23mlDfIYmXHke4msg3qOvHBtMWNVU9Pht2bAU43d6O7bGuaqWL1HHrhMofm@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCB/jpuBMOJft10VNMk7VRWLXV8oOA+MMNiK2vUI3Iber5r8D
	gFs5Yryj080Ro4ZF2M+E4VKnnKbHvW/TGU3H0aL97hhreQEcCQINj8SD
X-Gm-Gg: ATEYQzx8N9BaBhIXYwdGZzMomE+sRRDVQFTmKDT29v+x52vhMDW8MEN7KytTanQjPol
	Pmxl9NvY5b/aD1WEt8OP2o8BWbqZCAiYov5p1x3ux4OHedNGuUjtq2GeHOnAVMUlCulossgro+2
	cCccjtV6FdVuPqyQsyYyLzvOZUq/2B82ncPBXuUWx9U93m6WeJZ/xlCfBMbbLlZs6TJ7Z3cUXEW
	l0Kmtj1OQHQMU5smnInbGXopAw4YQ46ylK0LOUONh3oiUIgZN6aNpx3SezRz0H/eDq7WE8PEoJo
	GcwFP1kZgCugKrmlxhGa+d4nAKe4xlK5sIgYzxUCWTZLAfJs2qDUDB9OyeCP7An5/sOwEKEA1Zx
	MwaWiM9ZvqUZbkWDxCM9TlEo5VFdFZGmhyEdLpFuG/vCzllBZuAWgAcXZ5UcZH9/cyiAcpowXRj
	tIZfGDq+G7iuCI5sSo7z0thNH+Ugft0JaUzZzmUB0KxtDzPvYeIpjFR0HNcG7bTJh1Fy88Qq1qw
	JirQs4hWS9F7Nc=
X-Received: by 2002:a05:7300:6c1f:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be30fbca17mr3113659eec.1.1772738519575;
        Thu, 05 Mar 2026 11:21:59 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:21:59 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:54 -0800
Subject: [PATCH v3 3/6] iio: adc: ti-ads7950: switch to using guard()
 notation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-3-a23fdd1a079e@gmail.com>
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
X-Rspamd-Queue-Id: 1CD7B217739
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-32609-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

guard() notation allows early returns when encountering errors, making
control flow more obvious. Use it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 75 ++++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 48 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index cdc624889559..1515089dd759 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -308,16 +308,17 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
 	int ret;
 
-	mutex_lock(&st->slock);
-	ret = spi_sync(st->spi, &st->ring_msg);
-	if (ret < 0)
-		goto out;
+	do {
+		guard(mutex)(&st->slock);
 
-	iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
-					   iio_get_time_ns(indio_dev));
+		ret = spi_sync(st->spi, &st->ring_msg);
+		if (ret)
+			break;
+
+		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
+						   iio_get_time_ns(indio_dev));
+	} while (0);
 
-out:
-	mutex_unlock(&st->slock);
 	iio_trigger_notify_done(indio_dev->trig);
 
 	return IRQ_HANDLED;
@@ -328,20 +329,16 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
 	int ret, cmd;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
+
 	cmd = TI_ADS7950_MAN_CMD(TI_ADS7950_CR_CHAN(ch));
 	st->single_tx = cmd;
 
 	ret = spi_sync(st->spi, &st->scan_single_msg);
 	if (ret)
-		goto out;
-
-	ret = st->single_rx;
-
-out:
-	mutex_unlock(&st->slock);
+		return ret;
 
-	return ret;
+	return st->single_rx;
 }
 
 static int ti_ads7950_get_range(struct ti_ads7950_state *st)
@@ -407,9 +404,8 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	if (value)
 		st->cmd_settings_bitmask |= BIT(offset);
@@ -417,11 +413,8 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 		st->cmd_settings_bitmask &= ~BIT(offset);
 
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-	mutex_unlock(&st->slock);
 
-	return ret;
+	return spi_sync(st->spi, &st->scan_single_msg);
 }
 
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
@@ -430,13 +423,12 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	bool state;
 	int ret;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
 		state = st->cmd_settings_bitmask & BIT(offset);
-		ret = 0;
-		goto out;
+		return state;
 	}
 
 	/* GPIO data bit sets SDO bits 12-15 to GPIO input */
@@ -444,7 +436,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
 	ret = spi_sync(st->spi, &st->scan_single_msg);
 	if (ret)
-		goto out;
+		return ret;
 
 	state = (st->single_rx >> 12) & BIT(offset);
 
@@ -453,12 +445,9 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
 	ret = spi_sync(st->spi, &st->scan_single_msg);
 	if (ret)
-		goto out;
-
-out:
-	mutex_unlock(&st->slock);
+		return ret;
 
-	return ret ?: state;
+	return state;
 }
 
 static int ti_ads7950_get_direction(struct gpio_chip *chip,
@@ -474,9 +463,8 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 				     int input)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret = 0;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Only change direction if needed */
 	if (input && (st->gpio_cmd_settings_bitmask & BIT(offset)))
@@ -484,15 +472,11 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 	else if (!input && !(st->gpio_cmd_settings_bitmask & BIT(offset)))
 		st->gpio_cmd_settings_bitmask |= BIT(offset);
 	else
-		goto out;
+		return 0;
 
 	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
 
-out:
-	mutex_unlock(&st->slock);
-
-	return ret;
+	return spi_sync(st->spi, &st->scan_single_msg);
 }
 
 static int ti_ads7950_direction_input(struct gpio_chip *chip,
@@ -515,9 +499,9 @@ static int ti_ads7950_direction_output(struct gpio_chip *chip,
 
 static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
 {
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Settings for Manual/Auto1/Auto2 commands */
 	/* Default to 5v ref */
@@ -525,17 +509,12 @@ static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
 	ret = spi_sync(st->spi, &st->scan_single_msg);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* Settings for GPIO command */
 	st->gpio_cmd_settings_bitmask = 0x0;
 	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-out:
-	mutex_unlock(&st->slock);
-
-	return ret;
+	return spi_sync(st->spi, &st->scan_single_msg);
 }
 
 static int ti_ads7950_probe(struct spi_device *spi)

-- 
2.53.0.473.g4a7958ca14-goog


