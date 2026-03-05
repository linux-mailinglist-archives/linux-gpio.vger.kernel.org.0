Return-Path: <linux-gpio+bounces-32612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKscL5jYqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:25:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F721777E
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8AFA3094CC5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F933E5ED8;
	Thu,  5 Mar 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPSBT2xe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F23D567E
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738525; cv=none; b=PIvBSC7L8QH8AUZl9aIllOE7dj3WakNk0GEYgAhDvICCIZr0d2TeVBolOr+KWuW/CK1d7zfefhRJ3tZ2tTjCAEp9A+M3tKyA06UmJ2hrRkVVRIW0lREHOg74bSahbvpoytZ37bwN5pSA9ZsJ6oocIBVUCvNOLU40V/u/1HyKH74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738525; c=relaxed/simple;
	bh=jUbqI6ezBlVyFDdEQHZwsRHOEwUTcg1/vMHeRJvJv5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTq6QHyAlovafFcEK9eHjOVpCqKbPXk0BTvJr/BPhWlX3mWviv+xR8QaPpS+dVdGMRKDeioGKCx+v6lD8FHy/ZgLhtozs4znl1OT9Zd796/9Bf9O3AKK4rmSMoaBdBGU9MJiSDLkfOif3TiWFIBd2gbQ3w151hkHh8z37SL2E+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPSBT2xe; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7872839eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738523; x=1773343323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjPq113nXOUWKDDAA/JDnS8+HilrFrKJ/9HVlkXWYhA=;
        b=VPSBT2xeQmmsPe5JKSy7cVMAF3fuxRFSdsGbQKzo4G1Geg+f96XUuMEo59RCkfuw/x
         Wab14HM17Hvx20A09BDzRTpTx0a1y7RtaIrp8/KMqWrwaRXHxPPQFN/l7a2CYo9+Sr0e
         dPG1yI0p2id0Kzv2USHh25Qw2R3+zRaEn8fy7I3RJts2Kp9Dc3gMr3kt6FmQIbrI4awh
         Y1k2MXLeoQDoxNxKw+h3xcbQykE+crNeRDobf7z6hAtcIHaxT4NRSfiQHSV9jgtM08nb
         w5hsdlxz5EhDGpU1lMTl0KrJf1HV/SJIAjMFDRh0cilBVpwADojuVi3dYYRukiN9RnRQ
         2xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738524; x=1773343324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjPq113nXOUWKDDAA/JDnS8+HilrFrKJ/9HVlkXWYhA=;
        b=Ll2mDvJLGPctxwP4HKER47IaQEcoQ9tUjPIZ2CiFjKXAq7cXXiGqAwo8aerA9WfwW7
         3Ki0TdrXLyYcpZaU5d7L40THZNzr390SpbVZW7AcfC7G40JxZIFjMujVxop3zM4O/cBK
         qpakEJoRqsHjX6UWXiDKffAw7MtHvFsD0ixphLFE5WYcxM7vO4h6kN0cbKYBY7iH9eYw
         OUbqgYZqqt3lKcHBpKir/pYssb7B04uav2bYbk+0wRNL5RNuGjpiWzmQK5/PPwmb3dxb
         rNQT87X3FDQd3kbSAPOApCAnkOc+hmMkxRkf+ERR8T9PolWvBQFCopXPscaSrivdPWEV
         A91g==
X-Forwarded-Encrypted: i=1; AJvYcCVnna26wd13GmccmXjx74FWjPZk4OZ2Gvkrb8lg/J2Sjkvz5/wpxBHQx6z0zs7M/rfWtvuAF2KAeiRO@vger.kernel.org
X-Gm-Message-State: AOJu0YyeFDLTU/wvz4/jM12a2oqE/BhYQ4leIQtl4mQsSMxherZO7gWU
	IBxRHUgmNcNBL0SIwzy6yOzcT8mU5gG3SxsghVjblVUAL/6nuCrS6WJB
X-Gm-Gg: ATEYQzzJJ80n4l1rxfHYx0MeGZS74XK7WFHkZrQEcTUqMOANZZ70jjYjxrrgOYXp46h
	tjWstZIkWspACjT7FlL5FdNyyl3wkg+eo1e/HERd1n/QG0LTOeYNewnupKu5rUrqQ+6DJfvbLJJ
	vfe8a8Sgqf9AIiOrww1cNSGG0sJp3Rs/7q9hTW50kjEZn33CDPKRRYG/cWWHoE484tzeyAqTCrQ
	G0uBbbPvJ01XwXp+ZTzEvxj/ziq6z10GFJIKRRRhiwvrI2VTi+E7lD/SqgO7WxnsDW3agEPh6ax
	ubFhFXbDfr+3p1MpRp3gvtJ2VPwGuiRo7uQF5VHgdPZWbSymhk599LzbMjzEO8yw8ZShiUtxCq6
	Y3XCc0wvQhzP4SoZPkS+7t1rh/OcYhISnx4de1qL4gKgao9q+CaymejKIo5nTj5F5m1icU7MLtU
	Iwy0e1fDd+awkipibxOzEmCd3VQkTrElsFYfhbsbhZMNEczohyix+v0N4fJiLm9Zsd3GEjr6F51
	VrHn9BQruoWnY0=
X-Received: by 2002:a05:7301:1e87:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2be311c34camr2322058eec.27.1772738523235;
        Thu, 05 Mar 2026 11:22:03 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:22:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:57 -0800
Subject: [PATCH v3 6/6] iio: adc: ti-ads7950: complete conversion to using
 managed resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-6-a23fdd1a079e@gmail.com>
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
X-Rspamd-Queue-Id: 3E0F721777E
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
	TAGGED_FROM(0.00)[bounces-32612-lists,linux-gpio=lfdr.de];
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

All resources that the driver needs have managed API now. Switch to
using them to make code clearer and drop ti_ads7950_remove().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 66 +++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 47 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 847e83baa876..a1197e9cff93 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -513,10 +513,8 @@ static int ti_ads7950_probe(struct spi_device *spi)
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
@@ -577,26 +575,22 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	else
 		st->vref_mv = ret / 1000;
 
-	mutex_init(&st->slock);
-
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
@@ -611,33 +605,12 @@ static int ti_ads7950_probe(struct spi_device *spi)
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
@@ -680,7 +653,6 @@ static struct spi_driver ti_ads7950_driver = {
 		.of_match_table = ads7950_of_table,
 	},
 	.probe		= ti_ads7950_probe,
-	.remove		= ti_ads7950_remove,
 	.id_table	= ti_ads7950_id,
 };
 module_spi_driver(ti_ads7950_driver);

-- 
2.53.0.473.g4a7958ca14-goog


