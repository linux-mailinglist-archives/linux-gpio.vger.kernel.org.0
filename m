Return-Path: <linux-gpio+bounces-7183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D288FD4AE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1F128AB00
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02B14900C;
	Wed,  5 Jun 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4iEbje9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E613C909
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610408; cv=none; b=iPplZXqSXBeIBBRVfNNfmXrcWfen+/pccr86PJV7krJSsPusVPV9MDmoaYTEr9QdDaxR4fhjINj/otROl8RBytxwFyBElh+ye8W/1/an1ho1ZK0g7T65ZxL0r9Lxi47XG0Dw2IFe+kcZrizs0SLLnUMwBgO3e63ik0eBc+Kh6Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610408; c=relaxed/simple;
	bh=ipr39Oe7qflzshs+uqKeD5dsLOI2DywzVbGtmwc3XF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E+0xhSJhAm5jne4V28BN0rvSsUB92dGok4K7tP47bc9+1ZieBfGoLOnS0G/0jBVS4UUcolTPJ9gOdI44NYutfIMFRmPKHPGWK27ndw4GcDy4dxKryurOTGabj7GPpFl0Tsm+qS2Mcg8cnyS2hxfv5PJ37j1lhZqre/T/kC3U+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4iEbje9; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-df7a6530373so127534276.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610405; x=1718215205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=J4iEbje95ninWiXtqqt5T/9d9/rhCySu+uRgj5M+PAahakXxAmJMwbOM3Vl+q9ipwO
         cR2XMTaT3Cl6rtmhHcCzhm9ADVnFZb1p7yDmg+5o5KLMVVkrKunBBEwcfC6DifTaKXZY
         +22DMkjtteZbmFu3YZvAFV37gq3FnCxnNGemPsZXaxgCOZFtLwTgb/ySUoNoxgKThXqI
         /j358DaGUSozaVs/XrXx5gTTjXCJvJ2f3lRsZKCCy3KtAdh0gF3OvCEX+ecoMyu8HbjC
         QoZmOUWx+hkMmSCw6alLz9KvgAyuX7At1Lbtv2yzZUUbf2fKO7pPiVpatVP+Lflv7Hil
         VtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610405; x=1718215205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=jsY0fbVjunMPT/2DqMY0OjkWP8ot8MiKL4wRROfCeJjUjRk79wOJTlmkAMmhrJZ34g
         Fy9rKwcSbukR6NpmX8rsLRzImHxrfMgHwffapIS9ZSEAW2oaJtggF18WAUYtTKMeKP+w
         kcuWCc40DYBRb1aKkBZiOo483DPRTQboUcOpCW/B5MK1HjlHx+7O+MjepclkUiAFjPRh
         sXWTIhpVR15HmALVBcaSr8ChibQKlpZpOSY6LzJ5kkz6Dt1yfJukCfKCL3cakuNg3lRx
         Bnezk/7+rdEd5c8l8C2k38nYVw370vSgoDdXeaQUPhzLqN64dv+mFpZjAglXtd81RfLq
         yRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY7pCnEh7xzGOVGrAdsP+55uPDbEQNxEkdLZ01ttqQu6jnvh0hrUXIYxgWq2U4DagI15q/Bhg9yHWCGXM3hTxvdEgPpkFboz1rNA==
X-Gm-Message-State: AOJu0YzxIaKK378RaSPvEehQIJYRHARb1UQZEPN2IXlRj/OCS3ahyLgc
	KNihsC5+5GkEM2yOgME6sI7uFQzqk3jEMZjvcKBk2lWFQMe/wnuudspksxmTMvp5ZP5OzOeghoF
	FoaFjy0My6Q==
X-Google-Smtp-Source: AGHT+IEFfd1XOUpmBlCQ8OC96XaGHvsQJFoGDWo7KSg31aa/FmwG5qSwwUZMqSajPkXkOc1t6VuaS9UByNrZ0g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id
 3f1490d57ef6-dfade9e0f4dmr76066276.2.1717610404805; Wed, 05 Jun 2024 11:00:04
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:45 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-2-joychakr@google.com>
Subject: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/hwmon/pmbus/adm1266.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..7eaab5a7b04c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	return 0;
 }
 
-static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct adm1266_data *data = priv;
 	int ret;
@@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 
 	memcpy(val, data->dev_mem + offset, bytes);
 
-	return 0;
+	return bytes;
 }
 
 static int adm1266_config_nvmem(struct adm1266_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


