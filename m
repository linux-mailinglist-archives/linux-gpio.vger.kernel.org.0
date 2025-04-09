Return-Path: <linux-gpio+bounces-18545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8FA82060
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A19611B656B1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7A825DAF1;
	Wed,  9 Apr 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vqaahOy5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8025D8F0
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188055; cv=none; b=nirqLLcQrbaExdZQFDJvGEBWh4Vg86MUBYfI3Kz0fkB7ruil9dLBEfC++OcoTTjiUgjjj4Yi5wQQay/7+S27VPn21zYgRMcBqbkmB8Hj9j0z07oJHUU7mAWyi5buhAe4Nxv1PbOV6jScvsXl2VudxKKz+LRrvk2RcVb5ISJzTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188055; c=relaxed/simple;
	bh=JcjRt3IWWdiCtJbwqzp1v4b47hd64XOA+ew6annId/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2noFV0OX4NQ/vKf4PKyKJsFSe0I2P3xnFUVS3RbxSV3VExCJJALCtA35SbKqoQkSojDNTjQTN01Ral3fcHAddPfs+A98K5JYjh1k6u68fAyNlx0xFWoYqblEljuYqdn9z+kua8Dea5uYe4Lp90BFD9NHspEFU3TjeXkPIj2aH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vqaahOy5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso45354075e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188051; x=1744792851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=vqaahOy5Vhf3YpjRKW4IwqPFQyJzZzqrQBpO9yIhs6RrwfvAafxpqdrb/po3cI6YmK
         NWoXLtIGhQ5ORU0YxoC+TlMy1V7mOAh2S1aj6yu/tZ5jkcDdi0FgHZF0BTc1FKtgxJ6T
         V5uL18f+ZZFQD7lIvmdWCWRJHI5NbcMgu+TL61HFBxuEYKTxPRW0m2CelL6o+qMxwSHz
         UmCmJCj59xh1Zn6xxaKNiJxjdys5r933Q5KF2i1vBFYXuZTl/+tqEbFo18ogQN54Gha8
         5TfteYLgHylgSyuAOpWWzNx9OucWVfy1GN19mnqRxXNxl2xLv4RYiuGB+pRcMp+O+5qt
         BhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188051; x=1744792851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=bS28Ah9NMHahmuzm4IUBLPql1dqfctGaTX8ccW+67N+Ca1WEnn6ZEKeAvdcq8SfXbj
         a8rsp49UtwX9XmYczsChmwu3M3txRyf09KFUPC+RcRY2RjNj6M8mMr2IIldD3hPYBIio
         DeQl7Ui8rYGhUymQJO2qUsAZ3NkSo9mp65Ntzns8zsyVEDgAuK+QbAhxCw++9f8pNcly
         diEvSY+bchIOSQaK53xzgoO72oMjBfFsTOX1Ur5eRBbVnZbMfkEMm7xQ2XldfYWdrVHC
         k96K1wSt6YQ5/D8oip+t7cEFej4GAZ6AX6tbzRq3uKDziUJWvSHR6VrmrtQ8WtI+CY7N
         dBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQX6ZSdnwLirHu9qRMWL8NusBp4tB+FvyUNkHtj/hgb55sD8y3Mt9ZA6C7KSNKObrVb9xhn422wuNZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy855ZYXfotiwtyWDe3LgFGDT9BelKiye/2PAm8N+9/3yAkRdG0
	LCRUQpjYeWVi95k4dAiIWC67oyK0X/1ezPKtp2yHEGM7PFAGhcn5cFaBBM6kdpw=
X-Gm-Gg: ASbGnctPQD+QOOLSR6Qvnxie2KLfGvehERXMWiqOXybB2uvhdydGsiiyVbekqrv6+zq
	JVBPscNU69FEZigJDtLkLyw5tH9O/N8gWBYJhkKTfOD9RY5KOCYbCqxOD96F9lBl7Sx19OBuoO7
	wOm06gKaFlUfpPQHlY7CYmyfGjJar5MM5MQRIZGSqNuCgnoTZ+LU6r2Ksw9Fv8FX7BET3SwBm1C
	y8V3MAWrRq2EfPYEKGBuC5U3Q8FfC8VPx3PobSCrYV0yZizk7ZkdeRqcnZlfuLywrGY2dxjQ+Qy
	4SaCf7nUUw/EsO3r8tP0Zxv/4jIAxNfgVA==
X-Google-Smtp-Source: AGHT+IGsO3C+MGGdKhwPSByKad+ec5QzbW4TU0+WbuJN6qEWAsyjCVw9P8iRYYQ6yhP7Q/xszVDWRQ==
X-Received: by 2002:a05:600c:1d29:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f1fc8345bmr14884195e9.0.1744188050684;
        Wed, 09 Apr 2025 01:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:42 +0200
Subject: [PATCH v2 4/7] iio: adc: ti-ads7950: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-4-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2MIhT3UvouiWSb+JqPeZnzmfSS+HLRvIRYg5KBNUdDc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKMjREirvPxTpHQ9hbsW4kwhT8F08OGlVFso
 dl3acAI19KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 cucbD/9dp4DbiVLe0Nnj1IgUfrlse8TDg+7aDhEaAd9rA45y0l1y7uMV+HkiO5R+Z2Ndzx4qODP
 cywQxb/9nl4dtPAlb9Lfx5J4MdRaJ/d0qybEsxpP1eJvQJmgxM96v7t+JiweohlfvmAkt9L8Lql
 rUT8PsL16yg1GLi8Henf3rKwS97TmHA4uxFpKAchccleQVMLxUSObVFlKdAzNk6wR2DnwWn51PK
 c4CuihlDTWSfHYyfcZ89uVgrP6kDmNWiQumUeRVcIwK9uFd2g2KpQ+RANgPL5Mb0r/uhrDa7rf5
 DKg+r2j0dYhr/lUdhVm4jH04mGGZeCBTkUvGocaDiS9Zzy0bOmt5duJjQCMzYKf9r88s5gNAR9U
 Uy22YgtFfR0e+0UeJexBnI0hMGK9kw2pGVcyVW6FMeYW6gk8ePftfiIDr1SCBY6MTShwm0/sqVC
 tDVyBrkyy9b5EiJs5ho+bP00OvoCrFrSgNDAC3ywXKA/qKSPEk0iIhliCzFg+eCy5zG44luJ5Iq
 QRO+2rRq5S6tFjtnEwPR5tDydLUllDRMqfnE11kESudCf9WQgRjjSAO7c7g3eZ8txunucQBBVJG
 lA9JoXIb3sMaX8D3wiNPubO9PivBI+pBMR2vkhEJc2KrwMo+ZM1ly3E+N0g/0AGFgxsVm6uvV4T
 Ck9ptDwL/Vhputw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/adc/ti-ads7950.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index af28672aa803..0356ccf23fea 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -403,10 +403,11 @@ static const struct iio_info ti_ads7950_info = {
 	.update_scan_mode	= ti_ads7950_update_scan_mode,
 };
 
-static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&st->slock);
 
@@ -416,9 +417,11 @@ static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 		st->cmd_settings_bitmask &= ~BIT(offset);
 
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	spi_sync(st->spi, &st->scan_single_msg);
+	ret = spi_sync(st->spi, &st->scan_single_msg);
 
 	mutex_unlock(&st->slock);
+
+	return ret;
 }
 
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
@@ -499,7 +502,11 @@ static int ti_ads7950_direction_input(struct gpio_chip *chip,
 static int ti_ads7950_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
-	ti_ads7950_set(chip, offset, value);
+	int ret;
+
+	ret = ti_ads7950_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return _ti_ads7950_set_direction(chip, offset, 0);
 }
@@ -641,7 +648,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	st->chip.direction_input = ti_ads7950_direction_input;
 	st->chip.direction_output = ti_ads7950_direction_output;
 	st->chip.get = ti_ads7950_get;
-	st->chip.set = ti_ads7950_set;
+	st->chip.set_rv = ti_ads7950_set;
 
 	ret = gpiochip_add_data(&st->chip, st);
 	if (ret) {

-- 
2.45.2


