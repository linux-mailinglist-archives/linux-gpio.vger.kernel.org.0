Return-Path: <linux-gpio+bounces-18295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 050F2A7D58E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B4B5171E42
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898622DFA3;
	Mon,  7 Apr 2025 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N4ReUfRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11B22D7B1
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010301; cv=none; b=LXkVXz0mAfEb2uA6Qwy9SJoV+3ipmWVVXKqKadIDbT70s3GGxjevCXbIlaYCBOMtAf9lfvCnPV+Hmr0tfWxAOPKEJCwGS1gOhsEuMxFPURfyma1K0OjtjJ+yYDE0XEXVHyQIRSUD6ulQ1jUyOKcdfPvguLdu0WX+bpFA0S4fmTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010301; c=relaxed/simple;
	bh=JcjRt3IWWdiCtJbwqzp1v4b47hd64XOA+ew6annId/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHN9O4wlMLi1ioU49t3G25eXW60kn3otySEIQf7IQS3qaQJYpIJ8VKvjR94bWBdSihBRhH75rCU7Y0eRUvXqXzr76haTQ6zQFeoLHvJKpqUdb1Eky2HR88TD439UmXbwmxlo0/BWZCN3VPFM6JwH4qUo07V0tA5sMozJeVjglxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N4ReUfRl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso25277355e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010298; x=1744615098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=N4ReUfRlxNmbLYE9UbZ2TrsC7oE+e8x0M/39C+e6wj+lv9BjbiQe4TJkXRTujYU5+Z
         deN4HorPfo0GxDgQ1+OgAu4dw/CMWLQVUdN389PsMsyl/1bHxFahsNLnUBWgkZwUe/u8
         bU2VaqKIWtps1z8LYY5dpQI/yAfmBesqMCZVYaUTUTSM7NqYllQg3qrdFrYKPe9wIt38
         1ZfvZKIu3Kp6CkCN3T3xOx64v6LYOxx1+gXvrIhymnQpaqJidHXsmViSWFyNAYqNQfCT
         SYW/4ZHosjaF2pM442EtyKtTkUeo16QJuTTNEP9eXBCIVgAgj/MhRz1ydnw/7BQA2BkT
         ouZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010298; x=1744615098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=HW3tIxLujxVbNuON2qNI0W97gyEBbHZmJcbQIlJFsdaecOkfoLnqp5c7Y6YQf6OC2U
         bQWefG8Xmq+R3W3uKrETq5wAOn94t/IPatd7W/Z5H5JTyNnBX+9P9JaIr3NLCRARmraW
         mZMIR2tqKIVywc57zhC/FtpSyp/NCbKqJrF9SF3NsvFx1QKFzvU9tR11hWRjFkFBGH2A
         dGI5HFnjbzj1yZkptbGeZCUcI4hQSiGpU3LjKITwSULbI2oxz3JDbtlu38Dpwp4gxgSc
         LQfBizbj8o1tBGEG2qEKlFXhmKt+tdQ6CG9tq5P2qlJ3dBXUmjtc1Ct4Jgi9+0mY68h4
         ijDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5GJoOzkQfXDP8zmtI68sBQ7u8rU1j4mQnO/E4Drdr0R+dLxOtT8ym7Ten6q3kKQFC4vGjCX8ca1/3@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDHWaF/uHv40ID8JT5O5XSZImWO/rX5d5LLF8RLDW8Kc/hawD
	yiNBe5PsbopYs/RstPjSrom8SWzdT7hkj4lmY6QyZ06Gvpv6Fr4Xv18sHq2Q/firvLOisTwqXrc
	UXPs=
X-Gm-Gg: ASbGncubE4IFvshzie5F1u23s/kSjb1Y+kJAneqVzjRnrmA/0rxFp3gHJlFRVyD/7C1
	2bPcYVwUd9DFGWLZA3p6Mm6dAWAA13tgAtq8zL4TJFdUSb8p9lG2viBLQqy4gy3sKfegWZvgK0J
	HYsX7ipAnYFiSt/SQktTBNAH0tDH1YICOnhyMAfObvrhm2QCzcnOTDQMU4FUzyolIuy1O/SnPAb
	nxhUYx4ScVR606IYKjw4Qyv8T+6W26EjhIsjJQXYq+gQ84eJbGMLuu2kbCs7JrBt7WyoXYakIaw
	hLwF590QWdXUSgaBrjJ43YfmVhIy95WHWeRMNn2o5T3UQgpB
X-Google-Smtp-Source: AGHT+IFJgSB1mfe2t5szPiSLNr2MNwqUf8v+9jwrmbgyH2kFsuYq3Qv/ef4JBN4s56UCzcSRvHeX/g==
X-Received: by 2002:a05:600c:1f07:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ecfa04a8emr85603395e9.27.1744010297012;
        Mon, 07 Apr 2025 00:18:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:12 +0200
Subject: [PATCH 4/7] iio: adc: ti-ads7950: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-4-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wzY9NMbOxk6VjgP1/KsmPepcYuP2rlT9xHP
 EzAhaaVp/KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 cnZAEADY4UNBcOSE8f291z41AA1F2ND4+IVzRboTWFLvRw+4K1BaOrnd3ZLW0yDdokNkKCGXp1F
 94KNmgK/lYxNmlQfVYU8N5Y1Pt6ss9q9f/d+VWanGAdv2UBp3I3d7OtrwgnmBAPB/lEzwicIsgt
 sfZsaPf5lNYyx3Jx9NIuCcfVRolZu/jwpY1uJcj8jTfZyM6eoAD2FTlqAR6WXBLaiAO9khXzzvr
 kqiRECyfrVntEMVIYATjhByrdw/x+NamoagDxFJZ7voEBVjZYLQ5b7zE+3U8B+4NFU/LJi6xCam
 zvRZ4l5N/ZP98/x0ypvjG+1nIrnNuZRQo+89QBDcgz+HPqC8cq/VyM067dUKJ/cIilIKi9JEjd4
 bjRZvUdo1ymKm7HpwilINx+4nFjYu1a9Qji2IOUwvPFGbAFbtc/ndlgcnCO4rcyGy5CcERu1e49
 Iu/iqffd0wgl6alpN7j0w44+MEwK3nw0sQSdS5AXD4MgWdJxrybBGmkpxcdsj9ynP8ryR5/t6iA
 WNIAAmUsJdTVSTJjFQIvAdEC5y+xUZ15rbP0FUmdaJ+wldYlpHskzODfNFucF+MEgxPtzsRFeq1
 rf2cGaakRaIjryTMG8EFZSkR2pfnDh7Ls06Ao516+jPWA9WpN922ffqizx2UZg07tGkHTXTltOX
 nBMHrip0BRIKwDQ==
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


