Return-Path: <linux-gpio+bounces-21150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C778AD324D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 11:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123023B50C5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A6D28BA9D;
	Tue, 10 Jun 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OzqChnGo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DDC28B41D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548410; cv=none; b=WESHS5jgFw5v2BOPKXTgIUjrLD8ZUg+1LaMaFdM2kzhomhT+TJK9qevho2m8j8xgGAPYUssdheyCVcVcLDMFqChdmAp0V+vNbBHzGgngyjSlpzk6iuEgskmxRQe9EnmiwX/jpiNomb53irN0s92u3sl+lf+a5ZuBMvStkvj4SOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548410; c=relaxed/simple;
	bh=T9Vg0wvW1hKLtDwEAea/F673Ap81+xfLRjMRIOwyjuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWSmQe/cfqcWEwDl7mqMhamvZydN6Aivy1mLl2qHFVTyvcfyInbf/6dwL5iHEzy/20BVvqR4EXfyrCp2M01QjZQ3eAST6d/A6G+vnlWPZ72Nl2HuMKaxmg6W+OlC6eTimyk2dwH/XJrqhkebECGuq5X/toG1JW5KlcX1m6j+kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OzqChnGo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2723876f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548407; x=1750153207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu79p97CBMbqD0WMqfE3aKDFszV913MMxxhgM+UJYyI=;
        b=OzqChnGoW0qbCITrv2TIRwFSYLPSURQK4wMIdeiRqUNyyFg3yH9ClxwKx9TKcnNLQ2
         hDNFJF4R0KtiTMqGR6PzyK4uEF4jm9+QW8uZtcpXXO+i6MMT/erMgs8sbSq5GHs8rLCD
         79BB2hBhLq4dlOOO0xbdKJRfKmjrvKyO1c/yFJo0xMy4UCvFYWTcUU6IgZfTLG6/x77O
         AkvtP6mw/yAz8riTZBF45pRtY/9YLmimiIytJaiSu0csVJh0Lc+x/Isdky+O1c5jKr0H
         XpEyiYiWzEpljwoHSKTVVce1orDHPTt5O54VJxBAtt6+hW9fX9OuprC2HbUHnabMIL+Q
         EA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548407; x=1750153207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu79p97CBMbqD0WMqfE3aKDFszV913MMxxhgM+UJYyI=;
        b=lQABiuNkF2QHCgqTiScK1fZTZrwTr6spcTf4a39VXo9lPY6FX3V3JMH5fqcmegBmVL
         oxCUp/zIUDySrQPsiRVmfdYeIkt0dxzzM9nF/RiRHX/0MdhoDqFzXRi4L6XSM7xYZtCm
         eaxqvT07pKi23q/vA/5+sgxkYVUjOEohT9Ayg54BsLtBzewyeJmgGQs3gY3vjTfyMpgX
         YL6fOhIZVMyeR7jF1rMKfzeGh2YkBQRGTsDzRv9m6Sd5bYoIEv496YL+jrqb0Xmvugah
         CFaQAubnoQQ5JHjmEHDBvbNiEYADOBo0ouglhh7iv3vFEWDe8Ye7hK3kAcBoEbVMbfsa
         GQkA==
X-Forwarded-Encrypted: i=1; AJvYcCUHAGGxpibhmNHK/q+qKHhceDyRevVHunNJbZtk3y6p9PeJZNvP0fYijMmiN/EQs9ZbA+lcOWkkYw48@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gmZow0kvHZcbiiYiztIq0cWbL8jKNIhOgMop9Lqiz9f77NtQ
	3grX+fXQ+6sOmeIH5j3TE84X3l6mWNLuHfqcrEvBWk/OCjdVWIlQxNZIrjReZLHQt9c=
X-Gm-Gg: ASbGncsLcUidaZDqNH8//7yAt11rW+937rL1e5Y5KHeLr7Et0v4Dft22kbY2iFBwNzv
	qkAW1CdgJOW59HGVONOB4F5Lz+CukDOSvk7fULJ45SCXRXg29iDyr+mvNrEeQHtegu/Df3CAdWO
	YPx3E838/oCHzG3rYxuGtR3f73iZ6x7UyqrSyXOTs107k4i06amUtl0tRpsAwH+p4fy4NDEV3Tb
	ek8PUKq0lcXtg4tkaM4C6C78mw+svAFDQrwiKyChwhQzDptrwG4FmK5hi23b2rR6r6vg2tR/s1Y
	foW4KDRSYnlNnOJtXcZG3BmkqkDurL5ZcBqfPxkim18flk9Ex4gapsWeQBP9vBQ=
X-Google-Smtp-Source: AGHT+IGBG5AnZ7WoS8T+OydhEHnGXvZC2sik/ScM1rf811UK1oAyJzo7QEcRs9ivB+TFGJzULnkUsw==
X-Received: by 2002:a5d:64ee:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a531abd96cmr13532032f8f.53.1749548407047;
        Tue, 10 Jun 2025 02:40:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:39:58 +0200
Subject: [PATCH RESEND 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ob3eXl0xtZ14fRcS+tLz8GnDtyJ7+FiNafvHBBXvo6Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/108QZzPPewPOLCuwF0wrlBiAIdz285fQ8Cg
 yfxWynooDeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9dAAKCRARpy6gFHHX
 clZMD/4zlTpQ/Em6ds233GBUxVYyRYs3ly2on+t22u5TSDWKle1HmPyCKtQ3NFc2HC3mgEzdSxo
 O+jitDlbR/FZdPU99p+U1KoyOBoQiV0qVkO3r9kMqr7kIPsc+9hWgpA9Kb/CH/43xWO8ocS6WCJ
 JuPRGq4AWBQVvXPz4JCxiUTVm/ENKwo3kh00c4b/hfvas3aiXaDQz0fTzteBwAsOh4MOi0RPnHL
 r4SDH6FxJ83PE+aMmdYr0bF17zXPc7vChLfphkZeO4L4ydG1tX4AxrY8YrUh4jvieXaiAPf1Paw
 7F91CQzYgiYyXec5tSf/ksKVpWUKDOHod1NkXW+tvpOkDSzDQ668Pv+7RapSOZAPWOynN2g8R4o
 zjH85MuxUwasRX1PvPZ936EQ403f5MyiIU6jwrCALxecq+wrVY/6BdX1nh1JIIAXCZgOhvArsti
 wSG1YYl5Bl1OvfloIrQCvTOUmit9IcA3+llxsoBvE71nMrQ09gWBkcCtNDhto/HkAWumDnhOxu4
 JJ9TKmcuw+SfVF2vV0cgrQSGFUVd2z/w6nimULd4bpSe7dpsQDwgbZ7JxcofVTE1NF8SM3d3MRX
 Q58T7OW6PrrZko30LaGLS7Ed/Xklt3gLPOs/zMVOHNcOSs/k+aaSSqDges4dh1UZc73BmsaFv1i
 8x5iq/VflHs6NgA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/touchscreen/ad7879.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f9db5cefb25bca45e18e80fafc9cad5dd78f4f68..d2a3a5e016b6a5416846e8a9edf906c891d4038a 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -444,10 +444,11 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & AD7879_GPIO_DATA);
 }
 
-static void ad7879_gpio_set_value(struct gpio_chip *chip,
-				  unsigned gpio, int value)
+static int ad7879_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				 int value)
 {
 	struct ad7879 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&ts->mutex);
 	if (value)
@@ -455,8 +456,10 @@ static void ad7879_gpio_set_value(struct gpio_chip *chip,
 	else
 		ts->cmd_crtl2 &= ~AD7879_GPIO_DATA;
 
-	ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
+	ret = ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
 	mutex_unlock(&ts->mutex);
+
+	return ret;
 }
 
 static int ad7879_gpio_add(struct ad7879 *ts)
@@ -472,7 +475,7 @@ static int ad7879_gpio_add(struct ad7879 *ts)
 	ts->gc.direction_input = ad7879_gpio_direction_input;
 	ts->gc.direction_output = ad7879_gpio_direction_output;
 	ts->gc.get = ad7879_gpio_get_value;
-	ts->gc.set = ad7879_gpio_set_value;
+	ts->gc.set_rv = ad7879_gpio_set_value;
 	ts->gc.can_sleep = 1;
 	ts->gc.base = -1;
 	ts->gc.ngpio = 1;

-- 
2.48.1


