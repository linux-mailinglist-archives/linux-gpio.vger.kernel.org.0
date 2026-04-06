Return-Path: <linux-gpio+bounces-34694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMA4Azs502kwgAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:40:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD853A1781
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5198301950B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 04:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA63634DCE3;
	Mon,  6 Apr 2026 04:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGv3t+uy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA02FE075
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450372; cv=none; b=d9N/jcgt6QhzeY7Yw8epFIfThlzQIAmdYmEyvPe52o8ubrMsf0y9ZYGKz4ukwcQEXoCRr00DMODIUP/Grc3PbgKuciGJSIRzDSWJ9DBWWB0yljh3DmDPyESFfpPfkWW+1cRPuJq765aKBFLQcOAc7N3X3laxEZcaHzCDC5z6M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450372; c=relaxed/simple;
	bh=Jp11lnnBrydu78xWpI7iQkASv1g6UtX/tycmB5OGwuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7NSomK3tIddcYvyOq2JhYD7ZC6VO/+Sh8v/y3zXDrV8XGcIxBf6crp0QQSjycjckR9+UnP9qHn07jVZDhNn36YFaZ6H2PvzXJlnAON8PFsjx4TxuPV3YowUBIfmY0i6IyI/Lst0RmxcqwcLOCdV8PhQeg4xvMbDoHiaf26hjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGv3t+uy; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12776bebe9fso8410503c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 21:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775450370; x=1776055170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bm4XXEcWjidns3Evs84tEMwqC2yXbhhjm6W1vqULni0=;
        b=LGv3t+uykzFn4AzECoZMV3TV+6IDSpFEr9A5rcl5TmCYxvMQ4GWOvDqbqkWEnQs99w
         WdVxwcTRyTvtsieQ7vasOOqDKuqwL8vO++Zgmjv96jli/meVRsuY/lGhWwGb0mQiMJd2
         5VCyEu5VS+DfzYriXJeIxmrGFLfeWQ0LWm7cxtMZOF4nxQTZkbnBNhfmiyaFHCeOt0LE
         Ox0RSQkMc6otHc59ztM4dFpEaHfbQ4cKQGFTRl21fpeNsOmldRe1JyWI9v+rT0vWr6lu
         BtzlqOZsnCJoD/RxpWbfrwkx34EcNWc2r+D3S35ImPasbfZDVLPSn6/Pvi7Qxjm5MqMM
         7UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450370; x=1776055170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bm4XXEcWjidns3Evs84tEMwqC2yXbhhjm6W1vqULni0=;
        b=EigHP8wa8yYDx+KLTd/9SfQW77sFd66mLpqFMU0bJEJI+ppFvg8QmJ6YLSrP6z3p5S
         sxHujj/GySF2tFAGHI+JY4BnVj9K8Warxc2OtZ+5FXRQroNOuMDp4J4dtzpWFHhW6f4y
         PmmA9ABfg2L3zx3YbUIbLhHF/A3K2BgW8onZKGH0Jr41loJZ7UaXgX7L02geaK9h1//y
         equOsGlMmWeNxba7Wg905N2oHRKhS01iM2OlNwJUjIUtNh5EYwzYjlpWIsgAsdUrEYBg
         iNOkXP2Jlz6kzwI9gGddUXjD0ZG2UpvdrvSXl0sjqOTYStETAhHpe85u/vy2izh/JuKO
         +mBA==
X-Forwarded-Encrypted: i=1; AJvYcCU38ulHSSqqKib2hhjstM2UyfuA+Kx17paSU7pSE8vD55Rq1EFgbFmGRYVhd0w2HVgJ8RNzV7Ijn4XE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvrh3gAzmXwqd7Vf9hfsptm5GnYvXRlMqxk3jGe0drN6da9WrL
	XYtyBRZRYQHDDWLWrmpp0WNG7rqZxs3/7fykJH1uGPxW+/gh0CqUXOIM
X-Gm-Gg: AeBDiesup75YcXXLQwAsKKCscGJ1mikbMb6LF+Fg5uDpjzjbJGtbzERIr8g5lljYQ2r
	101fY1FGhrQ+40CCiNuanw3otNX9eA0X1M/CGeuzf2iEgqEu/A19yPpquWkEH3RMZPCWFDy1mop
	PyBOnwCMA2uhc8JOS3BWkmBwUYDl7EdxnAxJuOXEN3dgLlstr7OpEyecPNFTGOAGhxiXoJWaxpp
	8sFw8ESeROQpLQL0GCsovq7VO3gmpEeybKsbbJ2J6MWLStMiGDUjwQWTYFF+8PF3+kYAP3OSi+v
	gowr1b7PBnsQLV61KkcMww5ykXMn2DTwTZ8nZ7H26GqNVziOvcwDOG80sRUc5LeGY06fUrIXKsN
	9icjORopoMpmX30EHwe6gbrABWQtGP+Z955Z+WLoFjxdoJrQc4UwqTYlSiLPZVrs94MNjLjlBC8
	KTreyYD/ZYqO9PcNni6y2ByhpkdTYm0/Jos99Im0IoxjHuNaCvebOtUM5Xh4IbXZ/SQdBReDDsv
	Fq9pyLUwZSuDiw=
X-Received: by 2002:a05:7022:6092:b0:128:cbc7:4c28 with SMTP id a92af1059eb24-12bfb771ab5mr5387632c88.35.1775450370259;
        Sun, 05 Apr 2026 21:39:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:fe13:98b9:9e98:d1bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm15182005c88.0.2026.04.05.21.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:39:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Apr 2026 21:39:23 -0700
Subject: [PATCH v5 1/4] iio: adc: ti-ads7950: switch to using guard()
 notation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-ti-ads7950-facelift-v5-1-1f980ed3cf9e@gmail.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34694-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7AD853A1781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

guard() notation allows early returns when encountering errors, making
control flow more obvious. Use it.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
2.53.0.1213.gd9a14994de-goog


