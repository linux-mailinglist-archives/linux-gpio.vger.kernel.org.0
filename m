Return-Path: <linux-gpio+bounces-22795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B3AF934B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 14:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B2A4A0B9A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 12:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC0B2F50B0;
	Fri,  4 Jul 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X7eYKpx/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E02F7CFB
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633939; cv=none; b=V7XVmN3fETw/Yp+3qIEpHoUWfosxd1H5CpjlLRUaz5zmAJt4kbN1NUVxQez+dzxYbxNCHtGPNwF2c7f2MlxRpdxtCTRYRNHvgL5zHU2t1Ko9bK+9nkCI5AGp3IBRDK2Zz/4wa2nS/fv3Cixf9cUs0EgnVSMTV8jxXMHFYY8mi7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633939; c=relaxed/simple;
	bh=QMWIrIsZsHd4/QJq/tOFfSWRWVwuYowwy6j47eKWiWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZ+yBaowfwNiRm3JrKN8BCuwW2laOEQYxgAgikv5ugRoaXo9CKtHB0F2tpMxBYEquGwV7RysmupQqa0YHyK4yjeGRpYm5D2Yz++sPSyV9cn+xuTmUlso9gfn9cWKw/lQpYOULWVtknYaEF+MLIJJhVmo1jB8Xlg6fGr0ox6tZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X7eYKpx/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso688007f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633935; x=1752238735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz0K9x6WVUUEMtJl7r+FzEpq3GnlzRz5RtFA+qGgsHk=;
        b=X7eYKpx/RsZRj+yaOBk4XPYZHt+IeT2mLsugnUOMR0h2JUzDablP4xOuh7H/PnLaEn
         Ah3saTjIIpx8/hF0qAfKu7lHnQfdue6ECx7p/Sf+qWFY/M3Cr1JGTpxTd3qAT2qfBTMm
         ZJ5L9mblVIBMgLon47yUYtN7wLWfOfG6EEsigOF/V68GwM9JBpS58JQo3jTcExoNi3kW
         fuurGWMSeJSjzfA3h7L8XJzjIvbR06NkgwUjfU9J16AXflvlEL3fF1LdXqZqOo1CeVhy
         Dr0E7iai8bVVLjKi1knP8xh6sR6xqmofgfZXZkbsoEpiukaVcHQCxICo1D8475byX3x7
         Nalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633935; x=1752238735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz0K9x6WVUUEMtJl7r+FzEpq3GnlzRz5RtFA+qGgsHk=;
        b=vGmk58Qs+AFaQmKSRxIDcCyNTxDREGlmkUy0w4zVqi/3JIxbgL5msYhr/5AmkUxIGU
         R8sTZgsW9doxtOSwhWUBWMwNqLKDNgZbzT82uMIAvuhWyp3Hk2PilRmoyty7+h94K10+
         F1nkyQvjIfv9Vw6ytJZJ03WfY4AwMOmt9oa1/p4leRso8KL/sitAq33ldSBN31ePz0Lf
         T8HhVQVKMNPseaCPSfJSyFwSfPCIbQ8xAz7KgqhkijFdXovkhXr9vvN/71gCQG45CnSI
         uKxbhc+2Sj5cGV42M/e2pWm35EltVi5qC6YhF8czp1R4DVVyoiIem0X5NoyoGMIw6TCh
         ElIA==
X-Gm-Message-State: AOJu0YxbUDJzbYXhiXyLweu7nrJG27KIDFPrTXXbNFvO7Dw84SHRo17t
	ZoUPKZ62gdF35ewYguRpH72rBJSFQcwOKA8CRu5+zrG3Rhr5LUfrDP3qnT3jmhiPTfo=
X-Gm-Gg: ASbGncuunNjdIOe3HlbCOI04cPt6928LKP9vU2cG7wbAC/SZdwB6fSVB9Vywfvfzyu3
	zINf+DKxdLFN4vDZRHiWYwVXy+97PvjSUscBhPJVO+GdrV7xbQdsRIhYKqqQaiXmqDNmfOehPnJ
	nxlffZgAtRLGIemccVtyWQCRsqjBXBoZ8SZYPZU3r6chGy+rq0DtM+zQLS31qCx3dBaYTSFGWAb
	1IcspFHZ9NMqjDIpRjmQ3m3ePyq8VAtdxTXzJ48xPuibMTOP45FbrC7nhu+9P/zc7gliEMPj2PJ
	3dxJjVupW7KrkByTWrE7vZBmIP0wvu6b7hUegpKIxjm8hnMC7nYID8c=
X-Google-Smtp-Source: AGHT+IHg1n/qrH2J6dTNw93F2kEzgdI64kMJD2ZmQFJ01deEa0sk7Src48VwOQ06MLVAifI/HZiaQA==
X-Received: by 2002:a05:6000:480b:b0:3a8:38b3:6e32 with SMTP id ffacd0b85a97d-3b4964f4e41mr1862900f8f.8.1751633935292;
        Fri, 04 Jul 2025 05:58:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:58:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:48 +0200
Subject: [PATCH v4 01/10] gpio: sysfs: use gpiod_is_equal() to compare GPIO
 descriptors
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-1-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ikmfqSg91RkpdEfKPtgwiZRnKuHEt1zFC0lBiF3REpM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AKFdJP2TwJNtEzy85VwJjHxi4N/QvM4zY8h
 tjJ9c9Fdz+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCgAKCRARpy6gFHHX
 cmq4EACwoTIkVXg0R4gogmKgBodhH6XWnN9aB44SDWTZ6mdOuG/yDn4+yIKiKVmtMYvm0mHsZas
 C0legWWSJm6/iBdXBuIzyynXfRUUjFz5tx3YJVdZQyWWFROQTzHs0U0uKTMNcafNtn3qTMSsAYt
 xhowSzgde4udxKb8/3laymvak5DU+eGGmwPtLhgASo9CvHyOCJ2+zx6wYKjFQ3BRoyWp00Wn4JH
 TS6QE3NnxV8Q8PcF7hQBVmpinOnlyFr4DVp/Z0riv2VWP0Xoh7GMZQ8Oh58To0fp7N+MDt3J6PE
 wQAh5W/WEgVcElrbj/l+wh3Hv7m2pPQvSP9RmkpG2/Bb1dXN16dkVaNDqNQYnoC0NRTXb5P9zu8
 TuE27L0E2gDXwRTIzYXyaZw11enzahGT72ikLRegkeu4COzvNChOG4aLoHoYR106siwIqg1kP7F
 EsUu2RoxauXwNd6au/QZ9xohrtM+AYAaWLTm2VZ6KMtrlS739ryz06g6ghilWi1pF5c0KHlYmAu
 HugnS5zf5A4ZGDH5pXs6/ac5zUo11zTsrwunSfUAgP6MUSplWusuaIgAoC7L5GVWWYcSHve6611
 eSdITxRuYQd6HIeRRdiN9F5Ftai21XaaE8G1uAE/vAtRDVsjqOfGEzuPiyFsCjm9jM4n18KfHBy
 Tu6h7KAlD/umzBA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated comparator for GPIO descriptors that performs
additional checks and hides the implementation detail of whether the
same GPIO can be associated with two separate struct gpio_desc objects.
Use it in sysfs code

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c4c21e25c682b939e4a0517393308343feb6585a..c4e85f2827697d0239ff6296caf49d243cf10fe8 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -657,7 +657,7 @@ static int match_export(struct device *dev, const void *desc)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 
-	return data->desc == desc;
+	return gpiod_is_equal(data->desc, desc);
 }
 
 /**

-- 
2.48.1


