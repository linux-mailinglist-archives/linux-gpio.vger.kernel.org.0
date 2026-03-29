Return-Path: <linux-gpio+bounces-34372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPFeJFisyWnn0wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:48:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11254354573
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A341A301326B
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 22:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0F836E482;
	Sun, 29 Mar 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgjaB1Ku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1E2E54AA
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 22:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774824435; cv=none; b=T9grH/HKu/CcHo1ESUXyM6B6Racs6ECr+aeu3tMuV+pimaDe4hvTUczHuIIihRpkO+P82as60YoSMXdsYGW7gDo+KIn6ro5YOVXeYY9gUt13W+LFOfEDQeQm/1zXFDdwKb/DkVofOp+VQA46KTIt1T+L5lLDbOdRrfjDA5b7LuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774824435; c=relaxed/simple;
	bh=xIe8W+1jIXINgmxwa9p/U0LcjRjeCYfnSgMBa9JCf9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJKR5VgKrDQ5XnzQgn0+PGQNQUAgwfLTSuDAvxRuDZ/CVKLqaxu6EGvtKw80yGT0zGJHuf2AH0m2SBad8Zsbk/xVfnylZAlX1MRcs6RerRznfRWfeeP1SP7TeTi+tqR1D7gWyydMFU8d8NQ6BWAVVktCfAcY7SxNmBC6VTdsHy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgjaB1Ku; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c56aa62931so467036eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774824433; x=1775429233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vjudEEXqzxPRbybQTwtbPdouiJ0uhGQsqsaFK6mvh4=;
        b=pgjaB1KuyntZIlWVUj4gkhYhItg5ID7LnV7IN+zlMzTuT5k7K0X2b64ipOwahkRfQu
         Uys5MpawM0bA+SEdkOgt34sDbT7X4FUoczU7DiqN0kwPBZwV78HD7JqZcVEcUmYYkbw9
         K9Ngu5jNsgdm7IDMN9XoflcC74cFiQ7TWvqaYLwS9+N/SazV/yJkVARRhs9ig9f+NwJ1
         bhqpQJz09ikLGygGo7MxUQNryGSWbHC7nDNhK1v95htuvRPK7EJOv/oEI3sH+u1Tfrhw
         XFtd51vQUtpdiSb8/hxdaBlzlIde8P/W/uC5klvzcNcLhMpAwcit6I8iq9cSvTDyALoF
         Kveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824433; x=1775429233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vjudEEXqzxPRbybQTwtbPdouiJ0uhGQsqsaFK6mvh4=;
        b=swWRoB3wV+N7eu5tejWAAb1LgBZrY4RbEmDUlTxjEfqQrWqJjMF2BU7Htait3gjk+2
         He/qgN2be0N3GD9bjsHDJPD81bi44s5BLCXKmZJRSSFayQIOvHDzb0h+1l0julh/EWfY
         0RmQ2j4QRKycjZvilHijAm7EivPOtOvqySvBhMw3cuE5j/dD6GaTPishEJrJrvZZBNSy
         CyNGiILCB7r+vUbbg6FGbJWcywrj2FGPdBfgroPXREY21c/7uXBH9zsRb9ah7h8CiIJE
         7gs0/PZMRMsWG1O4VvkgtESJDyfXgnJYqzj1ggttW4NBaZ7D7BPbqq09+3N5tuTrcuh1
         ydgw==
X-Forwarded-Encrypted: i=1; AJvYcCUYLZE/w6/N0iVtsigOQyGD+X0og4ERT3IDRdTOxZPAFry7iRWpa9WIu/JBIA9vr7Ur9LIZohvq9PdG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0+ec3bjU5o0sUPqEdpGeEOqC1wwXvhZuBwQ9G8I3wBkEwDC3
	f7qEJ0USptjMbiHbYyDSMsBjJGvyT0Iyta5waEUk3JxSx6hdiY40eiyG
X-Gm-Gg: ATEYQzyUfykbX+6urghG2qIZt3CmaVFG/ARdA4nUU+TwHQCptk4lJjEeMTJq8Rk0otC
	MFTXzTlPzJD5pIOE0XDURAAfUsE7JzRA4H/5zng6PoqBylL4ak4+v3ZVtdCB8iGMMWbTHUFj9Vh
	r4eVBYkUV5ausjoczjCan02up3rGQg0VV63HemKRzcgDw3oTSNqCmgdjTx56+2u/Z/EhRM3vz/Y
	AMXbgZWj6jxijYVwNVWQCGDZSQ0yidiBwOF7HXol0QjIHeRWLvoSXdWEPcTsce3VRx/p2deOgUl
	r9hQiTnFDgQGZeA/5DG0ZHKyOtph4b7dZ1KXtPfG9IzaMtt2Ds1v/SDFjenlNVASSsu1iqSGnUM
	LXkg5H+9bFKsOF/uDwqkr09+twoQOWZchr/AGnFPowWyx6s5YQp3TdOuuJ4R7iyYtrWH0u+IH+w
	marjkirpXlf3V6YwugSJ3s+hLg7ygJkBAK++9ZIfBVyuk0i5wtnGrQ49Ie+9E+xTlmY5mXHRPAo
	O0xpH2mIAFYmbQ=
X-Received: by 2002:a05:7301:3d19:b0:2ba:7875:10c9 with SMTP id 5a478bee46e88-2c185e4da2dmr5231209eec.26.1774824433027;
        Sun, 29 Mar 2026 15:47:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm5840295eec.30.2026.03.29.15.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:47:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 15:47:06 -0700
Subject: [PATCH v4 1/4] iio: adc: ti-ads7950: switch to using guard()
 notation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ti-ads7950-facelift-v4-1-c568c508c49a@gmail.com>
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
In-Reply-To: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34372-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 11254354573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

guard() notation allows early returns when encountering errors, making
control flow more obvious. Use it.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 83 +++++++++++++++++---------------------------
 1 file changed, 31 insertions(+), 52 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 028acd42741f..6e9ea9cc33bf 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -299,18 +299,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
 	int ret;
 
-	mutex_lock(&st->slock);
-	ret = spi_sync(st->spi, &st->ring_msg);
-	if (ret < 0)
-		goto out;
-
-	iio_push_to_buffers_with_ts_unaligned(indio_dev, &st->rx_buf[2],
-					      sizeof(*st->rx_buf) *
-					      TI_ADS7950_MAX_CHAN,
-					      iio_get_time_ns(indio_dev));
-
-out:
-	mutex_unlock(&st->slock);
+	do {
+		guard(mutex)(&st->slock);
+
+		ret = spi_sync(st->spi, &st->ring_msg);
+		if (ret)
+			break;
+
+		iio_push_to_buffers_with_ts_unaligned(indio_dev, &st->rx_buf[2],
+						      sizeof(*st->rx_buf) *
+						      TI_ADS7950_MAX_CHAN,
+						      iio_get_time_ns(indio_dev));
+	} while (0);
+
 	iio_trigger_notify_done(indio_dev->trig);
 
 	return IRQ_HANDLED;
@@ -321,20 +322,16 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
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
@@ -400,9 +397,8 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	if (value)
 		st->cmd_settings_bitmask |= BIT(offset);
@@ -410,11 +406,8 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 		st->cmd_settings_bitmask &= ~BIT(offset);
 
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-	mutex_unlock(&st->slock);
 
-	return ret;
+	return spi_sync(st->spi, &st->scan_single_msg);
 }
 
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
@@ -423,13 +416,12 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
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
@@ -437,7 +429,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
 	ret = spi_sync(st->spi, &st->scan_single_msg);
 	if (ret)
-		goto out;
+		return ret;
 
 	state = (st->single_rx >> 12) & BIT(offset);
 
@@ -446,12 +438,9 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
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
@@ -467,9 +456,8 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 				     int input)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret = 0;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Only change direction if needed */
 	if (input && (st->gpio_cmd_settings_bitmask & BIT(offset)))
@@ -477,15 +465,11 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 	else if (!input && !(st->gpio_cmd_settings_bitmask & BIT(offset)))
 		st->gpio_cmd_settings_bitmask |= BIT(offset);
 	else
-		goto out;
+		return 0;
 
 	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-out:
-	mutex_unlock(&st->slock);
 
-	return ret;
+	return spi_sync(st->spi, &st->scan_single_msg);
 }
 
 static int ti_ads7950_direction_input(struct gpio_chip *chip,
@@ -508,9 +492,9 @@ static int ti_ads7950_direction_output(struct gpio_chip *chip,
 
 static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
 {
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Settings for Manual/Auto1/Auto2 commands */
 	/* Default to 5v ref */
@@ -518,17 +502,12 @@ static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
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
2.53.0.1018.g2bb0e51243-goog


