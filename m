Return-Path: <linux-gpio+bounces-34697-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCNZASU502kwgAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34697-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:40:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 066843A176A
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECAF330091D4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 04:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9704530FC0F;
	Mon,  6 Apr 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VybCdcSP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CDC3290AA
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 04:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450383; cv=none; b=E4nkpWgavkyDERx7nLnVKkmQ2fhFbydlhMDdrEbZmm/+Ag97927ZVO/bWVeemYkKBpx13ZHT+sxYEafHN8preJpGVuhKrKWHmu2xfJt2jtadTou+eyJZqwe2CoScvfJ1RNMm8QxF9kYYRsK6xiS1maitQrY7qlTLHgZIndcQ8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450383; c=relaxed/simple;
	bh=q1ErVgV21ILDuUcdhUgtkkx+/oTMzLm9AIurDmszr/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2qxlP6F22ngwpow8SqJrL1iJ2vleelzUjzHb7MKuUuR1W7WdBTVB8nCv3CgBNcyFhmNYPu7gPq50VZQbjzFAV+hxWRxtV69x+0/4BnKqbjjO2PQGfkPr61ceMAcOWnPte8TBAV2jHwbi4HUStTxN/UxG0xy3wN+29oDbLc8Ens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VybCdcSP; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a74039dc6so2519247c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775450376; x=1776055176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muAbhbsfMeNqO7iyxZwi7/vPm//pj1ujL1kw3AyjdRw=;
        b=VybCdcSPDY3l8Sdjo4ZN7cbq2f87d0EGqYZ0p3gLfuWSf5tzRsPZEpP/jAYnpYBhxI
         fdDZvi9Y7od3B/wUNsP+X+XCsaVuBFwCMaRKXIVteOX56zp1wxq/PbOHqwPajucC66Rf
         Cm52vQsMife9df5FFJGDrf7YvG9aLeZyO0SFM82icX7p60A3J88Z9Vbw5ZLYzDEnsyl5
         Z8M73TOrfL/4Da/+J76ScnaXQ2GdPR6/wGz+ydODIh4wrBR8z4fpEgmPrKaAW01WhEkO
         pcIKN8jpdtDmuwYGns3XjG0LnzyY/lmIUeW9a4xyQeHoDeOhZk69HhEZCg7rlfaa2+NH
         qwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450376; x=1776055176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muAbhbsfMeNqO7iyxZwi7/vPm//pj1ujL1kw3AyjdRw=;
        b=g9lk5jO8wnyKTIeJcFNNZA/FfZ4zeGPEJORciOfNfpLhJs9BYuCZ0wg4/avtuEKlXP
         QmahsF3gHVREMrZ1Dq9FNVzYVZ9rrP6pGwbZuLem9ueq1X37Kmr4sQjqW2srME0xli1p
         A0DlxY5p3qrtVbAZS2+DsLmCrQA/KUqyQJJkxKsBwKdee2GRdWHMtzyruz0xyVEsMMMf
         rjOshQNRWAE+YbMWCunBrG0NdThobqoXavtwt/MGF9GmntinqvosyPUrvca2HvHWLN4X
         5v7U2DSlZChgACFCthPJQ/uGg/fTIH+vJooLjvyRs72oj8W7X+vXULUH7B0RwzwSSdAd
         w+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW8y5yPvBZrjwDDaVAuaBuTt4Yx5U0gQdGNW03hl8zm/IeGJEoRU4z2Bu9jrhnoHoh1mJiyilNv/lSn@vger.kernel.org
X-Gm-Message-State: AOJu0YywsiHxUR75yY+2TD8A2WTREcv9G3LhuO08XUjlnezXXq4lbYLm
	+ySlK1tf4OJ46L+/s9wIzYAxcgCXYGA4vSSG2ZwMBiomYNI9N0yIPXXy
X-Gm-Gg: AeBDievzVX6+CTaeOoHo12xclSGYjoqDH1UFDDuxABxgBo0J0MfbkBmrSe1r4ZjGLuJ
	P+ClSmwBH300k1nmihDNF1KQ/l+v/PpXpI2S84ZblG15PsVGAQgSPzuX76UTz40aC4/vbmfrrwd
	ZB42oogJHmtCD333xmnfBbTNd7G6thrrlInV11IZPV5xtvNHYEoUbXg1n7dkxAlp/S0tYdAhFWH
	8Mm3RrZnnSbzpsoA9S8GOQigRgFCdQpVfCqRW1aqoeAV4O5b/1eql0hE+BssskaVEvOLCzc0XUo
	s3ICzfKS7hsHdiLOthlUqVbCerlJi7W4X8NED1es0Vd8P45+a9ZynIkhRcNKcbtqfP8ZaYfnKRk
	PFULNEPcXMpKqsHr2ls6mU/TBrlyT+BI//2midSz0pLKq5SEjq0BnrF/8gnDyWow0u/suAXKaaq
	OXKMG79qprTufGYKg+N4BXWpi3fsfBIOvKHzXLBvWhD1pdS8PmfX1uXXLa/SU43lH/uBwbZBOpr
	Q21W/2lV+xFeKU=
X-Received: by 2002:a05:7022:e02:b0:12b:f881:d8d0 with SMTP id a92af1059eb24-12bfb7459f4mr5048040c88.18.1775450376503;
        Sun, 05 Apr 2026 21:39:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:fe13:98b9:9e98:d1bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm15182005c88.0.2026.04.05.21.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:39:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Apr 2026 21:39:26 -0700
Subject: [PATCH v5 4/4] iio: adc: ti-ads7950: complete conversion to using
 managed resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-ti-ads7950-facelift-v5-4-1f980ed3cf9e@gmail.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
In-Reply-To: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34697-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 066843A176A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All resources that the driver needs have managed API now. Switch to
using them to make code clearer and drop ti_ads7950_remove().

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 70 ++++++++++++++------------------------------
 1 file changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 0b98c8e7385d..882b280d9e0b 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -506,10 +506,8 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi->bits_per_word = 16;
 	spi->mode |= SPI_CS_WORD;
 	ret = spi_setup(spi);
-	if (ret) {
-		dev_err(&spi->dev, "Error in spi setup\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&spi->dev, ret, "Error in spi setup\n");
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev)
@@ -517,8 +515,6 @@ static int ti_ads7950_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	spi_set_drvdata(spi, indio_dev);
-
 	st->spi = spi;
 
 	info = spi_get_device_match_data(spi);
@@ -559,7 +555,9 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi_message_init_with_transfers(&st->scan_single_msg,
 					st->scan_single_xfer, 3);
 
-	mutex_init(&st->slock);
+	ret = devm_mutex_init(&spi->dev, &st->slock);
+	if (ret)
+		return ret;
 
 	/* Use hard coded value for reference voltage in ACPI case */
 	if (ACPI_COMPANION(&spi->dev)) {
@@ -573,24 +571,22 @@ static int ti_ads7950_probe(struct spi_device *spi)
 		st->vref_mv = ret / 1000;
 	}
 
-	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-					 &ti_ads7950_trigger_handler, NULL);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to setup triggered buffer\n");
-		goto error_destroy_mutex;
-	}
+	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev, NULL,
+					      &ti_ads7950_trigger_handler,
+					      NULL);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to setup triggered buffer\n");
 
 	ret = ti_ads7950_init_hw(st);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to init adc chip\n");
-		goto error_cleanup_ring;
-	}
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to init adc chip\n");
 
-	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to register iio device\n");
-		goto error_cleanup_ring;
-	}
+	ret = devm_iio_device_register(&spi->dev, indio_dev);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to register iio device\n");
 
 	/* Add GPIO chip */
 	st->chip.label = dev_name(&st->spi->dev);
@@ -605,33 +601,12 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	st->chip.get = ti_ads7950_get;
 	st->chip.set = ti_ads7950_set;
 
-	ret = gpiochip_add_data(&st->chip, st);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to init GPIOs\n");
-		goto error_iio_device;
-	}
+	ret = devm_gpiochip_add_data(&spi->dev, &st->chip, st);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to init GPIOs\n");
 
 	return 0;
-
-error_iio_device:
-	iio_device_unregister(indio_dev);
-error_cleanup_ring:
-	iio_triggered_buffer_cleanup(indio_dev);
-error_destroy_mutex:
-	mutex_destroy(&st->slock);
-
-	return ret;
-}
-
-static void ti_ads7950_remove(struct spi_device *spi)
-{
-	struct iio_dev *indio_dev = spi_get_drvdata(spi);
-	struct ti_ads7950_state *st = iio_priv(indio_dev);
-
-	gpiochip_remove(&st->chip);
-	iio_device_unregister(indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
-	mutex_destroy(&st->slock);
 }
 
 static const struct spi_device_id ti_ads7950_id[] = {
@@ -674,7 +649,6 @@ static struct spi_driver ti_ads7950_driver = {
 		.of_match_table = ads7950_of_table,
 	},
 	.probe		= ti_ads7950_probe,
-	.remove		= ti_ads7950_remove,
 	.id_table	= ti_ads7950_id,
 };
 module_spi_driver(ti_ads7950_driver);

-- 
2.53.0.1213.gd9a14994de-goog


