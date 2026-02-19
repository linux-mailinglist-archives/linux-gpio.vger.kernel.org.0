Return-Path: <linux-gpio+bounces-31837-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK9tA+l1lmkIfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31837-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:31:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCBE15BBAD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 03:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA773069AE7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 02:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C5327CCEE;
	Thu, 19 Feb 2026 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtHtzM2l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F64275AEB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468181; cv=none; b=t+x2JyTMANaQiw+bHFeJz7TD7I1tK50teBVPXvhziI2Hu+dQDF9cGpGNaGk/wmfE+l99vSnSvgrVqGi3y17uLlcRzmDJ3AdkqkpW8oH+CMqZ93rXp9GzR2oTyiM8N6VjLE3y0k2ud7d2D0Qg9nDIFWqUG2za0bTMNDwKe1a1o9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468181; c=relaxed/simple;
	bh=Yz9snSJF0jeyCudaLTFzwfAA3jyjKzrb0jhPuElnXuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jq5BjeGscvPvt6zpvv6bE/n8CfOXSBg4eo0zo0Khh/i2UePz2u1FgP6HlQDfk9WrNv4wuBTEOf/9t7QRX5Wm3FV10zbXcsNODkxz0uTWmFwl9Yu0lk64DY50DuQTuFNyaMqk3YSAaBCtj41myJ0hVaLpzgml4ui/zLtHUAfmdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtHtzM2l; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127423bea4bso1038313c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771468179; x=1772072979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuFP5v7SMXV4DVA+yxAHBbrT46M+siIg2POmogyVVsY=;
        b=UtHtzM2lxzp+aVqNpkpV0VGus6Ik+wkkq+fE+DX2axiIBVubjliikcWR6RnT2dUcbM
         L5905v9z7fjdbcyO5KhRYiS+5xxI0fTg2BJFkkJ2KbRZMwR0MNPYqE21HZe8DBLjG+YF
         h20X1XMVPgYmLOsTIFCHa1E31Kzm0oVMia/s/DNrpnYumrrUczikmryEVj9s5RA8iDmY
         5O8ol0W9r3Iqk2+2YHVDy2pW+9ZNZMbbHob3y9J5bLALpXZsBwE1RmoijLcOF+mn3L8i
         u1/yAnwjuaedBiYcPipiPQz7LQ1eDejy8kyukMBw0LBgRvbAaHLWHMcN8Y3RosnB4yJi
         vc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468179; x=1772072979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OuFP5v7SMXV4DVA+yxAHBbrT46M+siIg2POmogyVVsY=;
        b=gl7JanmF/qPzca3CSp8taXCct/35PSoG2J6FKCJGW2MkJPmQjfcuxObL6T514WWOSw
         H51kt5iqcfltxvVyql/mbS8R+2MI+QcTqKxXHMH1CyQ2KHAdMj9cDxPsNI2JLpGufKW0
         JtF9OWfB/0BCjQQePKj+ySPjwORefgacazsR3NdgJVKduXOKseTtetSAh6zKDuFiKmZk
         3CK3wTxztdnBImm3yKtm34fk6pODvHRq5iob/6gWfk2zfjZ+zrgKm+B7qZhGcsMOR75L
         hjP2c0wXVM3F0a8UjKG8x5+fDh6J6J9DZ2g9UgNd6lg8lPzixS024exraWgwoQCtLTpv
         fW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5s/FPl7U4wpjn7KIoMihsOfz4o7vAApXd0eF5qRRbCXzheDbwxEaMWfCKciqHNH0bY9nYHCcrQ3Jr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yTETd0PrU0pKslevJ3/Iu3kU17xxxFHuPubkzJpJaJgdLyAg
	H4qRBJL75ewYFL0JZqXPq5AB0XiLXZXE1kfjjdZXE8TeB9xdEB9Dpf0q
X-Gm-Gg: AZuq6aK6o83P9m3wM7hzwOhK2upu6gZtYrCMG05tc5gBf1ywbnCFEXKyJJAwD/6/P+f
	/J2/7brGc35odmnmcmpr7EwMQtbt61UlrLuktzg72ZkJXk7skwPlBAYzDOk8/E0yWBuJt6MYAnB
	+Pm9gUEVzDebZhoEKhGawJmX4k9cpOFN/XH7siVMXv2x+UjEGwF89ZccByJOszwqyhYyRx1zzVh
	LKjG8wNbmTyWZmAFwKoVsecVBmgAyJIDcjMew25hgL6FwN2Y/A58mXnxgFZozZTEcqfMEyU0czp
	VIdYsT10JxPlkzFsY5lFtLh7xi7vtEXOQByYTL/cfuDD5JuxVRx4VXqP7oQDXyQGpXlCbOZgxnJ
	ntyg+UrZZJ4+K6biHHq3MU2Ww8eHsjMlKTfUm3s6cm5hee5Z0xJKw1ECsGDnfvKnbxua9qD5y5e
	sMf3xgF0/GUtJI9lez+WGBIsluuWwzmvAInyjGfuvkB4DqI6PocOdH5qBEiTq4wACHWWSQbpPXT
	AzXVa4Iklc79RA=
X-Received: by 2002:a05:7301:d19:b0:2ba:659f:2002 with SMTP id 5a478bee46e88-2babc3c8a4dmr8115517eec.15.1771468178933;
        Wed, 18 Feb 2026 18:29:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm19609433eec.12.2026.02.18.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:29:38 -0800 (PST)
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
Subject: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard() notation
Date: Wed, 18 Feb 2026 18:29:27 -0800
Message-ID: <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-31837-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6CCBE15BBAD
X-Rspamd-Action: no action

guard() notation allows early returns when encountering errors, making
control flow more obvious. Use it.

Also variables that now only hold error codes (or 0) are renamed to
"error" to make their purpose clearer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 105 ++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 57 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 2a7d4a1d9fa9..d31397f37ec4 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -306,18 +306,17 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
-	int ret;
+	int error;
 
-	mutex_lock(&st->slock);
-	ret = spi_sync(st->spi, &st->ring_msg);
-	if (ret < 0)
-		goto out;
+	scoped_guard(mutex, &st->slock) {
+		error = spi_sync(st->spi, &st->ring_msg);
+		if (error)
+			break;
 
-	iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
-					   iio_get_time_ns(indio_dev));
+		iio_push_to_buffers_with_timestamp(indio_dev, &st->rx_buf[2],
+						   iio_get_time_ns(indio_dev));
+	}
 
-out:
-	mutex_unlock(&st->slock);
 	iio_trigger_notify_done(indio_dev->trig);
 
 	return IRQ_HANDLED;
@@ -326,22 +325,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
 static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 {
 	struct ti_ads7950_state *st = iio_priv(indio_dev);
-	int ret, cmd;
+	int error;
+	int cmd;
+
+	guard(mutex)(&st->slock);
 
-	mutex_lock(&st->slock);
 	cmd = TI_ADS7950_MAN_CMD(TI_ADS7950_CR_CHAN(ch));
 	st->single_tx = cmd;
 
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-	if (ret)
-		goto out;
-
-	ret = st->single_rx;
-
-out:
-	mutex_unlock(&st->slock);
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
-	return ret;
+	return st->single_rx;
 }
 
 static int ti_ads7950_get_range(struct ti_ads7950_state *st)
@@ -407,9 +403,9 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret;
+	int error;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	if (value)
 		st->cmd_settings_bitmask |= BIT(offset);
@@ -417,47 +413,44 @@ static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 		st->cmd_settings_bitmask &= ~BIT(offset);
 
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-	mutex_unlock(&st->slock);
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret = 0;
 	bool state;
+	int error;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
 		state = st->cmd_settings_bitmask & BIT(offset);
-		goto out;
+		return state;
 	}
 
 	/* GPIO data bit sets SDO bits 12-15 to GPIO input */
 	st->cmd_settings_bitmask |= TI_ADS7950_CR_GPIO_DATA;
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-	if (ret)
-		goto out;
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
 	state = (st->single_rx >> 12) & BIT(offset);
 
 	/* Revert back to original settings */
 	st->cmd_settings_bitmask &= ~TI_ADS7950_CR_GPIO_DATA;
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-	if (ret)
-		goto out;
-
-out:
-	mutex_unlock(&st->slock);
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
-	return ret ?: state;
+	return state;
 }
 
 static int ti_ads7950_get_direction(struct gpio_chip *chip,
@@ -473,9 +466,9 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 				     int input)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
-	int ret = 0;
+	int error;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Only change direction if needed */
 	if (input && (st->gpio_cmd_settings_bitmask & BIT(offset)))
@@ -483,15 +476,14 @@ static int _ti_ads7950_set_direction(struct gpio_chip *chip, int offset,
 	else if (!input && !(st->gpio_cmd_settings_bitmask & BIT(offset)))
 		st->gpio_cmd_settings_bitmask |= BIT(offset);
 	else
-		goto out;
+		return 0;
 
 	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
-out:
-	mutex_unlock(&st->slock);
-
-	return ret;
+	return 0;
 }
 
 static int ti_ads7950_direction_input(struct gpio_chip *chip,
@@ -514,27 +506,26 @@ static int ti_ads7950_direction_output(struct gpio_chip *chip,
 
 static int ti_ads7950_init_hw(struct ti_ads7950_state *st)
 {
-	int ret = 0;
+	int error;
 
-	mutex_lock(&st->slock);
+	guard(mutex)(&st->slock);
 
 	/* Settings for Manual/Auto1/Auto2 commands */
 	/* Default to 5v ref */
 	st->cmd_settings_bitmask = TI_ADS7950_CR_RANGE_5V;
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-	if (ret)
-		goto out;
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
 	/* Settings for GPIO command */
 	st->gpio_cmd_settings_bitmask = 0x0;
 	st->single_tx = TI_ADS7950_GPIO_CMD_SETTINGS(st);
-	ret = spi_sync(st->spi, &st->scan_single_msg);
-
-out:
-	mutex_unlock(&st->slock);
+	error = spi_sync(st->spi, &st->scan_single_msg);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int ti_ads7950_probe(struct spi_device *spi)
-- 
2.53.0.335.g19a08e0c02-goog


