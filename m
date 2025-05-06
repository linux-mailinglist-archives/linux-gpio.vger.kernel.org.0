Return-Path: <linux-gpio+bounces-19667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE65AABE1E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299F74E4EF6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B407626FD86;
	Tue,  6 May 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wZKt+1lC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA3526C390
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522123; cv=none; b=usUuFBF/EMMZbFaA7wzY3E0sI8peNS7xvlOHl+RtKdkjh5IH63Ou8ce+/NLMK3NwLTKWAK8a/Sm1uut43rT6ypt5bSTo1bmnGCpHLdCx0YU3rG9dVrgSiLWQCUcrAhhAJxDwmBZu4RkuRr//iAYY0+u5a1oEtvoSgJefLg9TVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522123; c=relaxed/simple;
	bh=J9Yj8CedNMj5JM6ni24l2rshEZjkmfXOzVX7kgR0zdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skq3I3jb2XIa7T2gQ6SIdOO5GjIFIHvsyVig60oPpmYE999QibdBVOwIUNFuOw5kjixfc4MeaRrvcwQrB0XdrBnCX4tXaQruxWZZNWzV8mgPy5hEMSdPLS6Q3NkSbTz3W7it4LDkqaqQ2i1l+/7dno/H4pQNVXFKjiK0aCsw4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wZKt+1lC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf848528aso39897885e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522119; x=1747126919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=wZKt+1lCx9UFftWQ/Z1O8FzSDDfMRgh/gjJY3kzuJ5F2+yNiMmMnau4X3cLEuccVMV
         7SbVA2v7iBp96KOYxJ+WFoszrPCQGKQoT+pNFGCHy/K12cf7Gbcb9jgFgSP9p8VtkfoT
         7X9tqx6j/oNNB4HdBLUr48iUcqZCOnobbyXZlPR2Qrsa9VPn5EPwZ8+5CtwpggcdXbX7
         SqVHDFIMzV/lR/m58AluR4qIekSFmcz63RoyjT6hCc1mrJU/FXEZo+qKb0miIKqhilEl
         iFGUez7gHgar28z01/yy/DrKVdbqmltn2IVyTBtKELVeyPS/0Fl1KMBMo/KcxqKk+PBN
         MTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522119; x=1747126919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqmuA8vzWG7JwGdGuncL1WKx+Z40oy7BuFrvWPOr8LE=;
        b=w+4hXenvAbZklZGS42mIuWIxnDEB2shKX2lKUkaflvNIvs3dwNxBpQb1N26CPpcKkZ
         mxDlvOntY2dRwTjoRqSDNRfYkmv0CinPaopSpBuc/w4XspKHTjeBAi1PUFL1qX3U+p7g
         rl8PVzL2VX1RWc0yZFJwic9GZEg6J6UsZmK82vD4EqMMVtXIXHzdvZBi7xodCMKwVgVz
         S3DmlkqLSLEsgblKD+8HslAC5JR9sO/2m/n9uYKdeNsokF5k4K4Ji6MTVflKfggI26ot
         FeXqE2ur9QHD8s9kBSkPUN98SNh3YuyoMyRxQtBnR235ib5DY9OG4m7UcfnVa28+nQga
         8dSA==
X-Gm-Message-State: AOJu0YyD2QniQvO9J7OuOwqg6Vxie657mRbVb6q4dFbZDX7tu6DJ7Ihg
	j86MM9MJjCG0U0HsNyUuHhM+YDOmyJtLZsLCoE3IG2GNT9wjCRDyPCnifkzQV3g=
X-Gm-Gg: ASbGnctNyT+xHjuG6pprtQOPFqsi+kCc2tL+Un3+erHebOliSe6aCxLcGKox4VUrgQA
	UY/h8X7Yw1oyLULrLYz7b9TxAtStP9ObwS/57YiZ3KUxh3kjhqPxsLmh4Ay3w0ILlmaqjVWCfoC
	E9biEIHGuzhgniPNtzhXOcTRIG9BOqIk8mYH9I4RExt2nId8FnFIVI0HTHnUYVIETedVF1zfV3c
	mCzFimtQEsNBcDsz6DHKU0C5z9zxr3Ta1Nrie6tNe91HktUjMdsdhMuwbej4RHBhqqNP0OQnXTR
	+lhU0RGwZfJ/dWekKezh73eosjOAScHO24w=
X-Google-Smtp-Source: AGHT+IE8JUabBzKM92O/84MQPWd1WLHM3XpE0TI2Ymwc3HYRvwGlfQk0QZso0kEgfuXzy3SeMbuyHQ==
X-Received: by 2002:a05:600c:5105:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-441d100a80emr16950635e9.26.1746522119581;
        Tue, 06 May 2025 02:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:49 +0200
Subject: [PATCH 06/12] gpio: max3191x: remove unused callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-6-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uCZv0LrEzy8ud4KkWpNsBzdnLQeoymZc1NVUk4tf4VQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+AppL2eFtEqFE/Vs0gNp1cXoYKuSQEWvx1
 S2/TAMByK2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 cq5HD/9HyaQrVcRS2SmjLzWGPQc6hSa3wPn27qklXKNgMw8ZoMukH+bqB5mfDRtM6NUrmQD4x7M
 3vd98abOWOBCZkKheY5mu84Ems1rxlmXI9p1M/Zi4lsYf26yT+Pt4dbMt/ZNXxNxFaF/XMUTQe2
 o+4aglfuV0lO3tHfmy7c9dLk8qEEiHXETDfcpHCJnB+BqDgz8aWwfrQYgMFDbXeTO/FVnBZp8Fw
 SutR3wH+u4ac6VY0sIXN3Zz35TrYg0bWElply7PdiJlVUty2whyWhAGt5YnI16f2OYymRDpb7I5
 nNntQtwTa0J8zJ1ArYsW6JaXlIYdBsdM8nXtqdavnT2FmMHLoIk+4CIzaWZ+PcEq5zBLzXWDPYT
 dZRSIwtUKeHxwJfN4T1yaZcF+WXGR5df4XTKfGEJ47Q3CtrRSClqXFT0kxNZvdgB+ovjRkStec+
 LHnqrVYf08eaSeSstqga6tksa7JA5HKAawG7Qr0ThwJmZ29w0HPY+VdzuNyB85PReUluYKkVlLS
 K75yhDoPQtYTnzkIyjpatRNoJ0whVIQaycWgTndtZlo0/Slg6lDwbN8eehGu5o9UVC2z1nSnWI3
 PaftfnkHNsifK6ahgdM/84ynLS728hSV0wOAmsiykjd9W49dktGiYn/5XHdBEKEuciZvq77o4oU
 02XZNAgeT4PdUwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is input-only and as such doesn't need to define empty set()
and direction_output() callbacks. Remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index fc0708ab5192b..6e6504ab740a4 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -103,19 +103,6 @@ static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
 	return 0;
 }
 
-static int max3191x_direction_output(struct gpio_chip *gpio,
-				     unsigned int offset, int value)
-{
-	return -EINVAL;
-}
-
-static void max3191x_set(struct gpio_chip *gpio, unsigned int offset, int value)
-{ }
-
-static void max3191x_set_multiple(struct gpio_chip *gpio, unsigned long *mask,
-				  unsigned long *bits)
-{ }
-
 static unsigned int max3191x_wordlen(struct max3191x_chip *max3191x)
 {
 	return max3191x->mode == STATUS_BYTE_ENABLED ? 2 : 1;
@@ -421,9 +408,6 @@ static int max3191x_probe(struct spi_device *spi)
 
 	max3191x->gpio.get_direction = max3191x_get_direction;
 	max3191x->gpio.direction_input = max3191x_direction_input;
-	max3191x->gpio.direction_output = max3191x_direction_output;
-	max3191x->gpio.set = max3191x_set;
-	max3191x->gpio.set_multiple = max3191x_set_multiple;
 	max3191x->gpio.get = max3191x_get;
 	max3191x->gpio.get_multiple = max3191x_get_multiple;
 	max3191x->gpio.set_config = max3191x_set_config;

-- 
2.45.2


