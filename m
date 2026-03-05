Return-Path: <linux-gpio+bounces-32611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ot8CoLYqWl5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3421775F
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAE7D308B426
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD9B3E3DA9;
	Thu,  5 Mar 2026 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihwEtfTg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4E3C2760
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738524; cv=none; b=bG3XqyqGPWH50RfhR8noxmOoAWg8BgDJPAg+roSjsy9QKpPBQjfdHBzMV9kbEcvhSRVwrVsimmLFtrzzOvJGyIKTGAsLFWg7ujPPEjT89FL2W4qH8woqVg0hAXxFpur7LGWNEE3/TtG2zynAIalh+5qe991nRVOZiRt55DAO2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738524; c=relaxed/simple;
	bh=SMEngmxi+V1iJrnKbLYWEzqidqgepXSPtcgppjiDGDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYnLPnPx7B6EZ/it9OqkNI4RzVu9hmC9jbyZW18DbFwESsMAZYc/7te+PzNVKtYwe+a8wv8QOjRec5edBDc20Xp4ILrttaNGGWDIDA2/iUJ1to0Yu9tRpp2ckeTg/YIIwQzrlTFRp1qmJilzoBUYFbI2KRPdDrDoh6wr237PijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihwEtfTg; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2be27fa54feso4354801eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738522; x=1773343322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e4srTG2w8Nmq6WFaWd7C/J5fjQdqqF7reTkmwpcgV8=;
        b=ihwEtfTggp4E/FNI2rnOefIKzZ8MaYJShfY1zbObJFN5BM1eyO6optv+dWuglUQXl5
         ICSEKmsRKfOsruVCDtrlbEtVxvU7qKhcfiHqCMJGUW92b/W089Ega+zsFTqEK+1bc4wn
         +9e9gm8ECdD/1Mr+rzdjj752L4Et5MX9dFDSAszI1eFqdG9vnWf9fnD3tl6AuO4r/gKI
         tCWMX2yH5EnPqXi+/+0mYviN0WIYu8TLtBylcGP0vSruYSR2i2DpE+K41YenefaNIcPX
         YzslLHY7RMKbeQpAJ20uRf4BfcSH1++QB4rK7HKJ2e7PVuCtq1p5QZEHK9wVCL9pp7xs
         rIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738522; x=1773343322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8e4srTG2w8Nmq6WFaWd7C/J5fjQdqqF7reTkmwpcgV8=;
        b=oMakF02es8WHyX1tJwfQFBlnZwb6mxcNGWYqHQwMn2aFbRlDvxconqd3iy5DxFLEwE
         FjQPiiE24pr/gvdRxqsuq3+rx5dLylQ/IMnLVkytUF3hBXQihI6L/ES3Cixb+d97npQE
         okv8ZPJElM6Rv3wjCVxo/T/hyvMg7Up4EGDsn3MN8Ds2crIiIcJi9AmX8hi1KLP7e6j+
         TFw1BAM176zsbFBtILEqRHaUqIkBcYjdA2IOd0GS1wqwdf+kanI4BzaU9tej12/BMFBi
         HZ7ddPyL9i2EdggwDJbzvE2+UBUhbTKba13N2Tjz4kRj7g1t3U+87psOJGfr5wLle8ZR
         8ANg==
X-Forwarded-Encrypted: i=1; AJvYcCWpG1RXiLebIFUxC8E06r4lMglPC8oZdi5QADwJ0iANXa5J1KF9WKSrYbyxATlT+4qujN++ph3hkguM@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBpWksPcqYWvg/zz2We9mEt1VgF01Py9SytED+l+ciZoizhUn
	uOGnJNwm2R7NLG5bnZC6Rj52KAdaPfhMQ/h67pxyt5BxmIp3nLZe6mU5YYjuiw==
X-Gm-Gg: ATEYQzyxKGevu6bbt0i6eEtwfJfpMSYhNva8HVPg/RNsXQsNcVqwmgu/vEnmhqVfUDY
	D6SOGJ2zPHzPPGM0Aig/y7OYKoJfeM40/1MmV6OfD0iBKjQeA1isWAXcsUlzCEeyR+SCYo7uqfU
	W6pu+rLq5eTa3P6fCOlp22CZwKCUOHRp6Ab/PX4J/6ZWJ/Ipt19YF5o5m0IvFmjrG7kWxLL0lL0
	VFezHQzMHuxuLmdsSNsujzzzbcFIZwms8ySHkOrQnAJEpnnbIySTuBVN9psD02KkKoHdWbBaSBt
	mTLOIL+boGgtQO/0I96W0nNZZvsSbYARKmSTT3CiJCzDi/1M2VAn0uaLWG2+Fi1LtgRRNcvxMqQ
	V1YwVFv4aS2nKkY2eb61gZRmgWsZhVvBEQagG0VrxG4wJ/vkUHSAfMnvqS0qh3H0jDjHjGAtRL6
	uy3VZbSzE1fxJl6T2PMn3uCS8jhx/qGXv+iXH9nMItuHs372yPz9REhc0gaaYtjLFPHoioTRGtr
	+t+G51tuNYVcEQ=
X-Received: by 2002:a05:7300:fb96:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2be310a2a47mr2640901eec.19.1772738522033;
        Thu, 05 Mar 2026 11:22:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:22:01 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:56 -0800
Subject: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
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
X-Rspamd-Queue-Id: 9FD3421775F
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
	TAGGED_FROM(0.00)[bounces-32611-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The regulator is enabled for the entire time the driver is bound to the
device, and we only need to access it to fetch voltage, which can be
done at probe time.

Switch to using devm_regulator_get_enable_read_voltage() which
simplifies probing and unbinding code.

Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 45 +++++++++++---------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 273c35e03185..847e83baa876 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -341,19 +341,9 @@ static int ti_ads7950_scan_direct(struct iio_dev *indio_dev, unsigned int ch)
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
@@ -382,11 +372,7 @@ static int ti_ads7950_read_raw(struct iio_dev *indio_dev,
 
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
@@ -580,30 +566,24 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	spi_message_init_with_transfers(&st->scan_single_msg,
 					st->scan_single_xfer, 3);
 
+	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
+	if (ret < 0)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to get regulator \"vref\"\n");
+
 	/* Use hard coded value for reference voltage in ACPI case */
 	if (ACPI_COMPANION(&spi->dev))
 		st->vref_mv = TI_ADS7950_VA_MV_ACPI_DEFAULT;
+	else
+		st->vref_mv = ret / 1000;
 
 	mutex_init(&st->slock);
 
-	st->reg = devm_regulator_get(&spi->dev, "vref");
-	if (IS_ERR(st->reg)) {
-		ret = dev_err_probe(&spi->dev, PTR_ERR(st->reg),
-				     "Failed to get regulator \"vref\"\n");
-		goto error_destroy_mutex;
-	}
-
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable regulator \"vref\"\n");
-		goto error_destroy_mutex;
-	}
-
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
 					 &ti_ads7950_trigger_handler, NULL);
 	if (ret) {
 		dev_err(&spi->dev, "Failed to setup triggered buffer\n");
-		goto error_disable_reg;
+		goto error_destroy_mutex;
 	}
 
 	ret = ti_ads7950_init_hw(st);
@@ -643,8 +623,6 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	iio_device_unregister(indio_dev);
 error_cleanup_ring:
 	iio_triggered_buffer_cleanup(indio_dev);
-error_disable_reg:
-	regulator_disable(st->reg);
 error_destroy_mutex:
 	mutex_destroy(&st->slock);
 
@@ -659,7 +637,6 @@ static void ti_ads7950_remove(struct spi_device *spi)
 	gpiochip_remove(&st->chip);
 	iio_device_unregister(indio_dev);
 	iio_triggered_buffer_cleanup(indio_dev);
-	regulator_disable(st->reg);
 	mutex_destroy(&st->slock);
 }
 

-- 
2.53.0.473.g4a7958ca14-goog


