Return-Path: <linux-gpio+bounces-34696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BqjCBA502kwgAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:39:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B615F3A1753
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 422FB30066B8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 04:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A356307494;
	Mon,  6 Apr 2026 04:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5HFP4tP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA93128DF
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450376; cv=none; b=qUeGwJXmaWDX3Ag8iUfiWzlpkFv+LcUDWxquezHqMmWaDUlfSv/wYERHLeNbplhfTSWXljU3NMTNbxAp6NeIExJzgY9FgG1g0CWf7y9RXOWgDjigKYDfpE5ivAsZRlQJHgQj8DGfs06GPc54OXKkRmsaBQWU4xXcC4Is64ajQm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450376; c=relaxed/simple;
	bh=jWsQsT6/Mu9a3P6wxYYDo0MqxdW/7rVXJ/kMeejbGis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWDQKI5uNjGBrdT+XfV+XUjE6zseChrjlR8OxA/P4viqP/pHvL+jBFOK8ft7Jx5FdcFn8VKWjQpKlnVpIOA6CT7R9J9lhnBoZ7z95SdSle7G15eo90SzncPyBKHIXU1wamjnpwkSUjrQwqnOj2RxhdZT3YCICIlXMT13cwKCi28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5HFP4tP; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-126ea4b77adso3916990c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 21:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775450374; x=1776055174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBFK0WbO5+WLvAVMP/XY5fTWFLTdlcIvaSfOJd72QI8=;
        b=G5HFP4tPadZfkQBFCUPuTy0QHjXGZZusDCKuwFTdy7ODZYC6OoCQV5ZRoMPDEM+Tr9
         mYmsXA/MEdAbi+PkxdhACPiR2IlyK1kLsPyyT6K1Yxx++IN58Q90MFJyHt7g9knbVjU8
         /wLcFnLso1Yx9xrn5qOs4MjvdMMPgEmMNVi8QVMmWShsCpfEjMMS4Xi4Hh3QscCTJFqK
         lO+VMrZX0jZQJ68OXBWhq64MOwMTYFRmK3k1RBhW7ge+SpAMuyqsSV4i7wXJoGKti7+y
         pyU1S1L73jxZBWiFY41h/wHysiiKOwt+g+k52yPjrd0O48pieSDb3H9kT/xbRmLWARX2
         4SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450374; x=1776055174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBFK0WbO5+WLvAVMP/XY5fTWFLTdlcIvaSfOJd72QI8=;
        b=EIHFkJmQ7+xIWp2UM9EhhDZwkvoIl8kJkg4XFhqwpTpoeFwmtLA4oCjZMs2IG2+fuh
         kqpI53ow2FS8b2l/oWr4PM+KrOoJpA4sBAyDBZNA9iyjoTQGGZw8VfKJq4S6ybwrO1mc
         9/+fkZtUj5k1kxHq27FT/nNu/Qxlof0tnitM71aBwsD3yd/fW7LQUXwi/0G73D5eFLo3
         kJwjzGtQS+v/y4vVBnDFILGerKKoegCmB+igRK5KHW8Yrp2ny0lbLOyXXqUIlaGkAKVW
         Tdt2zVal2nyZd5XciDPOUFL4dNfLOI5Us9AKbcgu4w+/7fYMTPF8es6fw8LLiDx5QHxz
         dyLg==
X-Forwarded-Encrypted: i=1; AJvYcCX2dLDIKZ21/+dWHkeX8wnxsppnba8YAAFffLpgXgOpNwN/ZeMjfitwpBwDZDDg3XvoqjWxKPtTbGIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnEKM2sjdBXKSYKlkhqyzN6eXk2GGnYkh2K21N5IDm7FYK1Qt
	oSUDABPBhlICSoEaGdrR3cJjMeb1ivgKdC6rv8YEbrnluCeTSH97VLd9
X-Gm-Gg: AeBDiev/WBXoQWa4IAAL2+8ZNR6P/smQ4fpzY78UPNvOWd7QZBAQGzh4P4iHFU4Iy7y
	bnXitgrMMrEE8zCYHAdWyl25/FOvGcKZie605snvEHF1tsWPD16GXLZS+qDZGBK38QNKN+zkdFV
	3dsS+4o8HDQoiNhD6Zl0/WTM6nJsxKosA3xFObyKIww6iZkEVT+zz2S8b9cRFwOKyI+AzUPT2D6
	h6n0bsyNlyKwJYCBpKBF85LrpNF71omWyM46THwMVkk5xa6begkSTeDdhefDKUkakeLy8VDCJNU
	GEst14kPZ6kFaS0Y/+Jk9O9thNUdBlevPPYjNbucv8vUm2dcu3hLtVSRgoheNemin+5NYpXKRFu
	c1hhOv74SiXcUwZa/SU6S3C+wwZw66chhDNykWm1+M7MEBVVQWM/6s+a4af3jv52tbw7xRWkcxE
	E/1CxY8KdpXwMM7M6iOWYMFMadtEYQMR30wNjrD0Du49sgYAXkmg9qP0dMYVF7LJk/1RekZf81V
	qFH+XdxT9KHldM=
X-Received: by 2002:a05:7022:48c:b0:128:d084:e921 with SMTP id a92af1059eb24-12bfb70dd27mr5179501c88.14.1775450374090;
        Sun, 05 Apr 2026 21:39:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:fe13:98b9:9e98:d1bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm15182005c88.0.2026.04.05.21.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:39:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Apr 2026 21:39:25 -0700
Subject: [PATCH v5 3/4] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-ti-ads7950-facelift-v5-3-1f980ed3cf9e@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34696-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: B615F3A1753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The regulator is enabled for the entire time the driver is bound to the
device, and we only need to access it to fetch voltage, which can be
done at probe time.

Switch to using devm_regulator_get_enable_read_voltage() which
simplifies probing and unbinding code.

Suggested-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 48 ++++++++++++--------------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index c31c706c92a9..0b98c8e7385d 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -334,19 +334,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
 	return st->single_rx;
 }
 
-static int ti_ads7950_get_range(struct ti_ads7950_state *st)
+static unsigned int ti_ads7950_get_range(struct ti_ads7950_state *st)
 {
-	int vref;
-
-	if (st->vref_mv) {
-		vref = st->vref_mv;
-	} else {
-		vref = regulator_get_voltage(st->reg);
-		if (vref < 0)
-			return vref;
-
-		vref /= 1000;
-	}
+	unsigned int vref = st->vref_mv;
 
 	if (st->cmd_settings_bitmask & TI_ADS7950_CR_RANGE_5V)
 		vref *= 2;
@@ -375,11 +365,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
 
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-		ret = ti_ads7950_get_range(st);
-		if (ret < 0)
-			return ret;
-
-		*val = ret;
+		*val = ti_ads7950_get_range(st);
 		*val2 = (1 << chan->scan_type.realbits) - 1;
 
 		return IIO_VAL_FRACTIONAL;
@@ -573,30 +559,25 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi_message_init_with_transfers(&st->scan_single_msg,
 					st->scan_single_xfer, 3);
 
-	/* Use hard coded value for reference voltage in ACPI case */
-	if (ACPI_COMPANION(&spi->dev))
-		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
-
 	mutex_init(&st->slock);
 
-	st->reg = devm_regulator_get(&spi->dev, "vref");
-	if (IS_ERR(st->reg)) {
-		ret = dev_err_probe(&spi->dev, PTR_ERR(st->reg),
-				     "Failed to get regulator \"vref\"\n");
-		goto error_destroy_mutex;
-	}
+	/* Use hard coded value for reference voltage in ACPI case */
+	if (ACPI_COMPANION(&spi->dev)) {
+		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
+	} else {
+		ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
+		if (ret < 0)
+			return dev_err_probe(&spi->dev, ret,
+					     "Failed to get regulator \"vref\"\n");
 
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable regulator \"vref\"\n");
-		goto error_destroy_mutex;
+		st->vref_mv = ret / 1000;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
 					 &ti_ads7950_trigger_handler, NULL);
 	if (ret) {
 		dev_err(&spi->dev, "Failed to setup triggered buffer\n");
-		goto error_disable_reg;
+		goto error_destroy_mutex;
 	}
 
 	ret = ti_ads7950_init_hw(st);
@@ -636,8 +617,6 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	iio_device_unregister(indio_dev);
 error_cleanup_ring:
 	iio_triggered_buffer_cleanup(indio_dev);
-error_disable_reg:
-	regulator_disable(st->reg);
 error_destroy_mutex:
 	mutex_destroy(&st->slock);
 
@@ -652,7 +631,6 @@ static void ti_ads7950_remove(struct spi_device *spi)
 	gpiochip_remove(&st->chip);
 	iio_device_unregister(indio_dev);
 	iio_triggered_buffer_cleanup(indio_dev);
-	regulator_disable(st->reg);
 	mutex_destroy(&st->slock);
 }
 

-- 
2.53.0.1213.gd9a14994de-goog


