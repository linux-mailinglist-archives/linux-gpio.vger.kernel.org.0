Return-Path: <linux-gpio+bounces-34375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHj/NQysyWnn0wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:47:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D0354554
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 900F0300D624
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 22:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24369372B59;
	Sun, 29 Mar 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfewBTZe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817237BE64
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774824442; cv=none; b=kCKsIgc/Iw9doC7gmS9eX5tfDx2phxs7GTgiIw2Foq02wlTWhWGn8pd72pCkBc11TN2ZDh9uvGPydJ73039XMWUMINNV2JgH9q9+s3ZgdCKhzh/V0S9POUJtBl/rc01Y4icnp1DH3eCteZGmt+w1amcbrgJzESYi6lEoMYvGOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774824442; c=relaxed/simple;
	bh=vwpbqrdZWg2IZwLAqAvEpGuR5LpR+6ltHKabiSi+AJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6NDTF6dKdBI59hQwUbcALVltJX8pSQlCxMAracPQ2pGnJw4C5j4nBB+szo0BmqOrF4Bh39h/SXRRKfEBV5chedw2Kx71aVBUJO/K6KERZ699i/jrSGoNcaNP78biwv1UDTZ8ZS6AG1QbgF+DZmj6dgWIk1ZF1KKo77FszjpjbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfewBTZe; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c54c68db4dso1391309eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774824437; x=1775429237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+M5YsOq3vk2JVYTGrQ8f5AMbXIKgHmkOF2OORVkBAw=;
        b=cfewBTZeel9IF/6M+EKcatDd1aajhVSb5EHkuvat9le936bVm77lu0t9j3HCktW8ah
         o3iflk+1eZPzNsmt/xIifQtLyks/9pu5M5YWo5KvOHaqAloB2H2iPitpNCnxCHwPsm8W
         iMtQDs9oIkcXQmND30JFKYDa77nrxeXOTHayQy5syFNohe9nCSGZZlcIhTLKUgMo7Fjm
         KAT7lCF9pf9OrJEIichFEJ0OHuZXhjuNu9tqiG9hKP1YWDxTcjpkwgk2FuCxJL0pdyBf
         z98LwKgu5Jy4z3IvsVDbt85xhpFgl9ymFn8W7E0ooRb0FCPfhQGMNB5EzCTmqvDfjMAf
         9ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824437; x=1775429237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+M5YsOq3vk2JVYTGrQ8f5AMbXIKgHmkOF2OORVkBAw=;
        b=Q5OB+RCju1P8o2qTzOskZgnZrAR9J8CuEn7WedHR0BHkn8udo5qX6CXHM3LRNRefLw
         CJBMjUgyXeN9fZKQkTy3Qynyd42VpyMquYCJ6AhKs6b7vMmBNdYhm1Kiqv4Kj9+7f/Kx
         l6IHbjg1jR+ge/yRH8vVfEI/idR7APsy8NRL/831UR3NMzja/deaUNDw02g2G65blR3r
         oQkqByYyVfD9z9BvRPLGFtPMe6Mhb3jISbo/rIPC6D/pyQZQHKWMjUdiCNc/2jI0I17j
         lxpnxusSDQvdLZZ2Edcq3PRDflaLp9Dfk0J6Cs5yUzWVKVHDzuCsF4GHLCtDZWd1CJVf
         suHg==
X-Forwarded-Encrypted: i=1; AJvYcCXKQgoR35qYBf/n7ABZwliGGAfDcJWRId0SEgkEFg45HTz5Nr8cfJjlaNAxI0wVKZGUDzkwETLpsDsu@vger.kernel.org
X-Gm-Message-State: AOJu0YzDnAbkoilbuNxXDpuupQbnNgoO56FzfsPAUiA3GeDtOIlK1j7q
	aXQ00fV0g8m+oSJsH46aE4IwLgu3QOf5tJJWBipbtkSpohEx/km0Q9aQ
X-Gm-Gg: ATEYQzzEDx78y1aLxdLG4WhPap9IB8zdHvy0rtbW4QvKWnig2zLVPSAbp05RkqsdgPZ
	txWSGgBZ/4TzriPO92d8ui+ajVpljYjC5XyUMYexQuPCUYiSh5icXBtAd8c1N2q57v03cz+pKqW
	4CSB9FwKurc/jo0b+Z9DL9dIbs4bnDj9ZA+rmleqInaaXvRzqypD8BJ9yhHX7wq5GvAj71ckTIL
	JJLDhA/SO2i1tYgfcNVd/nPQ+SlW3HB+Z5tjgaImTL5hLRZ0BMjOvmOkDLb2LohSx5ewlI7496X
	sEm2iA/9aS889S8z122178WQYkzspTeQ59hc5nqA6dhgT9BVSExIobAXsFHILSheWglJK4yK4ly
	asHCEsKj5g1d2zPR+glErjvMiq3E1Vb8FPaef6rCRMxB20ihwmtRqB/j3mXc2PQIMnnF9iKM+Bj
	7gT79G8yY6gQAP81cWsgkwC9MAGMbuWFfkwTkpZiSnGxjTiT6bzFsDGMbftlrI1ft70fZxG+Bvc
	WeZx2WK7ykEtNE=
X-Received: by 2002:a05:693c:3282:b0:2c0:c96a:a4db with SMTP id 5a478bee46e88-2c185d8e84emr5487052eec.4.1774824437396;
        Sun, 29 Mar 2026 15:47:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm5840295eec.30.2026.03.29.15.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:47:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 15:47:09 -0700
Subject: [PATCH v4 4/4] iio: adc: ti-ads7950: complete conversion to using
 managed resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ti-ads7950-facelift-v4-4-c568c508c49a@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34375-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email]
X-Rspamd-Queue-Id: 568D0354554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All resources that the driver needs have managed API now. Switch to
using them to make code clearer and drop ti_ads7950_remove().

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 66 +++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 47 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 0b98c8e7385d..234249ab76d8 100644
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
@@ -573,24 +569,22 @@ static int ti_ads7950_probe(struct spi_device *spi)
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
@@ -605,33 +599,12 @@ static int ti_ads7950_probe(struct spi_device *spi)
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
@@ -674,7 +647,6 @@ static struct spi_driver ti_ads7950_driver = {
 		.of_match_table = ads7950_of_table,
 	},
 	.probe		= ti_ads7950_probe,
-	.remove		= ti_ads7950_remove,
 	.id_table	= ti_ads7950_id,
 };
 module_spi_driver(ti_ads7950_driver);

-- 
2.53.0.1018.g2bb0e51243-goog


